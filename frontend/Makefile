APP = tanlabs-speed-tester-backend

# Add any other object files to this list below
APP_OBJS = speed_test_ctrl.o test_functions_fake.o web_server.o

LIBCIVETWEB = civetweb-1.13/libcivetweb.a
CIVETWEB_URL ?= https://laekov.com.cn/l/software/civetweb-1.13.tar.gz

CXXFLAGS += -std=c++11 -Iinclude -Icivetweb-1.13/include

LDFLAGS += -lpthread -ldl

default : build

all: build

build: $(APP) 

$(APP): src/main.cc $(APP_OBJS) $(LIBCIVETWEB)
	$(CXX) $(CXXFLAGS) -o $@ $(APP_OBJS) $< $(LIBCIVETWEB) $(LDFLAGS) $(LDLIBS) 

%.o : src/%.cc civetweb-1.13
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(LIBCIVETWEB) : civetweb-1.13
	make -C civetweb-1.13/ lib WITH_CPP=1

civetweb-1.13 :
	wget -O - $(CIVETWEB_URL) | gzip -d | tar -x

www/html/wheel : 
	www/setup.sh

clean:
	rm -rf civetweb-1.13
	rm -rf www/html/wheel
	rm -f $(APP) *.o

