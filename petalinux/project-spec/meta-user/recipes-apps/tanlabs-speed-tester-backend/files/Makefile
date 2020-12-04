APP = tanlabs-speed-tester-backend

# Add any other object files to this list below
APP_OBJS = tanlabs-speed-tester-backend.o

all: build

build: $(APP)

$(APP): $(APP_OBJS)
	$(CXX) -o $@ $(APP_OBJS) $(LDFLAGS) $(LDLIBS)
clean:
	rm -f $(APP) *.o
