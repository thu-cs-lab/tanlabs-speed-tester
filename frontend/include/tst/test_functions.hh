#ifndef TST_TEST_FUNCTIONS_HH
#define TST_TEST_FUNCTIONS_HH

#include <string>

void tst_setup();
void tst_setup_routing_table(int n_records);

void tst_test_routing_4(int target0, int target1, int target2, int target3);
void tst_test_speed_4(int target0, int target1, int target2, int target3,
		int size);

std::string tst_get_status();

#endif  // TST_TEST_FUNCTIONS_HH
