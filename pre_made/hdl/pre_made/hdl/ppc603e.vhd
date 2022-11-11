library cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
--------------------------------------------------------------------------------
--
--   ppc603e Model QuickHDL VHDL Interface
--
--   Copyright (c) MENTOR GRAPHICS CORPORATION 1996,1997 All Rights Reserved
--                      UNPUBLISHED, LICENSED SOFTWARE.
--         CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
--         PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS.
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Bridge to ppc603e Model engine
--
--  The foreign attribute causes the bridge function for the Model to
--  be executed.
--------------------------------------------------------------------------------

entity ppc603e_engine_e is
  attribute foreign : string;
end ppc603e_engine_e;

architecture engine_a of ppc603e_engine_e is
  attribute foreign of engine_a : architecture is
	"ppc603e_InitQhdl $CVE_HOME/lib/ppc603e_qhdl.slib;";
begin
end engine_a;

--------------------------------------------------------------------------------
--  ppc603e Pin Interface
--------------------------------------------------------------------------------

library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use std.textio.all;
use ieee.std_logic_1164.all;


entity ppc603e is
   generic (
        DEFAULT_PIN_DELAY : time := 1 ns; --Default output delay
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/ppc603e_delays";
        CVE_NAME          : string := "" --Logical name for instance
           );
   port (
        BR_BAR        : out std_logic := 'Z'; --Address Bus Arbitration Signals.
        BG_BAR        : in std_logic;
        ABB_BAR       : inout std_logic := 'Z';
        TS_BAR        : inout std_logic := 'Z'; --Address Transfer Start Signals
        A             : inout std_logic_vector ( 0 to 31 ) := (others => 'Z'); --Address Transfer Signals.
        AP            : inout std_logic_vector ( 0 to 3 ) := (others => 'Z');
        APE_BAR       : out std_logic := 'Z';
        TT            : inout std_logic_vector ( 0 to 4 ) := (others => 'Z'); --Address Transfer Attribute Signals.
        TSIZ          : inout std_logic_vector ( 0 to 2 ) := (others => 'Z');
        TBST_BAR      : inout std_logic := 'Z';
        TC            : out std_logic_vector ( 0 to 1 ) := (others => 'Z');
        CI_BAR        : out std_logic := 'Z';
        WT_BAR        : out std_logic := 'Z';
        GBL_BAR       : inout std_logic := 'Z';
        CSE           : out std_logic_vector ( 0 to 1 ) := (others => 'Z');
        AACK_BAR      : in std_logic; --Address Transfer Termination Signals
        ARTRY_BAR     : inout std_logic := 'Z';
        DBG_BAR       : in std_logic; --Data Bus Arbitration Signals
        DBWO_BAR      : in std_logic;
        DBB_BAR       : inout std_logic := 'Z';
        DH            : inout std_logic_vector ( 0 to 31 ) := (others => 'Z'); --Data Transfer Signals
        DL            : inout std_logic_vector ( 0 to 31 ) := (others => 'Z');
        DP            : inout std_logic_vector ( 0 to 7 ) := (others => 'Z');
        DPE_BAR       : out std_logic := 'Z';
        DBDIS_BAR     : in std_logic;
        TA_BAR        : in std_logic; --Data Transfer Termination Signals
        DRTRY_BAR     : in std_logic;
        TEA_BAR       : in std_logic;
        INT_BAR       : in std_logic; --Interrupt Signals
        SMI_BAR       : in std_logic;
        MCP_BAR       : in std_logic;
        CKSTP_BAR     : in std_logic; --Checkstop Signals
        CHECKSTOP_BAR : out std_logic := 'Z';
        HRESET_BAR    : in std_logic; --Reset Signals
        SRESET_BAR    : in std_logic;
        QREQ_BAR      : out std_logic := 'Z'; --Processor Status Signals
        QACK_BAR      : in std_logic;
        RSRV_BAR      : out std_logic := 'Z';
        TBEN          : in std_logic;
        TLBISYNC_BAR  : in std_logic;
        SYSCLK        : in std_logic; --Clock Signals
        CLK_OUT       : out std_logic := 'Z';
        PLL_CFG       : in std_logic_vector ( 0 to 3 );
        TRST_BAR      : in std_logic; --JTAG / COP Interface Signals.
        TCK           : in std_logic;
        TMS           : in std_logic;
        TDI           : in std_logic;
        TD0           : out std_logic := 'Z';
        LSSD_MODE_BAR : in std_logic; -- Test signals for factory use only.
        L1_TSTCLK     : in std_logic;
        L2_TSTCLK     : in std_logic;
        AVDD          : in std_logic; --Power Supply Lines
        GND           : in std_logic;
        OGND          : in std_logic;
        OVDD          : in std_logic;
        VDD           : in std_logic
        );

end ppc603e;

architecture interface of ppc603e is


  component ppc603e_engine_e
  end component;

  for all : ppc603e_engine_e use entity cve_qhdl_vhdl_lib.ppc603e_engine_e(engine_a);


begin

-- This dummy process makes generics visible.  It must appear before
-- the instance of the model engine so that the model engine can see the
-- generics when it is allocating and initializing.

  process ( HRESET_BAR )
    begin
    end process;

-- Bridge to Model

  engine : ppc603e_engine_e;

end interface;

-------------------------------------------------------------------------------
--  Package for ppc603e Component
-------------------------------------------------------------------------------
 
library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use ieee.std_logic_1164.all;
 

package ppc603e_pkg is

  component ppc603e
 
   generic (
        DEFAULT_PIN_DELAY : time := 1 ns; --Default output delay
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/ppc603e_delays";
        CVE_NAME          : string := "" --Logical name for instance
   );
 
   port (
        BR_BAR        : out std_logic := 'Z'; --Address Bus Arbitration Signals.
        BG_BAR        : in std_logic;
        ABB_BAR       : inout std_logic := 'Z';
        TS_BAR        : inout std_logic := 'Z'; --Address Transfer Start Signals
        A             : inout std_logic_vector ( 0 to 31 ) := (others => 'Z'); --Address Transfer Signals.
        AP            : inout std_logic_vector ( 0 to 3 ) := (others => 'Z');
        APE_BAR       : out std_logic := 'Z';
        TT            : inout std_logic_vector ( 0 to 4 ) := (others => 'Z'); --Address Transfer Attribute Signals.
        TSIZ          : inout std_logic_vector ( 0 to 2 ) := (others => 'Z');
        TBST_BAR      : inout std_logic := 'Z';
        TC            : out std_logic_vector ( 0 to 1 ) := (others => 'Z');
        CI_BAR        : out std_logic := 'Z';
        WT_BAR        : out std_logic := 'Z';
        GBL_BAR       : inout std_logic := 'Z';
        CSE           : out std_logic_vector ( 0 to 1 ) := (others => 'Z');
        AACK_BAR      : in std_logic; --Address Transfer Termination Signals
        ARTRY_BAR     : inout std_logic := 'Z';
        DBG_BAR       : in std_logic; --Data Bus Arbitration Signals
        DBWO_BAR      : in std_logic;
        DBB_BAR       : inout std_logic := 'Z';
        DH            : inout std_logic_vector ( 0 to 31 ) := (others => 'Z'); --Data Transfer Signals
        DL            : inout std_logic_vector ( 0 to 31 ) := (others => 'Z');
        DP            : inout std_logic_vector ( 0 to 7 ) := (others => 'Z');
        DPE_BAR       : out std_logic := 'Z';
        DBDIS_BAR     : in std_logic;
        TA_BAR        : in std_logic; --Data Transfer Termination Signals
        DRTRY_BAR     : in std_logic;
        TEA_BAR       : in std_logic;
        INT_BAR       : in std_logic; --Interrupt Signals
        SMI_BAR       : in std_logic;
        MCP_BAR       : in std_logic;
        CKSTP_BAR     : in std_logic; --Checkstop Signals
        CHECKSTOP_BAR : out std_logic := 'Z';
        HRESET_BAR    : in std_logic; --Reset Signals
        SRESET_BAR    : in std_logic;
        QREQ_BAR      : out std_logic := 'Z'; --Processor Status Signals
        QACK_BAR      : in std_logic;
        RSRV_BAR      : out std_logic := 'Z';
        TBEN          : in std_logic;
        TLBISYNC_BAR  : in std_logic;
        SYSCLK        : in std_logic; --Clock Signals
        CLK_OUT       : out std_logic := 'Z';
        PLL_CFG       : in std_logic_vector ( 0 to 3 );
        TRST_BAR      : in std_logic; --JTAG / COP Interface Signals.
        TCK           : in std_logic;
        TMS           : in std_logic;
        TDI           : in std_logic;
        TD0           : out std_logic := 'Z';
        LSSD_MODE_BAR : in std_logic; -- Test signals for factory use only.
        L1_TSTCLK     : in std_logic;
        L2_TSTCLK     : in std_logic;
        AVDD          : in std_logic; --Power Supply Lines
        GND           : in std_logic;
        OGND          : in std_logic;
        OVDD          : in std_logic;
        VDD           : in std_logic
      );
  end component;
 
end ppc603e_pkg;
 
-------------------------------------------------------------------------------
