`ifndef _TESTER_COMMON
`define _TESTER_COMMON

typedef logic [12:0] frame_size_t; // 13 bits - max 8192 bytes
typedef logic [12:0] test_duration_t; // 13 bits - max 8192 ms
typedef logic [31:0] ip_addr_t;
typedef logic [47:0] mac_addr_t;

typedef logic [3:0]  u4_t;
typedef logic [7:0]  u8_t;
typedef logic [15:0] u16_t;
typedef logic [31:0] u32_t;
typedef logic [63:0] u64_t;


// test config (R&W)
typedef struct packed {
    test_duration_t duration; // RW (unit: ms), will be changed to actual duration when test is stopped
    logic start; // WO
    logic busy; // RO
} test_config_t;

// config of each port (32 bytes)
typedef struct packed {
    logic [46:0] padding4;
    logic enable;
    logic [2:0] padding3;
    frame_size_t frame_size;
    ip_addr_t src_ip, dst_ip;
    u8_t [1:0] padding2;
    mac_addr_t src_mac;
    u8_t [1:0] padding1;
    mac_addr_t dst_mac;
} port_config_t;


// statistics of each port (16 bytes)
typedef struct packed {
    // count error frames (T_user == 1 or content checking not passed)
    u32_t err_bytes;
    u32_t err_frames;
    // count testing frames
    u32_t recv_bytes;
    u32_t recv_frames;
} port_result_t;

typedef struct packed {
    u32_t dst_addr;
    u32_t src_addr;
    u16_t checksum;
    u8_t proto;
    u8_t ttl;
    logic [12:0] offset;
    logic mf;
    logic df;
    logic reserved;
    u16_t id;
    u16_t len;
    u8_t tos;
    u4_t version;
    u4_t ihl;
} ip_header_t;

typedef struct packed {
    u16_t ether_type;
    mac_addr_t src_mac;
    mac_addr_t dst_mac;
} eth_header_t;

typedef struct packed {
    ip_header_t ip_header;
    eth_header_t eth_header;
} frame_header_t;

`define TEST_FRAME_TOS 8'hDE
// default proto: test purpose
`define TEST_FRAME_PROTO 8'hFD


function logic [6:0] ctz64(input logic [63:0] x);
	for (int i = 0; i < 64; i++) begin
		if (x[i] == 1) begin
			return i;
		end
	end
	return 7'd64;
endfunction

module ip_header_checksum(
    input ip_header_t ip_header,
    output u16_t checksum
);
    localparam checksum_num = $bits(ip_header_t) / 16;
    logic [23:0] checksum_imm[checksum_num:0];
    generate
        assign checksum_imm[0] = '0;
        for (genvar i = 0; i < checksum_num; i += 1) begin
            if (i != 5)
                assign checksum_imm[i + 1] = checksum_imm[i] + ip_header[16 * i +: 16];
            else // skip checksum field
                assign checksum_imm[i + 1] = checksum_imm[i];
        end
    endgenerate
    logic [23:0] checksum_wrap;
    // wrap around twice for possible overflow
    assign checksum_wrap = checksum_imm[checksum_num][15:0] + checksum_imm[checksum_num][23:16];
    assign checksum = ~(checksum_wrap[15:0] + checksum_wrap[23:16]);
endmodule

`endif
