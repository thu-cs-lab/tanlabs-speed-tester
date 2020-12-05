APP = tanlabs-speed-tester-backend

# Add any other object files to this list below
APP_OBJS = speed_test_ctrl.o test_functions.o web_server.o

LIBCIVETWEB = civetweb-1.13/libcivetweb.a
CVIBEWEB_URL ?= https://laekov.com.cn/l/software/civetweb-1.13.tar.gz

CXXFLAGS ?= -std=c++11 -Iinclude -Icivetweb-1.13/include

LDFLAGS += -lpthread -ldl

default : build

all: build

build: $(APP) www/html/wheel

$(APP): src/main.cc $(APP_OBJS) $(LIBCIVETWEB)
	$(CXX) $(CXXFLAGS) -o $@ $(APP_OBJS) $< $(LIBCIVETWEB) $(LDFLAGS) $(LDLIBS) 

%.o : src/%.cc
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(LIBCIVETWEB) : civetweb-1.13
	CC=$(CC) CXX=$(CXX) make -C civetweb-1.13/ lib WITH_CPP=1
	
civetweb-1.13 :
	wget -O - $(CIVETWEB_URL) | gzip -d | tar -x

www/html/wheel : 
	www/setup.sh

clean:
	make -C civetweb-1.13/ clean
	rm -rf www/html/wheel
	rm -f $(APP) *.o

