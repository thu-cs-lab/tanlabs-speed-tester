APP = tanlabs-speed-tester-backend

# Add any other object files to this list below
APP_OBJS = tanlabs-speed-tester-backend.o

LIBCIVETWEB = civetweb-1.13/libcivetweb.a

default : $(LIBCIVETWEB)

all: build

build: $(APP) $(LIBCIVETWEB)

$(APP): $(APP_OBJS)
	$(CXX) -o $@ $(APP_OBJS) $(LDFLAGS) $(LDLIBS)

$(LIBCIVETWEB) : civetweb-1.13
	CC=$(CC) CXX=$(CXX) make -C civetweb-1.13/ lib
	
civetweb-1.13 :
	wget -O - https://laekov.com.cn/l/software/civetweb-1.13.tar.gz | gzip -d | tar -x

clean:
	rm -f $(APP) *.o

