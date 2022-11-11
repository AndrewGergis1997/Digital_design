--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--Mentor Graphics must receive a completed copy of the License Fee &        --
--Royalty Fee form for each use of the core where the design goes to mask.  --
--                                                                          --
--A fee is payable for all IC designs involving these deliverables at the   --
--time of production.  See your license agreement with Mentor Graphics for  --
--further details.  If you have further questions please contact Mentor     --
--Graphics Customer Support.                                                --
--                                                                          --
--This Mentor Graphics core (m85c30 v2000.020) was extracted on             --
--workstation hostid 80a4ee5e Inventra                                      --
-- VHDL Top Level Netslist for m85c30 SCC. 
-- V2.500
--************************************************************************
--
--  %W%  %G%   SCCS Version Control
--
-- m85c30.vhd VHDL file
--
-- Created 11/10/96
--
-- Description of code.
--
-- VHDL Top Level Netslist for m85c30 SCC.
--
-- (C)Copyright Mentor Graphics Corporation and Licensors (1996 - 1999)
--
-- V0.000   (11/10/96)
-- V0.001   25/2/98
-- V2.200   (8/6/98)
-- V2.300   (6/8/98)
-- V2.400   (5/8/99)
-- V2.500   (11/1/00)

-- Revision history
--
-- V0.001 Add tx clock test output for testbench ECN01078
--        Add new clk input nclk ECN01109
-- V2.200 Release version
-- V2.300 6th August 1998
--        Intermittent character loss in async mode bug fixed.
--        Start bit detection improved.
--        Receiver susceptiility to noise on rxda/b improved (async mode).
--        Receiver state machine bug fixed. Caused receiver to lock up
--        when in async mode if baud rate of input data changed.
-- V2.400 5th August 1999
--        Framing errors in async mode due to missing sclk_en_neg pulse from
--        module 038 fixed. Modification to module 038 now guarantees that 
--        sclk_en_neg pulse will not be missed out when the rx data start
--        bit is detected before the sclk_en_neg pulse has been produced
--        by the clock divider circuit. 
-- V2.500 11th January 2000
--        Modifications to m3s001ae and m3s002ae to ensure correct handling
--        of interrupt acknowledge cycles in multiple device applications
--************************************************************************
--
-- Hierarcy record                         : m85c30
-- This module is called by                : None
--
-- 
-- This module calls the following modules :
--
--     m3s001ae.vhd - CPU Interface
--     m3s002ae.vhd - Interrupt Controller
--     m3s003ae.vhd - Data Multiplexer
--     m3s004ae.vhd - Serial Controller
--
--************************************************************************
-- Library Declarations

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entity declaration

entity m85c30 is
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--Mentor Graphics must receive a completed copy of the License Fee &        --
--Royalty Fee form for each use of the core where the design goes to mask.  --
--                                                                          --
--A fee is payable for all IC designs involving these deliverables at the   --
--time of production.  See your license agreement with Mentor Graphics for  --
--further details.  If you have further questions please contact Mentor     --
--Graphics Customer Support.                                                --
--                                                                          --
--This Mentor Graphics core (m85c30 v2000.020) was extracted on             --
--workstation hostid 80a4ee5e Inventra                                      --

    port(
        clk,
        nclk, --ECN01109
        ncs,
        dnc,
        anb,
        nwr,
        nrd,
        ninta,
        iei,
        nrst,
        scan_test_enable,
        nsyai,
        trcai,
        rtca,
        rda,
        ncda,
        nctsa,
        nsybi,
        trcbi,
        rtcb,
        rdb,
        ncdb,
        nctsb : in std_logic;

        di : in std_logic_vector(7 downto 0);

        nrdqa,
        wnrae,
        nsyao,
        nsyae,
        trcao,
        ntcae,
        tda,
        ndtra,
        nrtsa,
        tx_clk_test_a,
        ndoe,
        nint,
        ieo,
        nrdqb,
        wnrbe,
        nsybo,
        nsybe,
        trcbo,
        ntcbe,
        tdb,
        ndtrb,
        nrtsb,
        tx_clk_test_b : out std_logic;

        da : out std_logic_vector(7 downto 0)
         );       
end m85c30;     


--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, mpci, is restricted to employees of MGC on          --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (mpci v1999.050) was extracted on               --
--workstation hostid 80895eb6 Inventra                                      --
-- PCI Core Top level
-- RCS Version Control
-- 2000/05/24 15:22:54
--
--
-- File history
-- Revision 1.3  2000/05/24 15:22:54
-- Updated versions
--
-- Revision 1.12  1999/05/27 16:43:27  _
-- cleaned up comments
--
-- Revision 1.11  1999/05/07 10:14:19  
-- brought input latch clock out to aid scan test
--
-- Revision 1.10  1999/04/12 15:13:47  
-- removed IO pads, now in separate higher level module mpci_io.vhd
--
-- Revision 1.9  1999/03/29 15:53:53  
-- fixed width of fifo datacount output, full flag decode corrected
--
-- Revision 1.8  1999/03/29 09:53:06  
-- added scan test enable input to disable transparent latches during scan
--
-- Revision 1.7  1999/03/29 09:00:26  
-- added registered and direct data outputs from master rx fifo
--
-- Revision 1.6  1999/03/24 17:28:06  
-- added input to disable auto flushing of fifos for when dma module used
--
-- Revision 1.5  1999/02/26 15:15:28  
-- removed clock buffering - now done external to core
--
-- Revision 1.4  1999/02/26 10:56:55  
-- pme_chg changed to pme_ack.
-- added master fifo datacount outputs and flush inptu
-- inputs for dma module.
-- removed references to old dma module, also removed old rom interface
--
-- Revision 1.3  1999/02/08 12:32:38  
-- equalised delta delays on clocks for rtl simulation
--
-- Revision 1.2  1999/01/21 16:14:47  
-- changed generics to integers for synthesis
--
-- Revision 1.1  1999/01/20 10:38:30  
-- Initial revision
--
--
--

library WORK;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY mpci IS
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, mpci, is restricted to employees of MGC on          --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (mpci v1999.050) was extracted on               --
--workstation hostid 80895eb6 Inventra                                      --

  GENERIC (
    -- ----------------------   PARAMETERS   -------------------------
     pci_dat_width                  :  integer := 32; 
     pci_cbe_width                  :  integer := 4; 
     master_is_64bits               :  integer := 0; 
     capable_66mhz                  :  integer := 0; 
     def_vendorID                   :  integer := 16#FFFF#; 
     def_deviceID                   :  integer := 16#FFFF#; 
     def_revID                      :  integer := 16#00#; 
     def_classCode                  :  integer := 16#FF0000#;
     def_subvenID                   :  integer := 16#0000#; 
     def_subsysID                   :  integer := 16#0000#; 
     master_exist                   :  integer := 1; 
     bar0_exist                     :  integer := 1; 
     bar1_exist                     :  integer := 1; 
     bar2_exist                     :  integer := 0; 
     bar3_exist                     :  integer := 0; 
     bar4_exist                     :  integer := 0; 
     bar5_exist                     :  integer := 0; 
     pwrman_exist                   :  integer := 1; 
     pme_assert_cap                 :  integer := 2#0110#; 
     pme_state_cap                  :  integer := 2#11#; 
     pmi_dsi                        :  integer := 0; 
     bios_exist                     :  integer := 1; 
     rom_addr_width                 :  integer := 16; 
     m_fifo_depth                   :  integer := 16; 
     m_fram_addr_range              :  integer := 4; 
     m_space_mark                   :  integer := 4; 
     m_data_mark                    :  integer := 12; 
     t0_bar_config_addr             :  integer := 16#10#; 
     t0_io_mem_n                    :  integer := 1; 
     t0_bar_addr_range              :  integer := 16; 
     t0_below1mb                    :  integer := 0; 
     t0_prefetchable                :  integer := 0; 
     t0_ram_depth                   :  integer := 16; 
     t0_ram_addr_range              :  integer := 4; 
     irq_supported                  :  integer := 1; 
     t0_dat_width                   :  integer := 32; 
     t0_cbe_width                   :  integer := 4; 
     t0_fifo_depth                  :  integer := 16; 
     t0_fram_addr_range             :  integer := 4; 
     t0_space_mark                  :  integer := 4; 
     t0_data_mark                   :  integer := 12; 
     t0_d64_capable                 :  integer := 0; 
     t1_bar_config_addr             :  integer := 16#14#; 
     t1_io_mem_n                    :  integer := 0; 
     t1_bar_addr_range              :  integer := 16; 
     t1_below1mb                    :  integer := 0; 
     t1_prefetchable                :  integer := 1; 
     t1_dat_width                   :  integer := 32; 
     t1_cbe_width                   :  integer := 4; 
     t1_fifo_depth                  :  integer := 16; 
     t1_fram_addr_range             :  integer := 4; 
     t1_space_mark                  :  integer := 4; 
     t1_data_mark                   :  integer := 12; 
     t1_d64_capable                 :  integer := 0; 
     t2_bar_config_addr             :  integer := 16#18#; 
     t2_io_mem_n                    :  integer := 0; 
     t2_bar_addr_range              :  integer := 16; 
     t2_below1mb                    :  integer := 0; 
     t2_prefetchable                :  integer := 0; 
     t2_dat_width                   :  integer := 32; 
     t2_cbe_width                   :  integer := 4; 
     t2_fifo_depth                  :  integer := 16; 
     t2_fram_addr_range             :  integer := 4; 
     t2_space_mark                  :  integer := 4; 
     t2_data_mark                   :  integer := 12; 
     t2_d64_capable                 :  integer := 0; 
     t3_bar_config_addr             :  integer := 16#1C#; 
     t3_io_mem_n                    :  integer := 0; 
     t3_bar_addr_range              :  integer := 16; 
     t3_below1mb                    :  integer := 0; 
     t3_prefetchable                :  integer := 0; 
     t3_dat_width                   :  integer := 32; 
     t3_cbe_width                   :  integer := 4; 
     t3_fifo_depth                  :  integer := 16; 
     t3_fram_addr_range             :  integer := 4; 
     t3_space_mark                  :  integer := 4; 
     t3_data_mark                   :  integer := 12; 
     t3_d64_capable                 :  integer := 0; 
     t4_bar_config_addr             :  integer := 16#20#; 
     t4_io_mem_n                    :  integer := 0; 
     t4_bar_addr_range              :  integer := 16; 
     t4_below1mb                    :  integer := 0; 
     t4_prefetchable                :  integer := 0; 
     t4_dat_width                   :  integer := 32; 
     t4_cbe_width                   :  integer := 4; 
     t4_fifo_depth                  :  integer := 16; 
     t4_fram_addr_range             :  integer := 4; 
     t4_space_mark                  :  integer := 4; 
     t4_data_mark                   :  integer := 12; 
     t4_d64_capable                 :  integer := 0; 
     t5_bar_config_addr             :  integer := 16#24#; 
     t5_io_mem_n                    :  integer := 0; 
     t5_bar_addr_range              :  integer := 16; 
     t5_below1mb                    :  integer := 0; 
     t5_prefetchable                :  integer := 0; 
     t5_dat_width                   :  integer := 32; 
     t5_cbe_width                   :  integer := 4; 
     t5_fifo_depth                  :  integer := 16; 
     t5_fram_addr_range             :  integer := 4; 
     t5_space_mark                  :  integer := 4; 
     t5_data_mark                   :  integer := 12; 
     t5_d64_capable                 :  integer := 0);
  PORT (
    --  PCI SIGNALS
    ad_in                     : IN std_logic_vector(pci_dat_width - 1 DOWNTO 0); 
    ad_out                    : OUT std_logic_vector(pci_dat_width - 1 DOWNTO 0); 
    ad_en                     : OUT std_logic_vector(3 DOWNTO 0); --  Duplicated for fanout reduction
    cbe_in                    : IN std_logic_vector(pci_cbe_width - 1 DOWNTO 0); 
    cbe_out                   : OUT std_logic_vector(pci_cbe_width - 1 DOWNTO 0); 
    cbe_en                    : OUT std_logic; 
    par_in                    : IN std_logic; 
    par_out                   : OUT std_logic; 
    par_en                    : OUT std_logic; 
    frame_n_in                : IN std_logic; 
    frame_n_out               : OUT std_logic; 
    frame_n_en                : OUT std_logic; 
    irdy_n_in                 : IN std_logic; 
    irdy_n_out                : OUT std_logic; 
    irdy_n_en                 : OUT std_logic; 
    trdy_n_in                 : IN std_logic; 
    trdy_n_out                : OUT std_logic; 
    trdy_n_en                 : OUT std_logic; 
    stop_n_in                 : IN std_logic; 
    stop_n_out                : OUT std_logic; 
    stop_n_en                 : OUT std_logic; 
    perr_n_in                 : IN std_logic; 
    perr_n_out                : OUT std_logic; 
    perr_n_en                 : OUT std_logic; 
    serr_n_in                 : IN std_logic; 
    serr_n_en                 : OUT std_logic; 
    devsel_n_in               : IN std_logic; 
    devsel_n_out              : OUT std_logic; 
    devsel_n_en               : OUT std_logic; 
    idsel_in                  : IN std_logic; 
    lock_n_in                 : IN std_logic; 
    f_clock                   : IN std_logic; 
    s_clock                   : IN std_logic; 
    lat_clock                 : IN std_logic; 
    reset_n                   : IN std_logic; 
    gnt_n_in                  : IN std_logic; 
    req_n_out                 : OUT std_logic; 
--    -- 64 bit PCI extensions
--    par64_in                : IN std_logic; 
--    par64_out               : OUT std_logic; 
--    par64_en                : OUT std_logic; 
--    ad64_en                 : OUT std_logic_vector(3 DOWNTO 0); 
--    cbe64_en                : OUT std_logic; 
--    req64_n_in              : IN std_logic; 
--    req64_n_out             : OUT std_logic; 
--    req64_n_en              : OUT std_logic; 
--    ack64_n_in              : IN std_logic; 
--    ack64_n_out             : OUT std_logic; 
--    ack64_n_en              : OUT std_logic; 
    -- target0 reg interface signals
    target0_address         : IN std_logic_vector(t0_ram_addr_range - 1 DOWNTO 0); 
    target0_data_in         : IN std_logic_vector(t0_dat_width - 1 DOWNTO 0); 
    target0_cbe_in          : IN std_logic_vector(3 DOWNTO 0); 
    target0_write           : IN std_logic; 
    target0_req             : IN std_logic; 
    target0_ram_dout        : IN std_logic_vector(31 DOWNTO 0); 
    target0_data_out        : OUT std_logic_vector(t0_dat_width - 1 DOWNTO 0); 
    target0_gnt             : OUT std_logic; 
    target0_ram_din         : OUT std_logic_vector(31 DOWNTO 0); 
    target0_reg_addr        : OUT std_logic_vector(t0_ram_addr_range - 1 DOWNTO 0); 
    target0_write_en        : OUT std_logic_vector(3 DOWNTO 0); 
--    -- target0 fifo interface signals
--    target0_del_rds         : IN std_logic; 
--    target0_data_in         : IN std_logic_vector(t0_dat_width - 1 DOWNTO 0); 
--    target0_write           : IN std_logic; 
--    target0_read            : IN std_logic; 
--    target0_ack             : IN std_logic; 
--    target0_flush_tx        : IN std_logic; 
--    target0_flush_rx        : IN std_logic; 
--    target0_new_cmd         : OUT std_logic; 
--    target0_pci_addr        : OUT std_logic_vector(31 DOWNTO 0); 
--    target0_pci_cmd         : OUT std_logic_vector(3 DOWNTO 0); 
--    target0_data_out        : OUT std_logic_vector(t0_dat_width - 1 DOWNTO 0); 
--    target0_cbe_out         : OUT std_logic_vector(t0_cbe_width - 1 DOWNTO 0); 
--    target0_tx_fifo_full    : OUT std_logic; 
--    target0_tx_fifo_af      : OUT std_logic; 
--    target0_tx_space_mark   : OUT std_logic; 
--    target0_rx_fifo_empty   : OUT std_logic; 
--    target0_rx_fifo_ae      : OUT std_logic; 
--    target0_rx_data_mark    : OUT std_logic; 
--    target0_discard_err     : OUT std_logic; 
    -- target1 fifo interface signals
    target1_del_rds         : IN std_logic; 
    target1_data_in         : IN std_logic_vector(t1_dat_width - 1 DOWNTO 0); 
    target1_write           : IN std_logic; 
    target1_read            : IN std_logic; 
    target1_ack             : IN std_logic; 
    target1_flush_tx        : IN std_logic; 
    target1_flush_rx        : IN std_logic; 
    target1_new_cmd         : OUT std_logic; 
    target1_pci_addr        : OUT std_logic_vector(31 DOWNTO 0); 
    target1_pci_cmd         : OUT std_logic_vector(3 DOWNTO 0); 
    target1_data_out        : OUT std_logic_vector(t1_dat_width - 1 DOWNTO 0); 
    target1_cbe_out         : OUT std_logic_vector(t1_cbe_width - 1 DOWNTO 0); 
    target1_tx_fifo_full    : OUT std_logic; 
    target1_tx_fifo_af      : OUT std_logic; 
    target1_tx_space_mark   : OUT std_logic; 
    target1_rx_fifo_empty   : OUT std_logic; 
    target1_rx_fifo_ae      : OUT std_logic; 
    target1_rx_data_mark    : OUT std_logic; 
    target1_discard_err     : OUT std_logic; 
--    -- target2 fifo interface signals
--    target2_del_rds         : IN std_logic; 
--    target2_data_in         : IN std_logic_vector(t2_dat_width - 1 DOWNTO 0); 
--    target2_write           : IN std_logic; 
--    target2_read            : IN std_logic; 
--    target2_ack             : IN std_logic; 
--    target2_flush_tx        : IN std_logic; 
--    target2_flush_rx        : IN std_logic; 
--    target2_new_cmd         : OUT std_logic; 
--    target2_pci_addr        : OUT std_logic_vector(31 DOWNTO 0); 
--    target2_pci_cmd         : OUT std_logic_vector(3 DOWNTO 0); 
--    target2_data_out        : OUT std_logic_vector(t2_dat_width - 1 DOWNTO 0); 
--    target2_cbe_out         : OUT std_logic_vector(t2_cbe_width - 1 DOWNTO 0); 
--    target2_tx_fifo_full    : OUT std_logic; 
--    target2_tx_fifo_af      : OUT std_logic; 
--    target2_tx_space_mark   : OUT std_logic; 
--    target2_rx_fifo_empty   : OUT std_logic; 
--    target2_rx_fifo_ae      : OUT std_logic; 
--    target2_rx_data_mark    : OUT std_logic; 
--    target2_discard_err     : OUT std_logic; 
--    -- target3 fifo interface signals
--    target3_del_rds         : IN std_logic; 
--    target3_data_in         : IN std_logic_vector(t3_dat_width - 1 DOWNTO 0); 
--    target3_write           : IN std_logic; 
--    target3_read            : IN std_logic; 
--    target3_ack             : IN std_logic; 
--    target3_flush_tx        : IN std_logic; 
--    target3_flush_rx        : IN std_logic; 
--    target3_new_cmd         : OUT std_logic; 
--    target3_pci_addr        : OUT std_logic_vector(31 DOWNTO 0); 
--    target3_pci_cmd         : OUT std_logic_vector(3 DOWNTO 0); 
--    target3_data_out        : OUT std_logic_vector(t3_dat_width - 1 DOWNTO 0); 
--    target3_cbe_out         : OUT std_logic_vector(t3_cbe_width - 1 DOWNTO 0); 
--    target3_tx_fifo_full    : OUT std_logic; 
--    target3_tx_fifo_af      : OUT std_logic; 
--    target3_tx_space_mark   : OUT std_logic; 
--    target3_rx_fifo_empty   : OUT std_logic; 
--    target3_rx_fifo_ae      : OUT std_logic; 
--    target3_rx_data_mark    : OUT std_logic; 
--    target3_discard_err     : OUT std_logic; 
--    -- target4 fifo interface signals
--    target4_del_rds         : IN std_logic; 
--    target4_data_in         : IN std_logic_vector(t4_dat_width - 1 DOWNTO 0); 
--    target4_write           : IN std_logic; 
--    target4_read            : IN std_logic; 
--    target4_ack             : IN std_logic; 
--    target4_flush_tx        : IN std_logic; 
--    target4_flush_rx        : IN std_logic; 
--    target4_new_cmd         : OUT std_logic; 
--    target4_pci_addr        : OUT std_logic_vector(31 DOWNTO 0); 
--    target4_pci_cmd         : OUT std_logic_vector(3 DOWNTO 0); 
--    target4_data_out        : OUT std_logic_vector(t4_dat_width - 1 DOWNTO 0); 
--    target4_cbe_out         : OUT std_logic_vector(t4_cbe_width - 1 DOWNTO 0); 
--    target4_tx_fifo_full    : OUT std_logic; 
--    target4_tx_fifo_af      : OUT std_logic; 
--    target4_tx_space_mark   : OUT std_logic; 
--    target4_rx_fifo_empty   : OUT std_logic; 
--    target4_rx_fifo_ae      : OUT std_logic; 
--    target4_rx_data_mark    : OUT std_logic; 
--    target4_discard_err     : OUT std_logic; 
--    -- target5 fifo interface signals
--    target5_del_rds         : IN std_logic; 
--    target5_data_in         : IN std_logic_vector(t5_dat_width - 1 DOWNTO 0); 
--    target5_write           : IN std_logic; 
--    target5_read            : IN std_logic; 
--    target5_ack             : IN std_logic; 
--    target5_flush_tx        : IN std_logic; 
--    target5_flush_rx        : IN std_logic; 
--    target5_new_cmd         : OUT std_logic; 
--    target5_pci_addr        : OUT std_logic_vector(31 DOWNTO 0); 
--    target5_pci_cmd         : OUT std_logic_vector(3 DOWNTO 0); 
--    target5_data_out        : OUT std_logic_vector(t5_dat_width - 1 DOWNTO 0); 
--    target5_cbe_out         : OUT std_logic_vector(t5_cbe_width - 1 DOWNTO 0); 
--    target5_tx_fifo_full    : OUT std_logic; 
--    target5_tx_fifo_af      : OUT std_logic; 
--    target5_tx_space_mark   : OUT std_logic; 
--    target5_rx_fifo_empty   : OUT std_logic; 
--    target5_rx_fifo_ae      : OUT std_logic; 
--    target5_rx_data_mark    : OUT std_logic; 
--    target5_discard_err     : OUT std_logic; 
    -- master signals without dma
    master_request          : IN std_logic; 
    master_pci_cmd          : IN std_logic_vector(3 DOWNTO 0); 
    master_address          : IN std_logic_vector(31 DOWNTO 0); 
    master_word_count       : IN std_logic_vector(31 DOWNTO 0); 
    master_receive_be       : IN std_logic_vector(pci_cbe_width - 1 DOWNTO 0); 
    mas_tx_data_in          : IN std_logic_vector(pci_dat_width - 1 DOWNTO 0); 
    mas_tx_be_in            : IN std_logic_vector(pci_cbe_width - 1 DOWNTO 0); 
    mas_tx_fifo_wr          : IN std_logic; 
    mas_rx_fifo_rd          : IN std_logic; 
    mas_tx_fifo_flush       : IN std_logic; 
    mas_rx_fifo_flush       : IN std_logic; 
    dma_tx_fifo_flush       : IN std_logic; 
    dma_rx_fifo_flush       : IN std_logic; 
    master_force_term       : IN std_logic; 
    master_dis_auto_flush   : IN std_logic; 
    master_started          : OUT std_logic; 
    master_complete         : OUT std_logic; 
    mas_rx_data_out_reg     : OUT std_logic_vector(pci_dat_width - 1 DOWNTO 0);
    mas_rx_data_out_dir     : OUT std_logic_vector(pci_dat_width - 1 DOWNTO 0);
    mas_rx_fifo_empty       : OUT std_logic; 
    mas_rx_fifo_ae          : OUT std_logic; 
    mas_rx_fifo_data        : OUT std_logic; 
    mas_tx_fifo_full        : OUT std_logic; 
    mas_tx_fifo_af          : OUT std_logic; 
    mas_tx_fifo_space       : OUT std_logic; 
    mas_rx_fifo_datacount   : OUT std_logic_vector(m_fram_addr_range DOWNTO 0); 
    mas_tx_fifo_datacount   : OUT std_logic_vector(m_fram_addr_range DOWNTO 0); 
    master_det_perr         : OUT std_logic; 
    master_det_serr         : OUT std_logic; 
    master_mas_abort        : OUT std_logic; 
    master_tar_abort        : OUT std_logic; 
    master_retry_err        : OUT std_logic; 
    master_trdy_err         : OUT std_logic; 
    -- E2PROM INTERFACE SIGNALS
    sdo                     : IN std_logic; --  output from serial prom
    sdi                     : OUT std_logic; --  input to serial prom
    sclk                    : OUT std_logic; --  serial clock to prom
    scs                     : OUT std_logic; --  chip select for prom
    -- Interrupts
    int_req                 : IN std_logic_vector(31 DOWNTO 0); 
    int_en                  : IN std_logic_vector(31 DOWNTO 0); 
    inta_n_en               : OUT std_logic; 
    -- Power management interface pins
    pme_req                 : IN std_logic; 
    pme_ack                 : OUT std_logic; 
    pme_en                  : OUT std_logic; 
    pwr_state               : OUT std_logic_vector(1 DOWNTO 0); 
    pwr_state_rst           : OUT std_logic; 
    pme_n_en                : OUT std_logic; 
    m66en_in                : IN std_logic; 
    -- Misc backend signals
    scan_test_enable        : IN std_logic; 
    b_clock                 : IN std_logic; 
    b_rst_n                 : OUT std_logic; 
    force_retry             : IN std_logic; 
    force_abort             : IN std_logic; 
    tar_op_in_prog          : OUT std_logic); 
END mpci;

--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, hdlc_fifo, is restricted to employees of MGC on     --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (hdlc_fifo v1999.101) was extracted on          --
--workstation hostid 80895eb6 Inventra                                      --
--------------------------------------------------------------------------
--                                                                      --
--   (C) MENTOR GRAPHICS CORPORATION AND LICENSORS 1997                 --
--                                                                      --
--------------------------------------------------------------------------
--   Product Name :   HDLC-FIFO                                         --
--------------------------------------------------------------------------
--   Product      :   Single Channel HDLC with FIFO                     --
--   Description  :                                                     --
--------------------------------------------------------------------------
--   File         :   VHDL RTL Source code                              --
--   Description  :                                                     --
--------------------------------------------------------------------------
--   Version      :   2.6G00                                            --
--------------------------------------------------------------------------
--   Release Date :   13 September 1999                                 --
--------------------------------------------------------------------------
--                                                                      --
--   Notes:                                                             --
--                                                                      --
--------------------------------------------------------------------------
LIBRARY IEEE;

USE IEEE.std_logic_1164.all;

PACKAGE cf_hdlc_fifo_pak IS
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, hdlc_fifo, is restricted to employees of MGC on     --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (hdlc_fifo v1999.101) was extracted on          --
--workstation hostid 80895eb6 Inventra                                      --

-- Register Addresses
CONSTANT MODE_addr  : integer := 0;                                 -- HDLC Mode Register
CONSTANT EMODE_addr : integer := 1;                                 -- HDLC Mode Register
CONSTANT CMD_addr   : integer := 2;                                 -- Command Register
CONSTANT SSTAT_addr : integer := 3;                                 -- Serial Status Register
CONSTANT FSTAT_addr : integer := 4;                                 -- FIFO Status Register
CONSTANT ISTAT_addr : integer := 5;                                 -- HDLC Interrupt Status Register
CONSTANT ISERV_addr : integer := 6;                                 -- HDLC Interrupt Status Register
CONSTANT IMASK_addr : integer := 7;                                 -- HDLC Interrupt Enable Register
CONSTANT FIFO_addr  : integer := 8;                                 -- FIFO Address (Read -> rx_fifo / Write -> tx_fifo)
CONSTANT RFBC_addr  : integer := 9;                                 -- Receive Frame Byte Count
CONSTANT TA1_addr   : integer := 10;                                -- Transmit Address 1
CONSTANT TA2_addr   : integer := 11;                                -- Transmit Address 2
CONSTANT RAW1_addr  : integer := 12;                                -- Receive Address Wildcard1
CONSTANT RAW2_addr  : integer := 13;                                -- Receive Address Wildcard2
CONSTANT RA1_addr   : integer := 14;                                -- Receive Address Register 1
CONSTANT RA2_addr   : integer := 15;                                -- Receive Address Register 2

-- Mode Register Bits
CONSTANT MODE_msb   : integer := 7;
CONSTANT SAC        : integer := 7;                                 -- Select Abort Character
CONSTANT HEN        : integer := 6;                                 -- HDLC protocol enable
CONSTANT TXE        : integer := 5;                                 -- HDLC transmit enable
CONSTANT RXE        : integer := 4;                                 -- HDLC receive enable
CONSTANT CR32       : integer := 3;                                 -- 1: CRC 32, 0 : CRC 16
CONSTANT ITF        : integer := 2;                                 -- HDLC interframe time fill (1: 1's, 0:flags)
CONSTANT FLS        : integer := 1;                                 -- HDLC flag share on transmit
CONSTANT TIC        : integer := 0;                                 -- Transmit Incorrect CRC

-- Extended Mode Register Bits
CONSTANT EMODE_msb  : integer := 7;
CONSTANT LPB        : integer := 7;                                 -- enable loopback mode
CONSTANT CPT        : integer := 6;                                 -- CRC Pass Through - do not receive into data buffer
CONSTANT TAIE       : integer := 5;                                 -- Transmit Address Insert Enable
CONSTANT RAF1       : integer := 4;                                 -- Receive Address Filter 1
CONSTANT RAF0       : integer := 3;                                 -- Receive Address Filter 0
CONSTANT MFLE       : integer := 2;                                 -- Minimum Frame Length Enable
CONSTANT MFL1       : integer := 1;                                 -- Minimum Frame Length 1
CONSTANT MFL0       : integer := 0;                                 -- Minimum Frame Length 0

-- Command Register Bits
CONSTANT CMD_msb    : integer := 3;
CONSTANT TFT        : integer := 3;                                 -- Transmit Frame Terminator
CONSTANT TFC        : integer := 2;                                 -- Transmit FIFO Clear
CONSTANT RFC        : integer := 1;                                 -- Receive FIFO Clear
CONSTANT RFB        : integer := 0;                                 -- Receive Force abort

-- Serial Status Register
CONSTANT SSTAT_msb  : integer := 3;
CONSTANT SPG        : integer := 3;                                 -- Serial Port Grant
CONSTANT RID        : integer := 2;                                 -- Receive Line Idle
CONSTANT RFL        : integer := 1;                                 -- Receive Flag Characters
CONSTANT TIF        : integer := 0;                                 -- Transmit in-frame

-- FIFO Status Register bits
CONSTANT FSTAT_msb  : integer := 6;
CONSTANT RSB        : integer := 6;                                 -- Receive Status Byte
CONSTANT TLL        : integer := 5;                                 -- Transmit fifo level low (below threshold level)
CONSTANT TFE        : integer := 4;                                 -- Transmit fifo full/empty
CONSTANT TOU        : integer := 3;                                 -- Transmit fifo overrun/underrun
CONSTANT RLH        : integer := 2;                                 -- Receive fifo level high (above threshold level)
CONSTANT RFE        : integer := 1;                                 -- Receive fifo full/empty
CONSTANT ROU        : integer := 0;                                 -- receive fifo overrun/underrun

-- Interrupt Status/Service/Mask Register bits
CONSTANT ISTAT_msb  : integer := 7;
CONSTANT ISERV_msb  : integer := 7;
CONSTANT IMASK_msb  : integer := 7;
CONSTANT TXOK       : integer := 7;                                 -- transmit frame ok interrupt
CONSTANT TXERR      : integer := 6;                                 -- transmit error interrupt
CONSTANT RXOK       : integer := 5;                                 -- receive frame ok interrupt
CONSTANT RXERR      : integer := 4;                                 -- receive error interrupt
CONSTANT TXFL       : integer := 3;                                 -- transmit fifo running low interrupt
CONSTANT TXFU       : integer := 2;                                 -- transmit fifo underflow interrupt
CONSTANT RXFH       : integer := 1;                                 -- receive fifo running high interrupt
CONSTANT RXFO       : integer := 0;                                 -- receive fifo overflow interrupt

-- Transmit / Receive FIFO
CONSTANT FIFO_msb   : integer := 7;

-- Receive Frame Byte Count
CONSTANT RFBC_msb   : integer := 7;

-- Transmit Address Register 1
CONSTANT TA1_msb    : integer := 7;

-- Transmit Address Register 2
CONSTANT TA2_msb    : integer := 7;

-- Receive Address Wildcard 1
CONSTANT RAW1_msb   : integer := 7;

-- Receive Address Wildcard 2
CONSTANT RAW2_msb   : integer := 7;

-- Receive Address 1
CONSTANT RA1_msb    : integer := 7;

-- Receive Address 2
CONSTANT RA2_msb    : integer := 7;

END cf_hdlc_fifo_pak;

PACKAGE BODY cf_hdlc_fifo_pak IS
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, hdlc_fifo, is restricted to employees of MGC on     --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (hdlc_fifo v1999.101) was extracted on          --
--workstation hostid 80895eb6 Inventra                                      --

END cf_hdlc_fifo_pak;


--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, hdlc_fifo, is restricted to employees of MGC on     --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (hdlc_fifo v1999.101) was extracted on          --
--workstation hostid 80895eb6 Inventra                                      --
--------------------------------------------------------------------------
--                                                                      --
--   (C) MENTOR GRAPHICS CORPORATION AND LICENSORS 1997                 --
--                                                                      --
--------------------------------------------------------------------------
--   Product Name :   HDLC-FIFO                                         --
--------------------------------------------------------------------------
--   Product      :   Single Channel HDLC with FIFO                     --
--   Description  :                                                     --
--------------------------------------------------------------------------
--   File         :   VHDL RTL Source code                              --
--   Description  :                                                     --
--------------------------------------------------------------------------
--   Version      :   2.6G00                                            --
--------------------------------------------------------------------------
--   Release Date :   13 September 1999                                 --
--------------------------------------------------------------------------
--                                                                      --
--   Notes:                                                             --
--                                                                      --
--------------------------------------------------------------------------
LIBRARY ieee, work;

USE ieee.std_logic_1164.all;
USE work.cf_hdlc_fifo_pak.ALL;

ENTITY cf_hdlc_fifo IS
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, hdlc_fifo, is restricted to employees of MGC on     --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (hdlc_fifo v1999.101) was extracted on          --
--workstation hostid 80895eb6 Inventra                                      --
    GENERIC (   ram_based_fifos         : integer := 0;                         
                -- if non-zero then use ram-based fifos (else use reg-based)

                fifo_addr_size          : integer := 6;                         
                -- each fifo has 2**6 = 64 words
                tx_fifo_threshold       : integer := 32;                        
                -- Tx fifo threshold level
                rx_fifo_threshold       : integer := 32;                        
                -- Rx fifo threshold level

                config_crc32            : integer := 1;                         
                -- configure cf-hdlc-fifo with CRC32 capability
                                                                                
                --  (must be either 0 = CRC16 only, or 1 = CRC16/32 programmable)
                tx_addr_insert          : integer := 1;                         
                -- configure cf-hdlc-fifo with address insertion registers and control
                rx_addr_filter          : integer := 1;                         
                -- configure cf-hdlc-fifo with address filtering registers and control
                rx_addr_filter_tei_bcast: integer := 1                          
                -- enable matching of TEI broadcast address
            );
    PORT    (   rst_i           : IN  std_ulogic;                               
                -- master reset input (async)
                s_rst_i         : IN  std_ulogic;                               
                -- master reset input (sync)
                clk             : IN  std_ulogic;                               
                -- master clock input                     

                loopback        : OUT std_ulogic;                               
                -- indicate loopback mode active

                                                                                
                -- FISPbus SIGNALS
                AI              : IN  std_ulogic_vector(3 DOWNTO 0);            
                -- FISPbus address bus
                DI              : IN  std_ulogic_vector(7 DOWNTO 0);            
                -- FISPbus data bus
                RWI             : IN  std_ulogic;                               
                -- FISPbus Read/Write
                CS_B            : IN  std_ulogic_vector(1 DOWNTO 0);            
                -- FISPbus Chip Select & strbs
                RI_B            : IN  std_ulogic;                               
                -- FISPbus Ready signal
                IG              : IN  std_ulogic_vector(1 DOWNTO 0);            
                -- FISPbus Interrupt Grant bus

                DO              : OUT std_ulogic_vector(7 DOWNTO 0);            
                -- FISPbus data bus
                RO_B            : OUT std_ulogic;                               
                -- FISPbus Ready signal
                IR              : OUT std_ulogic_vector(1 DOWNTO 0);            
                -- FISPbus IRQ bus
                FTS             : OUT std_ulogic;                               
                -- FISPbus Free To Send
                FTR             : OUT std_ulogic;                               
                -- FISPbus Free To Recieve

                                                                                
                -- SERIAL INTERFACE SIGNALS
                rx_clk          : IN  std_ulogic;                               
                -- hdlc receive clock
                tx_clk          : IN  std_ulogic;                               
                -- hdlc transmit clock
                rx_ser          : IN  std_ulogic;                               
                -- hdlc receive data (serial)
                tx_ser          : OUT std_ulogic;                               
                -- hdlc transmit data (serial)
                rx_ser_en       : IN  std_ulogic;                               
                -- hdlc receive data enable
                tx_ser_en       : IN  std_ulogic;                               
                -- hdlc transmit data enable
                req_ser         : OUT std_ulogic;                               
                -- hdlc channel request
                gnt_ser         : IN  std_ulogic;                               
                -- hdlc channel grant

                                                                                
                -- RAM INTERFACE SIGNALS (only used when ram_based_fifos /= 0)
                RAM_mcycle      : OUT std_ulogic;                               
                -- Memory access cycle (active high)
                RAM_wrn         : OUT std_ulogic;                               
                -- Write signal (active low)
                RAM_addr        : OUT std_ulogic_vector(fifo_addr_size DOWNTO 0)
;               -- Address lines
                RAM_d           : OUT std_ulogic_vector(8 DOWNTO 0);            
                -- Data to RAM
                RAM_q           : IN  std_ulogic_vector(8 DOWNTO 0)             
                -- Data from RAM
            );
END cf_hdlc_fifo;


library IEEE;

use IEEE.std_logic_1164.all;

entity M8259A is
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, m8259aeng, is restricted to employees of MGC on     --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (m8259aeng v1998.020) was extracted on          --
--workstation hostid 80895eb6 Inventra                                      --

   port( CAO0, CAO1, CAO2, DAO_0_port, DAO_1_port, DAO_2_port, DAO_3_port, 
         DAO_4_port, DAO_5_port, DAO_6_port, DAO_7_port, IRQ, NBUF, NEN, SLAVE 
         : out std_logic;  BA0, BDI_0_port, BDI_1_port, BDI_2_port, BDI_3_port,
         BDI_4_port, BDI_5_port, BDI_6_port, BDI_7_port, BNCS, BNRD, BNWR, CAI0
         , CAI1, CAI2, IR0, IR1, IR2, IR3, IR4, IR5, IR6, IR7, NINTA, NSP, 
         NTEST : in std_logic);

end M8259A;


--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1998.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--These deliverables may be used for the purpose of making silicon for one  --
--IC design only.  No further use of these deliverables for the purpose of  --
--making silicon from an IC design is permitted without the payment of an   --
--additional license fee.  See your license agreement with Mentor Graphics  --
--for further details.  If you have further questions please contact        --
--Mentor Graphics Customer Support.                                         --
--                                                                          --
--This Mentor Graphics core (m8051warp v1998.100) was extracted on          --
--workstation hostid 80895eb6 Inventra                                      --
-- M8051Warp Core Top Level Module
-- (c) Copyright Mentor Graphics Corporation and Licensors 1998.
-- All rights reserved.
-- v1.00
--------------------------------------------------------------------------------
--File          :       m8051warp.vhd                                         --
--Created on    :       23rd February 1998                                    --
--Purpose       :       M8051Warp Fast 8051 Microcontroller                   --
--Version       :       1.000                                                 --
--------------------------------------------------------------------------------

-- VHDL entity and architecture file.


library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.std_logic_unsigned.all;
--USE work.m8051warp_package.all;
USE std.textio.all;

ENTITY m8051warp IS
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1998.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--These deliverables may be used for the purpose of making silicon for one  --
--IC design only.  No further use of these deliverables for the purpose of  --
--making silicon from an IC design is permitted without the payment of an   --
--additional license fee.  See your license agreement with Mentor Graphics  --
--for further details.  If you have further questions please contact        --
--Mentor Graphics Customer Support.                                         --
--                                                                          --
--This Mentor Graphics core (m8051warp v1998.100) was extracted on          --
--workstation hostid 80895eb6 Inventra                                      --
   PORT (
      -- Port Drivers
      PORT0O    : OUT   std_logic_vector(7 DOWNTO 0);
      PORT1O    : OUT   std_logic_vector(7 DOWNTO 0);
      PORT2O    : OUT   std_logic_vector(7 DOWNTO 0);
      PORT3O    : OUT   std_logic_vector(7 DOWNTO 0);

      -- Port Driver Enables
      NPORT1E   : OUT   std_logic_vector(7 DOWNTO 0);
      NPORT2E   : OUT   std_logic_vector(7 DOWNTO 0);
      NPORT3E   : OUT   std_logic_vector(7 DOWNTO 0);

      -- Program Memory Interface
      PROGA     : OUT   std_logic_vector(15 DOWNTO 0);
      NPSEN     : OUT   std_logic;

      -- External Data RAM Interface
      XRAMA     : OUT   std_logic_vector(15 DOWNTO 0);
      XRAMDO    : OUT   std_logic_vector(7 DOWNTO 0);
      NXRAMR    : OUT   std_logic;
      NXRAMW    : OUT   std_logic;

      -- Dual port RAM interface
      SOURCE_A  : OUT   std_logic_vector(7 DOWNTO 0);
      DESTIN_A  : OUT   std_logic_vector(7 DOWNTO 0);
      DESTIN_DO : OUT   std_logic_vector(7 DOWNTO 0);
      NDESTIN_WE        : OUT   std_logic;

      -- External SFR Interface
      SFRWE     : OUT   std_logic;

      -- Interrupt Acknowledges
      XINTR_ACK : OUT   std_logic_vector(13 DOWNTO 5);

      -- External Controls
      IDLE      : OUT   std_logic;
      PDOWN     : OUT   std_logic;
      NCCLKE    : OUT   std_logic;
      NPCLKE    : OUT   std_logic;

      -- Port Inputs
      PORT0I    : IN    std_logic_vector(7 DOWNTO 0);
      PORT1I    : IN    std_logic_vector(7 DOWNTO 0);
      PORT2I    : IN    std_logic_vector(7 DOWNTO 0);
      PORT3I    : IN    std_logic_vector(7 DOWNTO 0);

      -- Program Memory Interface
      PROGDI    : IN    std_logic_vector(7 DOWNTO 0);

      -- External Data RAM Interface
      XRAMDI    : IN    std_logic_vector(7 DOWNTO 0);

      -- Dual port RAM interface
      SOURCE_DI : IN    std_logic_vector(7 DOWNTO 0);

      -- External SFR Interface
      ESFRDI    : IN    std_logic_vector(7 DOWNTO 0);

      -- Interrupt sources
      XINTR_SRC : IN    std_logic_vector(13 DOWNTO 5);

      SCLK      : IN    std_logic;
      CCLK      : IN    std_logic;
      PCLK      : IN    std_logic;
      RESET     : IN    std_logic;
      TRESET    : IN    std_logic
   );
END m8051warp;


--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, m8237a, is restricted to employees of MGC on        --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (m8237a v1998.080) was extracted on             --
--workstation hostid 80895eb6 Inventra                                      --
-- m8237a - netlist to connect 8237a low level blocks together.
-- Copyright 3Soft Limited. 1996
-- V6.3
-----------------------------------------------------------------------------
-- Description :

-- Differences between this design and original part:

-- 1. Original part has asynchronous master clear (soft reset). This design
--    has synchronous master clear. This can lead to timing differences between
--    original part and this design due to the position of nwr rising edge
--    (captures mclr) relative to clk falling edge (causes execution of mclr
--    in state machine and priority resolver).

-----------------------------------------------------------------------------
-- Rev. history : 
--     V6.0 - New design.
--     V6.1 - 14/1/97:
--            1. Changes to line up with new versions of component blocks.
--     V6.2 - 23/5/97:
--            1. Changes to line up with new versions of component blocks.

--     V6.3 - 28/6/98
--            1. Brought nwri, nwri_clk signals to i/o of core to avoid 
--               net capacitance loading problems.
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity m8237a is
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, m8237a, is restricted to employees of MGC on        --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (m8237a v1998.080) was extracted on             --
--workstation hostid 80895eb6 Inventra                                      --

    port(
        adstb, 
        aen, 
        covl, 
        dack0, 
        dack1, 
        dack2, 
        dack3, 
        davl, 
        hrq, 
        neopi, 
        nior, 
        niow, 
        nmemr, 
        nmemw,
        nrdi_o,
        nwri_o : out std_logic;
        ca    : out std_logic_vector(15 downto 0);
        da    : out std_logic_vector(7 downto 0);
        nrdi_i,
        nwri_i,
        clk,
        nclk, 
        dreq0, 
        dreq1, 
        dreq2, 
        dreq3, 
        hlda, 
        ncs, 
        neope, 
        nrd, 
        nwr, 
        ready, 
        rset,
        test : in std_logic;
        di   : in std_logic_vector(7 downto 0);
        a    : in std_logic_vector(3 downto 0)
         );
end m8237a;


--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, m146818, is restricted to employees of MGC on       --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (m146818 v1999.100) was extracted on            --
--workstation hostid 80895eb6 Inventra                                      --
--
-- m146818 Real Time Clock. (RTC)                                     //
-- Copyright Mentor Graphics Corporation and Licensors 1997.          //
-- V6.000                                                             //
--                                                                    //
-- Revision history                                                   //
--                                                                    //
-- V6.000 -                                                           //
--          27 August 1997.                                           //
--          Initial RTL version.                                      //
--                                                                    //
--                                                                    //
-- CLK  - Either 4.194304, 1.048576, or 0.032768 MHz                  //
-- NRST - Same reset as cpu when 'switched on in morning'             //
--        Other registers should still be defined if no power down.   //
--        Active low reset clears:  PIE. AIE, UIE                     //
--        interrupt flag: PF, AF, UF, IRQF, and                       //
--        square wave enable SQWE. (Clears interface).                //
-- A    - Address lines.                                              //
-- AS   - Address strobe, latches A6-0 when low.                      //
--        A6-0 by default (128 bytes), see m146818cfg.vhd.                //
-- LA   - Latched address lines for external RAM addressing           //
-- DI   - Input Data bus, 8 wide.                                     //
-- DA   - Output data bus, 8 wide.                                    //
-- NDOE - Data bus output enable, active low.                         //
-- NWR  - Write strobe active low                                     //
-- NRD  - read strobe active low                                      //
-- NCE  - Chip enable active low                                      //
-- NRE  - External ram enable, active low                             //
--        Low when NCE is low and address > 14                        //
-- NIRQ - Interrupt request active low                                //
-- SWQ  - Square wave output                                          //
-- NMR  - For use after power loss.                                   //
--        Master reset active low. This signal clears the VTR         //
--        bit in register D to indicate invalid data. This            //
--        signal should be asserted at power up. This is used         //
--        when power has been lost to the device.                     //
--        Used to define Update controller, Clock prescaler & divider //
--        , Control registers, for simulation purposes                //
-- NTST - Test mode pin (active low).                                 //
--                                                                    //
-- LARtc - RTC internal bus = F hex when external RAM location.       //
--                                                                    //
-- The macro comes with addresses defined 14-63 (dec), by             //
-- default. The address range may be altered by adjusting the         //
-- BUS_WIDTH parameter. See "m146818cfg.vhd"                          //
--                                                                    //
-- NWRInterTCA - To save power this signal only changes when the chip //
--               is selected. This signal for writing to TCA regs is  //
--               disabled during and update.                          //
-- NWRInterABCD -To save power this signal only changes when the chip //
--               is selected. This signal for writing to ABCD regs is //
--               NOT disabled during and update.                      //
--                                                                    //
--//////////////////////////////////////////////////////////////////////
-- Set address latch and bus width 
-- Set top of ram for ram simulation model ram.v, 
-- normally (2^BUS_WIDTH)-1.
--Include bus width definition, see m146818cfg.vhd
--//////////////// Interface ///////////////////////////////////////////
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


ENTITY m146818 IS
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, m146818, is restricted to employees of MGC on       --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (m146818 v1999.100) was extracted on            --
--workstation hostid 80895eb6 Inventra                                      --
  PORT (
        A                       : IN std_logic_vector(BUS_WIDTH DOWNTO 0); 
        DI                      : IN std_logic_vector(7 DOWNTO 0); 
        AS                      : IN std_logic; 
        CLK                     : IN std_logic; 
        NCE                     : IN std_logic; 
        NMR                     : IN std_logic; 
        NRD                     : IN std_logic; 
        NRST                    : IN std_logic; 
        NTST                    : IN std_logic; 
        NWR                     : IN std_logic; 
        DA                      : OUT std_logic_vector(7 DOWNTO 0); 
        LA                      : OUT std_logic_vector(BUS_WIDTH DOWNTO 0); 
        NDOE                    : OUT std_logic; 
        NIRQ                    : OUT std_logic; 
        NRE                     : OUT std_logic; 
        SQW                     : OUT std_logic); 
END m146818;

--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--Use of these deliverables for the purpose of making silicon from an IC    --
--design is limited to the terms and conditions of your license agreement   --
--with Mentor Graphics If you have further questions please contact Mentor  --
--Graphics Customer Support.                                                --
--                                                                          --
--This Mentor Graphics core (m1284h v1999.010) was extracted on             --
--workstation hostid 80895eb6 Inventra                                      --

-- IEEE 1284 parallel port implementation.                                         *
-- (C) Copyright Mentor Graphics Corporation and Licensors (1996 - 1997).          *
-- V1.3                                                                            *
--                                                                                 *
-- m1284h.vhdl                                                                     *
--                                                                                 *
--                                                                                 *
--                                                                                 *
--  Tfifo mode added                                                               *
--  cfifo corrected                                                                *
--                                                                                 *
-- Description :- FpgaAdvantage Evaluation version - T.DELAYE			   *
--**********************************************************************************
LIBRARY   ieee;
LIBRARY   WORK;

USE   ieee.std_logic_1164.all;
USE   ieee.std_logic_unsigned;

ENTITY m1284h IS
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--Use of these deliverables for the purpose of making silicon from an IC    --
--design is limited to the terms and conditions of your license agreement   --
--with Mentor Graphics If you have further questions please contact Mentor  --
--Graphics Customer Support.                                                --
--                                                                          --
--This Mentor Graphics core (m1284h v1999.010) was extracted on             --
--workstation hostid 80895eb6 Inventra                                      --
   PORT (
      TESTMODE                      : IN  std_logic;		
      CLK                           : IN  std_logic;		
      RST                           : IN  std_logic;		
      PWRGD                         : IN  std_logic;		
      NIOW                          : IN  std_logic;		
      NIOR                          : IN  std_logic;		
      SLCT                          : IN  std_logic;		
      NACK                          : IN  std_logic;		
      BUSY                          : IN  std_logic;		
      PE                            : IN  std_logic;		
      NERR                          : IN  std_logic;		
      ADDR                          : IN  std_logic_vector(10 DOWNTO 0);		
      DATAIN                        : IN  std_logic_vector(7 DOWNTO 0);		
      PDIN                          : IN  std_logic_vector(7 DOWNTO 0);		
      DATAOUT                       : OUT std_logic_vector(7 DOWNTO 0);		
      PDOUT                         : OUT std_logic_vector(7 DOWNTO 0);		
      NSLCTIN                       : OUT std_logic;		
      NINIT                         : OUT std_logic;		
      NSTROBE                       : OUT std_logic;		
      NAUTOFD                       : OUT std_logic;		
      PINTR1                        : OUT std_logic;		
      PDIR                          : OUT std_logic;		
      IOCHRDY                       : OUT std_logic;		
      AEN                           : IN  std_logic;		
      TC                            : IN  std_logic;		
      NPDACK                        : IN  std_logic;		
      PDRQ                          : OUT std_logic;		
      READEN                        : OUT std_logic;		
      INTEN                         : OUT std_logic;		
      COMP                          : OUT std_logic;		
      ECR                           : OUT std_logic_vector(7 DOWNTO 0);		
      CR1_3                         : OUT std_logic;		
      CR4_1                         : OUT std_logic;		
      CR4_0                         : OUT std_logic		

   );
END m1284h;

--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, m16x50, is restricted to employees of MGC on        --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (m16x50 v1999.100) was extracted on             --
--workstation hostid 80895eb6 Inventra                                      --

-- M16x50 UART
-- Copyright Mentor Graphics Corporation and Licensors 1999
-- V1.200

-- This is the top level module. It instantiates and connects
-- up the lower levels.

-- It is derived from m16550a V8.400, but uses a single clock
-- Enhancements added:
--   Hardware flow control (RTS/CTS)
--   Software flow control (Xon/Xoff)
--   CR, TOT outputs added

-- FpgaAdvantage evaluation Version - T.DELAYE


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.m16x50_cfg.all;

entity m16x50 is
  port (
    CLK, MR                 : in std_logic;
    A                       : in std_logic_vector(2 downto 0); 
    DI                      : in std_logic_vector(7 downto 0); 
    NCE, RNW                : in std_logic;
    RCLK, BRGE, RCLK_BAUD   : in std_logic;
    NDCD, NRI, NDSR, NCTS   : in std_logic;
    SIN                     : in std_logic;
    DA                      : out std_logic_vector(7 downto 0);
    IRQ                     : out std_logic;
    NDVL                    : out std_logic;
    NOUT1, NOUT2            : out std_logic;
    NRTS, NDTR              : out std_logic;
    SOUT                    : out std_logic;
    BAUD                    : out std_logic; 
    TXRDY, RXRDY, CR, TOT   : out std_logic
    );
end m16x50;


library IEEE;

use IEEE.std_logic_1164.all;
library WORK;

entity m8051 is 
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, m8051, is restricted to employees of MGC on         --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (m8051 v1999.100) was extracted on              --
--workstation hostid 80895eb6 Inventra                                      --
       port(
            NMOE,
            NMWE,
            DLM,
            ALE,
            NPSEN,
            NALEN,
            NFWE,
            NFOE,
            NSFRWE,
            NSFROE,
            IDLE,
            XOFF:
            out std_logic;
            OA,
            OB,
            OC,
            OD,
            AE,
            BE,
            CE,
            DE,
            FA,
            FO:
            out std_logic_vector(7 downto 0);
            M:
            out std_logic_vector(15 downto 0);
            NX1,
            NX2,
            RST,
            NEA,
            NESFR,
            ALEI,
            PSEI:
            in std_logic;
            AI,
            BI,
            CI,
            DI,
            FI,
            MD:
            in std_logic_vector(7 downto 0)
            );
end m8051;
library IEEE;

use IEEE.std_logic_1164.all;
library WORK;

entity m8052 is 
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--Use of these deliverables for the purpose of making silicon from an IC    --
--design is limited to the terms and conditions of your license agreement   --
--with Mentor Graphics If you have further questions please contact Mentor  --
--Graphics Customer Support.                                                --
--                                                                          --
--This Mentor Graphics core (m8052 v1998.081) was extracted on              --
--workstation hostid 80895eb6 Inventra                                      --
       port(
            NMOE,
            NMWE,
            DLM,
            ALE,
            NPSEN,
            NALEN,
            NFWE,
            NFOE,
            NSFRWE,
            NSFROE,
            IDLE,
            XOFF:
            out std_logic;
            OA,
            OB,
            OC,
            OD,
            AE,
            BE,
            CE,
            DE,
            FA,
            FO:
            out std_logic_vector(7 downto 0);
            M:
            out std_logic_vector(15 downto 0);
            NX1,
            NX2,
            RST,
            NEA,
            NESFR,
            ALEI,
            PSEI:
            in std_logic;
            AI,
            BI,
            CI,
            DI,
            FI,
            MD:
            in std_logic_vector(7 downto 0)
            );
end m8052;

--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, m82092ide, is restricted to employees of MGC on     --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (m82092ide v1999.100) was extracted on          --
--workstation hostid 80895eb6 Inventra                                      --
-- M82092IDE Top level
-- M82092IDE
-- Copyright Mentor Graphics Corporation and licensors 1999.
-- V1.002
--
-- This module provides all the timing for the IDE bus including
-- address, data (both read and write) and buffer control.
--

library IEEE;
use IEEE.std_logic_1164.all;

ENTITY m82092ide IS
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, m82092ide, is restricted to employees of MGC on     --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (m82092ide v1999.100) was extracted on          --
--workstation hostid 80895eb6 Inventra                                      --
  PORT (
    --
-- PBI interface signals
--
    CLK                     : IN std_logic; -- Master timing
        NCD                     : IN std_logic; -- Master reset
        DA                      : IN std_logic_vector(31 DOWNTO 0); -- Data in
        DQ                      : OUT std_logic_vector(31 DOWNTO 0); -- Data Out
        NBE                     : IN std_logic_vector(3 DOWNTO 0); -- Byte qualifiers
        A                       : IN std_logic_vector(31 DOWNTO 0); -- Address
        PBIRQ                   : OUT std_logic; -- Primary and secondary interrupts
        SBIRQ                   : OUT std_logic; -- Primary and secondary interrupts
        INTSEL                  : OUT std_logic_vector(7 DOWNTO 0); -- Define IRQ routing
        NIRD                    : IN std_logic; -- Strobes
        NIWR                    : IN std_logic; -- Strobes
        RDY                     : OUT std_logic; -- Cycle wait
        NAVAL                   : OUT std_logic; -- Recognised address
        ABORT                   : OUT std_logic; -- Illegal Address NBE combination
        CFSEL                   : IN std_logic; -- Configuration select
        RETRY                   : OUT std_logic; -- Posted cycle in progress
        ENSERR                  : OUT std_logic; -- Misc enables
        ENPERR                  : OUT std_logic; 
        DATAPE                  : IN std_logic; -- Misc Status
        SERRAC                  : IN std_logic; 
    --
-- IDE interface signals
--
    IDEO                    : OUT std_logic_vector(15 DOWNTO 0); -- Data out
        IDEI                    : IN std_logic_vector(15 DOWNTO 0); -- Data in
        NIDEEN                  : OUT std_logic; -- Data buffer control
        ADD                     : OUT std_logic_vector(2 DOWNTO 0); -- Address
        NIOR                    : OUT std_logic; -- Strobes
        NIOW                    : OUT std_logic; -- Strobes
        NIOCS16                 : IN std_logic; -- Transfer size 0 = 16-bit, 1 = 8-bit
        IORDY                   : IN std_logic; -- Cycle wait = 0 ready = 1
        NPDIR                   : OUT std_logic; -- Exteranl Data buffer direction control 1 = Out, 0 = In
        NSDIR                   : OUT std_logic; -- Exteranl Data buffer direction control 1 = Out, 0 = In
        NPCS0                   : OUT std_logic; -- Primary selects
        NPCS1                   : OUT std_logic; -- Primary selects
        NSCS0                   : OUT std_logic; -- Secondary selects
        NSCS1                   : OUT std_logic; -- Secondary selects
        PIRQ                    : IN std_logic; 
        SIRQ                    : IN std_logic); 
END m82092ide;

--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--Use of these deliverables for the purpose of making silicon from an IC    --
--design is limited to the terms and conditions of your license agreement   --
--with Mentor Graphics If you have further questions please contact Mentor  --
--Graphics Customer Support.                                                --
--                                                                          --
--This Mentor Graphics core (m82365sl v1998.070) was extracted on           --
--workstation hostid 80895eb6 Inventra                                      --
-- M82365SL PC Card I/F controller.
-- (C)Copyright Mentor Graphics Corporation and Licensors (1996 - 1998)
-- Module m82365sl.vhd
-- V1.000
--

--
-- M82365SL Top level.
--
-- Instantiates two PC Card interface blocks and connect logic
-- FpgaAdvantage evaluation version - T.DELAYE

LIBRARY    ieee;

USE    ieee.std_logic_1164.all;
USE    ieee.std_logic_unsigned.all;

ENTITY m82365sl IS
    PORT (
        SA                                        : IN  std_logic_vector(23 DOWNTO 0);		
        NSBHE                                     : IN  std_logic;		
        SDI                                       : IN  std_logic_vector(7 DOWNTO 0);		
        SDO                                       : OUT std_logic_vector(7 DOWNTO 0);		
        NESDO                                     : OUT std_logic;		
        AEN                                       : IN  std_logic;		
        BALE                                      : IN  std_logic;		
        NCS                                       : IN  std_logic;		
        NINTR                                     : OUT std_logic;		
        SYSCLK                                    : IN  std_logic;		
        IOCHRDY                                   : OUT std_logic;		
        NIOCS16                                   : OUT std_logic;		
        NIORC                                     : IN  std_logic;		
        NIOWC                                     : IN  std_logic;		
        NMEMR                                     : IN  std_logic;		
        NMEMW                                     : IN  std_logic;		
        NMEMCS16                                  : OUT std_logic;		
        NZEROWS                                   : OUT std_logic;		
        NEIRQ3                                    : OUT std_logic;		
        NEIRQ4                                    : OUT std_logic;		
        NEIRQ5                                    : OUT std_logic;		
        NEIRQ7                                    : OUT std_logic;		
        NEIRQ9                                    : OUT std_logic;		
        NEIRQ10                                   : OUT std_logic;		
        NEIRQ11                                   : OUT std_logic;		
        NEIRQ12                                   : OUT std_logic;		
        NEIRQ14                                   : OUT std_logic;		
        NEIRQ15                                   : OUT std_logic;		
        IRQ3                                      : OUT std_logic;		
        IRQ4                                      : OUT std_logic;		
        IRQ5                                      : OUT std_logic;		
        IRQ7                                      : OUT std_logic;		
        IRQ9                                      : OUT std_logic;		
        IRQ10                                     : OUT std_logic;		
        IRQ11                                     : OUT std_logic;		
        IRQ12                                     : OUT std_logic;		
        IRQ14                                     : OUT std_logic;		
        IRQ15                                     : OUT std_logic;		
        PWRGOOD                                   : IN  std_logic;		
        RESETDRV                                  : IN  std_logic;		
        NRI_OUT                                   : OUT std_logic;		
        NSPKROUT                                  : OUT std_logic;		
        MODE                                      : IN  std_logic;		
        SEL0                                      : IN  std_logic;		
        SEL1                                      : IN  std_logic;		
        A_BVD1                                    : IN  std_logic;		
        A_BVD2                                    : IN  std_logic;		
        A_CA                                      : OUT std_logic_vector(25 DOWNTO 12);		
        A_NCD1                                    : IN  std_logic;		
        A_NCD2                                    : IN  std_logic;		
        A_NCE1                                    : OUT std_logic;		
        A_NCE2                                    : OUT std_logic;		
        A_NENABLE                                 : OUT std_logic;		
        A_NENIF                                   : OUT std_logic;		
        A_NIORD                                   : OUT std_logic;		
        A_NIOWR                                   : OUT std_logic;		
        A_NOE                                     : OUT std_logic;		
        A_NVCC_EN                                 : OUT std_logic;		
        A_VPP1_EN0                                : OUT std_logic;		
        A_VPP1_EN1                                : OUT std_logic;		
        A_VPP2_EN0                                : OUT std_logic;		
        A_VPP2_EN1                                : OUT std_logic;		
        A_NGPI                                    : IN  std_logic;		
        A_RDY                                     : IN  std_logic;		
        A_NREG                                    : OUT std_logic;		
        A_RESET                                   : OUT std_logic;		
        A_NWAIT                                   : IN  std_logic;		
        A_NWE                                     : OUT std_logic;		
        A_WP                                      : IN  std_logic;		
        B_BVD2                                    : IN  std_logic;		
        B_BVD1                                    : IN  std_logic;		
        B_CA                                      : OUT std_logic_vector(25 DOWNTO 12);		
        B_NCD1                                    : IN  std_logic;		
        B_NCD2                                    : IN  std_logic;		
        B_NCE1                                    : OUT std_logic;		
        B_NCE2                                    : OUT std_logic;		
        B_NENABLE                                 : OUT std_logic;		
        B_NENIF                                   : OUT std_logic;		
        B_NIORD                                   : OUT std_logic;		
        B_NIOWR                                   : OUT std_logic;		
        B_NOE                                     : OUT std_logic;		
        B_NVCC_EN                                 : OUT std_logic;		
        B_VPP1_EN0                                : OUT std_logic;		
        B_VPP1_EN1                                : OUT std_logic;		
        B_VPP2_EN0                                : OUT std_logic;		
        B_VPP2_EN1                                : OUT std_logic;		
        B_NGPI                                    : IN  std_logic;		
        B_RDY                                     : IN  std_logic;		
        B_NREG                                    : OUT std_logic;		
        B_RESET                                   : OUT std_logic;		
        B_NWAIT                                   : IN  std_logic;		
        B_NWE                                     : OUT std_logic;		
        B_WP                                      : IN  std_logic;		
        EXT_DIR                                   : OUT std_logic;		
        CSPWRD                                    : OUT std_logic;		
        NTEST                                     : IN  std_logic		-- Used in scan test

    );
END m82365sl;

--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, m82371ide, is restricted to employees of MGC on     --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (m82371ide v1999.100) was extracted on          --
--workstation hostid 80895eb6 Inventra                                      --
-- M82371IDE Top level
-- M82371IDE
-- Copyright Mentor Graphics Corporation and licensors 1999.
-- V1.000
--
-- This module provides all the timing for the IDE bus including
-- address, data (both read and write) and buffer control.
--FpgaAdvantage Evaluation version - T.DELAYE

library IEEE;
use IEEE.std_logic_1164.all;

ENTITY m82371ide IS

   PORT (
      --
-- PBI interface signals
--
      CLK                     : IN std_logic; -- Master timing
            NCLK                    : IN std_logic; -- Master timing complement of CLK
            NCD                     : IN std_logic; -- Master reset
            DA                      : IN std_logic_vector(31 DOWNTO 0); -- Data in
            DQ                      : OUT std_logic_vector(31 DOWNTO 0); -- Data Out
            NBE                     : IN std_logic_vector(3 DOWNTO 0); -- Byte qualifiers
            A                       : IN std_logic_vector(31 DOWNTO 0); -- Address
            PBIRQ                   : OUT std_logic; -- Primary and secondary interrupts
            SBIRQ                   : OUT std_logic; -- Primary and secondary interrupts
            NIRD                    : IN std_logic; -- Strobes
            NIWR                    : IN std_logic; -- Strobes
            RDY                     : OUT std_logic; -- Cycle wait
            NAVAL                   : OUT std_logic; -- Recognised address
            ABORT                   : OUT std_logic; -- Illegal Address NBE combination
            CFSEL                   : IN std_logic; -- Configuration select
            RETRY                   : OUT std_logic; -- Posted cycle in progress
      --
-- PBI interface master
--
      NMRQ                    : OUT std_logic; -- Master transfer request
            NMGT                    : IN std_logic; -- Master transfer grant
            NMRD                    : OUT std_logic; -- Master transfer direction
            NMWR                    : OUT std_logic; -- Master transfer direction
            MA                      : OUT std_logic_vector(31 DOWNTO 0); -- Address
            NMBE                    : OUT std_logic_vector(3 DOWNTO 0); -- Data Qualifier
            NMRDY                   : IN std_logic; -- Data transfer complete
            MABORT                  : IN std_logic; -- The transfer request was aborted
            MTABORT                 : IN std_logic; -- The trnasfer request was aborted by target
      --
-- IDE interface signals
--
      PIDEO                   : OUT std_logic_vector(15 DOWNTO 0); -- Data out
            PIDEI                   : IN std_logic_vector(15 DOWNTO 0); -- Data in
            NPIDEEN                 : OUT std_logic; -- Data buffer control (Bidirect)
            NPDIR                   : OUT std_logic; -- Exteranl Data buffer direction control 1 = Out, 0 = In
            PADD                    : OUT std_logic_vector(2 DOWNTO 0); -- Address
            NPCS0                   : OUT std_logic; -- Primary selects
            NPCS1                   : OUT std_logic; -- Secondary selects
            NPIOR                   : OUT std_logic; -- Strobes
            NPIOW                   : OUT std_logic; -- Strobes
            PIORDY                  : IN std_logic; -- Cycle wait = 0 ready = 1
            PDREQ                   : IN std_logic; -- DMA Request
            NPDACK                  : OUT std_logic; -- DMA Acknowledge
            PIRQ                    : IN std_logic; -- Interrupts
      --
-- IDE interface signals
--
      SIDEO                   : OUT std_logic_vector(15 DOWNTO 0); -- Data out
            SIDEI                   : IN std_logic_vector(15 DOWNTO 0); -- Data in
            NSIDEEN                 : OUT std_logic; -- Data buffer control (Bidirect)
            NSDIR                   : OUT std_logic; -- Exteranl Data buffer direction control 1 = Out, 0 = In
            SADD                    : OUT std_logic_vector(2 DOWNTO 0); -- Address
            NSCS0                   : OUT std_logic; -- Primary selects
            NSCS1                   : OUT std_logic; -- Secondary selects
            NSIOR                   : OUT std_logic; -- Strobes
            NSIOW                   : OUT std_logic; -- Strobes
            SIORDY                  : IN std_logic; -- Cycle wait = 0 ready = 1
            SDREQ                   : IN std_logic; -- DMA Request
            NSDACK                  : OUT std_logic; -- DMA Acknowledge
            SIRQ                    : IN std_logic); -- Interrupts
END m82371ide;
     	

library IEEE;
use IEEE.std_logic_1164.all;
library WORK;
use WORK.all;

-- ------------------------------


entity m8251a is
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1998.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--These deliverables may be used for the purpose of making silicon for one  --
--IC design only.  No further use of these deliverables for the purpose of  --
--making silicon from an IC design is permitted without the payment of an   --
--additional license fee.  See your license agreement with Mentor Graphics  --
--for further details.  If you have further questions please contact        --
--Mentor Graphics Customer Support.                                         --
--                                                                          --
--This Mentor Graphics core (m8251a v1998.060) was extracted on             --
--workstation hostid 80895eb6 Inventra                                      --
-- top level of m8251a
port (
  clk,                    -- system clock
  txc,                    -- transmitter clock
  rxc,                    -- receiver clock
  reset,                  -- asynchronous reset

  ncs,                    -- not chip select
  nwr,                    -- not write
  nrd,                    -- not read
  cnd,                    -- command not data
  ncts,                   -- not clear to send
  ndsr,                   -- not data set ready
  sbdet_in,               -- sync/break detect in
  rxd,                    -- serial data in
  test_mode:              -- blanks out internal reset for test purpose
  in std_logic;

  d_in:                   -- parallel data in
  in std_logic_vector (7 downto 0);

  rxrdy,                  -- receiver ready (character received)
  txrdy,                  -- transmitter ready 
  txe,                    -- transmitter empty
  ndtr,                   -- not data terminal ready
  nrts,                   -- not ready to send
  sbdet_out,              -- sync/break detect out
  dac,                    -- direction control for parallel data (0: out; 1: in)
  sbdetc,                 -- direction control for sync/break detect (    "    )
  txd:                    -- serial data out
  out std_logic;

  d_out:                  -- parallel data out
  out std_logic_vector (7 downto 0));
-- top level of m8251a
end m8251a;

--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--Mentor Graphics must receive a completed copy of the License Fee &        --
--Royalty Fee form for each use of the core where the design goes to mask.  --
--                                                                          --
--A fee is payable for all IC designs involving these deliverables at the   --
--time of production.  See your license agreement with Mentor Graphics for  --
--further details.  If you have further questions please contact Mentor     --
--Graphics Customer Support.                                                --
--                                                                          --
--This Mentor Graphics core (m8254 v1998.060) was extracted on              --
--workstation hostid 80a4ee5e Inventra                                      --
-- M8254 Programmable Interval Timer MegaMacro(R) Design
-- Copyright Mentor Graphics Corporation and Licensors 1998

-- File:             m8254.vhd
-- Created on:       2. September 1997
-- Last revised on:  6. June 1998

-- FpgaAdvantage evaluation version


-- ------------------------------ 
library IEEE;
use IEEE.std_logic_1164.all;
library WORK;
use WORK.all;


entity m8254 is
  port (
    ID:                                  -- input data bus
    in std_logic_vector (7 downto 0);
    TMODE,                               -- Test mode select
    CLK0,                                -- counter 0 clock
    DELA0,                               -- Counter 0 advanced clock input
    DELB0,                               -- Counter 0 delayed clock input
    DELSEL0,                             -- Counter 0 delay line select
    GATE0,                               -- counter 0 gate
    TRIG0,                               -- tie to gate 0
    CLK1,                                -- counter 1 clock
    DELA1,                               -- Counter 1 advanced clock input
    DELB1,                               -- Counter 1 delayed clock input
    DELSEL1,                             -- Counter 1 delay line select
    GATE1,                               -- counter 1 gate
    TRIG1,                               -- tie to gate 1
    CLK2,                                -- counter 2 clock
    DELA2,                               -- Counter 2 advanced clock input
    DELB2,                               -- Counter 2 delayed clock input
    DELSEL2,                             -- Counter 2 delay line select
    GATE2,                               -- counter 2 gate
    TRIG2,                               -- tie to gate 2
    NCLR,                                -- reset input
    A0,                                  -- address bit 0
    A1,                                  -- address bit 1
    NCS,                                 -- chip select, active low
    NWR,                                 -- write strobe, active low
    NRD,                                 -- read strobe, active low
    NOE:                                 -- output enable (tie to NRD)
    in std_logic;
    DAO:                                 -- output data bus
    out std_logic_vector (7 downto 0);
    NOD,                                 -- output buffer control pin
    OUT0,                                -- counter 0 output
    OUT1,                                -- counter 1 output
    OUT2:                                -- counter 2 output
    out std_logic);
end m8254;

--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--Use of these deliverables for the purpose of making silicon from an IC    --
--design is limited to the terms and conditions of your license agreement   --
--with Mentor Graphics If you have further questions please contact Mentor  --
--Graphics Customer Support.                                                --
--                                                                          --
--This Mentor Graphics core (m8255 v1998.070) was extracted on              --
--workstation hostid 80895eb6 Inventra                                      --
-- M8255 Programmable Peripheral Interface
-- Copyright Mentor Graphics Corporation and Licensors 1997.
-- V1.0

-- Revision history
-- V1.0   - 9 October 1997. M8255 Release V5.000.
--          Initial RTL version.

LIBRARY    ieee;

USE    ieee.std_logic_1164.all;

entity m8255 is

  port (
    RESET    : IN std_logic;
    NCS      : IN std_logic;
    NRD      : IN std_logic;
    NWR      : IN std_logic;
    A1       : IN std_logic;
    A0       : IN std_logic;
    DI       : IN std_logic_vector(7 downto 0);
    PAI      : IN std_logic_vector(7 downto 0);
    PBI      : IN std_logic_vector(7 downto 0);
    PCI      : IN std_logic_vector(7 downto 0);
    OD       : OUT std_logic_vector(7 downto 0);
    PAO      : OUT std_logic_vector(7 downto 0);
    PBO      : OUT std_logic_vector(7 downto 0);
    PCO      : OUT std_logic_vector(7 downto 0);
    NDEN     : OUT std_logic;
    NPAE     : OUT std_logic;
    NPBE     : OUT std_logic;
    NPCE1    : OUT std_logic;
    NPCE2    : OUT std_logic;
    NPCE3    : OUT std_logic;
    NPCE4    : OUT std_logic;
    NPCE5    : OUT std_logic;
    NPCE6    : OUT std_logic;
    NPCE7    : OUT std_logic
    );
end m8255;

library    ieee;

use    ieee.std_logic_1164.all;

entity mi2c is
--*******************************************************************       --
--IMPORTANT NOTICE                                                          --
--================                                                          --
--Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  --
--This file and associated deliverables are the trade secrets,              --
--confidential information and copyrighted works of Mentor Graphics         --
--Corporation and its licensors and are subject to your license agreement   --
--with Mentor Graphics Corporation.                                         --
--                                                                          --
--The use of this core, mi2c, is restricted to employees of MGC on          --
--equipment owned by MGC for the purposes of demonstrations and trade       --
--shows or to develop tools in conjunction with Inventra.  The use of this  --
--core is granted until the license key used to extract it on workstation   --
--hostid 80895eb6 expires, at which time all copies must be deleted.        --
--Ownership of the core is retained by MGC.  Warning - this core is not     --
--warranted to be complete or fully functional.                             --
--                                                                          --
--This Mentor Graphics core (mi2c v1999.100) was extracted on               --
--workstation hostid 80895eb6 Inventra                                      --
  port (
    CLK, NRST                             : in std_logic;
    A                                     : in std_logic_vector (2 downto 0);
    DI                                    : in std_logic_vector (7 downto 0);
    WR, SEL, ISCL, ISDA                   : in std_logic;
    DA                                    : out std_logic_vector (7 downto 0);
    NOE, INTR, OSCL, OSDA                 : out std_logic
    );
end mi2c;

