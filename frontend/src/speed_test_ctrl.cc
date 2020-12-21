#include <cstdlib>
#include <cstdio>
#include <cstring>
#include <algorithm>

#include <unistd.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <fcntl.h>

#include <tst/speed_test_api.h>
#include <tst/speed_test_ctrl.hh>

#define PAGE_SIZE 4096

void SpeedTesterCtrl::setup() {
	this->fd_ = open("/dev/mem", O_RDWR | O_SYNC);
	if (this->fd_ == -1) {
		fprintf(stderr, "cannot open mem\n");
		exit(-1);
	}
	this->raw_ = (char*)mmap(0, std::max(PAGE_SIZE, OFFSET_RESERVED), 
			PROT_READ | PROT_WRITE, 
			MAP_SHARED, this->fd_, OFFSET_ZYNQ_BASE);
	if (this->raw_ == MAP_FAILED) {
		fprintf(stderr, "cannot mmap\n");
		exit(-1);
	}
	fprintf(stderr, "mmap ready %lx\n", (unsigned long)this->raw_);
}

void SpeedTesterCtrl::destroy() {
	if (this->raw_) {
		munmap(this->raw_, OFFSET_RESERVED);
	}
	if (this->fd_ != -1) {
		close(this->fd_);
	}
}

int SpeedTesterCtrl::config(unsigned short duration, 
		const config_t* port_configs) {
	duration &= (1u << 13) - 1;
	memcpy(this->raw_ + OFFSET_DURATION, &duration, 2);
	memcpy(this->raw_ + OFFSET_TEST_CONFIG, port_configs, 
			sizeof(config_t) * N_PORTS);
	return RET_SUCCESS;
}

int SpeedTesterCtrl::start() {
	uint8_t signal = 0xff;
	memcpy(this->raw_ + OFFSET_START, &signal, 1);
	return RET_SUCCESS;
}

int SpeedTesterCtrl::isBusy() {
	uint8_t res;
	memcpy(&res, this->raw_ + OFFSET_BUSY, 1);
	return res & 1;
}

int SpeedTesterCtrl::getDuration() {
	uint16_t duration;
	memcpy(&duration, this->raw_ + OFFSET_DURATION, 2);
	duration &= ((1u << 13) - 1);
	return (int)duration;
}

result_t* SpeedTesterCtrl::getResult() {
	if (this->isBusy()) {
		return 0;
	}
	result_t *results = new result_t[N_PORTS];
	memcpy(results, this->raw_ + OFFSET_TEST_RESULT, 
			sizeof(result_t) * N_PORTS);
	return results;
}

