#include <cstring>
#include <ctime>
#include <cstdio>
#include <cstdlib>

#include <string>
#include <sstream>
#include <fstream>
#include <iostream>
#include <pthread.h>

#include <unistd.h>

#include <tst/speed_test_api.h>
#include <tst/speed_test_ctrl.hh>
#include <tst/test_functions.hh>


// #define FAKE_EXEC

#ifdef FAKE_EXEC
#define TST_EXEC(__cmd__) printf("Exec: %s\n", __cmd__);
#else
#define TST_EXEC(__cmd__) system(__cmd__);
#endif


#define STATUS_IDLE 0
#define STATUS_READY 5
#define STATUS_ROUTING 1
#define STATUS_ROUTING_READY 10
#define STATUS_IP 2
#define STATUS_SPEED 3

int current_status;
int rip_interval;
int rip_passed, rip_n, rip_latency;
time_t task_start_time;

using std::string;
using std::stringstream;
using std::ifstream;
using std::cout;
using std::endl;

SpeedTesterCtrl* ctrl;

mac_addr_t src_macs[N_PORTS];
mac_addr_t dst_macs[N_PORTS];

void test_routing(int* targets, int size, int duration) {
	config_t configs[N_PORTS];

	for (int i = 0; i < N_PORTS; ++i) {
		int tgt = targets[i];
		if (tgt) {
			--tgt;
			memcpy(&configs[i].src_mac, &src_macs[i], sizeof(mac_addr_t));
			memcpy(&configs[i].dst_mac, &dst_macs[tgt], sizeof(mac_addr_t));
			// TODO: Fill ip
			ip_addr_t ip = {10, 0, (uint8_t)tgt + 1u, 2};
			memcpy(&configs[i].dst_ip, &ip, sizeof(mac_addr_t));
		}

		configs[i].frame_size = (uint16_t)size;
		configs[i].enable = (targets[i] != 0 ? 1 : 0);
	}
	ctrl->config(duration, configs);
	ctrl->start();
}

void parseif() {
	system("ip -br l >/tmp/ifs.txt");
	ifstream inf("/tmp/ifs.txt");
	string ctnt, mac;
	while (inf >> ctnt) {
		if (ctnt.substr(0, 3) == "eth") {
			inf >> mac;
			inf >> mac;
			int ifid = ctnt[3] - 48;
			if (ifid > 0 && ifid < 5) {
				for (int j = 0; j < 6; ++j) {
					unsigned v;
					sscanf(mac.substr(j * 3, 2).c_str(), "%x", &v);
					dst_macs[ifid - 1].addr[j] = v;
				}
			}
		}
	}
}

int test_duration;

void tst_setup() {
	current_status = STATUS_IDLE;
	const char* dur_s = getenv("TST_DUR");
	if (!dur_s || !*dur_s) {
		test_duration = 1000;
	} else {
		test_duration = atoi(dur_s);
	}

	const char* rip_s = getenv("TST_RIP_INTERVAL");
	if (!rip_s || !*rip_s) {
		rip_interval = 1;
	} else {
		rip_interval = atoi(rip_s);
	}

	ctrl = new SpeedTesterCtrl();

	parseif();

	printf("Test duration set to %d ms, rip interval %d s\n", test_duration,
			rip_interval);

	/* use if mac as dst mac */
	puts("Destination macs:");
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 6; ++j) {
			printf("%02x%c", dst_macs[i].addr[j], j == 5 ? '\n': ':');
		}
	}

	/* random generate src mac */
	for (int i = 0; i < N_PORTS; ++i) {
		for (int j = 0; j < 6; ++j) {
			src_macs[i].addr[j] = rand() & 0xff;
		}
	}

	stringstream cmds;
	cmds << "killall bird";
	TST_EXEC(cmds.str().c_str());
	/* setup bird in each netns */
	for (int i = 0; i < N_PORTS; ++i) {
		int si = i + 1;
		cmds.str("");
		cmds << "ip netns exec vth"  << si << " "
				<< "bird -s /var/run/bird" << si << ".ctl "
				<< "-c birds/bird" << si << ".conf";
		TST_EXEC(cmds.str().c_str());
	}
}

void reset_routing_table(int ifid, int n) {
	stringstream cmds;
	cmds << "birds/static-routing-" << ifid << ".conf";
	FILE* conf = fopen(cmds.str().c_str(), "w");
	fprintf(conf, "route 10.0.%d.0/24 via \"lo\";\n", ifid);
	for (int i = 1; i < n; ++i) {
		fprintf(conf, "route 11%d.%d.%d.0/24 via \"lo\";\n", ifid, 
				i & 0xff, (i >> 8) & 0xff);
	}
	fclose(conf);
	cmds.str("");
	cmds << "echo configure | bird -s /var/run/bird" << ifid << ".ctl";
	TST_EXEC(cmds.str().c_str());
}

int check_num_routing() {
	int x, s;
#ifdef FAKE_EXEC
	return 1;
#endif
	for (int i = 0; i < N_PORTS; ++i) {
		stringstream cmds;
		cmds << "echo show route | birdcl -s /var/run/bird" << i + 1 << ".ctl"
			<< " | wc -l";
		FILE *cmdf = fopen(cmds.str().c_str(), "r");
		int n;
		fscanf(cmdf, "%d", &n);
		fclose(cmdf);
		printf("Port %d route %d\n", i + 1, n);
		if (n < rip_n * N_PORTS) {
			return 0;
		}
	}
	return 1;
}

void* tst_setup_routing_table_th(void* np) {
	current_status = STATUS_ROUTING;
	task_start_time = time(0);
	rip_n = *(int*)np;
	delete np;

	for (int i = 0; i < N_PORTS; ++i) {
		reset_routing_table(i + 1, rip_n);
	}

	sleep(rip_interval);
	if (!check_num_routing()) {
		sleep(rip_interval);
		rip_passed = check_num_routing();
	} else {
		rip_passed = 1;
	}
	rip_latency = (time(0) - task_start_time) * 1000;
	current_status = STATUS_ROUTING_READY;
	return 0;
}

void tst_setup_routing_table(int n_) {
	int* np = new int;
	*np = n_;
	pthread_t th;
	pthread_create(&th, 0, tst_setup_routing_table_th, (void*)np);
}

void tst_test_routing_4(int t0, int t1, int t2, int t3) {
	int targets[4] = {t0, t1, t2, t3};
	// test_routing(targets, 128, 100);
}

void tst_test_speed_4(int t0, int t1, int t2, int t3, int size) {
	current_status = STATUS_SPEED;
	int targets[4] = {t0, t1, t2, t3};
	test_routing(targets, size, test_duration);
}

string tst_get_status() {
	stringstream buf;
	if (current_status == STATUS_IDLE) {
		buf << "{\"status\":\"idle\"}";
		return buf.str();
	}

	if (current_status == STATUS_ROUTING || current_status == STATUS_IP) {
		unsigned long duration = (time(0) - task_start_time) * 1000;
		buf << "{\"status\":\"busy\","
				"\"duration\":" << duration << "}";
		return buf.str();
	}
	
	if (current_status == STATUS_ROUTING_READY) {
		buf << "{\"status\":\"done\","
				"\"latency\":" << rip_latency << ","
				"\"passed\":" << rip_passed << ","
				"\"n_rip\":" << rip_n << "}";
		return buf.str();
	}

	if (ctrl->isBusy()) {
		int duration = ctrl->getDuration();
		buf << "{\"status\":\"busy\","
				"\"duration\":" << duration << "}";
		return buf.str();
	}
	result_t* res = ctrl->getResult();
	if (!res) {
		buf << "{\"status\":\"error\","
				"\"message\":\"Cannot get results\"}";
		return buf.str();
	}
	buf << "{\"status\":\"done\"," << 
		"\"duration\":" << test_duration << "," << 
		"\"results\":[";
	for (int i = 0; i < N_PORTS; ++i) {
		buf << "{\"recv_frames\":" << res[i].recv_frames << ","
				"\"recv_bytes\":" << res[i].recv_bytes << ","
				"\"err_frames\":" << res[i].err_frames << ","
				"\"err_bytes\":" << res[i].err_bytes << "}";
		if (i + 1 < N_PORTS) {
			buf << ",";
		}
	}
	buf << "]}";
	current_status = STATUS_READY;
	return buf.str();
}

