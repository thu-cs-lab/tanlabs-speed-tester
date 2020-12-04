# Controller Interface

The controller exposes itself as an AXI-Lite MMIO slave mounted at offset `0x42000000` of Zynq.

## Address Space

Size are all in bytes. Any access must be aligned to 4 bytes, and only lowest 9 bits of address is used (512 bytes address space in total).

| Offset  | Size  | Description | Property |
| :-----: | :---: | :---------: | :------: |
| `0x00`  |  `1`  |    Busy     |    RO    |
| `0x04`  |  `1`  |    Start    |    WO    |
| `0x08`  |  `2`  |  Duration   |    RW    |
| `0x100` | `128` | Test Config |    RW    |
| `0x180` | `64`  | Test Result |    RW    |
| `0x1C0` | `64`  |  Reserved   |   N/A    |

## Registers

### Busy Status

The least significant bit of this register indicates that the controller is currently busy. Either it is not fully initialized or a test is in progress.

### Test Start

Write any non-zero byte to this register starts a test (if the controller is not busy). The information in the duration and config register will be latched and used in the test. Any previous results will be cleared.

### Test Duration

The lowest 13 bits of this configurable register contains the duration of next test in milliseconds when no test is in progress. Therefore the longest duration of a test will be 8191 ms.

When a test is in progress, the register contains the actual time elapsed since the test starts (always shorter than the duration configured before). Software can use it to estimate the progress of tests.

### Test Config

The read-write register contains the configuration for each port, which could be expressed in C++:

```c++
struct __attribute__ ((packed)) config_t {
    mac_addr_t dst_mac; // 48 bits
    uint8_t padding1[2]; // pad to 8 bytes
    mac_addr_t src_mac;
    uint8_t padding2[2]; // pad to 8 bytes
    ip_addr_t dst_ip, src_ip; // 32 bits each
    uint16_t frame_size; // only lowest 13 bits used
    uint64_t enable; // only lowest 1 bit used
}
```

Each `config_t` is 32 bytes long, and the whole register can be seen as `config_t[4]`.

The test controller will use these configuration to generate test frames when a test is started. The MAC and IP address will be directly copied to the generated frame, thus should be in network byte order. If `enable` is not set, nothing will be sent on this port in the next test.

### Test Result

The read-only register contains the test result of each port, which could be expressed in C++:

```c++
struct __attribute__ ((packed)) result_t {
    uint32_t recv_frames, recv_bytes, err_frames, err_bytes;
}
```

Each `result_t` is 32 bytes long, and the whole register can be seen as `result_t[4]`. `recv_*` refers to all received & checked testing frames (not including frames that is bypassed), and `err_*` refers to all frames containing errors, including:

* `AXIS_T_USER` is not marked zero by AXI Ethernet IP, or
* checksum not correct, or
* content checking not passed.

The test controller will reset this register when a test is started, and keeps updating its content when receiving & checking test frames. Software can use this information to present the result to end users.
