#include <cstring>
#include <string>
#include <sstream>
#include <cstdio>
#include <cstdlib>

#include <tst/speed_test_api.h>
#include <tst/speed_test_ctrl.hh>
#include <tst/test_functions.hh>


using std::string;
using std::stringstream;

SpeedTesterCtrl* ctrl;

mac_addr_t src_macs[N_PORTS];
mac_addr_t dst_macs[N_PORTS];

void test_routing(int* targets, int size, int duration) {
	config_t configs[N_PORTS];

	for (int i = 0; i < N_PORTS; ++i) {
		memcpy(&configs[i].src_mac, &src_macs[i], sizeof(mac_addr_t));
		memcpy(&configs[i].dst_mac, &dst_macs[i], sizeof(mac_addr_t));
		// TODO: Fill ip
		configs[i].frame_size = (uint16_t)size;
		configs[i].enable = (targets[i] != 0 ? 1 : 0);
	}
	ctrl->config(duration, configs);
	ctrl->start();
}

void tst_setup() {
	ctrl = new SpeedTesterCtrl();
	for (int i = 0; i < N_PORTS; ++i) {
		for (int j = 0; j < 6; ++j) {
			src_macs[i].addr[j] = rand() & 0xff;
			dst_macs[i].addr[j] = rand() & 0xff;
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
	test_routing(targets, size, 1000);
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
	buf << "{\"status\":\"done\",\"results\":[";
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

