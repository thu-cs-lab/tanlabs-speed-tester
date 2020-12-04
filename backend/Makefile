APP = tanlabs-speed-tester-backend

# Add any other object files to this list below
APP_OBJS = speed_test_ctrl.o test_functions.o

LIBCIVETWEB = civetweb-1.13/libcivetweb.a
CVIBEWEB_URL ?= https://laekov.com.cn/l/software/civetweb-1.13.tar.gz

CXXFLAGS ?= -Iinclude -Icivetweb/include

default : build

all: build

build: $(APP) $(LIBCIVETWEB)

$(APP): src/main.cc $(APP_OBJS)
	$(CXX) -o $@ $(APP_OBJS) $< $(LDFLAGS) $(LDLIBS)

%.o : src/%.cc
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(LIBCIVETWEB) : civetweb-1.13
	CC=$(CC) CXX=$(CXX) make -C civetweb-1.13/ lib
	
civetweb-1.13 :
	wget -O - $(CIVETWEB_URL) | gzip -d | tar -x

clean:
	make -C civetweb-1.13/ clean
	rm -f $(APP) *.o

