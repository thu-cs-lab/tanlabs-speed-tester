#include <vector>
#include <string>
#include <unistd.h>

#include <tst/web_server.hh>
#include <CivetServer.h>

using std::string;

#define TST_LOG(...) fprintf(stderr, __VA_ARGS__)

class APIHandler: public CivetHandler {
public:
	bool handleGet(CivetServer *server, struct mg_connection *conn) {
		const struct mg_request_info *req_info = mg_get_request_info(conn);

		TST_LOG("GET request: %s\n", req_info->local_uri);

		string uri(req_info->local_uri);
		
		if (uri == "/api/get_busy") {
		} else if (uri == "/api/get_duration") {
		} else if (uri == "/api/get_result") {
		} else {
			return false;
		}

		return true;
	}

	bool handlePost(CivetServer *server, struct mg_connection *conn) {
		const struct mg_request_info *req_info = mg_get_request_info(conn);

		TST_LOG("POST request: %s\n", req_info->local_uri);

		string uri(req_info->local_uri);
		char* cbuf = new char[req_info->content_length + 10];
		mg_read(conn, cbuf, req_info->content_length);
		string buf(cbuf);
		delete [] cbuf;
		TST_LOG("POST body: %s\n", buf.c_str());
		
		if (uri == "/api/test_rip") {
		} else if (uri == "/api/test_connectivity") {
		} else if (uri == "/api/test_bandwidth") {
		} else {
			return false;
		}

		return true;
	}
};


void WebServer::listen(const char* addr, const char* port) {
	mg_init_library(0);

	const char *options[] = { 
		"document_root", "../www/html", 
		"listening_ports", port, 0};

	std::vector<std::string> cpp_options;
	for (int i=0; i<(sizeof(options)/sizeof(options[0])-1); i++) {
		cpp_options.push_back(options[i]);
	}
	CivetServer server(cpp_options);

	APIHandler h_api;
	server.addHandler("/api*", h_api);
	while (true) {
		sleep(60);
	}
	mg_exit_library();
}
