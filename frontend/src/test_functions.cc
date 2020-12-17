#include <cstring>
#include <ctime>
#include <cstdio>
#include <cstdlib>

#include <vector>
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
#define TST_EXEC(__cmd__) { int ret = system(__cmd__); \
	printf("Exec %s retured %d\n", __cmd__, ret); }
#endif

using std::vector;
using std::max;
using std::string;
using std::stringstream;
using std::ifstream;
using std::cout;
using std::endl;

#define STATUS_IDLE 0
#define STATUS_READY 5
#define STATUS_ROUTING 1
#define STATUS_ROUTING_READY 11
#define STATUS_IP 2
#define STATUS_IP_READY 21
#define STATUS_SPEED 3

int current_status;
int ping_cnt;
int rip_interval;
int rip_passed, rip_n, rip_latency, rip_maxroutes, rip_routes[N_PORTS];
typedef struct {
	int from, to, pass;
} ping_res_t;
vector<ping_res_t> ping_res;
time_t task_start_time;

SpeedTesterCtrl* ctrl;

mac_addr_t src_macs[N_PORTS];
mac_addr_t dst_macs[N_PORTS];

string router_ip[N_PORTS];
string src_ip[N_PORTS];

typedef struct {
	string ip;
	int mask;
} route_t;
vector<route_t> routes[N_PORTS];

typedef struct _trie_node_t {
	_trie_node_t* ch[2];
	int port;
} trie_node_t;

trie_node_t *trie_root, *trie_ptr, *trie_node_pool = 0;

void trie_insert(ip_addr_t ip, int port, int mask) {
	trie_node_t* ptr = trie_root; 
	for (int i = 0; i < 4 && mask; ++i) {
		for (int j = 7; j >= 0 && mask; --j, --mask) {
			int d = (ip.addr[i] >> j) & 1;
			if (!ptr->ch[d]) {
				ptr->ch[d] = trie_ptr++;
				memset(ptr->ch[d], 0, sizeof(trie_node_t));
			}
			ptr = ptr->ch[d];
		}
	}
	ptr->port |= (1 << port);
}

ip_addr_t str2struct(string ip) {
	ip_addr_t a = {0, 0, 0, 0};
	for (int i = 0, j = 0; i < ip.length(); ++i) {
		if (isdigit(ip[i])) {
			a.addr[j] = a.addr[j] * 10 + ip[i] - 48;
		} else {
			++j;
		}
	}
	return a;
}

void parse_src_mac() {
	for (int i = 1; i <= N_PORTS; ++i) {
		stringstream cmds;
		cmds << "ip netns exec vn" << i << " ip addr flush eth" << i; 
		TST_EXEC(cmds.str().c_str());

		cmds.str("");
		cmds << "ip netns exec vn" << i << " ip addr add " << src_ip[i - 1] << "/24 dev eth" << i; 
		TST_EXEC(cmds.str().c_str());

		cmds.str("");
		cmds << "ip netns exec vn" << i << " ip -br l"; 
		FILE* inf = popen(cmds.str().c_str(), "r");
		char buf[1024];
		string ctnt, mac;
		while (fscanf(inf, "%s", buf) != EOF) {
			ctnt = string(buf);
			if (ctnt.substr(0, 3) == "eth") {
				int ifid = ctnt[3] - 48;
				if (ifid == i) {
					fscanf(inf, "%*s%s", buf);
					mac = string(buf);
					if (mac.length() != 17) {
						fprintf(stderr, "incomplete mac %s\n", mac.c_str());
						continue;
					}
					fprintf(stderr, "got mac %s\n", mac.c_str());
					for (int j = 0; j < 6; ++j) {
						unsigned v;
						sscanf(mac.substr(j * 3, 2).c_str(), "%x", &v);
						src_macs[ifid - 1].addr[j] = v;
					}
				}
			}
		}
		fclose(inf);
	}
}


void parse_dst_mac() {
	for (int i = 1; i <= N_PORTS; ++i) {
		stringstream cmds;
		cmds.str("");
		cmds << "ip netns exec vn" << i << " ping -W 2 -w 1 " << router_ip[i - 1];
		TST_EXEC(cmds.str().c_str());
		cmds.str("");
		cmds << "ip netns exec vn" << i << " arp"; 
		FILE* inf = popen(cmds.str().c_str(), "r");
		char buf[1024];
		string ctnt, mac;
		while (fscanf(inf, "%s", buf) != EOF) {
			ctnt = string(buf);
			if (ctnt == router_ip[i - 1]) {
				fscanf(inf, "%*s%s", buf);
				mac = string(buf);
				if (mac.length() != 17) {
					fprintf(stderr, "incomplete mac %s\n", mac.c_str());
					continue;
				}
				for (int j = 0; j < 6; ++j) {
					unsigned v;
					sscanf(mac.substr(j * 3, 2).c_str(), "%x", &v);
					dst_macs[i - 1].addr[j] = v;
				}
			}
		}
		fclose(inf);
	}
}

void write_routing_table(int n) {
	if (trie_node_pool) {
		delete [] trie_node_pool;
	}
	trie_ptr = trie_node_pool = new trie_node_t[n * 32];
	trie_root = trie_ptr++;
	memset(trie_root, 0, sizeof(trie_node_t));

	FILE* fos[N_PORTS];
	for (int ifid = 1; ifid <= N_PORTS; ++ifid) {
		stringstream filename_s;
		filename_s << "birds/static-routing-" << ifid << ".conf";
		fos[ifid - 1] = fopen(filename_s.str().c_str(), "w");
		ip_addr_t ip = str2struct(src_ip[ifid - 1]);
		fprintf(fos[ifid - 1], "route %u.%u.%u.0/24 via \"lo\";\n", 
				ip.addr[0], ip.addr[1], ip.addr[2]);
		routes[ifid - 1].clear();
		route_t r = {.ip=src_ip[ifid - 1], .mask=24};
		routes[ifid - 1].push_back(r);

		trie_insert(ip, ifid - 1, 24);
	}
	FILE* routin = fopen("/var/fib_shuffled.txt", "r");
	char ip[23], mask[5];
	int port;
	for (int i = N_PORTS; i < n; ++i) {
		fscanf(routin, "%s%s%*s%d", ip, mask, &port);
		fprintf(fos[port], "route %s/%s unreachable;\n", ip, mask);
		route_t r = {.ip=string(ip), .mask=atoi(mask)};
		routes[port].push_back(r);

		ip_addr_t ipa = str2struct(ip);
		trie_insert(ipa, port, atoi(mask));
	}
	for (int ifid = 1; ifid <= N_PORTS; ++ifid) {
		fclose(fos[ifid - 1]);
	}
	fclose(routin);
}

void reset_routing_table(int ifid, int n) {
	stringstream cmds;
	cmds << "echo configure | birdcl -s /var/run/bird" << ifid << ".ctl";
	TST_EXEC(cmds.str().c_str());
}

int test_duration;

void kill_bird() {
	stringstream cmds;
	for (int i = 1; i <= N_PORTS; ++i) {
		cmds.str("");
		cmds << "echo q | birdcl -s /var/run/bird" << i << ".ctl";
		TST_EXEC(cmds.str().c_str());
	}

	cmds.str("");
	cmds << "killall bird";
	TST_EXEC(cmds.str().c_str());
	TST_EXEC(cmds.str().c_str());
	TST_EXEC(cmds.str().c_str());
}

void reset_bird() {
	stringstream cmds;
	kill_bird();
	sleep(1);
	write_routing_table(N_PORTS);

	/* setup bird in each netns */
	for (int i = 0; i < N_PORTS; ++i) {
		int si = i + 1;
		cmds.str("");
		cmds << "ip netns exec vn"  << si << " "
			<< "bird -s /var/run/bird" << si << ".ctl "
			<< "-c birds/bird" << si << ".conf";
		TST_EXEC(cmds.str().c_str());
	}
}

void tst_setup() {
	current_status = STATUS_IDLE;
	const char* dur_s = getenv("TST_DUR");

	for (int i = 0; i < 4; ++i) {
		stringstream ip;
		ip << "10.0." << i << ".1";
		router_ip[i] = ip.str();
		ip.str("");
		ip << "10.0." << i << ".2";
		src_ip[i] = ip.str();
	}

	if (!dur_s || !*dur_s) {
		test_duration = 1000;
	} else {
		test_duration = atoi(dur_s);
	}

	const char* ping_s = getenv("TST_PING_CNT");
	if (!ping_s || !*ping_s) {
		ping_cnt = 100;
	} else {
		ping_cnt = atoi(ping_s);
	}

	const char* rip_s = getenv("TST_RIP_INTERVAL");
	if (!rip_s || !*rip_s) {
		rip_interval = 1;
	} else {
		rip_interval = atoi(rip_s);
	}

	ctrl = new SpeedTesterCtrl();

	parse_src_mac();
	parse_dst_mac();

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

	reset_bird();
}

int check_num_routing() {
	int x, s, pass = 1;
#ifdef FAKE_EXEC
	return 1;
#endif

	for (int i = 0; i < N_PORTS; ++i) {
		stringstream cmds;
		cmds << "echo show route | birdcl -s /var/run/bird" << i + 1 << ".ctl"
			<< " | wc -l";
		FILE *cmdf = popen(cmds.str().c_str(), "r");
		if (!cmdf) {
			fprintf(stderr, "Wrong filename %s\n", cmds.str().c_str());
		}
		int n;
		fscanf(cmdf, "%d", &n);
		fclose(cmdf);
		n -= 3;
		rip_routes[i] = n;
		printf("Port %d route %d\n", i + 1, n);
		if (n < rip_n) {
			pass = 0;
		}
	}
	return pass;
}

void* tst_setup_routing_table_th(void* np) {
	current_status = STATUS_ROUTING;
	task_start_time = time(0);
	rip_n = *(int*)np;
	delete (int*)np;

	write_routing_table(rip_n);
	for (int i = 0; i < N_PORTS; ++i) {
		reset_routing_table(i + 1, rip_n);
	}

	sleep(rip_interval);
	rip_passed = 0;
	rip_maxroutes = 0;
	for (int i = 0; i < 10 && !rip_passed; ++i) {
		if (!check_num_routing()) {
			int curr_max = rip_routes[0];
			for (int j = 1; j < N_PORTS; ++j) {
				curr_max = max(curr_max, rip_routes[j]);
			}
			if (curr_max > rip_maxroutes) {
				rip_maxroutes = curr_max;
				i = 0;
			}
			sleep(rip_interval);
			rip_passed = check_num_routing();
		} else {
			rip_passed = 1;
			break;
		}
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

int get_ip_port(ip_addr_t ip) {
	trie_node_t* ptr = trie_root; 
	int port = 0;
	for (int i = 0; i < 4 && ptr; ++i) {
		for (int j = 7; j >= 0 && ptr; --j) {
			if (ptr->port) { 
				port = ptr->port;
			}
			int d = (ip.addr[i] >> j) & 1;
			ptr = ptr->ch[d];
		}
	}
	return port;
}

string get_target_ip(int port_idx) {
	while (1) {
		stringstream ips;
		unsigned idx = rand() % routes[port_idx].size();
		route_t r = routes[port_idx][idx];
		unsigned ipa[4];
		sscanf(r.ip.c_str(), "%u.%u.%u.%u", ipa + 0, ipa + 1, ipa + 2, ipa + 3);
		unsigned suffix = rand() & ((1u << (32 - r.mask)) - 1);
		ipa[0] += (suffix >> 24) & 0xffu;
		ipa[1] += (suffix >> 16) & 0xffu;
		ipa[2] += (suffix >> 8) & 0xffu;
		ipa[3] += (suffix >> 0) & 0xffu;
		if ((ipa[3] & ((1u << r.mask) - 1)) == 0) {
			++ipa[3];
		}
		for (int i = 0; i < 4; ++i) {
			if (ipa[i] == 0xffu) {
				--ipa[i];
			}
		}
		ips.str("");
		ips << ipa[0] << "." << ipa[1] << "." << ipa[2] << "." << ipa[3];
		ip_addr_t ipr = {ipa[0], ipa[1], ipa[2], ipa[3]};
		int reqport = get_ip_port(ipr);
		fprintf(stderr, "Random generate ip for %s/%d : %s, estimated port %x\n", 
				r.ip.c_str(), r.mask, ips.str().c_str(), reqport);
		if (reqport == (1 << port_idx)) {
			return ips.str();
		}
	}
}

void add_ip(int i, string ip) {
	stringstream cmds;
	cmds << "ip netns exec vn" << i << " ip addr add " << ip << "/32 dev eth" << i;
	TST_EXEC(cmds.str().c_str());
}

void del_ip(int i, string ip) {
	stringstream cmds;
	cmds << "ip netns exec vn" << i << " ip addr del " << ip << "/32 dev eth" << i;
	TST_EXEC(cmds.str().c_str());
}

void* tst_ping(void* tgts) {
	current_status = STATUS_IP;
	task_start_time = time(0);
	ping_res.clear();
	stringstream cmds;
	for (int i = 0; i < N_PORTS; ++i) {
		int tgt = ((int*)tgts)[i];
		// fprintf(stderr, "test tgt %d %d\n", i, tgt);
		if (tgt == 0) {
			continue;
		}
		
		string target_ip = get_target_ip(tgt - 1);
		add_ip(tgt, target_ip);

		cmds.str("");
		cmds << "ip netns exec vn" << i + 1 << " ping -W 2 -A -c " << ping_cnt << " -w 1 " << target_ip;
		int cnt_pass = 0;
		for (int j = 0; j < 10; ++j) {
			int ret = system(cmds.str().c_str());
			if (ret == 0) {
				++cnt_pass;
			}
		}
		fprintf(stderr, "Ping test pass rate: %d/%d\n", cnt_pass, 10);
		ping_res_t res = {.from=i + 1, .to=tgt, .pass=cnt_pass > 7};
		ping_res.push_back(res);

		del_ip(tgt, target_ip);
	}
	current_status = STATUS_IP_READY;
	// fprintf(stderr, "ip fin\n");
	delete [] (int*)tgts;
	// fprintf(stderr, "del suc\n");
	return 0;
}

void tst_test_routing_4(int t0, int t1, int t2, int t3) {
	int static_targets[4] = {t0, t1, t2, t3};
	int* targets = new int[4];
	memcpy(targets, static_targets, 4 * sizeof(int));
	pthread_t th;
	pthread_create(&th, 0, tst_ping, (void*)targets);
}

void test_speed(int* targets, int size, int duration) {
	config_t configs[N_PORTS];

	for (int i = 0; i < N_PORTS; ++i) {
		int tgt = targets[i];
		if (tgt) {
			--tgt;
			memcpy(&configs[i].src_mac, &src_macs[i], sizeof(mac_addr_t));
			memcpy(&configs[i].dst_mac, &dst_macs[i], sizeof(mac_addr_t));

			string target_ip = get_target_ip(tgt);
			add_ip(tgt + 1, target_ip);

			ip_addr_t ip = str2struct(target_ip.c_str());
			memcpy(&configs[i].dst_ip, &ip, sizeof(mac_addr_t));
		}

		configs[i].frame_size = (uint16_t)size + 14;
		configs[i].enable = (targets[i] != 0 ? 1 : 0);
	}
	ctrl->config(duration, configs);
	ctrl->start();
}

void tst_test_speed_4(int t0, int t1, int t2, int t3, int size) {
	current_status = STATUS_SPEED;
	int targets[4] = {t0, t1, t2, t3};
	test_speed(targets, size, test_duration);
}

string tst_get_status() {
	stringstream buf;
	if (current_status == STATUS_IDLE) {
		buf << "{\"status\":\"idle\"}";
		return buf.str();
	}

	stringstream ipbuf;
	if (current_status == STATUS_IP || current_status == STATUS_IP_READY) {
		unsigned sz = ping_res.size();
		ipbuf << "\"cases\":[";
		for (unsigned i = 0; i < sz; ++i) {
			if (i) {
				ipbuf << ",";
			}
			ipbuf << "{\"from\":" << ping_res[i].from << ","
				<< "\"to\":" << ping_res[i].to << ","
				<< "\"pass\":" << ping_res[i].pass << "}";
		}
		ipbuf << "]";
	}
	if (current_status == STATUS_ROUTING || current_status == STATUS_IP) {
		unsigned long duration = (time(0) - task_start_time) * 1000;
		buf << "{\"status\":\"busy\",";
		if (current_status == STATUS_ROUTING) {
			buf << "\"max_routes\":\"";
			for (int i = 0; i < N_PORTS; ++i) {
				buf << rip_routes[i];
				if (i + 1 < N_PORTS) {
					buf << ",";
				} else {
					buf << "\",";
				}
			}
		}
		if (current_status == STATUS_IP) {
			buf << ipbuf.str() << ",";
		}
		buf << "\"duration\":" << duration << "}";
		return buf.str();
	}
	
	if (current_status == STATUS_ROUTING_READY) {
		buf << "{\"status\":\"done\","
			"\"latency\":" << rip_latency << ","
			"\"passed\":" << rip_passed << ","
			"\"n_rip\":" << rip_n << ","
			"\"message\":\"Received routes: ";
		for (int i = 0; i < N_PORTS; ++i) {
			buf << rip_routes[i];
			if (i + 1 < N_PORTS) {
				buf << ",";
			}
		}
		buf << "\"}";
		return buf.str();
	}

	if (current_status == STATUS_IP_READY) {
		buf << "{\"status\":\"done\"," << ipbuf.str() << "}";
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

void tst_set_ip(string raw) {
	for (int i = 0; i < N_PORTS; ++i) {
		int p = raw.find(',');
		src_ip[i] = raw.substr(0, p);
		raw = raw.substr(p + 1);
	}
	for (int i = 0; i < N_PORTS; ++i) {
		int p = raw.find(',');
		router_ip[i] = raw.substr(0, p);
		raw = raw.substr(p + 1);
	}
	reset_bird();
	parse_src_mac();
	parse_dst_mac();
}
