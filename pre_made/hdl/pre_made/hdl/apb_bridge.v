// ----------------------------------------------------------------------
//    THIS IS AUTOMATICALLY GENERATED CODE
//   Generated by Mentor Graphics' Register Assistant V4.2 (Build 2)
//-----------------------------------------------------------------------
// Created by       : user
// Creation Date    : 04/12/12 14:21
//-----------------------------------------------------------------------
//  Project         : Bus Bridge
//  Bus Standard    : ARM(R)-AMBA(R)-APB
//   (ARM(R)   Advanced Microcontroller Bus Architecture(R)   APB)
//    All Rights Reserved Worldwide by their Respective Owners.
// ----------------------------------------------------------------------
//  Title           : AMBA APB to RA Generic Bus Bridge
// 
//  Description     : 
//      The Advanced Peripheral Bus (APB) is a low-cost interface
//      that is optimized for minimal power consumption and reduced
//      interface complexity. The APB protocol is useful for
//      connecting to low-bandwidth peripherals that do not require
//      the high performance of the AXI protocol.
//      Every transfer in APB takes at least two cycles.
//      The APB can interface with AHB and AXI Buses.
// 
//      The RA Generic Bus is the generic bus used by all slaves generated
//      by Register-Assistant. It supports read/write operations
//      for registers configured inside blocks by Register-Assistant 
// 
// ----------------------------------------------------------------------


module apb_to_generic_bus_bridge 
  #( parameter
    APB_ABUS_WIDTH = 32,  // APB Address Bus Width
    APB_DBUS_WIDTH = 32,  // APB Data Bus Width
    ABUS_WIDTH = 32,      // Address Bus Width
    DBUS_WIDTH = 16       // Data Bus Width  
  )
  (
    // AMBA APB SIGNALS
    input                         PRESETn,  // AMBA APB Bus Reset. The APB reset signal is active LOW. This signal is normally connected directly to the system bus reset signal.
    input                         PCLK,     // AMBA APB Bus Clock. The rising edge of PCLK times all transfers on the APB.
    input   [APB_ABUS_WIDTH-1:0]  PADDR,    // AMBA APB Peripheral Address Bus. This is the APB address bus. It can be up to 32 bits wide and is driven by the peripheral bus bridge unit.
    input   [2:0]                 PPROT,    // APBA APB Protection Type. This signal indicates the normal, privileged, or secure protection level of the transaction and whether the transaction is a data access or an instruction access.
    input                         PSEL,     // AMBA APB Peripheral Select. The APB bridge unit generates this signal to each peripheral bus slave. It indicates that the slave device is selected and that a data transfer is required. There is a PSELx signal for each slave.
    input                         PENABLE,  // AMBA APB Enable. Indicates 2nd and subsequent cycles of a transfer.
    input                         PWRITE,   // AMBA APB Transfer Direction. This signal indicates an APB write access when HIGH and an APB read access when LOW.
    input   [APB_DBUS_WIDTH-1:0]  PWDATA,   // AMBA APB Write Data. This bus is driven by the peripheral bus bridge unit during write cycles when PWRITE is HIGH. This bus can be up to 32 bits wide.
    input   [3:0]                 PSTRB,    // [Not used] Write strobes. This signal indicates which byte lanes to update during a write transfer. There is one write strobe for each eight bits of the write data bus. Therefore, PSTRB[n] corresponds to PWDATA[(8n + 7):(8n)]. Write strobes must not be active during a read transfer.
    output                        PREADY,   // Ready. The slave uses this signal to extend an APB transfer.
    output  [APB_DBUS_WIDTH-1:0]  PRDATA,   // AMBA APB Read Data. The selected slave drives this bus during read cycles when PWRITE is LOW. This bus can be up to 32-bits wide.
    output                        PSLVERR,  // This signal indicates a transfer failure. APB peripherals are not required to support the PSLVERR pin. This is true for both existing and new APB peripheral designs. Where a peripheral does not include this pin then the appropriate input to the APB bridge is tied LOW.

    // GENERIC BUS SIGNALS
    output                        clock,    // Register Bus Clock
    output                        reset,    // Register Bus Reset
    output                        rstrobe,  // Read Strobe. Activates a register read access when HIGH.
    output  [ABUS_WIDTH-1:0]      raddr,    // Read Address. Address of the register whose content is to be read.
    input   [DBUS_WIDTH-1:0]      rdata,    // Read Data. The content of the addressed register is placed on this bus when RSTROBE is HIGH.
    input                         rack,     // Read Acknowledge. Asserted HIGH when RDATA is valid. This can be on the current clock edge if "Read Data Mux Logic Type" is set to ASYNC or the next clock edge if set to SYNC.
    input                         raddrerr, // Read Address Error. Indicates an attempt to access an unmapped register address for read.
    output                        wstrobe,  // Write Strobe. Activates a register write access when HIGH.
    output  [ABUS_WIDTH-1:0]      waddr,    // Write Address. Address of the register whose content is to be written.
    output  [DBUS_WIDTH-1:0]      wdata,    // Write Data. The content of the addressed register is placed on this bus and written to the register when WSTROBE is HIGH.
    input                         wack,     // Write Acknowledge. Asserted HIGH when WDATA has been assigned to the appropriate register. This can be on the current clock edge if "Address Decode Logic Type" is set to ASYNC or the next clock edge if set to SYNC.
    input                         waddrerr  // Write Address Error. Indicates an attempt to access an unmapped register address for write.
  );

  // COMMON MAPPING
  assign reset                     = PRESETn;  // RA Generic Bus reset must be configured to active low to work with APB
  assign clock                     = PCLK;     // RA Generic Bus clock must be configured to positive edge triggered to work with APB

  // WRITING
  assign wdata                     = PWDATA[DBUS_WIDTH - 1:0];
  assign wstrobe                   = PSEL & (PWRITE & PENABLE);
  assign waddr                     = PADDR[ABUS_WIDTH - 1:0];

  // READING
  assign PRDATA [DBUS_WIDTH - 1:0] = (PSEL == 1'b1 ? rdata[DBUS_WIDTH - 1:0] : 'bz );
  assign rstrobe                   = PSEL & ((~PWRITE) & PENABLE);
  assign raddr                     = PADDR[ABUS_WIDTH - 1:0];

  // SHARED SIGNALS
  assign PREADY                    = (PSEL == 1'b1 ? (PWRITE & wack) | ((~ PWRITE) & rack) : 'bz );
  assign PSLVERR                   = (PSEL == 1'b1 ? (PWRITE & waddrerr) | ((~ PWRITE) & raddrerr) : 'bz );

endmodule