#ifndef TST_CTRL_HH
#define TST_CTRL_HH

class TestController {
private:
	int fd_;
	char* raw_;

	void setup();

public:
	TestController() {
		setup();
	}

	int config(unsigned short duration, const struct config_t* port_configs);
	int start();

	int isBusy();
	int getDuration();
	struct result_t* getResult();
};

#endif  // TST_CTRL_HH
