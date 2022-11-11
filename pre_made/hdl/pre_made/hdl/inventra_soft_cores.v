//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Mentor Graphics must receive a completed copy of the License Fee &        //
//Royalty Fee form for each use of the core where the design goes to mask.  //
//                                                                          //
//A fee is payable for all IC designs involving these deliverables at the   //
//time of production.  See your license agreement with Mentor Graphics for  //
//further details.  If you have further questions please contact Mentor     //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (m85c30 v2000.020) was extracted on             //
//workstation hostid 80a4ee5e Inventra                                      //
// M85C30 SCC
// Copyright Mentor Graphics Corporation and Licensors 2000
// V2.500

//////////////////////////////////////////////////////////////////////////////////////////////
//
// Verilog Top Level for m85c30 SCC. 
//
//************************************************************************
//
//  %W%  %G%   SCCS Version Control
//
// m85c30.v Verilog file
//
// Created 11/10/96
//
// Description of code.
//
// Verilog Top Level for m85c30 SCC.
//
// (C)Copyright Mentor Graphics Corporation and Licensors (1996 - 2000)
//
// V0.000   (11/10/96)
// V0.001   25/2/98
// V2.200   (8/6/98)
// V2.300   (6/8/98)
// V2.400   (5/8/99)
// V2.500   (17/1/00)
//
// Revision history
//
// V0.001 Add tx clock test output for testbench ECN01078
//        Add new clk input nclk ECN01109
// V2.200 Release version
// V2.300 6th August 1998
//        Intermittent character loss in async mode bug fixed.
//        Start bit detection improved.
//        Receiver susceptiility to noise on rxda/b improved (async mode).
//        Receiver state machine bug fixed. Caused receiver to lock up
//        when in async mode if baud rate of input data changed.
// V2.400 5th August 1999
//        Framing errors in async mode due to missing sclk_en_neg pulse from
//        module 038 fixed. Modification to module 038 now guarantees that 
//        sclk_en_neg pulse will not be missed out when the rx data start
//        bit is detected before the sclk_en_neg pulse has been produced
//        by the clock divider circuit. 
// V2.500 17th January 2000
//        Modifications to m3s001ae and m3s002ae to ensure correct handling
//        of interrupt acknowledge cycles in multiple device applications
//************************************************************************
//
// Hierarchy record                        : m85c30
// This module is called by                : None
//
// 
// This module calls the following modules :
//
//     m3s001ae.vhd - CPU Interface
//     m3s002ae.vhd - Interrupt Controller
//     m3s003ae.vhd - Data Multiplexer
//     m3s004ae.vhd - Serial Controller
//
//************************************************************************

module m85c30 (clk, nclk, ncs, dnc, anb, nwr, nrd, ninta, iei, nrst,
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Mentor Graphics must receive a completed copy of the License Fee &        //
//Royalty Fee form for each use of the core where the design goes to mask.  //
//                                                                          //
//A fee is payable for all IC designs involving these deliverables at the   //
//time of production.  See your license agreement with Mentor Graphics for  //
//further details.  If you have further questions please contact Mentor     //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (m85c30 v2000.020) was extracted on             //
//workstation hostid 80a4ee5e Inventra                                      //
   scan_test_enable, nsyai, trcai, rtca, rda, ncda, nctsa, nsybi,
   trcbi, rtcb, rdb, ncdb, nctsb, di, nrdqa, wnrae, nsyao, nsyae,
   trcao, ntcae, tda, ndtra, nrtsa, tx_clk_test_a, ndoe, nint, ieo,
   nrdqb, wnrbe, nsybo, nsybe, trcbo, ntcbe, tdb, ndtrb, nrtsb,
   tx_clk_test_b, da);

  input clk;
  input nclk;
  input ncs;
  input dnc;
  input anb;
  input nwr;
  input nrd;
  input ninta;
  input iei;
  input nrst;
  input scan_test_enable;
  input nsyai;
  input trcai;
  input rtca;
  input rda;
  input ncda;
  input nctsa;
  input nsybi;
  input trcbi;
  input rtcb;
  input rdb;
  input ncdb;
  input nctsb;
  input[7:0] di;
  output nrdqa;
  output wnrae;
  output nsyao;
  output nsyae;
  output trcao;
  output ntcae;
  output tda;
  output ndtra;
  output nrtsa;
  output tx_clk_test_a;
  output ndoe;
  output nint;
  output ieo;
  output nrdqb;
  output wnrbe;
  output nsybo;
  output nsybe;
  output trcbo;
  output ntcbe;
  output tdb;
  output ndtrb;
  output nrtsb;
  output tx_clk_test_b;
  output[7:0] da;

endmodule

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, mpci, is restricted to employees of MGC on          //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (mpci v1999.050) was extracted on               //
//workstation hostid 80895eb6 Inventra                                      //
// PCI Core Top level
// RCS Version Control
// 2000/05/24 15:22:53
//
//
// File history
// Revision 1.3  2000/05/24 15:22:53  
// Updated versions
//
// Revision 1.15  1999/05/27 16:25:59  _
// cleaned up comments, added timescale directives to avoid simulator warnings
//
// Revision 1.14  1999/05/07 10:28:40  
// brought input latch clock out to aid scan test
//
// Revision 1.13  1999/04/14 16:05:38  
// made parameters consistent with VHDL version
//
// Revision 1.12  1999/04/12 15:16:57  
// removed io pads, now separated to higher level io ring mpci_io.v
//
// Revision 1.11  1999/03/29 15:56:18  
// fixed width of fifo datacount output, full flag decode corrected
//
// Revision 1.10  1999/03/29 10:25:08  
// added scan test enable input to disable transparent latches during scan
//
// Revision 1.9  1999/03/29 09:12:24  
// added registered and direct data outputs from master rx fifo
//
// Revision 1.8  1999/03/24 17:28:51  
// added input to disable auto flushing of fifos for when dma module used
//
// Revision 1.7  1999/02/26 15:14:21  
// removed clock buffering - now done external to core
//
// Revision 1.6  1999/02/26 11:28:18  
// pme_chg changed to pme_ack.
// added master fifo datacount outputs and flush inputs for dma module.
// emoved references to old dma module, also removed old rom interface
//
// Revision 1.5  1999/02/08 12:31:54  
// equalised delta delays on clocks for rtl simulation
//
// Revision 1.4  1999/01/18 11:03:12  
// Changed PMI I/O signals.
// Added pmi_dsi parameter to allow user to change whether the power
// management interface reports that device specific initialisation is
// required or not.
// Master cmd is now 4 bits, wordcount is now 32 bits.
// Added master_force_term input to force end of master transaction.
//
// Revision 1.3  1999/01/12 16:40:13  
// added discard data timer error output flag to all target fifo chans
// added prefetchable parameter for memory targets
// added force abort and force retry inputs + tar_op_in_prog output
//
// Revision 1.2  1999/01/06 11:11:25  
// changed int_a_n to int_a in instantiation of pci_core
//
// Revision 1.1  1998/12/09 17:51:19  
// Initial revision
//
//
//`timescale 1ps/1ps

module mpci (
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, mpci, is restricted to employees of MGC on          //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (mpci v1999.050) was extracted on               //
//workstation hostid 80895eb6 Inventra                                      //
  // Standard PCI signals
  ad_in,
  ad_out,
  ad_en,
  cbe_in,
  cbe_out,
  cbe_en,
  par_in,
  par_out,
  par_en,
  frame_n_in,
  frame_n_out,
  frame_n_en,
  irdy_n_in,
  irdy_n_out,
  irdy_n_en,
  trdy_n_in,
  trdy_n_out,
  trdy_n_en,
  stop_n_in,
  stop_n_out,
  stop_n_en,
  perr_n_in,
  perr_n_out,
  perr_n_en,
  serr_n_in,
  serr_n_en,
  devsel_n_in,
  devsel_n_out,
  devsel_n_en,
  idsel_in,
  lock_n_in,
  f_clock,
  s_clock,
  lat_clock,
  reset_n,

  // Only need these if master present
  gnt_n_in,
  req_n_out,

  /*
  // Only need these if 64 bit PCI implemented
  par64_in,
  par64_out,
  par64_en,
  ad64_en,
  cbe64_en,
  req64_n_in,
  req64_n_out,
  req64_n_en,
  ack64_n_in,
  ack64_n_out,
  ack64_n_en,
  */

  // Target 0 register file interface
  target0_address,
  target0_data_in,
  target0_cbe_in,
  target0_write,
  target0_req,
  target0_ram_dout,

  target0_data_out,
  target0_gnt,
  target0_ram_din,
  target0_reg_addr,
  target0_write_en,

  /*
  // Target 0 fifo interface
  target0_del_rds ,
  target0_data_in ,
  target0_write,
  target0_read,
  target0_ack,
  target0_flush_tx,
  target0_flush_rx,

  target0_new_cmd ,
  target0_pci_addr,
  target0_pci_cmd,
  target0_data_out,
  target0_cbe_out,
  target0_tx_fifo_full,
  target0_tx_fifo_af,
  target0_tx_space_mark,
  target0_rx_fifo_empty,
  target0_rx_fifo_ae,
  target0_rx_data_mark,
  target0_discard_err,
  */

  // Target 1 fifo interface
  target1_del_rds ,
  target1_data_in ,
  target1_write,
  target1_read,
  target1_ack,
  target1_flush_tx,
  target1_flush_rx,

  target1_new_cmd ,
  target1_pci_addr,
  target1_pci_cmd,
  target1_data_out,
  target1_cbe_out,
  target1_tx_fifo_full,
  target1_tx_fifo_af,
  target1_tx_space_mark,
  target1_rx_fifo_empty,
  target1_rx_fifo_ae,
  target1_rx_data_mark,
  target1_discard_err,

  /*
  // Target 2 fifo interface
  target2_del_rds ,
  target2_data_in ,
  target2_write,
  target2_read,
  target2_ack,
  target2_flush_tx,
  target2_flush_rx,

  target2_new_cmd ,
  target2_pci_addr,
  target2_pci_cmd,
  target2_data_out,
  target2_cbe_out,
  target2_tx_fifo_full,
  target2_tx_fifo_af,
  target2_tx_space_mark,
  target2_rx_fifo_empty,
  target2_rx_fifo_ae,
  target2_rx_data_mark,
  target2_discard_err,
  */

  /*
  // Target 3 fifo interface
  target3_del_rds ,
  target3_data_in ,
  target3_write,
  target3_read,
  target3_ack,
  target3_flush_tx,
  target3_flush_rx,

  target3_new_cmd ,
  target3_pci_addr,
  target3_pci_cmd,
  target3_data_out,
  target3_cbe_out,
  target3_tx_fifo_full,
  target3_tx_fifo_af,
  target3_tx_space_mark,
  target3_rx_fifo_empty,
  target3_rx_fifo_ae,
  target3_rx_data_mark,
  target3_discard_err,
  */

  /*
  // Target 4 fifo interface
  target4_del_rds ,
  target4_data_in ,
  target4_write,
  target4_read,
  target4_ack,
  target4_flush_tx,
  target4_flush_rx,

  target4_new_cmd ,
  target4_pci_addr,
  target4_pci_cmd,
  target4_data_out,
  target4_cbe_out,
  target4_tx_fifo_full,
  target4_tx_fifo_af,
  target4_tx_space_mark,
  target4_rx_fifo_empty,
  target4_rx_fifo_ae,
  target4_rx_data_mark,
  target4_discard_err,
  */

  /*
  // Target 5 fifo interface
  target5_del_rds ,
  target5_data_in ,
  target5_write,
  target5_read,
  target5_ack,
  target5_flush_tx,
  target5_flush_rx,

  target5_new_cmd ,
  target5_pci_addr,
  target5_pci_cmd,
  target5_data_out,
  target5_cbe_out,
  target5_tx_fifo_full,
  target5_tx_fifo_af,
  target5_tx_space_mark,
  target5_rx_fifo_empty,
  target5_rx_fifo_ae,
  target5_rx_data_mark,
  target5_discard_err,
  */

  
  // Master interface without DMA
  master_request ,
  master_pci_cmd ,
  master_address ,
  master_word_count ,
  master_receive_be ,
  mas_tx_data_in,
  mas_tx_be_in,
  mas_tx_fifo_wr,
  mas_rx_fifo_rd,
  mas_tx_fifo_flush ,
  mas_rx_fifo_flush ,
  dma_tx_fifo_flush ,
  dma_rx_fifo_flush ,
  master_force_term ,
  master_dis_auto_flush ,

  master_started ,
  master_complete ,
  mas_rx_data_out_reg,
  mas_rx_data_out_dir,
  mas_rx_fifo_empty,
  mas_rx_fifo_ae,
  mas_rx_fifo_data,
  mas_tx_fifo_full,
  mas_tx_fifo_af,
  mas_tx_fifo_space,
  mas_rx_fifo_datacount,
  mas_tx_fifo_datacount,
  master_det_perr ,
  master_det_serr ,
  master_mas_abort ,
  master_tar_abort ,
  master_retry_err ,
  master_trdy_err ,
  
  // e2prom interface
  sdo,
  sdi,
  sclk,
  scs,

  // Only need these if interrupts supported
  int_req,
  int_en,
  inta_n_en,

  // Only need these if power management implemented
  pme_req,
  pme_ack,
  pme_en,
  pwr_state,
  pwr_state_rst,
  pme_n_en,
  m66en_in,

  // misc backend signals
  scan_test_enable,
  b_clock,
  b_rst_n,
  force_retry,
  force_abort,
  tar_op_in_prog
);


  // ----------------------   PARAMETERS   -------------------------

  parameter pci_dat_width      = 32;
  parameter pci_cbe_width      = 4;
  parameter master_is_64bits   = 1'b0;
  parameter capable_66mhz      = 1'b0;
  parameter def_vendorID       = 16'hffff;
  parameter def_deviceID       = 16'hffff;
  parameter def_revID          = 8'h00;
  parameter def_classCode      = 24'hff_0000;
  parameter def_subvenID       = 16'h0000;
  parameter def_subsysID       = 16'h0000;

  parameter master_exist       = 1'b1;
  parameter bar0_exist         = 1'b1;
  parameter bar1_exist         = 1'b1;
  parameter bar2_exist         = 1'b0;
  parameter bar3_exist         = 1'b0;
  parameter bar4_exist         = 1'b0;
  parameter bar5_exist         = 1'b0;

  parameter pwrman_exist       = 1'b1;
  parameter pme_assert_cap     = 4'b0110;
  parameter pme_state_cap      = 2'b11;
  parameter pmi_dsi            = 1'b0;

  parameter bios_exist         = 1'b1;
  parameter rom_addr_width     = 16;

  parameter m_fifo_depth       = 16;
  parameter m_fram_addr_range  = 4;
  parameter m_space_mark       = 4;
  parameter m_data_mark        = 12;

  parameter t0_bar_config_addr = 8'h10;
  parameter t0_io_mem_n        = 1'b1;
  parameter t0_bar_addr_range  = 16;
  parameter t0_below1mb        = 1'b0;
  parameter t0_prefetchable    = 1'b0;

  parameter t0_ram_depth       = 16;
  parameter t0_ram_addr_range  = 4;
  parameter irq_supported      = 1'b1;

  parameter t0_dat_width       = 32;
  parameter t0_cbe_width       = 4;
  parameter t0_fifo_depth      = 16;
  parameter t0_fram_addr_range = 4;
  parameter t0_space_mark      = 4;
  parameter t0_data_mark       = 12;
  parameter t0_d64_capable     = 1'b0;

  parameter t1_bar_config_addr = 8'h14;
  parameter t1_io_mem_n        = 1'b0;
  parameter t1_bar_addr_range  = 16;
  parameter t1_below1mb        = 1'b0;
  parameter t1_prefetchable    = 1'b1;
  parameter t1_dat_width       = 32;
  parameter t1_cbe_width       = 4;
  parameter t1_fifo_depth      = 16;
  parameter t1_fram_addr_range = 4;
  parameter t1_space_mark      = 4;
  parameter t1_data_mark       = 12;
  parameter t1_d64_capable     = 1'b0;

  parameter t2_bar_config_addr = 8'h18;
  parameter t2_io_mem_n        = 1'b0;
  parameter t2_bar_addr_range  = 16;
  parameter t2_below1mb        = 1'b0;
  parameter t2_prefetchable    = 1'b0;
  parameter t2_dat_width       = 32;
  parameter t2_cbe_width       = 4;
  parameter t2_fifo_depth      = 16;
  parameter t2_fram_addr_range = 4;
  parameter t2_space_mark      = 4;
  parameter t2_data_mark       = 12;
  parameter t2_d64_capable     = 1'b0;

  parameter t3_bar_config_addr = 8'h1C;
  parameter t3_io_mem_n        = 1'b0;
  parameter t3_bar_addr_range  = 16;
  parameter t3_below1mb        = 1'b0;
  parameter t3_prefetchable    = 1'b0;
  parameter t3_dat_width       = 32;
  parameter t3_cbe_width       = 4;
  parameter t3_fifo_depth      = 16;
  parameter t3_fram_addr_range = 4;
  parameter t3_space_mark      = 4;
  parameter t3_data_mark       = 12;
  parameter t3_d64_capable     = 1'b0;

  parameter t4_bar_config_addr = 8'h20;
  parameter t4_io_mem_n        = 1'b0;
  parameter t4_bar_addr_range  = 16;
  parameter t4_below1mb        = 1'b0;
  parameter t4_prefetchable    = 1'b0;
  parameter t4_dat_width       = 32;
  parameter t4_cbe_width       = 4;
  parameter t4_fifo_depth      = 16;
  parameter t4_fram_addr_range = 4;
  parameter t4_space_mark      = 4;
  parameter t4_data_mark       = 12;
  parameter t4_d64_capable     = 1'b0;

  parameter t5_bar_config_addr = 8'h24;
  parameter t5_io_mem_n        = 1'b0;
  parameter t5_bar_addr_range  = 16;
  parameter t5_below1mb        = 1'b0;
  parameter t5_prefetchable    = 1'b0;
  parameter t5_dat_width       = 32;
  parameter t5_cbe_width       = 4;
  parameter t5_fifo_depth      = 16;
  parameter t5_fram_addr_range = 4;
  parameter t5_space_mark      = 4;
  parameter t5_data_mark       = 12;
  parameter t5_d64_capable     = 1'b0;

// Standard PCI signals
input       [pci_dat_width-1:0]  ad_in ;
output      [pci_dat_width-1:0]  ad_out ;
output                    [3:0]  ad_en ;
input       [pci_cbe_width-1:0]  cbe_in ;
output      [pci_cbe_width-1:0]  cbe_out ;
output                           cbe_en ;
input                            par_in ;
output                           par_out ;
output                           par_en ;
input                            frame_n_in ;
output                           frame_n_out ;
output                           frame_n_en ;
input                            irdy_n_in ;
output                           irdy_n_out ;
output                           irdy_n_en ;
input                            trdy_n_in ;
output                           trdy_n_out ;
output                           trdy_n_en ;
input                            stop_n_in ;
output                           stop_n_out ;
output                           stop_n_en ;
input                            perr_n_in ;
output                           perr_n_out ;
output                           perr_n_en ;
input                            serr_n_in ;
output                           serr_n_en ;
input                            devsel_n_in ;
output                           devsel_n_out ;
output                           devsel_n_en ;
input                            idsel_in ;
input                            lock_n_in ;
input                            f_clock;
input                            s_clock;
input                            lat_clock;
input                            reset_n;

// Only need these if master present
input                            gnt_n_in ;
output                           req_n_out;

/*
// Only need these if 64 bit PCI implemented
input                            par64_in;
output                           par64_out;
output                           par64_en;
output                    [3:0]  ad64_en;
output                           cbe64_en;
input                            req64_n_in;
output                           req64_n_out;
output                           req64_n_en;
input                            ack64_n_in;
output                           ack64_n_out;
output                           ack64_n_en;
*/

// Target 0 register file interface
input     [t0_ram_addr_range-1:0] target0_address;
input                      [31:0] target0_data_in;
input                       [3:0] target0_cbe_in;
input                             target0_write;
input                             target0_req;
input                      [31:0] target0_ram_dout;

output                     [31:0] target0_data_out;
output                            target0_gnt;
output                     [31:0] target0_ram_din;
output    [t0_ram_addr_range-1:0] target0_reg_addr;
output                      [3:0] target0_write_en;

/*
// Target 0 fifo interface
input                             target0_del_rds;
input         [t0_dat_width-1:0]  target0_data_in;
input                             target0_write;
input                             target0_read;
input                             target0_ack;
input                             target0_flush_tx;
input                             target0_flush_rx;

output                            target0_new_cmd ;
output                    [31:0]  target0_pci_addr;
output                     [3:0]  target0_pci_cmd;
output        [t0_dat_width-1:0]  target0_data_out;
output        [t0_cbe_width-1:0]  target0_cbe_out;
output                            target0_tx_fifo_full;
output                            target0_tx_fifo_af;
output                            target0_tx_space_mark;
output                            target0_rx_fifo_empty;
output                            target0_rx_fifo_ae;
output                            target0_rx_data_mark;
output                            target0_discard_err;
*/

// Target 1 fifo interface
input                             target1_del_rds;
input         [t1_dat_width-1:0]  target1_data_in;
input                             target1_write;
input                             target1_read;
input                             target1_ack;
input                             target1_flush_tx;
input                             target1_flush_rx;

output                            target1_new_cmd ;
output                    [31:0]  target1_pci_addr;
output                     [3:0]  target1_pci_cmd;
output        [t1_dat_width-1:0]  target1_data_out;
output        [t1_cbe_width-1:0]  target1_cbe_out;
output                            target1_tx_fifo_full;
output                            target1_tx_fifo_af;
output                            target1_tx_space_mark;
output                            target1_rx_fifo_empty;
output                            target1_rx_fifo_ae;
output                            target1_rx_data_mark;
output                            target1_discard_err;

/*
// Target 2 fifo interface
input                             target2_del_rds;
input         [t2_dat_width-1:0]  target2_data_in;
input                             target2_write;
input                             target2_read;
input                             target2_ack;
input                             target2_flush_tx;
input                             target2_flush_rx;

output                            target2_new_cmd ;
output                    [31:0]  target2_pci_addr;
output                     [3:0]  target2_pci_cmd;
output        [t2_dat_width-1:0]  target2_data_out;
output        [t2_cbe_width-1:0]  target2_cbe_out;
output                            target2_tx_fifo_full;
output                            target2_tx_fifo_af;
output                            target2_tx_space_mark;
output                            target2_rx_fifo_empty;
output                            target2_rx_fifo_ae;
output                            target2_rx_data_mark;
output                            target2_discard_err;
*/

/*
// Target 3 fifo interface
input                             target3_del_rds;
input         [t3_dat_width-1:0]  target3_data_in;
input                             target3_write;
input                             target3_read;
input                             target3_ack;
input                             target3_flush_tx;
input                             target3_flush_rx;

output                            target3_new_cmd ;
output                    [31:0]  target3_pci_addr;
output                     [3:0]  target3_pci_cmd;
output        [t3_dat_width-1:0]  target3_data_out;
output        [t3_cbe_width-1:0]  target3_cbe_out;
output                            target3_tx_fifo_full;
output                            target3_tx_fifo_af;
output                            target3_tx_space_mark;
output                            target3_rx_fifo_empty;
output                            target3_rx_fifo_ae;
output                            target3_rx_data_mark;
output                            target3_discard_err;
*/

/*
// Target 4 fifo interface
input                             target4_del_rds;
input         [t4_dat_width-1:0]  target4_data_in;
input                             target4_write;
input                             target4_read;
input                             target4_ack;
input                             target4_flush_tx;
input                             target4_flush_rx;

output                            target4_new_cmd ;
output                    [31:0]  target4_pci_addr;
output                     [3:0]  target4_pci_cmd;
output        [t4_dat_width-1:0]  target4_data_out;
output        [t4_cbe_width-1:0]  target4_cbe_out;
output                            target4_tx_fifo_full;
output                            target4_tx_fifo_af;
output                            target4_tx_space_mark;
output                            target4_rx_fifo_empty;
output                            target4_rx_fifo_ae;
output                            target4_rx_data_mark;
output                            target4_discard_err;
*/

/*
// Target 5 fifo interface
input                             target5_del_rds;
input         [t5_dat_width-1:0]  target5_data_in;
input                             target5_write;
input                             target5_read;
input                             target5_ack;
input                             target5_flush_tx;
input                             target5_flush_rx;

output                            target5_new_cmd ;
output                    [31:0]  target5_pci_addr;
output                     [3:0]  target5_pci_cmd;
output        [t5_dat_width-1:0]  target5_data_out;
output        [t5_cbe_width-1:0]  target5_cbe_out;
output                            target5_tx_fifo_full;
output                            target5_tx_fifo_af;
output                            target5_tx_space_mark;
output                            target5_rx_fifo_empty;
output                            target5_rx_fifo_ae;
output                            target5_rx_data_mark;
output                            target5_discard_err;
*/


// Master interface without DMA
input                           master_request ;
input                    [3:0]  master_pci_cmd ;
input                   [31:0]  master_address ;
input                   [31:0]  master_word_count ;
input      [pci_cbe_width-1:0]  master_receive_be ;
input      [pci_dat_width-1:0]  mas_tx_data_in;
input      [pci_cbe_width-1:0]  mas_tx_be_in;
input                           mas_tx_fifo_wr;
input                           mas_rx_fifo_rd;
input                           mas_tx_fifo_flush ;
input                           mas_rx_fifo_flush ;
input                           dma_tx_fifo_flush ;
input                           dma_rx_fifo_flush ;
input                           master_force_term;
input                           master_dis_auto_flush;

output                          master_started ;
output                          master_complete ;
output     [pci_dat_width-1:0]  mas_rx_data_out_reg;
output     [pci_dat_width-1:0]  mas_rx_data_out_dir;
output                          mas_rx_fifo_empty;
output                          mas_rx_fifo_ae;
output                          mas_rx_fifo_data;
output                          mas_tx_fifo_full;
output                          mas_tx_fifo_af;
output                          mas_tx_fifo_space;
output [m_fram_addr_range:0]    mas_rx_fifo_datacount;
output [m_fram_addr_range:0]    mas_tx_fifo_datacount;
output                          master_det_perr ;
output                          master_det_serr ;
output                          master_mas_abort ;
output                          master_tar_abort ;
output                          master_retry_err ;
output                          master_trdy_err ;

// e2prom Interface
input                           sdo;
output                          sdi;
output                          sclk;
output                          scs;

// Only need these if interrupts supported
input                   [31:0]  int_req;
input                   [31:0]  int_en;
output                          inta_n_en;

// Only need these if power management implemented
input                           pme_req;
output                          pme_ack;
output                          pme_en;
output                   [1:0]  pwr_state;
output                          pwr_state_rst;
output                          pme_n_en;
input                           m66en_in;

// misc backend signals
input                           scan_test_enable;
input                           b_clock;
output                          b_rst_n;
input                           force_retry;
input                           force_abort;
output                          tar_op_in_prog;

endmodule

//*******************************************************************       //
//NOTICE  	                                                            //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Mentor Graphics must receive a completed copy of the License Fee &        //
//Royalty Fee form for each use of the core where the design goes to mask.  //
//                                                                          //
//A fee is payable for all IC designs involving these deliverables at the   //
//time of production.  See your license agreement with Mentor Graphics for  //
//further details.  If you have further questions please contact Mentor     //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (usbhubcc v1999.010) was extracted on           //
//workstation hostid 80a4ee5e Inventra                                      //
/***
***
*** @(#)usbhubcc.v 1.2 Created 15:00:01 98/06/11
***
***/


/********************************************************
        Module Name:      usbhubcc
        Project:          USB HUB
        Description:      Top level of the hub Core
                          P2-P5 are four downstream ports, DNP1-DNP4
                          P1 is embedded port (EMBP) stub
                          logical port numbers may be different
        Revision History:
********************************************************/
`timescale 1ns/100ps

module usbhubcc (
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Mentor Graphics must receive a completed copy of the License Fee &        //
//Royalty Fee form for each use of the core where the design goes to mask.  //
//                                                                          //
//A fee is payable for all IC designs involving these deliverables at the   //
//time of production.  See your license agreement with Mentor Graphics for  //
//further details.  If you have further questions please contact Mentor     //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (usbhubcc v1999.010) was extracted on           //
//workstation hostid 80a4ee5e Inventra                                      //
     RESETN ,
// CLOCK INPUTS
     CLKIN ,
     USB_CLK_BUF ,      //Clock Buffered outside
     CLK_48M_BUF ,      //Clock Buffered outside
     CLK_12M_BUF ,      //Clock Buffered outside
// reset in
     SYNC_RESET_ ,      //Reset Buffered outside
     RESET_PULSE_,      //Reset Buffered outside
     INT_RESET48_ ,             //Reset Buffered outside
     INT_RESET_ ,       //Reset Buffered outside
// MODE CONTROL
     GANG_PORT ,
     SELF_POWERED ,
     PWR_GOOD ,
// SUSPEND/RESUME
     STOP_CLK,     //stop clock from mcu/external logic
// USB SIGNALS
     RT_RXD ,
     RT_VPIN ,
     RT_VMIN ,

     DNP1_RXD,
     DNP1_VPIN,
     DNP1_VMIN,
     DNP1_PWRSNS,

     DNP2_RXD,
     DNP2_VPIN,
     DNP2_VMIN,
     DNP2_PWRSNS,

     DNP3_RXD,
     DNP3_VPIN,
     DNP3_VMIN,
     DNP3_PWRSNS,

     DNP4_RXD,
     DNP4_VPIN,
     DNP4_VMIN,
     DNP4_PWRSNS,

//
//OUTPUTS
     USB_CLK_out,          //taken outside to get buffered
     CLK_48M_out ,         //taken outside to get buffered
     CLK_12M_out ,         //taken outside to get buffered
// resets
     sync_reset_out_,      //taken outside to get buffered
     reset_pulse_out_,     //taken outside to get buffered
     sys_usb_reset48_,     //taken outside to get buffered
     sys_usb_reset12_,     //taken outside to get buffered
// SUSPEND/RESUME
     SUSPEND,
     
// USB PORT SIGNALS
     RT_VPOUT ,
     RT_VMOUT ,
     RT_OEN ,
     RT_SUSPEND,
     RT_LEDN ,

     DNP1_VPOUT ,
     DNP1_VMOUT ,
     DNP1_OEN ,
     DNP1_SPEED,
     DNP1_SUSPEND,
     DNP1_PWRONN,
     DNP1_LEDN,

     DNP2_VPOUT ,
     DNP2_VMOUT ,
     DNP2_OEN ,
     DNP2_SPEED,
     DNP2_SUSPEND,
     DNP2_PWRONN,
     DNP2_LEDN,

     DNP3_VPOUT ,
     DNP3_VMOUT ,
     DNP3_OEN ,
     DNP3_SPEED,
     DNP3_SUSPEND,
     DNP3_PWRONN,
     DNP3_LEDN,

     DNP4_VPOUT ,
     DNP4_VMOUT ,
     DNP4_OEN ,
     DNP4_SPEED,
     DNP4_SUSPEND,
     DNP4_PWRONN,
     DNP4_LEDN
);
 
input         RESETN ;
input         CLKIN ;
input         USB_CLK_BUF ;
input         CLK_48M_BUF ;
input         CLK_12M_BUF ;

input         SYNC_RESET_ ;
input         RESET_PULSE_ ;
input         INT_RESET48_ ;
input         INT_RESET_ ;

input         GANG_PORT ;
input         SELF_POWERED ;
input         PWR_GOOD ;

input         STOP_CLK;

input         RT_RXD;
input         RT_VPIN;
input         RT_VMIN;

input         DNP1_RXD;
input         DNP1_VPIN;
input         DNP1_VMIN;
input         DNP1_PWRSNS;

input         DNP2_RXD;
input         DNP2_VPIN;
input         DNP2_VMIN;
input         DNP2_PWRSNS;

input         DNP3_RXD;
input         DNP3_VPIN;
input         DNP3_VMIN;
input         DNP3_PWRSNS;

input         DNP4_RXD;
input         DNP4_VPIN;
input         DNP4_VMIN;
input         DNP4_PWRSNS;

// outputs
output        CLK_48M_out ;
output        CLK_12M_out ;
output        USB_CLK_out;

output        sync_reset_out_ ;
output        reset_pulse_out_ ;
output        sys_usb_reset48_ ;
output        sys_usb_reset12_ ;

output        SUSPEND;

output        RT_VPOUT;
output        RT_VMOUT;
output        RT_OEN;
output        RT_SUSPEND;
output        RT_LEDN;

output        DNP1_VPOUT ;
output        DNP1_VMOUT ;
output        DNP1_OEN ;
output        DNP1_SPEED;
output        DNP1_SUSPEND;
output        DNP1_PWRONN;
output        DNP1_LEDN ;

output        DNP2_VPOUT ;
output        DNP2_VMOUT ;
output        DNP2_OEN ;
output        DNP2_SPEED;
output        DNP2_SUSPEND;
output        DNP2_PWRONN;
output        DNP2_LEDN ;

output        DNP3_VPOUT ;
output        DNP3_VMOUT ;
output        DNP3_OEN ;
output        DNP3_SPEED;
output        DNP3_SUSPEND;
output        DNP3_PWRONN;
output        DNP3_LEDN ;

output        DNP4_VPOUT ;
output        DNP4_VMOUT ;
output        DNP4_OEN ;
output        DNP4_SPEED;
output        DNP4_SUSPEND;
output        DNP4_PWRONN;
output        DNP4_LEDN ;


endmodule          // End of usbhubcc

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Use of these deliverables for the purpose of making silicon from an IC    //
//design is limited to the terms and conditions of your license agreement   //
//with Mentor Graphics If you have further questions please contact Mentor  //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (usbfnfs16 v2000.010) was extracted on          //
//workstation hostid 80a4ee5e Inventra                                      //

// Top level of the Function Core
// Copyright Mentor Graphics Corporation and Licensors 1999-2000
//
// V1.100

// This module provides 


// Revision history:
// V1.100 - Reset input to sync_sys_reset now fed from a mux selecting
//          either logic 1 or INT_RESET_ signal in TEST MODE. ECN 01295 
// V1.000 - First release
//`include "header.v" 

module fun_core_top ( 
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Use of these deliverables for the purpose of making silicon from an IC    //
//design is limited to the terms and conditions of your license agreement   //
//with Mentor Graphics If you have further questions please contact Mentor  //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (usbfnfs16 v2000.010) was extracted on          //
//workstation hostid 80a4ee5e Inventra                                      //
    SYS_RESET, 
    CLK_IN    , 
    MC_CLK    , 
    MC_ADDR   , 
    MC_DATA_IN , 
    MC_WRN     , 
    MC_RDN     , 
    MC_CS      , 
    RT_RCV_DATA, 
    RT_VP_IN   , 
    RT_VM_IN    , 
    ep0_ram_data , 
    in_ram_data  , 
    out_ram_data , 
    //aditional inputs which are just buffered version of
    //signals taken out 
    USB_CLK_BUF , 
    CLK_12M_BUF , 
    CLK_24M_BUF , 
    syn_reset_buf , 
    INT_RESET_ , 
    TEST_MODE , 
    //OUTPUTS
    SOF_PULSE, 
    USB_RSTN , 
    MC_INTR , 
    RT_VP_OUT, 
    RT_VM_OUT, 
    RT_TXEN , 
    RT_SUSPEND , 
    ep0_rd_ptr , 
    ep0_wrt_ptr, 
    ep0_fifo_data , 
    ep0_rd_csn , 
    ep0_wrt_csn , 
    ep0_wen , 
    in_rd_ptr , 
    in_wrt_ptr, 
    in_rd_csn , 
    in_wrt_csn, 
    in_wen, 
    out_fifo_data, 
    out_rd_ptr, 
    out_wrt_ptr, 
    out_rd_csn, 
    out_wrt_csn , 
    out_wen , 
    MC_DATA_OUT , 
    //additional signals taken out of core for scan reasons 
    USB_CLK_out , 
    CLK_12M_out,  
    CLK_24M_out , 
    syn_reset , 
    INT_RESET_OUT 
    );
  

input                                SYS_RESET ;
input                                CLK_IN ;
input                                MC_CLK ;
input  [7:0]                         MC_ADDR ;
input  [7:0]                         MC_DATA_IN ;
input                                MC_WRN ;
input                                MC_RDN ;
input                                MC_CS ;
input                                RT_RCV_DATA ;
input                                RT_VP_IN ;
input                                RT_VM_IN ;
input  [7:0]                         ep0_ram_data ;
input  [7:0]                         in_ram_data ;
input  [7:0]                         out_ram_data ;
input                                USB_CLK_BUF ;
input                                CLK_12M_BUF ;
input                                CLK_24M_BUF ;
input                                syn_reset_buf ;
input                                INT_RESET_ ;
input                                TEST_MODE ;
  
output                               SOF_PULSE ;
output                               USB_RSTN ;
output                               MC_INTR ;
output                               RT_VP_OUT ;
output                               RT_VM_OUT ;
output                               RT_TXEN ;
output                               RT_SUSPEND ;
output [`EP0_FIFO_MSB-1 :0]          ep0_rd_ptr;
output [`EP0_FIFO_MSB-1 :0]          ep0_wrt_ptr;
output [7:0]                         ep0_fifo_data;
output                               ep0_rd_csn ;
output                               ep0_wrt_csn ;
output                               ep0_wen ;
output [`IN_RAM_MSB-1 :0]            in_rd_ptr ;
output [`IN_RAM_MSB-1 :0]            in_wrt_ptr ;
output                               in_rd_csn;
output                               in_wrt_csn;
output                               in_wen;
output [7:0]                         out_fifo_data ;
output [`OUT_RAM_MSB-1 :0]           out_rd_ptr ;
output [`OUT_RAM_MSB-1 :0]           out_wrt_ptr ;
output                               out_rd_csn ;
output                               out_wrt_csn ;
output                               out_wen ;
output [7:0]                         MC_DATA_OUT ;
output                               USB_CLK_out ;
output                               CLK_12M_out;
output                               CLK_24M_out ;
output                               syn_reset ;
output                               INT_RESET_OUT ;
 

endmodule 

//------------------------------------------------------------------------
//                                                                      --
//   (C) MENTOR GRAPHICS CORPORATION AND LICENSORS 1997                 --
//                                                                      --
//------------------------------------------------------------------------
//   Product Name :   HDLC-FIFO                                         --
//------------------------------------------------------------------------
//   Product      :   Single Channel HDLC with FIFO                     --
//   Description  :                                                     --
//------------------------------------------------------------------------
//   File         :   Verilog RTL code                                  --
//   Description  :                                                     --
//------------------------------------------------------------------------
//   Version      :   2.6G00                                            --
//------------------------------------------------------------------------
//   Release Date :   21 October 1999                                   --
//------------------------------------------------------------------------
//                                                                      --
//   Notes:  Fixed top level parameters version                         --
//                                                                      --
//   Parameters values are :                                            --
//                  ram_based_fifos = 0;                                --      
 //                  fifo_addr_size = 3;                                --      
 //                  tx_fifo_threshold = 3;                              --
//                  rx_fifo_threshold= 3;                               --
//                  config_crc32= 0;                                    --
//                  tx_addr_insert= 1;                                  --
//                  rx_addr_filter= 1;                                  --
//                  rx_addr_filter_tei_bcast= 0                         --   
//                                                                      --
//------------------------------------------------------------------------
module cf_hdlc_fifo (
    
    rst_i ,
    s_rst_i ,
    clk ,
    loopback ,
    ai ,
    di ,
    rwi ,
    cs_b ,
    ri_b ,
    ig ,
    do ,
    ro_b ,
    ir ,
    fts ,
    ftr ,
    rx_clk ,
    tx_clk ,
    rx_ser ,
    tx_ser ,
    rx_ser_en ,
    tx_ser_en ,
    req_ser ,
    gnt_ser ,
    ram_mcycle ,
    ram_wrn ,
    ram_addr ,
    ram_d ,
    ram_q );
//Commented by T.D for FPGAADVANTAGE    
//`include "cf_hdlc_fifo_pak.inc"
 input  rst_i;
 input  s_rst_i;
 input  clk;
 input[ 3 : 0 ]  ai;
 input[ 7 : 0 ]  di;
 input  rwi;
 input[ 1 : 0 ]  cs_b;
 input  ri_b;
 input[ 1 : 0 ]  ig;
 input  rx_clk;
 input  tx_clk;
 input  rx_ser;
 input  rx_ser_en;
 input  tx_ser_en;
 input  gnt_ser;
 input[ 8 : 0 ]  ram_q;
 output  loopback;
 output[ 7 : 0 ]  do;
 output  ro_b;
 output[ 1 : 0 ]  ir;
 output  fts;
 output  ftr;
 output  tx_ser;
 output  req_ser;
 output  ram_mcycle;
 output  ram_wrn;
 output[ 3 : 0 ]  ram_addr;
 output[ 8 : 0 ]  ram_d;

endmodule

module M8259A ( CAO0, CAO1, CAO2, DAO_0_port, DAO_1_port, DAO_2_port, DAO_3_port 
, DAO_4_port, 
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m8259aeng, is restricted to employees of MGC on     //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m8259aeng v1998.020) was extracted on          //
//workstation hostid 80895eb6 Inventra                                      //
    DAO_5_port, DAO_6_port, DAO_7_port, IRQ, NBUF, NEN, SLAVE, BA0, BDI_0_port, 
BDI_1_port, BDI_2_port, 
    BDI_3_port, BDI_4_port, BDI_5_port, BDI_6_port, BDI_7_port, BNCS, BNRD, BNWR
, CAI0, CAI1, CAI2, 
    IR0, IR1, IR2, IR3, IR4, IR5, IR6, IR7, NINTA, NSP, NTEST );
input  BA0, BDI_0_port, BDI_1_port, BDI_2_port, BDI_3_port, BDI_4_port, BDI_5_port, 
BDI_6_port, BDI_7_port, 
    BNCS, BNRD, BNWR, CAI0, CAI1, CAI2, IR0, IR1, IR2, IR3, IR4, IR5, IR6, IR7, 
    NINTA, NSP, NTEST;
output CAO0, CAO1, CAO2, DAO_0_port, DAO_1_port, DAO_2_port, DAO_3_port, DAO_4_port, 
DAO_5_port, 
    DAO_6_port, DAO_7_port, IRQ, NBUF, NEN, SLAVE;

endmodule

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Use of these deliverables for the purpose of making silicon from an IC    //
//design is limited to the terms and conditions of your license agreement   //
//with Mentor Graphics If you have further questions please contact Mentor  //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (m8255 v1998.070) was extracted on              //
//workstation hostid 80895eb6 Inventra                                      //
// M8255 Programmable Peripheral Interface
// Copyright Mentor Graphics Corporation and Licensors 1997.
// V1.0

// Revision history
// V1.0   - 9 October 1997. M8255 Release V5.000.
//          Initial RTL version.


module m8255 (RESET, NCS, NRD, NWR, A1, A0, DI, PAI, PBI, PCI,
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Use of these deliverables for the purpose of making silicon from an IC    //
//design is limited to the terms and conditions of your license agreement   //
//with Mentor Graphics If you have further questions please contact Mentor  //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (m8255 v1998.070) was extracted on              //
//workstation hostid 80895eb6 Inventra                                      //
    OD, PAO, PBO, PCO,
    NDEN, NPAE, NPBE, NPCE1, NPCE2, NPCE3, NPCE4, NPCE5, NPCE6, NPCE7);

  input        RESET, NCS, NRD, NWR, A1, A0;
  input  [7:0] DI, PAI, PBI, PCI;
  output [7:0] OD, PAO, PBO, PCO;
  output       NDEN, NPAE, NPBE, NPCE1, NPCE2, NPCE3, NPCE4, NPCE5, NPCE6, NPCE7;


endmodule

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Mentor Graphics must receive a completed copy of the License Fee &        //
//Royalty Fee form for each use of the core where the design goes to mask.  //
//                                                                          //
//A fee is payable for all IC designs involving these deliverables at the   //
//time of production.  See your license agreement with Mentor Graphics for  //
//further details.  If you have further questions please contact Mentor     //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (m8254 v1998.060) was extracted on              //
//workstation hostid 80a4ee5e Inventra                                      //
// M8254 Programmable Interval Timer MegaMacro(R) Design
// Copyright Mentor Graphics Corporation and Licensors 1997
// File:             m8254.v
// Created on:       2. September 1997
// Last revised on:  25. November 1997
// Version:          17.020
// Revision history:
//   17.020 Ready for release
//   17.005 Verified against chip using m8254_tb, verify_tb and 71054_tb
//   17.004 Changed test mode scheme to improve scan coverage
//   17.003 Added test mode inputs to disable uncontrollable async resets
//          and force counter output latch to be transparent
//   17.002 Now passes NRD and NWR to counter blocks
//   17.001 Fixed syntax errors
//   17.000 First RTL description
// This file contains the top level for the M8254 MegaMacro.
// See notes at top of m3s003af and m3s007af for information on translation
// from VHDL to verilog. There are some areas which require hand editing.
// ------------------------------
// Hierarchy record:
//   Called by: None
//   Calls to:  m3s001af.v (address decoder)
//              m3s002af.v (output multiplexor)
//              m3s003af.v (counter block)
// ------------------------------ 
// ------------------------------
// entity has 3 extra pins - TRIG2:0
// These should be tied to gate - they simply allow the gate signal to be
// a clock and data simultaneously for scan insertion. Defining them as
// separate signals GATE and TRIG fools the test compiler and raises fault
// coverage.
// Likewise, NRD is used as a clock and NOE which is tied to NRD is used for
// combinatorial purposes to avoid problems with scan insertion.
// DELA, DELB and DELSEL are related to the counter latch circuitry. DELSEL
// selects either synchronous counter latch control if DELSEL is '0' or
// counter latch control gating using external delay lines to more closely
// mirror the operation of the real chip. If DELSEL is '0', DELA must be fed
// by the primary clock, CLK must be fed by the primary clock delayed by
// 10ns and DELB must be fed by the promary clock delayed by 20ns. This will
// then cause the macro to emulate the counter latch command timing described
// in the chip data sheet by the specification on Tcl.
module m8254 (ID, TMODE, CLK0, DELA0, DELB0, DELSEL0, GATE0, TRIG0, CLK1, DELA1, DELB1, DELSEL1, GATE1, TRIG1, CLK2, DELA2, DELB2, DELSEL2, GATE2, TRIG2, NCLR, A0, A1, NCS, NWR, NRD, NOE, DAO, NOD, OUT0, OUT1, OUT2);
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Mentor Graphics must receive a completed copy of the License Fee &        //
//Royalty Fee form for each use of the core where the design goes to mask.  //
//                                                                          //
//A fee is payable for all IC designs involving these deliverables at the   //
//time of production.  See your license agreement with Mentor Graphics for  //
//further details.  If you have further questions please contact Mentor     //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (m8254 v1998.060) was extracted on              //
//workstation hostid 80a4ee5e Inventra                                      //

  input[7:0] ID;
  input TMODE;
  input CLK0;
  input DELA0;
  input DELB0;
  input DELSEL0;
  input GATE0;
  input TRIG0;
  input CLK1;
  input DELA1;
  input DELB1;
  input DELSEL1;
  input GATE1;
  input TRIG1;
  input CLK2;
  input DELA2;
  input DELB2;
  input DELSEL2;
  input GATE2;
  input TRIG2;
  input NCLR;
  input A0;
  input A1;
  input NCS;
  input NWR;
  input NRD;
  input NOE;
  output[7:0] DAO;
  output NOD;
  output OUT0;
  output OUT1;
  output OUT2;

endmodule

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m82371ide, is restricted to employees of MGC on     //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m82371ide v1999.100) was extracted on          //
//workstation hostid 80895eb6 Inventra                                      //
// M82371IDE Top level
// M82371IDE
// Copyright Mentor Graphics Corporation and licensors 1999.
// V1.000

//
// This module provides all the timing for the IDE bus including
// address, data (both read and write) and buffer control.
//

module m82371ide (CLK, NCLK, NCD, DA, DQ, NBE, A, PBIRQ, SBIRQ, 
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m82371ide, is restricted to employees of MGC on     //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m82371ide v1999.100) was extracted on          //
//workstation hostid 80895eb6 Inventra                                      //
                  NIRD, NIWR, RDY, NAVAL, ABORT, CFSEL, RETRY,

                  NMRQ, NMGT, NMRD, NMWR, MA, NMBE, NMRDY, MABORT, MTABORT,

                  PIDEO, PIDEI, NPIDEEN, NPDIR, PADD, NPCS0, NPCS1, NPIOR, NPIOW,
                  PIORDY, PDREQ, NPDACK, PIRQ,

                  SIDEO, SIDEI, NSIDEEN, NSDIR, SADD, NSCS0, NSCS1, NSIOR, NSIOW,
                  SIORDY, SDREQ, NSDACK, SIRQ
                  );
//
// PBI interface signals
//
input         CLK;         //Master timing
input         NCLK;        //Master timing complement of CLK
input         NCD;         //Master reset
input  [31:0] DA;          //Data in
output [31:0] DQ;          //Data Out
input  [3:0]  NBE;         //Byte qualifiers
input  [31:0] A;           //Address
output        PBIRQ, SBIRQ; //Primary and secondary interrupts
input         NIRD, NIWR;  //Strobes
output        RDY;         //Cycle wait
output        NAVAL;       //Recognised address
output        ABORT;       //Illegal Address NBE combination
input         CFSEL;       //Configuration select
output        RETRY;       //Posted cycle in progress
//
// PBI interface master
//
output        NMRQ;        //Master transfer request
input         NMGT;        //Master transfer grant
output        NMRD, NMWR;  //Master transfer direction
output [31:0] MA;          //Address
output [3:0]  NMBE;        //Data Qualifier
input         NMRDY;       //Data transfer complete
input         MABORT;      //The transfer request was aborted
input         MTABORT;     //The trnasfer request was aborted by target
//
// IDE interface signals
//
output [15:0] PIDEO,    SIDEO;         //Data out
input  [15:0] PIDEI,    SIDEI;         //Data in
output        NPIDEEN,  NSIDEEN;       //Data buffer control (Bidirect)
output        NPDIR,    NSDIR;         //Exteranl Data buffer direction control 1 = Out, 0 = In
output [2:0]  PADD,     SADD;          //Address
output        NPIOR,    NSIOR;         //Strobes
output        NPIOW,    NSIOW;         //Strobes
input         PIORDY,   SIORDY;        //Cycle wait = 0 ready = 1
output        NPCS0,    NSCS0;         //Primary selects
output        NPCS1,    NSCS1;         //Secondary selects
input         PIRQ,     SIRQ;          //Interrupts
output        NPDACK,   NSDACK;        //DMA Acknowledge
input         PDREQ,    SDREQ;         //DMA Request

endmodule

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m16x50, is restricted to employees of MGC on        //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m16x50 v1999.100) was extracted on             //
//workstation hostid 80895eb6 Inventra                                      //
// M16x50 UART
// Copyright Mentor Graphics Corporation and Licensors 1999
// V1.200

// This is the top level module. It instantiates and connects
// up the lower levels.

// It is derived from m16550a V8.400, but uses a single clock and
// has a synchronous CPU interface.
// Enhancements added:
//   Hardware flow control (RTS/CTS)
//   Software flow control (Xon/Xoff)
//   CR, TOT outputs
//   IR modulation/demodulation

// Revision history:
// V 1.210 - 26 October 1999 - Script files modified to use UMC18
// and meet ip standards, Headers added to readme and script files,
// SDF back annotation of verilog test benchs added.  
// V1.200 - 1 June 1999
//          CPU interface made synchronous
// V1.100 - 30 April 1999
//          Synchronised to a single input clock
// V1.000 - 4 March 1999
//          Derived from m16550a V8.400

//Remove for FpgaAdvantage - T.D
//`include "m16x50_cfg.v"


module m16x50 (
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m16x50, is restricted to employees of MGC on        //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m16x50 v1999.100) was extracted on             //
//workstation hostid 80895eb6 Inventra                                      //
  CLK, MR,
  A, DI, NCE, RNW,
  RCLK, RCLK_BAUD, BRGE,
  NDCD, NRI, NDSR, NCTS, SIN,
  DA, IRQ, NDVL,
  NOUT2, NOUT1, NRTS, NDTR, SOUT, BAUD,
  TXRDY, RXRDY, CR, TOT
  );

input       CLK, MR;
input [2:0] A;
input [7:0] DI;
input       NCE, RNW, RCLK, RCLK_BAUD, BRGE;
input       NDCD, NRI, NDSR, NCTS, SIN;

output [7:0] DA;
output       IRQ, NDVL, NOUT2, NOUT1, NRTS, NDTR, SOUT, BAUD;
output       TXRDY, RXRDY, CR, TOT;

endmodule

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Use of these deliverables for the purpose of making silicon from an IC    //
//design is limited to the terms and conditions of your license agreement   //
//with Mentor Graphics If you have further questions please contact Mentor  //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (m1284h v1999.010) was extracted on             //
//workstation hostid 80895eb6 Inventra                                      //
// IEEE 1284 parallel port implementation.                                         *
// (C) Copyright Mentor Graphics Corporation and Licensors (1996 - 1997).          *
// V1.3                                                                            *
//                                                                                 *
// m1284h.v verilog file                                                           *
//                                                                                 *
//                                                                                 *
// Created          : 25th September 1996.                                         *
//                                                                                 *
// Last Modified    : 20 January 1999.                                             *
//                   TFIFO Mode added                                              *
//                   Cfifo corrected                                               *
//                                                                                 *
// Description :- This is the top level of the M1284h macro, it's main purpose is  *
//                to nit together the individual modules that make up the          *
//                functionality of the M1284h.                                     *
//                                                                                 *
//                It decodes the access to and from the Data bus, using gating     *
//                signals from the individual modules.                             *
//                                                                                 *
//   %W%   %G%    -- SCCS Version Control                                          *
//                                                                                 *
//**********************************************************************************

 `timescale 1ns/10ps

module m1284h   (TESTMODE, CLK, RST, PWRGD, NIOW, NIOR,
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Use of these deliverables for the purpose of making silicon from an IC    //
//design is limited to the terms and conditions of your license agreement   //
//with Mentor Graphics If you have further questions please contact Mentor  //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (m1284h v1999.010) was extracted on             //
//workstation hostid 80895eb6 Inventra                                      //
                 SLCT, NACK, BUSY, PE, NERR, ADDR[10:0], DATAIN[7:0], PDIN[7:0],
                 DATAOUT[7:0], PDOUT[7:0], NSLCTIN, NINIT, NSTROBE, NAUTOFD, PINTR1,
 		 PDIR, IOCHRDY, AEN, TC, NPDACK, PDRQ, READEN, INTEN, COMP,
                 ECR, CR1_3, CR4_1, CR4_0);
		
//**********************************************************************************
// Data type declarations.                                                         *
//**********************************************************************************
		
input  [10:0] ADDR;
input  [7:0]  DATAIN, PDIN;
input         TESTMODE, CLK, RST, PWRGD, NIOW;
input         NIOR, SLCT, NACK, BUSY, PE, NERR, AEN, NPDACK, TC;

output [7:0]  DATAOUT, PDOUT;
output [7:0]  ECR;
output        NSLCTIN, NINIT, NSTROBE, NAUTOFD, PINTR1, PDIR, IOCHRDY, PDRQ, READEN;
output        INTEN, COMP, CR1_3, CR4_1, CR4_0;

endmodule

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m146818, is restricted to employees of MGC on       //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m146818 v1999.100) was extracted on            //
//workstation hostid 80895eb6 Inventra                                      //
// m146818 Real Time Clock. (RTC)                                     //
// Copyright Mentor Graphics Corporation and Licensors 1997.          //
// V6.000                                                             //
//                                                                    //

////////////////// Interface ///////////////////////////////////////////

module m146818 ( A, DI, AS, CLK, NCE, NMR, NRD, NRST, NTST, NWR,
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m146818, is restricted to employees of MGC on       //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m146818 v1999.100) was extracted on            //
//workstation hostid 80895eb6 Inventra                                      //
                 DA, LA, NDOE, NIRQ, NRE, SQW );

input [6:0]  A;
input [7:0]  DI;
input        AS, CLK;
input        NCE, NMR, NRD, NRST, NTST, NWR;
output [7:0] DA;
output [6:0] LA;   
output       NDOE, NIRQ, NRE, SQW;

endmodule

module m8051 (NMOE, NMWE, DLM, ALE, NPSEN, NALEN, NFWE, NFOE, NSFRWE, NSFROE,
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m8051, is restricted to employees of MGC on         //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m8051 v1999.100) was extracted on              //
//workstation hostid 80895eb6 Inventra                                      //
IDLE, XOFF, OA, OB, OC, OD, AE, BE, CE, DE, FA, FO, M, NX1, NX2, RST, NEA,
NESFR, ALEI, PSEI, AI, BI, CI, DI, FI, MD);

  output NMOE;
  output NMWE;
  output DLM;
  output ALE;
  output NPSEN;
  output NALEN;
  output NFWE;
  output NFOE;
  output NSFRWE;
  output NSFROE;
  output IDLE;
  output XOFF;
  output[7:0] OA;
  output[7:0] OB;
  output[7:0] OC;
  output[7:0] OD;
  output[7:0] AE;
  output[7:0] BE;
  output[7:0] CE;
  output[7:0] DE;
  output[7:0] FA;
  output[7:0] FO;
  output[15:0] M;
  input NX1;
  input NX2;
  input RST;
  input NEA;
  input NESFR;
  input ALEI;
  input PSEI;
  input[7:0] AI;
  input[7:0] BI;
  input[7:0] CI;
  input[7:0] DI;
  input[7:0] FI;
  input[7:0] MD;

endmodule

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m8051warp, is restricted to employees of MGC on     //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m8051warp v1999.110) was extracted on          //
//workstation hostid 80895eb6 Inventra                                      //
// M8051Warp Soft Core Top Level Module
// (c) Copyright Mentor Graphics Corporation and Licensors 1999.
// All rights reserved.
// v3.000
////////////////////////////////////////////////////////////////////////////////
//
// File         :       %M%
// Created on   :       23rd February 1998
// Purpose      :       M8051Warp Fast 8051 Microcontroller Soft Core
// Version      :       3.000
// Mod Date     :       %G%
// Mod History  :       3.000 - Synchronous memory suppport,
//              :               optional multiplexed external memory interface,
//              :               memory MWAIT input.
//              :       2.001 - 'Megamacros' re-branded as 'Soft Cores'
// Version      :       2.000 - MOVC @(DPTR++), A  added
//                      1.000 - Original
// SCCS Version :       %I%
//
////////////////////////////////////////////////////////////////////////////////

module m8051warp (PORT0O, PORT1O, PORT2O, PORT3O, NPORT1E, NPORT2E, NPORT3E,
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m8051warp, is restricted to employees of MGC on     //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m8051warp v1999.110) was extracted on          //
//workstation hostid 80895eb6 Inventra                                      //
                  XRAMDO, PROGA, XRAMA, NPSEN, NXRAMR, NXRAMW, PROGA_EN,
                  XRAMA_EN, SOURCE_A, DESTIN_A, DESTIN_DO, NDESTIN_WE,
                  NSOURCE_RE, SFRWE, SFRSA, XINTR_ACK, IDLE, PDOWN, NCCLKE,
                  NPCLKE,
                  PORT0I, PORT1I, PORT2I, PORT3I, PROGDI, XRAMDI, SOURCE_DI,
                  ESFRDI, XINTR_SRC, MWAIT, SCLK, CCLK, PCLK, RESET, TRESET); 
               
// Port Drivers
   output [7:0]  PORT0O;
   output [7:0]  PORT1O;
   output [7:0]  PORT2O;
   output [7:0]  PORT3O;

// Port Driver Enables
   output [7:0]  NPORT1E;
   output [7:0]  NPORT2E;
   output [7:0]  NPORT3E;

// Program Memory Interface
   output [15:0] PROGA;
   output        NPSEN;
// output        NPSWR;
   output        PROGA_EN;

// External Data RAM Interface
   output [15:0] XRAMA;
   output [7:0]  XRAMDO;
   output        NXRAMR, NXRAMW;
   output        XRAMA_EN;

// Dual port RAM interface
   output [7:0]  SOURCE_A;
   output [7:0]  DESTIN_A;
   output [7:0]  DESTIN_DO;
   output        NDESTIN_WE;
   output        NSOURCE_RE;

// External SFR Interface
   output [6:0]  SFRSA;
   output        SFRWE;

// Interrupt Acknowledges
   output [13:5] XINTR_ACK;

// External Controls
   output        IDLE;
   output        PDOWN;
   output        NPCLKE;
   output        NCCLKE;

// Port Inputs
   input  [7:0]  PORT0I;
   input  [7:0]  PORT1I;
   input  [7:0]  PORT2I;
   input  [7:0]  PORT3I;

// Program Memory Interface
   input  [7:0]  PROGDI;

// External Data RAM Interface
   input  [7:0]  XRAMDI;

// Dual port RAM interface
   input  [7:0]  SOURCE_DI;

// External SFR Interface
   input  [7:0]  ESFRDI;

// Interrupt sources
   input  [13:5] XINTR_SRC;

// Slow memory synchronisation
   input  MWAIT;

   input  SCLK, CCLK, PCLK;		
   input  RESET;
   input  TRESET;


endmodule

module m8052 (NMOE, NMWE, DLM, ALE, NPSEN, NALEN, NFWE, NFOE, NSFRWE, NSFROE,
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Use of these deliverables for the purpose of making silicon from an IC    //
//design is limited to the terms and conditions of your license agreement   //
//with Mentor Graphics If you have further questions please contact Mentor  //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (m8052 v1998.081) was extracted on              //
//workstation hostid 80895eb6 Inventra                                      //
IDLE, XOFF, OA, OB, OC, OD, AE, BE, CE, DE, FA, FO, M, NX1, NX2, RST, NEA,
NESFR, ALEI, PSEI, AI, BI, CI, DI, FI, MD);

  output NMOE;
  output NMWE;
  output DLM;
  output ALE;
  output NPSEN;
  output NALEN;
  output NFWE;
  output NFOE;
  output NSFRWE;
  output NSFROE;
  output IDLE;
  output XOFF;
  output[7:0] OA;
  output[7:0] OB;
  output[7:0] OC;
  output[7:0] OD;
  output[7:0] AE;
  output[7:0] BE;
  output[7:0] CE;
  output[7:0] DE;
  output[7:0] FA;
  output[7:0] FO;
  output[15:0] M;
  input NX1;
  input NX2;
  input RST;
  input NEA;
  input NESFR;
  input ALEI;
  input PSEI;
  input[7:0] AI;
  input[7:0] BI;
  input[7:0] CI;
  input[7:0] DI;
  input[7:0] FI;
  input[7:0] MD;

endmodule

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m82092ide, is restricted to employees of MGC on     //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m82092ide v1999.100) was extracted on          //
//workstation hostid 80895eb6 Inventra                                      //
// M82092IDE Top Level
// M82092IDE
// Copyright Mentor Graphics Corporation and licensors 1999.
// V1.002

//
// This module provides all the timing for the IDE bus including
// address, data (both read and write) and external buffer control.
//

module m82092ide (CLK, NCD, DA, DQ, NBE, A, PBIRQ, SBIRQ, INTSEL,
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m82092ide, is restricted to employees of MGC on     //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m82092ide v1999.100) was extracted on          //
//workstation hostid 80895eb6 Inventra                                      //
                  NIRD, NIWR, RDY, NAVAL, ABORT, CFSEL, RETRY,
                  ENSERR, ENPERR, DATAPE, SERRAC,

                  IDEO, IDEI, NIDEEN, ADD, NIOR, NIOW,
                  NIOCS16, IORDY, NPDIR, NSDIR,
                  NPCS0, NPCS1, NSCS0, NSCS1,
                  PIRQ, SIRQ);
//
// PBI interface signals
//
input         CLK;         //Master timing
input         NCD;         //Master reset
input  [31:0] DA;          //Data in
output [31:0] DQ;          //Data Out
input  [3:0]  NBE;         //Byte qualifiers
input  [31:0] A;           //Address
output        PBIRQ, SBIRQ; //Primary and secondary interrupts
output [7:0]  INTSEL;      //Define IRQ routing
input         NIRD, NIWR;  //Strobes
output        RDY;         //Cycle wait
output        NAVAL;       //Recognised address
output        ABORT;       //Illegal Address NBE combination
input         CFSEL;       //Configuration select
output        RETRY;       //Posted cycle in progress
output        ENSERR;      //Misc enables
output        ENPERR;
input         DATAPE;      //Misc Status
input         SERRAC;
//
// IDE interface signals
//
output [15:0] IDEO;        //Data out
input  [15:0] IDEI;        //Data in
output        NIDEEN;      //Data buffer control
output [2:0]  ADD;         //Address
output        NIOR, NIOW;  //Strobes
input         NIOCS16;     //Transfer size 0 = 16-bit, 1 = 8-bit
input         IORDY;       //Cycle wait = 0 ready = 1
output        NPDIR,NSDIR; //Exteranl Data buffer direction control 1 = Out, 0 = In
output        NPCS0, NPCS1; //Primary selects
output        NSCS0, NSCS1; //Secondary selects
input         PIRQ, SIRQ;


endmodule

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Use of these deliverables for the purpose of making silicon from an IC    //
//design is limited to the terms and conditions of your license agreement   //
//with Mentor Graphics If you have further questions please contact Mentor  //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (m82365sl v1998.070) was extracted on           //
//workstation hostid 80895eb6 Inventra                                      //
// M82365SL PC Card I/F controler.
// (C)Copyright Mentor Graphics Corporation and Licensors (1996 - 1998)
// Module m82365sl.v
// V1.000

// M82365SL Top level.
//
// Instantiates two PC Card interface blocks and connect logic
// FpgaAdvantage evaluation version - T.DELAYE

module m82365sl (SA, NSBHE, SDI, SDO, NESDO, AEN, BALE, NCS, NINTR, SYSCLK,

	IOCHRDY, NIOCS16, NIORC, NIOWC, NMEMR, NMEMW, NMEMCS16, NZEROWS,
	NEIRQ3, NEIRQ4, NEIRQ5, NEIRQ7, NEIRQ9, NEIRQ10, NEIRQ11, NEIRQ12, NEIRQ14, NEIRQ15,
	IRQ3, IRQ4, IRQ5, IRQ7, IRQ9, IRQ10, IRQ11, IRQ12, IRQ14, IRQ15,
	PWRGOOD, RESETDRV, NRI_OUT, NSPKROUT, MODE, SEL0, SEL1,

	A_BVD1, A_BVD2, A_CA, A_NCD1, A_NCD2, A_NCE1, A_NCE2, A_NENABLE, A_NENIF,
	A_NIORD, A_NIOWR, A_NOE, A_NVCC_EN, A_VPP1_EN0, A_VPP1_EN1, A_VPP2_EN0, A_VPP2_EN1,
	A_NGPI, A_RDY, A_NREG, A_RESET, A_NWAIT, A_NWE, A_WP,

	B_BVD2, B_BVD1, B_CA, B_NCD1, B_NCD2, B_NCE1, B_NCE2, B_NENABLE, B_NENIF,
	B_NIORD, B_NIOWR, B_NOE, B_NVCC_EN, B_VPP1_EN0, B_VPP1_EN1, B_VPP2_EN0, B_VPP2_EN1,
	B_NGPI, B_RDY, B_NREG, B_RESET, B_NWAIT, B_NWE, B_WP,

	EXT_DIR, CSPWRD,

	NTEST);

//
// ISA BUS I/F
//
input	[23:0]	SA;
input	[7:0]	SDI;
input		NSBHE, AEN, BALE, NCS, SYSCLK;
input		NIORC, NIOWC, NMEMR, NMEMW;
input		PWRGOOD, RESETDRV, MODE, SEL0, SEL1;
input		NTEST;      //Used in scan test

output	[7:0]	SDO;
output		NESDO;
output		NINTR, IOCHRDY, NIOCS16, NMEMCS16, NZEROWS;
output		NEIRQ3, NEIRQ4, NEIRQ5, NEIRQ7, NEIRQ9, NEIRQ10, NEIRQ11, NEIRQ12, NEIRQ14, NEIRQ15;
output		IRQ3, IRQ4, IRQ5, IRQ7, IRQ9, IRQ10, IRQ11, IRQ12, IRQ14, IRQ15;
output		NRI_OUT, NSPKROUT;

//
// PC Card A
//
input		A_BVD1, A_BVD2, A_NCD1, A_NCD2, A_NGPI, A_RDY, A_NWAIT, A_WP;

output	[25:12]	A_CA;
output		A_NCE1, A_NCE2, A_NENABLE, A_NENIF, A_NIORD, A_NIOWR, A_NOE;
output		A_NVCC_EN, A_VPP1_EN0, A_VPP1_EN1, A_VPP2_EN0, A_VPP2_EN1;
output		A_NREG, A_RESET, A_NWE;

//
// PC Card B
//
input		B_BVD1, B_BVD2, B_NCD1, B_NCD2, B_NGPI, B_RDY, B_NWAIT, B_WP;

output	[25:12]	B_CA;
output		B_NCE1, B_NCE2, B_NENABLE, B_NENIF, B_NIORD, B_NIOWR, B_NOE;
output		B_NVCC_EN, B_VPP1_EN0, B_VPP1_EN1, B_VPP2_EN0, B_VPP2_EN1;
output		B_NREG, B_RESET, B_NWE;		

//
// PC Card A/B (Shared)
//
output		EXT_DIR;
output		CSPWRD;


endmodule

module m8237a (adstb, aen, covl, dack0, dack1, dack2, dack3, davl, hrq, neopi,
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, m8237a, is restricted to employees of MGC on        //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (m8237a v1998.080) was extracted on             //
//workstation hostid 80895eb6 Inventra                                      //
nior, niow, nmemr, nmemw, nrdi_o, nwri_o, ca, da, nrdi_i, nwri_i, 
clk, nclk, dreq0, dreq1, dreq2, dreq3, hlda, ncs, neope, nrd, nwr, ready, rset,
test, di, a);

   output adstb;
   output aen;
   output covl;
   output dack0;
   output dack1;
   output dack2;
   output dack3;
   output davl;
   output hrq;
   output neopi;
   output nior;
   output niow;
   output nmemr;
   output nmemw;
   output nrdi_o;
   output nwri_o;
   output[15:0] ca;
   output[7:0] da;
   input nrdi_i;
   input nwri_i;
   input clk;
   input nclk;
   input dreq0;
   input dreq1;
   input dreq2;
   input dreq3;
   input hlda;
   input ncs;
   input neope;
   input nrd;
   input nwr;
   input ready;
   input rset;
   input test;
   input[7:0] di;
   input[3:0] a;

endmodule

module m8251a (clk, txc, rxc, reset, ncs, nwr, nrd, cnd, ncts, ndsr, sbdet_in, rxd, test_mode, d_in, rxrdy, txrdy, txe, ndtr, nrts, sbdet_out, dac, sbdetc, txd, d_out);
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1998.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//These deliverables may be used for the purpose of making silicon for one  //
//IC design only.  No further use of these deliverables for the purpose of  //
//making silicon from an IC design is permitted without the payment of an   //
//additional license fee.  See your license agreement with Mentor Graphics  //
//for further details.  If you have further questions please contact        //
//Mentor Graphics Customer Support.                                         //
//                                                                          //
//This Mentor Graphics core (m8251a v1998.060) was extracted on             //
//workstation hostid 80895eb6 Inventra                                      //

  input clk;
  input txc;
  input rxc;
  input reset;
  input ncs;
  input nwr;
  input nrd;
  input cnd;
  input ncts;
  input ndsr;
  input sbdet_in;
  input rxd;
  input test_mode;
  input[7:0] d_in;
  output rxrdy;
  output txrdy;
  output txe;
  output ndtr;
  output nrts;
  output sbdet_out;
  output dac;
  output sbdetc;
  output txd;
  output[7:0] d_out;

endmodule

//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1998.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, mfdc78, is restricted to employees of MGC on        //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (mfdc78 v1998.070) was extracted on             //
//workstation hostid 80895eb6 Inventra                                      //
// MFDC78 FLOPPY DISC CONTROLER
//
// Copyright Mentor Graphics Corporation and Licensors 1998. All Rights Reserved.
// V1.001
//
// 
//
// MODE[1:0]
// 
// 0,0  = PC AT mode
// 0,1  = Model 30
// 1,0  = Unspecified, do not use
// 1,1  = PS2 Mode
//
// Various extended configurations are posible
// these are programed via the M765A commands
//FpgaAdvantage Evaluation version - T.DELAYE
module mfdc78 (XLCK, CRCK, WCLK, PCCK, PLCK,

	CRCK_IN, WCLK_IN, PCCK_IN, PLCK_IN,

        NFWRO, NFRDO,
        NFWRI, NFRDI,

	SDCK,
	SDCK_IN,

	TSET, NTEST, RSET, MODE,

	DBI, NCE, NWR, NRD, NDACK, TC, A,
	TRK0, INDEX, WRP, DSKCH,

	RDAT,

	S3V, 

	DRQ, IRQ, NDMAIEN,
	SIDE, STP, DIR, WE, WDAT,

	MEDID1, MEDID0, DRVID1, DRVID0, DRVDEN1, DRVDEN0,
	DRV2,

        FDS3, FDS2, FDS1, FDS0, FDME3, FDME2, FDME1, FDME0,
	POWD, IDLE, DOSC, TRI_FDI,

	SELCK48,

	DBO, NDBE);

input		XLCK;	//System clock 24.00Mhz (usualy)

output		CRCK;	//Generated clocks
output		WCLK;
output		PCCK; 
output		PLCK;

input		CRCK_IN;  // Looped back externaly from CRCK
input		WCLK_IN;  // Looped back externaly from WCLK
input		PCCK_IN;  // Looped back externaly from PCCK
input		PLCK_IN;  // Looped back externaly from PLCK

output		NFWRO, NFRDO;
input		NFWRI, NFRDI;  // Loop back externaly from NFWRO & NFRDO

output		SDCK;
input           SDCK_IN;  // Looped back externaly from SDCK

input		TSET;  // Test mode reset for MDDS24_78
input		NTEST; // Test mode control for M765A_78
input		RSET;  // Power on reset
input	[1:0]	MODE;  // Select PCAT, M30 or PS2 modes

input	[7:0]	DBI;
input		NCE, NWR, NRD;
input		NDACK, TC;
input	[2:0]	A;

input	 	TRK0, INDEX, WRP, DSKCH; // FD I/F signals
input		RDAT;                    // RAW input data

input		S3V;

input		MEDID1, MEDID0, DRVID1, DRVID0;  // I/F status
input		DRV2;

output		DRQ;    //DMA request
output		IRQ;    //Interrupt request
output		NDMAIEN;  //DMA and IRQ tristate control

output		SIDE, STP, DIR, WE, WDAT;

output		DRVDEN1, DRVDEN0;

output		FDS3, FDS2, FDS1, FDS0, FDME3, FDME2, FDME1, FDME0;
output		POWD, IDLE, DOSC, TRI_FDI;

output		SELCK48;	//Select XLCK as 48Mhz, externaly. 

output	[7:0]	DBO;
output	[7:0]	NDBE;


endmodule

module mi2c (
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//The use of this core, mi2c, is restricted to employees of MGC on          //
//equipment owned by MGC for the purposes of demonstrations and trade       //
//shows or to develop tools in conjunction with Inventra.  The use of this  //
//core is granted until the license key used to extract it on workstation   //
//hostid 80895eb6 expires, at which time all copies must be deleted.        //
//Ownership of the core is retained by MGC.  Warning - this core is not     //
//warranted to be complete or fully functional.                             //
//                                                                          //
//This Mentor Graphics core (mi2c v1999.100) was extracted on               //
//workstation hostid 80895eb6 Inventra                                      //
  CLK, NRST, A, DI, WR, SEL, ISCL, ISDA,
  DA, NOE, INTR, OSCL, OSDA
  );

  input        CLK, NRST, WR, SEL, ISCL, ISDA;
  input  [2:0] A;
  input  [7:0] DI;
  output [7:0] DA;
  output       NOE, INTR, OSCL, OSDA;

endmodule
