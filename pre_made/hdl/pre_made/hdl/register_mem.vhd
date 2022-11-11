library cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
--------------------------------------------------------------------------------
--
--   register_mem Model QuickHDL VHDL Interface
--
--   Copyright (c) MENTOR GRAPHICS CORPORATION 1996,1997 All Rights Reserved
--                      UNPUBLISHED, LICENSED SOFTWARE.
--         CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
--         PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS.
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Bridge to register_mem Model engine
--
--  The foreign attribute causes the bridge function for the Model to
--  be executed.
--------------------------------------------------------------------------------

entity register_mem_engine_e is
  attribute foreign : string;
end register_mem_engine_e;

architecture engine_a of register_mem_engine_e is
  attribute foreign of engine_a : architecture is
	"register_mem_InitQhdl $CVE_HOME/lib/register_mem_qhdl.slib;";
begin
end engine_a;

--------------------------------------------------------------------------------
--  register_mem Pin Interface
--------------------------------------------------------------------------------

library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use std.textio.all;
use ieee.std_logic_1164.all;


entity register_mem is
   generic (
        NUM_DATA_BITS     : INTEGER := 8; --Width of databus
        DEFAULT_PIN_DELAY : time := 1 ns;
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/register_mem_delays";
        CVE_NAME          : string := "" --Logical name of this instance
           );
   port (
        D     : in std_logic_vector ( NUM_DATA_BITS-1 downto 0 ); --Input data bus
        OE    : in std_logic; --Output enable (active low)
        Q     : out std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Output data bus
        RESET : in std_logic; --Reset (active low)
        SET   : in std_logic; --Set (active low)
        WE    : in std_logic --Write enable (active low)
        );

end register_mem;

architecture interface of register_mem is


  component register_mem_engine_e
  end component;

  for all : register_mem_engine_e use entity cve_qhdl_vhdl_lib.register_mem_engine_e(engine_a);


begin

-- This dummy process makes generics visible.  It must appear before
-- the instance of the model engine so that the model engine can see the
-- generics when it is allocating and initializing.

  process ( OE )
    begin
    end process;

-- Bridge to Model

  engine : register_mem_engine_e;

end interface;

-------------------------------------------------------------------------------
--  Package for register_mem Component
-------------------------------------------------------------------------------
 
library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use ieee.std_logic_1164.all;
 

package register_mem_pkg is

  component register_mem
 
   generic (
        NUM_DATA_BITS     : INTEGER := 8; --Width of databus
        DEFAULT_PIN_DELAY : time := 1 ns;
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/register_mem_delays";
        CVE_NAME          : string := "" --Logical name of this instance
   );
 
   port (
        D     : in std_logic_vector ( NUM_DATA_BITS-1 downto 0 ); --Input data bus
        OE    : in std_logic; --Output enable (active low)
        Q     : out std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Output data bus
        RESET : in std_logic; --Reset (active low)
        SET   : in std_logic; --Set (active low)
        WE    : in std_logic --Write enable (active low)
      );
  end component;
 
end register_mem_pkg;
 
-------------------------------------------------------------------------------
