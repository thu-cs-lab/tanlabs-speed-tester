`ifndef _TESTER_COMMON
`define _TESTER_COMMON

typedef logic [12:0] frame_size_t; // 13 bits - max 8192 bytes
typedef logic [12:0] test_duration_t; // 13 bits - max 8192 ms
typedef logic [31:0] ip_addr_t;
typedef logic [47:0] mac_addr_t;

// test config (R&W), 64 bits, mem[0x00]
typedef struct packed {
    logic [48:0] padding;
    frame_size_t frame_size; // RW (unit: byte)
    test_duration_t duration; // RW (unit: ms), will be changed to actual duration when test is stopped
    logic start; // WO
    logic busy; // RO
} test_config_t;

// config of each port (192 bits)
// port_config_0 = {mem[0x12], mem[0x11], mem[0x10]}
// port_config_1 = {mem[0x16], mem[0x15], mem[0x14]}
// port_config_2 = {mem[0x1A], mem[0x19], mem[0x18]}
// port_config_3 = {mem[0x1E], mem[0x1D], mem[0x1C]}
typedef struct packed {
    logic [30:0] padding;
    logic enable;
    ip_addr_t src_ip, dst_ip;
    mac_addr_t src_mac, dst_mac;
} port_config_t;


// statistics of each port (128 bits)
// {mem[0x21], mem[0x20]} = result_0
// {mem[0x23], mem[0x22]} = result_1
// {mem[0x25], mem[0x24]} = result_2
// {mem[0x27], mem[0x26]} = result_3
typedef struct packed {
    // count testing frames
    logic [31:0] recv_bytes;
    logic [31:0] recv_frames;
    // count error frames (T_user == 1 or not content checking not passed)
    logic [31:0] err_bytes;
    logic [31:0] err_frames;
} port_result_t;

`endif
