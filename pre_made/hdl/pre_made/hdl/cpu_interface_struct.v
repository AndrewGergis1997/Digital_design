//
// Module uart_v2k.cpu_interface.struct
//
// Created:
//          by - user.group (host.domain)
//          at - 17:22:37 05/10/07
//
// Generated by Mentor Graphics' HDL Designer(TM) 2007.1
//

`resetall
`timescale 1ns/10ps
module cpu_interface( 
   // Port Declarations
   output  wire           clear_flags, 
   input   wire           clk, 
   input   wire           clk_div_en, 
   input   wire           clr_int_en, 
   input   wire           cs, 
   output  wire    [7:0]  datout, 
   input   wire    [7:0]  div_data, 
   output  wire           enable_write, 
   input   wire           nrw, 
   input   wire           rst, 
   input   wire    [7:0]  ser_if_data, 
   output  wire           start_xmit, 
   input   wire           xmitdt_en
);


// Internal Declarations


// Local declarations



// Instances
control_operation U_0(
   .clk          (clk),
   .clr_int_en   (clr_int_en),
   .cs           (cs),
   .nrw          (nrw),
   .rst          (rst),
   .xmitdt_en    (xmitdt_en),
   .clear_flags  (clear_flags),
   .enable_write (enable_write),
   .start_xmit   (start_xmit)
);

// HDL Embedded Text Block data_out_mux
//
assign datout = (clk_div_en == 1) ? div_data : ser_if_data;                                     
//

endmodule // cpu_interface

