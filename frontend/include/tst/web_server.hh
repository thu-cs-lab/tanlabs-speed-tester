#ifndef WEB_SERVER_HH
#define WEB_SERVER_HH

class WebServer {
public:
	void listen(const char* addr, const char* port);
};

#endif  // WEB_SERVER_HH
