APP = serial-config

C_SRCS += $(wildcard src/*.c)
APP_OBJS := $(C_SRCS:.c=.o)
CFLAGS += -Isrc

all: build

build: $(APP)

$(APP): $(APP_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(APP_OBJS) $(LDLIBS)

clean:
	-rm -f $(APP) *.elf *.gdb *.o
