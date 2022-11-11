library cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
--------------------------------------------------------------------------------
--
--   dram Model QuickHDL VHDL Interface
--
--   Copyright (c) MENTOR GRAPHICS CORPORATION 1996,1997 All Rights Reserved
--                      UNPUBLISHED, LICENSED SOFTWARE.
--         CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
--         PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS.
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Bridge to dram Model engine
--
--  The foreign attribute causes the bridge function for the Model to
--  be executed.
--------------------------------------------------------------------------------

entity dram_engine_e is
  attribute foreign : string;
end dram_engine_e;

architecture engine_a of dram_engine_e is
  attribute foreign of engine_a : architecture is
	"dram_InitQhdl $CVE_HOME/lib/dram_qhdl.slib;";
begin
end engine_a;

--------------------------------------------------------------------------------
--  dram Pin Interface
--------------------------------------------------------------------------------

library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use std.textio.all;
use ieee.std_logic_1164.all;


entity dram is
   generic (
        NUM_ADDR_BITS     : INTEGER := 8; --Width of address bus
        NUM_DATA_BITS     : INTEGER := 8; --Width of data bus
        DEFAULT_PIN_DELAY : time := 1 ns;
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/dram_delays";
        CVE_NAME          : string := "" --Logical name of this instance
           );
   port (
        ADDR : in std_logic_vector ( NUM_ADDR_BITS-1 downto 0 ); --Addr bus
        CAS  : in std_logic; --Column address strobe (active low)
        DQ   : inout std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Data bus
        OE   : in std_logic; --Output enable (active low)
        RAS  : in std_logic; --Row address strobe (active low)
        WE   : in std_logic --Write enable (active low)
        );

end dram;

architecture interface of dram is


  component dram_engine_e
  end component;

  for all : dram_engine_e use entity cve_qhdl_vhdl_lib.dram_engine_e(engine_a);


begin

-- This dummy process makes generics visible.  It must appear before
-- the instance of the model engine so that the model engine can see the
-- generics when it is allocating and initializing.

  process ( CAS )
    begin
    end process;

-- Bridge to Model

  engine : dram_engine_e;

end interface;

-------------------------------------------------------------------------------
--  Package for dram Component
-------------------------------------------------------------------------------
 
library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use ieee.std_logic_1164.all;
 

package dram_pkg is

  component dram
 
   generic (
        NUM_ADDR_BITS     : INTEGER := 8; --Width of address bus
        NUM_DATA_BITS     : INTEGER := 8; --Width of data bus
        DEFAULT_PIN_DELAY : time := 1 ns;
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/dram_delays";
        CVE_NAME          : string := "" --Logical name of this instance
   );
 
   port (
        ADDR : in std_logic_vector ( NUM_ADDR_BITS-1 downto 0 ); --Addr bus
        CAS  : in std_logic; --Column address strobe (active low)
        DQ   : inout std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Data bus
        OE   : in std_logic; --Output enable (active low)
        RAS  : in std_logic; --Row address strobe (active low)
        WE   : in std_logic --Write enable (active low)
      );
  end component;
 
end dram_pkg;
 
-------------------------------------------------------------------------------
