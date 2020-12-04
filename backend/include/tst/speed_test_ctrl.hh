#ifndef TST_SPEED_TEST_CTRL_HH
#define TST_SPEED_TEST_CTRL_HH

#define RET_SUCCESS	0
#define RET_FAIL	-1

class SpeedTesterCtrl {
private:
	int fd_;
	char* raw_;

	void setup();
	void destroy();

public:
	SpeedTesterCtrl() {
		setup();
	}

	~SpeedTesterCtrl() {
		destroy();
	}

	int config(unsigned short duration, const struct config_t* port_configs);
	int start();

	int isBusy();
	int getDuration();
	struct result_t* getResult();
};

#endif  // TST_SPEED_TESTER_CTRL_HH
