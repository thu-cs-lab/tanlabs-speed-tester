#include <cstdlib>

#include <tst/web_server.hh>
#include <tst/test_functions.hh>


int main() {
	tst_setup();

	const char* s_port = getenv("TST_PORT");
	if (!s_port || !*s_port) {
		s_port = "80";
	}
	WebServer server;
	server.listen("0.0.0.0", s_port);
}
