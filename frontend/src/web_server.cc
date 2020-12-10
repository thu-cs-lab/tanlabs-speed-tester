#include <cctype>
#include <vector>
#include <string>
#include <unistd.h>

#include <CivetServer.h>

#include <tst/web_server.hh>
#include <tst/test_functions.hh>

using std::string;
using std::vector;

#define TST_LOG(...) fprintf(stderr, __VA_ARGS__)

vector<int> seq2ints(const char* p) {
	int x = 0;
	vector<int> v;
	for (; *p; ++p) {
		if (isdigit(*p)) {
			x = x * 10 + *p - 48;
		} else if (*p == '.') {
			v.push_back(x);
			return v;
		} else {
			v.push_back(x);
			x = 0;
		}
	}
	v.push_back(x);
	return v;
}

class APIHandler: public CivetHandler {
public:
	bool handleGet(CivetServer *server, struct mg_connection *conn) {
		const struct mg_request_info *req_info = mg_get_request_info(conn);

		TST_LOG("GET request: %s\n", req_info->local_uri);

		string uri(req_info->local_uri);
		
		if (uri == "/api/get_result") {
			mg_printf(conn,
					"HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n");
			string res = tst_get_status();
			mg_printf(conn, "%s", res.c_str());
		} else {
			return false;
		}

		return true;
	}

	bool handlePost(CivetServer *server, struct mg_connection *conn) {
		// TODO: uncomment the tst functions
		const struct mg_request_info *req_info = mg_get_request_info(conn);

		TST_LOG("POST request: %s\n", req_info->local_uri);

		string uri(req_info->local_uri);
		char* cbuf = new char[req_info->content_length + 10];
		mg_read(conn, cbuf, req_info->content_length);
		string buf(cbuf);
		delete [] cbuf;
		TST_LOG("POST body: %s\n", buf.c_str());
		
		mg_printf(conn,
		          "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\n");
		if (uri == "/api/set_ip") {
			tst_set_ip(buf);
			mg_printf(conn, "done");
		} else if (uri == "/api/test_rip") {
			int nr = atoi(buf.c_str());
			TST_LOG("Setup RIP table with %d records\n", nr);
			tst_setup_routing_table(nr);
			mg_printf(conn, "done");
		} else if (uri == "/api/test_ip") {
			vector<int> tgts = seq2ints(buf.c_str());
			if (tgts.size() != 4) {
				mg_printf(conn, "error: number of targets should be 4");
			} else {
				TST_LOG("Test routing tgts %d %d %d %d\n", tgts[0], tgts[1], tgts[2], tgts[3]);
				tst_test_routing_4(tgts[0], tgts[1], tgts[2], tgts[3]);
				mg_printf(conn, "done");
			}
		} else if (uri == "/api/test_speed") {
			vector<int> tgts = seq2ints(buf.c_str());
			if (tgts.size() != 5) {
				mg_printf(conn, "error: format should be t0,t1,t2,t3;size");
			} else {
				int size = tgts[4];
				TST_LOG("Test speed with size %d tgts %d %d %d %d\n", size, tgts[0], tgts[1], tgts[2], tgts[3]);
				tst_test_speed_4(tgts[0], tgts[1], tgts[2], tgts[3], size);
				mg_printf(conn, "done");
			}
		} else {
			return false;
		}

		return true;
	}
};


void WebServer::listen(const char* addr, const char* port) {
	mg_init_library(0);

	const char *options[] = { 
		"document_root", "./www/html", 
		"listening_ports", port, 0};

	std::vector<std::string> cpp_options;
	for (int i=0; i<(sizeof(options)/sizeof(options[0])-1); i++) {
		cpp_options.push_back(options[i]);
	}
	CivetServer server(cpp_options);

	APIHandler h_api;
	server.addHandler("/api*", h_api);

	TST_LOG("Server working on address %s  port %s\n", addr, port);
	while (true) {
		sleep(60);
	}
	mg_exit_library();
}
