#ifndef TST_API_H
#define TST_API_H

#define OFFSET_ZYNQ_BASE	0x42000000

#define OFFSET_BUSY			0
#define OFFSET_START		0x04
#define OFFSET_DURATION		0x08
#define OFFSET_TEST_CONFIG	0x100
#define OFFSET_TEST_RESULT	0x180
#define OFFSET_RESERVED		0X1C0

#define N_PORTS				4

#include <stdint.h>

typedef struct {
	uint8_t addr[6];
} mac_addr_t; 
typedef struct {
	uint8_t addr[4];
} ip_addr_t;

struct __attribute__ ((packed)) config_t {
	mac_addr_t dst_mac; // 48 bits
	uint8_t padding1[2]; // pad to 8 bytes
	mac_addr_t src_mac;
	uint8_t padding2[2]; // pad to 8 bytes
	ip_addr_t dst_ip, src_ip; // 32 bits each
	uint16_t frame_size; // only lowest 13 bits used
	uint64_t enable; // only lowest 1 bit used
};

struct __attribute__ ((packed)) result_t {
	uint32_t recv_frames, recv_bytes, err_frames, err_bytes;
};

#endif  // TST_API_H
