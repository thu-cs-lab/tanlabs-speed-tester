//----------------------------------------------------------------------------------------------------------------------
// Title      : AXI4 Lite Register Header Module
// File       : design_1_axi_ethernet_0_11_axi4_lite_registers.h
// Author     : Xilinx Inc.
// ########################################################################################################################
// ##
// # (c) Copyright 2012-2016 Xilinx, Inc. All rights reserved.
// #
// # This file contains confidential and proprietary information of Xilinx, Inc. and is protected under U.S. and
// # international copyright and other intellectual property laws. 
// #
// # DISCLAIMER
// # This disclaimer is not a license and does not grant any rights to the materials distributed herewith. Except as
// # otherwise provided in a valid license issued to you by Xilinx, and to the maximum extent permitted by applicable law:
// # (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND
// # CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// # INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether in contract or tort,
// # including negligence, or under any other theory of liability) for any loss or damage of any kind or nature related to,
// # arising under or in connection with these materials, including for any direct, or any indirect, special, incidental, or
// # consequential loss or damage (including loss of data, profits, goodwill, or any type of loss or damage suffered as a
// # result of any action brought by a third party) even if such damage or loss was reasonably foreseeable or Xilinx had
// # been advised of the possibility of the same.
// #
// # CRITICAL APPLICATIONS
// # Xilinx products are not designed or intended to be fail-safe, or for use in any application requiring fail-safe
// # performance, such as life-support or safety devices or systems, Class III medical devices, nuclear facilities,
// # applications related to the deployment of airbags, or any other applications that could lead to death, personal injury,
// # or severe property or environmental damage (individually and collectively, "Critical Applications"). Customer assumes
// # the sole risk and liability of any use of Xilinx products in Critical Applications, subject only to applicable laws and
// # regulations governing limitations on product liability.
// #
// # THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
// #
// ########################################################################################################################
// Description: This header file contains AXI4 lite register information.
//----------------------------------------------------------------------------------------------------------------------

//// ==================================================
//// Register and Bitfield defines
//// ==================================================

//// Register type terminologies
//// XLNX_RW: Read/Write
//// XLNX_WO: Write-Only
//// XLNX_RO: Read-Only
//// XLNX_LH: Latching High
//// XLNX_LL: Latching Low
//// XLNX_COR: Clear-on-Read

////
//// Registers space
////


#define RESET_AND_ADDRESS_FILTER_REG_OFFSET 0x00000000

// Disc
#define RESET_AND_ADDRESS_FILTER_REG_MCSTREJ_MASK 0x00000002
#define RESET_AND_ADDRESS_FILTER_REG_MCSTREJ_ACCESS XLNX_RW 
#define RESET_AND_ADDRESS_FILTER_REG_MCSTREJ_SHIFT 1
#define RESET_AND_ADDRESS_FILTER_REG_MCSTREJ_DEFAULT 0x0

// Disc
#define RESET_AND_ADDRESS_FILTER_REG_BCSTREJ_MASK 0x00000004
#define RESET_AND_ADDRESS_FILTER_REG_BCSTREJ_ACCESS XLNX_RW 
#define RESET_AND_ADDRESS_FILTER_REG_BCSTREJ_SHIFT 2
#define RESET_AND_ADDRESS_FILTER_REG_BCSTREJ_DEFAULT 0x0

// Disc
#define RESET_AND_ADDRESS_FILTER_REG_TXVTAGMODE_MASK 0x00000018
#define RESET_AND_ADDRESS_FILTER_REG_TXVTAGMODE_ACCESS XLNX_RW 
#define RESET_AND_ADDRESS_FILTER_REG_TXVTAGMODE_SHIFT 3
#define RESET_AND_ADDRESS_FILTER_REG_TXVTAGMODE_DEFAULT 0x0

// Disc
#define RESET_AND_ADDRESS_FILTER_REG_RXVTAGMODE_MASK 0x00000060
#define RESET_AND_ADDRESS_FILTER_REG_RXVTAGMODE_ACCESS XLNX_RW 
#define RESET_AND_ADDRESS_FILTER_REG_RXVTAGMODE_SHIFT 5
#define RESET_AND_ADDRESS_FILTER_REG_RXVTAGMODE_DEFAULT 0x0

// Disc
#define RESET_AND_ADDRESS_FILTER_REG_TXVSTRPMODE_MASK 0x00000180
#define RESET_AND_ADDRESS_FILTER_REG_TXVSTRPMODE_ACCESS XLNX_RW 
#define RESET_AND_ADDRESS_FILTER_REG_TXVSTRPMODE_SHIFT 7
#define RESET_AND_ADDRESS_FILTER_REG_TXVSTRPMODE_DEFAULT 0x0

// Disc
#define RESET_AND_ADDRESS_FILTER_REG_RXVSTRPMODE_MASK 0x00006000
#define RESET_AND_ADDRESS_FILTER_REG_RXVSTRPMODE_ACCESS XLNX_RW 
#define RESET_AND_ADDRESS_FILTER_REG_RXVSTRPMODE_SHIFT 9
#define RESET_AND_ADDRESS_FILTER_REG_RXVSTRPMODE_DEFAULT 0x0

// Disc
#define RESET_AND_ADDRESS_FILTER_REG_NEWFNCENBL_MASK 0x00008000
#define RESET_AND_ADDRESS_FILTER_REG_NEWFNCENBL_ACCESS XLNX_RW 
#define RESET_AND_ADDRESS_FILTER_REG_NEWFNCENBL_SHIFT 11
#define RESET_AND_ADDRESS_FILTER_REG_NEWFNCENBL_DEFAULT 0x0

// Disc
#define RESET_AND_ADDRESS_FILTER_REG_EMULTIFLTRENBL_MASK 0x00010000
#define RESET_AND_ADDRESS_FILTER_REG_EMULTIFLTRENBL_ACCESS XLNX_RW 
#define RESET_AND_ADDRESS_FILTER_REG_EMULTIFLTRENBL_SHIFT 12
#define RESET_AND_ADDRESS_FILTER_REG_EMULTIFLTRENBL_DEFAULT 0x0

// Disc
#define RESET_AND_ADDRESS_FILTER_REG_RXBADFRMEN_MASK 0x00040000
#define RESET_AND_ADDRESS_FILTER_REG_RXBADFRMEN_ACCESS XLNX_RW 
#define RESET_AND_ADDRESS_FILTER_REG_RXBADFRMEN_SHIFT 14
#define RESET_AND_ADDRESS_FILTER_REG_RXBADFRMEN_DEFAULT 0x0


#define TRANSMIT_PAUSE_FRAME_REG_OFFSET 0x00000004

// Disc
#define TRANSMIT_PAUSE_FRAME_REG_TPFV_MASK 0x0000FFFF
#define TRANSMIT_PAUSE_FRAME_REG_TPFV_ACCESS XLNX_RW 
#define TRANSMIT_PAUSE_FRAME_REG_TPFV_SHIFT 0
#define TRANSMIT_PAUSE_FRAME_REG_TPFV_DEFAULT 0x0


#define TRANSMIT_IFG_ADJUST_REG_OFFSET 0x00000008

// Disc
#define TRANSMIT_IFG_ADJUST_REG_IFGP0_MASK 0x000000FF
#define TRANSMIT_IFG_ADJUST_REG_IFGP0_ACCESS XLNX_RW
#define TRANSMIT_IFG_ADJUST_REG_IFGP0_SHIFT 0
#define TRANSMIT_IFG_ADJUST_REG_IFGP0_DEFAULT 0x0


#define INTERRUPT_STATUS_REG_OFFSET 0x0000000C

// Disc
#define INTERRUPT_STATUS_REG_HARDACSCMPLT_MASK 0x00000001
#define INTERRUPT_STATUS_REG_HARDACSCMPLT_ACCESS XLNX_RW
#define INTERRUPT_STATUS_REG_HARDACSCMPLT_SHIFT 0
#define INTERRUPT_STATUS_REG_HARDACSCMPLT_DEFAULT 0x0

// Disc
#define INTERRUPT_STATUS_REG_AUTONEG_MASK 0x00000002
#define INTERRUPT_STATUS_REG_AUTONEG_ACCESS XLNX_RW
#define INTERRUPT_STATUS_REG_AUTONEG_SHIFT 1
#define INTERRUPT_STATUS_REG_AUTONEG_DEFAULT 0x0

// Disc
#define INTERRUPT_STATUS_REG_RXCMPLT_MASK 0x00000004
#define INTERRUPT_STATUS_REG_RXCMPLT_ACCESS XLNX_RW
#define INTERRUPT_STATUS_REG_RXCMPLT_SHIFT 2
#define INTERRUPT_STATUS_REG_RXCMPLT_DEFAULT 0x0

// Disc
#define INTERRUPT_STATUS_REG_RXRJECT_MASK 0x00000008
#define INTERRUPT_STATUS_REG_RXRJECT_ACCESS XLNX_RW
#define INTERRUPT_STATUS_REG_RXRJECT_SHIFT 3
#define INTERRUPT_STATUS_REG_RXRJECT_DEFAULT 0x0

// Disc
#define INTERRUPT_STATUS_REG_RXMEMOVR_MASK 0x00000010
#define INTERRUPT_STATUS_REG_RXMEMOVR_ACCESS XLNX_RW
#define INTERRUPT_STATUS_REG_RXMEMOVR_SHIFT 4
#define INTERRUPT_STATUS_REG_RXMEMOVR_DEFAULT 0x0

// Disc
#define INTERRUPT_STATUS_REG_TXCMPLT_MASK 0x00000020
#define INTERRUPT_STATUS_REG_TXCMPLT_ACCESS XLNX_RW
#define INTERRUPT_STATUS_REG_TXCMPLT_SHIFT 5
#define INTERRUPT_STATUS_REG_TXCMPLT_DEFAULT 0x0

// Disc
#define INTERRUPT_STATUS_REG_RXDCMLOCK_MASK 0x00000040
#define INTERRUPT_STATUS_REG_RXDCMLOCK_ACCESS XLNX_RW
#define INTERRUPT_STATUS_REG_RXDCMLOCK_SHIFT 6
#define INTERRUPT_STATUS_REG_RXDCMLOCK_DEFAULT 0x1

// Disc
#define INTERRUPT_STATUS_REG_MGTRDY_MASK 0x00000080
#define INTERRUPT_STATUS_REG_MGTRDY_ACCESS XLNX_RW
#define INTERRUPT_STATUS_REG_MGTRDY_SHIFT 7
#define INTERRUPT_STATUS_REG_MGTRDY_DEFAULT 0x0

// Disc
#define INTERRUPT_STATUS_REG_PHYRSTCMPLT_MASK 0x00000100
#define INTERRUPT_STATUS_REG_PHYRSTCMPLT_ACCESS XLNX_RW
#define INTERRUPT_STATUS_REG_PHYRSTCMPLT_SHIFT 8
#define INTERRUPT_STATUS_REG_PHYRSTCMPLT_DEFAULT 0x0


#define INTERRUPT_PENDING_REG_OFFSET 0x00000010

// Disc
#define INTERRUPT_PENDING_REG_HARDACSCMPLT_MASK 0x00000001
#define INTERRUPT_PENDING_REG_HARDACSCMPLT_ACCESS XLNX_RW
#define INTERRUPT_PENDING_REG_HARDACSCMPLT_SHIFT 0
#define INTERRUPT_PENDING_REG_HARDACSCMPLT_DEFAULT 0x0

// Disc
#define INTERRUPT_PENDING_REG_AUTONEG_MASK 0x00000002
#define INTERRUPT_PENDING_REG_AUTONEG_ACCESS XLNX_RW
#define INTERRUPT_PENDING_REG_AUTONEG_SHIFT 1
#define INTERRUPT_PENDING_REG_AUTONEG_DEFAULT 0x0

// Disc
#define INTERRUPT_PENDING_REG_RXCMPLT_MASK 0x00000004
#define INTERRUPT_PENDING_REG_RXCMPLT_ACCESS XLNX_RW
#define INTERRUPT_PENDING_REG_RXCMPLT_SHIFT 2
#define INTERRUPT_PENDING_REG_RXCMPLT_DEFAULT 0x0

// Disc
#define INTERRUPT_PENDING_REG_RXRJECT_MASK 0x00000008
#define INTERRUPT_PENDING_REG_RXRJECT_ACCESS XLNX_RW
#define INTERRUPT_PENDING_REG_RXRJECT_SHIFT 3
#define INTERRUPT_PENDING_REG_RXRJECT_DEFAULT 0x0

// Disc
#define INTERRUPT_PENDING_REG_RXMEMOVR_MASK 0x00000010
#define INTERRUPT_PENDING_REG_RXMEMOVR_ACCESS XLNX_RW
#define INTERRUPT_PENDING_REG_RXMEMOVR_SHIFT 4
#define INTERRUPT_PENDING_REG_RXMEMOVR_DEFAULT 0x0

// Disc
#define INTERRUPT_PENDING_REG_TXCMPLT_MASK 0x00000020
#define INTERRUPT_PENDING_REG_TXCMPLT_ACCESS XLNX_RW
#define INTERRUPT_PENDING_REG_TXCMPLT_SHIFT 5
#define INTERRUPT_PENDING_REG_TXCMPLT_DEFAULT 0x0

// Disc
#define INTERRUPT_PENDING_REG_RXDCMLOCK_MASK 0x00000040
#define INTERRUPT_PENDING_REG_RXDCMLOCK_ACCESS XLNX_RW
#define INTERRUPT_PENDING_REG_RXDCMLOCK_SHIFT 6
#define INTERRUPT_PENDING_REG_RXDCMLOCK_DEFAULT 0x0

// Disc
#define INTERRUPT_PENDING_REG_MGTRDY_MASK 0x00000080
#define INTERRUPT_PENDING_REG_MGTRDY_ACCESS XLNX_RW
#define INTERRUPT_PENDING_REG_MGTRDY_SHIFT 7
#define INTERRUPT_PENDING_REG_MGTRDY_DEFAULT 0x0

// Disc
#define INTERRUPT_PENDING_REG_PHYRSTCMPLT_MASK 0x00000100
#define INTERRUPT_PENDING_REG_PHYRSTCMPLT_ACCESS XLNX_RW
#define INTERRUPT_PENDING_REG_PHYRSTCMPLT_SHIFT 8
#define INTERRUPT_PENDING_REG_PHYRSTCMPLT_DEFAULT 0x0


#define INTERRUPT_ENABLE_REG_OFFSET 0x00000014

// Disc
#define INTERRUPT_ENABLE_REG_HARDACSCMPLT_MASK 0x00000001
#define INTERRUPT_ENABLE_REG_HARDACSCMPLT_ACCESS XLNX_RW
#define INTERRUPT_ENABLE_REG_HARDACSCMPLT_SHIFT 0
#define INTERRUPT_ENABLE_REG_HARDACSCMPLT_DEFAULT 0x0

// Disc
#define INTERRUPT_ENABLE_REG_AUTONEG_MASK 0x00000002
#define INTERRUPT_ENABLE_REG_AUTONEG_ACCESS XLNX_RW
#define INTERRUPT_ENABLE_REG_AUTONEG_SHIFT 1
#define INTERRUPT_ENABLE_REG_AUTONEG_DEFAULT 0x0

// Disc
#define INTERRUPT_ENABLE_REG_RXCMPLT_MASK 0x00000004
#define INTERRUPT_ENABLE_REG_RXCMPLT_ACCESS XLNX_RW
#define INTERRUPT_ENABLE_REG_RXCMPLT_SHIFT 2
#define INTERRUPT_ENABLE_REG_RXCMPLT_DEFAULT 0x0

// Disc
#define INTERRUPT_ENABLE_REG_RXRJECT_MASK 0x00000008
#define INTERRUPT_ENABLE_REG_RXRJECT_ACCESS XLNX_RW
#define INTERRUPT_ENABLE_REG_RXRJECT_SHIFT 3
#define INTERRUPT_ENABLE_REG_RXRJECT_DEFAULT 0x0

// Disc
#define INTERRUPT_ENABLE_REG_RXMEMOVR_MASK 0x00000010
#define INTERRUPT_ENABLE_REG_RXMEMOVR_ACCESS XLNX_RW
#define INTERRUPT_ENABLE_REG_RXMEMOVR_SHIFT 4
#define INTERRUPT_ENABLE_REG_RXMEMOVR_DEFAULT 0x0

// Disc
#define INTERRUPT_ENABLE_REG_TXCMPLT_MASK 0x00000020
#define INTERRUPT_ENABLE_REG_TXCMPLT_ACCESS XLNX_RW
#define INTERRUPT_ENABLE_REG_TXCMPLT_SHIFT 5
#define INTERRUPT_ENABLE_REG_TXCMPLT_DEFAULT 0x0

// Disc
#define INTERRUPT_ENABLE_REG_RXDCMLOCK_MASK 0x00000040
#define INTERRUPT_ENABLE_REG_RXDCMLOCK_ACCESS XLNX_RW
#define INTERRUPT_ENABLE_REG_RXDCMLOCK_SHIFT 6
#define INTERRUPT_ENABLE_REG_RXDCMLOCK_DEFAULT 0x0

// Disc
#define INTERRUPT_ENABLE_REG_MGTRDY_MASK 0x00000080
#define INTERRUPT_ENABLE_REG_MGTRDY_ACCESS XLNX_RW
#define INTERRUPT_ENABLE_REG_MGTRDY_SHIFT 7
#define INTERRUPT_ENABLE_REG_MGTRDY_DEFAULT 0x0

// Disc
#define INTERRUPT_ENABLE_REG_PHYRSTCMPLT_MASK 0x00000100
#define INTERRUPT_ENABLE_REG_PHYRSTCMPLT_ACCESS XLNX_RW
#define INTERRUPT_ENABLE_REG_PHYRSTCMPLT_SHIFT 8
#define INTERRUPT_ENABLE_REG_PHYRSTCMPLT_DEFAULT 0x0


#define TRANSMIT_VLAN_TAG_REG_OFFSET 0x00000018

// Disc
#define TRANSMIT_VLAN_TAG_REG_VID_MASK 0x00000FFF
#define TRANSMIT_VLAN_TAG_REG_VID_ACCESS XLNX_RW
#define TRANSMIT_VLAN_TAG_REG_VID_SHIFT 0
#define TRANSMIT_VLAN_TAG_REG_VID_DEFAULT 0x0

// Disc
#define TRANSMIT_VLAN_TAG_REG_CFI_MASK 0x00001000
#define TRANSMIT_VLAN_TAG_REG_CFI_ACCESS XLNX_RW
#define TRANSMIT_VLAN_TAG_REG_CFI_SHIFT 12
#define TRANSMIT_VLAN_TAG_REG_CFI_DEFAULT 0x0

// Disc
#define TRANSMIT_VLAN_TAG_REG_PRIORITY_MASK 0x0000E000
#define TRANSMIT_VLAN_TAG_REG_PRIORITY_ACCESS XLNX_RW
#define TRANSMIT_VLAN_TAG_REG_PRIORITY_SHIFT 13
#define TRANSMIT_VLAN_TAG_REG_PRIORITY_DEFAULT 0x0

// Disc
#define TRANSMIT_VLAN_TAG_REG_TPID_MASK 0xFFFF0000
#define TRANSMIT_VLAN_TAG_REG_TPID_ACCESS XLNX_RW
#define TRANSMIT_VLAN_TAG_REG_TPID_SHIFT 16
#define TRANSMIT_VLAN_TAG_REG_TPID_DEFAULT 0x0


#define RECEIVE_VLAN_TAG_REG_OFFSET 0x0000001C

// Disc
#define RECEIVE_VLAN_TAG_REG_VID_MASK 0x00000FFF
#define RECEIVE_VLAN_TAG_REG_VID_ACCESS XLNX_RW
#define RECEIVE_VLAN_TAG_REG_VID_SHIFT 0
#define RECEIVE_VLAN_TAG_REG_VID_DEFAULT 0x0

// Disc
#define RECEIVE_VLAN_TAG_REG_CFI_MASK 0x00001000
#define RECEIVE_VLAN_TAG_REG_CFI_ACCESS XLNX_RW
#define RECEIVE_VLAN_TAG_REG_CFI_SHIFT 12
#define RECEIVE_VLAN_TAG_REG_CFI_DEFAULT 0x0

// Disc
#define RECEIVE_VLAN_TAG_REG_PRIORITY_MASK 0x0000E000
#define RECEIVE_VLAN_TAG_REG_PRIORITY_ACCESS XLNX_RW
#define RECEIVE_VLAN_TAG_REG_PRIORITY_SHIFT 13
#define RECEIVE_VLAN_TAG_REG_PRIORITY_DEFAULT 0x0

// Disc
#define RECEIVE_VLAN_TAG_REG_TPID_MASK 0xFFFF0000
#define RECEIVE_VLAN_TAG_REG_TPID_ACCESS XLNX_RW
#define RECEIVE_VLAN_TAG_REG_TPID_SHIFT 16
#define RECEIVE_VLAN_TAG_REG_TPID_DEFAULT 0x0


#define UNICAST_ADDRESS_WORD_LOWER_REG_OFFSET 0x00000020

// Disc
#define UNICAST_ADDRESS_WORD_LOWER_REG_UNICASTADDR_MASK 0xFFFFFFFF
#define UNICAST_ADDRESS_WORD_LOWER_REG_UNICASTADDR_ACCESS XLNX_RW
#define UNICAST_ADDRESS_WORD_LOWER_REG_UNICASTADDR_SHIFT 0
#define UNICAST_ADDRESS_WORD_LOWER_REG_UNICASTADDR_DEFAULT 0x0


#define UNICAST_ADDRESS_WORD_UPPER_REG_OFFSET 0x00000024

// Disc
#define UNICAST_ADDRESS_WORD_UPPER_REG_UNICASTADDR_MASK 0x0000FFFF
#define UNICAST_ADDRESS_WORD_UPPER_REG_UNICASTADDR_ACCESS XLNX_RW
#define UNICAST_ADDRESS_WORD_UPPER_REG_UNICASTADDR_SHIFT 0
#define UNICAST_ADDRESS_WORD_UPPER_REG_UNICASTADDR_DEFAULT 0x0


#define VLAN_TPID_WORD0_REG_OFFSET 0x00000028

// Disc
#define VLAN_TPID_WORD0_REG_TPID0_MASK 0x0000FFFF
#define VLAN_TPID_WORD0_REG_TPID0_ACCESS XLNX_RW
#define VLAN_TPID_WORD0_REG_TPID0_SHIFT 0
#define VLAN_TPID_WORD0_REG_TPID0_DEFAULT 0x0

// Disc
#define VLAN_TPID_WORD0_REG_TPID1_MASK 0xFFFF0000
#define VLAN_TPID_WORD0_REG_TPID1_ACCESS XLNX_RW
#define VLAN_TPID_WORD0_REG_TPID1_SHIFT 16
#define VLAN_TPID_WORD0_REG_TPID1_DEFAULT 0x0


#define VLAN_TPID_WORD1_REG_OFFSET 0x0000002C

// Disc
#define VLAN_TPID_WORD1_REG_TPID2_MASK 0x0000FFFF
#define VLAN_TPID_WORD1_REG_TPID2_ACCESS XLNX_RW
#define VLAN_TPID_WORD1_REG_TPID2_SHIFT 0
#define VLAN_TPID_WORD1_REG_TPID2_DEFAULT 0x0

// Disc
#define VLAN_TPID_WORD1_REG_TPID3_MASK 0xFFFF0000
#define VLAN_TPID_WORD1_REG_TPID3_ACCESS XLNX_RW
#define VLAN_TPID_WORD1_REG_TPID3_SHIFT 16
#define VLAN_TPID_WORD1_REG_TPID3_DEFAULT 0x0


#define PCS_PMA_TEMAC_STATUS_REG_OFFSET 0x00000030

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_LINKSTATUS_MASK 0x00000001
#define PCS_PMA_TEMAC_STATUS_REG_LINKSTATUS_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_LINKSTATUS_SHIFT 0

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_LINKSYNC_MASK 0x00000002
#define PCS_PMA_TEMAC_STATUS_REG_LINKSYNC_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_LINKSYNC_SHIFT 1

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_RUDI_C_MASK 0x00000004
#define PCS_PMA_TEMAC_STATUS_REG_RUDI_C_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_RUDI_C_SHIFT 2

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_RUDI_I_MASK 0x00000008
#define PCS_PMA_TEMAC_STATUS_REG_RUDI_I_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_RUDI_I_SHIFT 3

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_RUDI_INVLD_MASK 0x00000010
#define PCS_PMA_TEMAC_STATUS_REG_RUDI_INVLD_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_RUDI_INVLD_SHIFT 4

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_RXDISPERR_MASK 0x00000020
#define PCS_PMA_TEMAC_STATUS_REG_RXDISPERR_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_RXDISPERR_SHIFT 5

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_RXNOTINTABLE_MASK 0x00000040
#define PCS_PMA_TEMAC_STATUS_REG_RXNOTINTABLE_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_RXNOTINTABLE_SHIFT 6

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_PHYLINKSTATUS_MASK 0x00000080
#define PCS_PMA_TEMAC_STATUS_REG_PHYLINKSTATUS_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_PHYLINKSTATUS_SHIFT 7

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_RMTFLTENC_MASK 0x00000300
#define PCS_PMA_TEMAC_STATUS_REG_RMTFLTENC_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_RMTFLTENC_SHIFT 8

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_SPEED_MASK 0x00000C00
#define PCS_PMA_TEMAC_STATUS_REG_SPEED_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_SPEED_SHIFT 10

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_DUPLEX_MASK 0x00001000
#define PCS_PMA_TEMAC_STATUS_REG_DUPLEX_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_DUPLEX_SHIFT 12

// Disc
#define PCS_PMA_TEMAC_STATUS_REG_RMTFLT_MASK 0x00002000
#define PCS_PMA_TEMAC_STATUS_REG_RMTFLT_ACCESS XLNX_RO
#define PCS_PMA_TEMAC_STATUS_REG_RMTFLT_SHIFT 13



//// Below registers information are available in TEMAC IP core .h file
// 0x00000200-0x000003FC: Statistics Counters registers
// 0x00000400: TEMAC Receive Configuration Word 0 Register (RCW)
// 0x00000404: TEMAC Receive Configuration Word 1 Register (RCW)
// 0x00000408: TEMAC Transmitter Configuration register (TC)
// 0x0000040C: TEMAC Flow Control Configuration register (FCC)
// 0x00000410: TEMAC Speed Configuration
// 0x00000414: TEMAC RX Max Frame Configuration
// 0x00000418: TEMAC TX Max Frame Configuration
// 0x0000041C: TEMAC TX timestamp adjust control register
// 0x00000480-0x0000049C: TEMAC Priority Quanta Registers
// 0x000004A0: TEMAC Legacy Pause Refresh Register
// 0x000004F8: TEMAC Identification register
// 0x000004FC: TEMAC Ability register
// 0x00000500: MDIO Setup Register
// 0x00000504: MDIO Control
// 0x00000508: MDIO Write Data
// 0x0000050C: MDIO Read Data
// 0x00000600: TEMAC Interrupt Status Register
// 0x00000610: TEMAC Interrupt Pending Register
// 0x00000620: TEMAC Interrupt Enable Register
// 0x00000630: TEMAC Interrupt Clear Register
// 0x00000700: TEMAC Unicast Address Word 0 register (UAW0)
// 0x00000704: TEMAC Unicast Address Word 1 register (UAW1)
// 0x0000070C: TEMAC Frame Filter Enable
// 0x00000710-0x0000074C: TEMAC Frame Filter Value
// 0x00000750–0x0000078C: TEMAC Frame Filter Mask Value
// 0x00004000–0x00007FFC: Transmit VLAN Data Table TEMAC
// 0x00008000–0x0000BFFC: Receive VLAN Data Table TEMAC
// 0x00010000–0x00013FFC: Ethernet AVB
// 0x00020000–0x0003FFFC: Multicast Address Table TEMACs
////




//#define RX_CONFIGURATION_WORD0_REG_OFFSET 0x0000400
//
//// Disc 
//#define RX_CONFIGURATION_WORD0_REG_MASK 0x0000003F
//#define RX_CONFIGURATION_WORD0_REG_ACCESS XLNX_RW 
//#define RX_CONFIGURATION_WORD0_REG_SHIFT 0
//
//
//#define RX_CONFIGURATION_WORD1_REG_OFFSET 0x0000404
//
//// Disc 
//#define RX_CONFIGURATION_WORD1_REG_MASK 0x0000003F
//#define RX_CONFIGURATION_WORD1_REG_ACCESS XLNX_RW 
//#define RX_CONFIGURATION_WORD1_REG_SHIFT 0
//
//
//#define TX_CONFIGURATION_REG_OFFSET 0x0000408
//
//// Disc 
//#define TX_CONFIGURATION_REG_MASK 0x0000003F
//#define TX_CONFIGURATION_REG_ACCESS XLNX_RW 
//#define TX_CONFIGURATION_REG_SHIFT 0
//
//
//#define FLOW_CTRL_CONFIG_REG_OFFSET 0x000040C
//
//// Disc 
//#define FLOW_CTRL_CONFIG_REG_MASK 0x0000003F
//#define FLOW_CTRL_CONFIG_REG_ACCESS XLNX_RW 
//#define FLOW_CTRL_CONFIG_REG_SHIFT 0
//
//
//#define SPEEDCONFIG_REG_OFFSET 0x0000410
//
//// Disc 
//#define SPEEDCONFIG_REG_MASK 0x0000003F
//#define SPEEDCONFIG_REG_ACCESS XLNX_RW 
//#define SPEEDCONFIG_REG_SHIFT 0
//
//
//#define RX_MAX_FRAME_CONFIG_REG_OFFSET 0x0000414
//
//// Disc 
//#define RX_MAX_FRAME_CONFIG_REG_MASK 0x0000003F
//#define RX_MAX_FRAME_CONFIG_REG_ACCESS XLNX_RW 
//#define RX_MAX_FRAME_CONFIG_REG_SHIFT 0
//
//
//#define TX_MAX_FRAME_CONFIG_REG_OFFSET 0x00000418
//
//// Disc 
//#define TX_MAX_FRAME_CONFIG_REG_MASK 0x0000003F
//#define TX_MAX_FRAME_CONFIG_REG_ACCESS XLNX_RW 
//#define TX_MAX_FRAME_CONFIG_REG_SHIFT 0
//
//
#define TX_TIMESTAMP_ADJUST_CONTROL_REG_OFFSET 0x0000041C

// Disc 
#define TX_TIMESTAMP_ADJUST_CONTROL_REG_TX_LATENCY_ADJUST_MASK 0x0000FFFF
#define TX_TIMESTAMP_ADJUST_CONTROL_REG_TX_LATENCY_ADJUST_ACCESS XLNX_RW 
#define TX_TIMESTAMP_ADJUST_CONTROL_REG_TX_LATENCY_ADJUST_SHIFT 0
#define TX_TIMESTAMP_ADJUST_CONTROL_REG_TX_LATENCY_ADJUST_DEFAULT 0xD3

// Disc 
#define TX_TIMESTAMP_ADJUST_CONTROL_REG_TX_TS_CORRECTION_ENABLE_MASK 0x00010000
#define TX_TIMESTAMP_ADJUST_CONTROL_REG_TX_TS_CORRECTION_ENABLE_ACCESS XLNX_RW 
#define TX_TIMESTAMP_ADJUST_CONTROL_REG_TX_TS_CORRECTION_ENABLE_SHIFT 16
#define TX_TIMESTAMP_ADJUST_CONTROL_REG_TX_TS_CORRECTION_ENABLE_DEFAULT 0x0
//
//
//#define MDIO_SETUP_REG_OFFSET 0x00000500
//
//// Disc 
//#define MDIO_SETUP_REG_MASK 0xFFFFFFFF
//#define MDIO_SETUP_REG_ACCESS XLNX_RW 
//#define MDIO_SETUP_REG_SHIFT 0
//#define MDIO_SETUP_REG_DEFAULT 0x68
//
//
//#define MDIO_CTRL_REG_OFFSET 0x00000504
//
//// Disc
//#define MDIO_CTRL_REG_MASK 0x0000001F
//#define MDIO_CTRL_REG_ACCESS XLNX_RW 
//#define MDIO_CTRL_REG_SHIFT 0
//#define MDIO_CTRL_REG_DEFAULT 0x0
//
//
//#define MDIO_WRITE_DATA_REG_OFFSET 0x00000508
//
//// Disc 
//#define MDIO_WRITE_DATA_REG_MASK 0x0000001F
//#define MDIO_WRITE_DATA_REG_ACCESS XLNX_RW 
//#define MDIO_WRITE_DATA_REG_SHIFT 0
//#define MDIO_WRITE_DATA_REG_DEFAULT 0x3
//
//
//#define MDIO_READ_DATA_REG_OFFSET 0x0000050C
//
//// Disc 
//#define MDIO_READ_DATA_REG_MASK 0x0000001F
//#define MDIO_READ_DATA_REG_ACCESS XLNX_RO 
//#define MDIO_READ_DATA_REG_SHIFT 0
//#define MDIO_READ_DATA_REG_DEFAULT 0xA

