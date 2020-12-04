#include <tst/web_server.hh>
#include <tst/test_functions.hh>


int main() {
	// tst_setup();

	WebServer server;
	server.listen("0.0.0.0", "8823");
}
