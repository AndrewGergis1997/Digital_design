library cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
--------------------------------------------------------------------------------
--
--   sram Model QuickHDL VHDL Interface
--
--   Copyright (c) MENTOR GRAPHICS CORPORATION 1996,1997 All Rights Reserved
--                      UNPUBLISHED, LICENSED SOFTWARE.
--         CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
--         PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS.
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Bridge to sram Model engine
--
--  The foreign attribute causes the bridge function for the Model to
--  be executed.
--------------------------------------------------------------------------------

entity sram_engine_e is
  attribute foreign : string;
end sram_engine_e;

architecture engine_a of sram_engine_e is
  attribute foreign of engine_a : architecture is
	"sram_InitQhdl $CVE_HOME/lib/sram_qhdl.slib;";
begin
end engine_a;

--------------------------------------------------------------------------------
--  sram Pin Interface
--------------------------------------------------------------------------------

library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use std.textio.all;
use ieee.std_logic_1164.all;


entity sram is
   generic (
        NUM_ADDR_BITS     : INTEGER := 8; --Width of address bus
        NUM_DATA_BITS     : INTEGER := 8; --Width of data bus
        DEFAULT_PIN_DELAY : time := 1 ns;
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/sram_delays";
        CVE_NAME          : string := "" --Logical name of this instance
           );
   port (
        ADDR : in std_logic_vector ( NUM_ADDR_BITS-1 downto 0 ); --Address bus
        CE   : in std_logic; --Chip enable (active low)
        DQ   : inout std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Data bus
        OE   : in std_logic; --Output enable (active low)
        WE   : in std_logic --Write enable (active low)
        );

end sram;

architecture interface of sram is


  component sram_engine_e
  end component;

  for all : sram_engine_e use entity cve_qhdl_vhdl_lib.sram_engine_e(engine_a);


begin

-- This dummy process makes generics visible.  It must appear before
-- the instance of the model engine so that the model engine can see the
-- generics when it is allocating and initializing.

  process ( CE )
    begin
    end process;

-- Bridge to Model

  engine : sram_engine_e;

end interface;

-------------------------------------------------------------------------------
--  Package for sram Component
-------------------------------------------------------------------------------
 
library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use ieee.std_logic_1164.all;
 

package sram_pkg is

  component sram
 
   generic (
        NUM_ADDR_BITS     : INTEGER := 8; --Width of address bus
        NUM_DATA_BITS     : INTEGER := 8; --Width of data bus
        DEFAULT_PIN_DELAY : time := 1 ns;
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/sram_delays";
        CVE_NAME          : string := "" --Logical name of this instance
   );
 
   port (
        ADDR : in std_logic_vector ( NUM_ADDR_BITS-1 downto 0 ); --Address bus
        CE   : in std_logic; --Chip enable (active low)
        DQ   : inout std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Data bus
        OE   : in std_logic; --Output enable (active low)
        WE   : in std_logic --Write enable (active low)
      );
  end component;
 
end sram_pkg;
 
-------------------------------------------------------------------------------
