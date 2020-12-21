#include <cstring>
#include <string>
#include <algorithm>
#include <sstream>

#include <tst/speed_test_api.h>
#include <tst/speed_test_ctrl.hh>
#include <tst/test_functions.hh>


using std::string;
using std::stringstream;


#define TASK_ROUTING 1
#define TASK_IP 2
#define TASK_SPEED 3

int g_duration = 0, g_busy = 0;
int g_size, g_task, g_rip;
int g_tgts[4];

void test_routing(int* targets, int size, int duration) {
	g_busy = 1;
	g_duration = duration;
	g_size = size;
}

void tst_setup() {
}

void tst_setup_routing_table(int n_) {
	g_size = n_;
	g_busy = 1;
	g_duration = 1000;
	g_rip = n_;
	g_task = TASK_ROUTING;
}

void tst_test_routing_4(int t0, int t1, int t2, int t3) {
	int targets[4] = {t0, t1, t2, t3};
	memcpy(g_tgts, targets, 4 * sizeof(int));
	g_busy = 1;
	g_duration = 2000;
	g_task = TASK_IP;
}

void tst_test_speed_4(int t0, int t1, int t2, int t3, int size) {
	int targets[4] = {t0, t1, t2, t3};
	memcpy(g_tgts, targets, 4 * sizeof(int));
	test_routing(targets, size, 4000);
	g_task = TASK_SPEED;
	g_size = size;
}

result_t* fake_results() {
	if (g_size == 0) {
		g_size = 1;
	}
	result_t* res = new result_t[4];
	int wire_speed = 1000000000 / 8;
	int send_pps = wire_speed / g_size;
	int fwd_pps = std::max(0, std::min(send_pps, 1000000 - g_rip * 500));
	for (int i = 0; i < 4; ++i) {
		res[i].recv_frames = fwd_pps;
		res[i].recv_bytes = fwd_pps * g_size;
		res[i].err_frames = send_pps - fwd_pps;
		res[i].err_bytes = res[i].err_frames * g_size;
	}
	return res;
}

string tst_get_status() {
	stringstream buf;
	g_duration -= 100;
	if (g_duration <= 0) {
		g_busy = 0;
		g_duration = 0;
	}
	if (g_busy) {
		int duration = g_duration;
		buf << "{\"status\":\"busy\","
				"\"duration\":" << duration << "}";
		return buf.str();
	}
	if (g_task == TASK_SPEED) {
		result_t* res = fake_results();
		if (!res) {
			buf << "{\"status\":\"error\","
				"\"message\":\"Cannot get results\"}";
			return buf.str();
		}
		buf << "{\"status\":\"done\","
			<< "\"packet_size\":" << g_size << ","
			<< "\"results\":[";
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
		delete [] res;
	} else if (g_task == TASK_ROUTING) {
		buf << "{\"status\":\"done\","
			<< "\"n_rip\":" << g_size << ","
			<< "\"passed\":true,"
			<< "\"latency\":1234}";
	} else if (g_task == TASK_IP) {
		buf << "{\"status\":\"done\","
			<< "\"cases\":[";
		for (int i = 0; i < N_PORTS; ++i) {
			buf << "{\"from\":" << i + 1 << ","
				<< "\"to\":" << g_tgts[i] << ","
				<< "\"pass\":true}";
			if (i + 1 < N_PORTS) {
				buf << ",";
			}
		}
		buf << "]}";
	}
	return buf.str();
}

