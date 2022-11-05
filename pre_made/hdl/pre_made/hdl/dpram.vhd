library cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
--------------------------------------------------------------------------------
--
--   dpram Model QuickHDL VHDL Interface
--
--   Copyright (c) MENTOR GRAPHICS CORPORATION 1996,1997 All Rights Reserved
--                      UNPUBLISHED, LICENSED SOFTWARE.
--         CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
--         PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS.
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Bridge to dpram Model engine
--
--  The foreign attribute causes the bridge function for the Model to
--  be executed.
--------------------------------------------------------------------------------

entity dpram_engine_e is
  attribute foreign : string;
end dpram_engine_e;

architecture engine_a of dpram_engine_e is
  attribute foreign of engine_a : architecture is
	"dpram_InitQhdl $CVE_HOME/lib/dpram_qhdl.slib;";
begin
end engine_a;

--------------------------------------------------------------------------------
--  dpram Pin Interface
--------------------------------------------------------------------------------

library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use std.textio.all;
use ieee.std_logic_1164.all;


entity dpram is
   generic (
        NUM_ADDR_BITS     : INTEGER := 8; --Width of address bus
        NUM_DATA_BITS     : INTEGER := 8; --Width of data bus
        DEFAULT_PIN_DELAY : time := 1 ns;
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/dpram_delays";
        CVE_NAME          : string := ""; --Logical name of this instance
        CVE_OPTIONS       : string := "" --Instance options
           );
   port (
        ADDRL : in std_logic_vector ( NUM_ADDR_BITS-1 downto 0 ); --Address bus left
        ADDRR : in std_logic_vector ( NUM_ADDR_BITS-1 downto 0 ); --Address bus right
        BUSYL : inout std_logic := 'Z'; --Busy left (active low)
        BUSYR : inout std_logic := 'Z'; --Busy right (active low)
        CEL   : in std_logic; --Chip enable left (active low)
        CER   : in std_logic; --Chip enable right (active low)
        DQL   : inout std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Databus left
        DQR   : inout std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Databus right
        INTL  : out std_logic := 'Z'; --Interrupt left (active low)
        INTR  : out std_logic := 'Z'; --Interrupt right (active low)
        MS    : in std_logic; --Master (high) / Slave (low)
        OEL   : in std_logic; --Output enable left (active low)
        OER   : in std_logic; --Output enable right (active low)
        SEML  : in std_logic; --Semaphore left (active low)
        SEMR  : in std_logic; --Semaphore right (active low)
        WEL   : in std_logic; --Write enable left (active low)
        WER   : in std_logic --Write enable right (active low)
        );

end dpram;

architecture interface of dpram is


  component dpram_engine_e
  end component;

  for all : dpram_engine_e use entity cve_qhdl_vhdl_lib.dpram_engine_e(engine_a);


begin

-- This dummy process makes generics visible.  It must appear before
-- the instance of the model engine so that the model engine can see the
-- generics when it is allocating and initializing.

  process ( CEL )
    begin
    end process;

-- Bridge to Model

  engine : dpram_engine_e;

end interface;

-------------------------------------------------------------------------------
--  Package for dpram Component
-------------------------------------------------------------------------------
 
library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use ieee.std_logic_1164.all;
 

package dpram_pkg is

  component dpram
 
   generic (
        NUM_ADDR_BITS     : INTEGER := 8; --Width of address bus
        NUM_DATA_BITS     : INTEGER := 8; --Width of data bus
        DEFAULT_PIN_DELAY : time := 1 ns;
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/dpram_delays";
        CVE_NAME          : string := ""; --Logical name of this instance
        CVE_OPTIONS       : string := "" --Instance options
   );
 
   port (
        ADDRL : in std_logic_vector ( NUM_ADDR_BITS-1 downto 0 ); --Address bus left
        ADDRR : in std_logic_vector ( NUM_ADDR_BITS-1 downto 0 ); --Address bus right
        BUSYL : inout std_logic := 'Z'; --Busy left (active low)
        BUSYR : inout std_logic := 'Z'; --Busy right (active low)
        CEL   : in std_logic; --Chip enable left (active low)
        CER   : in std_logic; --Chip enable right (active low)
        DQL   : inout std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Databus left
        DQR   : inout std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Databus right
        INTL  : out std_logic := 'Z'; --Interrupt left (active low)
        INTR  : out std_logic := 'Z'; --Interrupt right (active low)
        MS    : in std_logic; --Master (high) / Slave (low)
        OEL   : in std_logic; --Output enable left (active low)
        OER   : in std_logic; --Output enable right (active low)
        SEML  : in std_logic; --Semaphore left (active low)
        SEMR  : in std_logic; --Semaphore right (active low)
        WEL   : in std_logic; --Write enable left (active low)
        WER   : in std_logic --Write enable right (active low)
      );
  end component;
 
end dpram_pkg;
 
-------------------------------------------------------------------------------
