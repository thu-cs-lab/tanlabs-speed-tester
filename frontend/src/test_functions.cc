#include <cstring>
#include <string>
#include <sstream>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <iostream>

#include <tst/speed_test_api.h>
#include <tst/speed_test_ctrl.hh>
#include <tst/test_functions.hh>


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
	const char* dur_s = getenv("TST_DUR");
	if (!dur_s || !*dur_s) {
		test_duration = 1000;
	} else {
		test_duration = atoi(dur_s);
	}

	ctrl = new SpeedTesterCtrl();

	parseif();

	printf("Test duration set to %d ms\n", test_duration);
	puts("Destination macs:");
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 6; ++j) {
			printf("%02x%c", dst_macs[i].addr[j], j == 5 ? '\n': ':');
		}
	}

	for (int i = 0; i < N_PORTS; ++i) {
		for (int j = 0; j < 6; ++j) {
			src_macs[i].addr[j] = rand() & 0xff;
		}
	}
}

void tst_setup_routing_table(int n_) {
	// TODO
}

void tst_test_routing_4(int t0, int t1, int t2, int t3) {
	int targets[4] = {t0, t1, t2, t3};
	// test_routing(targets, 128, 100);
}

void tst_test_speed_4(int t0, int t1, int t2, int t3, int size) {
	int targets[4] = {t0, t1, t2, t3};
	test_routing(targets, size, test_duration);
}

string tst_get_status() {
	stringstream buf;
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
	return buf.str();
}

