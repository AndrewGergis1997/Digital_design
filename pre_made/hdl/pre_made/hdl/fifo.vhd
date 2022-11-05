library cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
--------------------------------------------------------------------------------
--
--   fifo Model QuickHDL VHDL Interface
--
--   Copyright (c) MENTOR GRAPHICS CORPORATION 1996,1997 All Rights Reserved
--                      UNPUBLISHED, LICENSED SOFTWARE.
--         CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
--         PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS.
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Bridge to fifo Model engine
--
--  The foreign attribute causes the bridge function for the Model to
--  be executed.
--------------------------------------------------------------------------------

entity fifo_engine_e is
  attribute foreign : string;
end fifo_engine_e;

architecture engine_a of fifo_engine_e is
  attribute foreign of engine_a : architecture is
	"fifo_InitQhdl $CVE_HOME/lib/fifo_qhdl.slib;";
begin
end engine_a;

--------------------------------------------------------------------------------
--  fifo Pin Interface
--------------------------------------------------------------------------------

library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use std.textio.all;
use ieee.std_logic_1164.all;


entity fifo is
   generic (
        NUM_DATA_BITS     : INTEGER := 8; --Width of data bus
        DEPTH             : INTEGER := 256; --Depth of fifo
        DEFAULT_PIN_DELAY : time := 1 ns;
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/fifo_delays";
        CVE_NAME          : string := ""; --Logical name of this instance
        CVE_OPTIONS       : string := "" --Instance options
           );
   port (
        AEF : out std_logic := 'Z'; --Almost-empty flag (active low)
        AFF : out std_logic := 'Z'; --Almost-full flag (active low)
        D   : in std_logic_vector ( NUM_DATA_BITS-1 downto 0 ); --Input databus
        EF  : out std_logic := 'Z'; --Empty flag (active low)
        FF  : out std_logic := 'Z'; --Full flag (active low)
        HF  : out std_logic := 'Z'; --Half-full flag (active low)
        Q   : out std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Output databus
        RE  : in std_logic; --Read enable (active low)
        RS  : in std_logic; --Reset (active low)
        WE  : in std_logic --Write enable (active low)
        );

end fifo;

architecture interface of fifo is


  component fifo_engine_e
  end component;

  for all : fifo_engine_e use entity cve_qhdl_vhdl_lib.fifo_engine_e(engine_a);


begin

-- This dummy process makes generics visible.  It must appear before
-- the instance of the model engine so that the model engine can see the
-- generics when it is allocating and initializing.

  process ( RE )
    begin
    end process;

-- Bridge to Model

  engine : fifo_engine_e;

end interface;

-------------------------------------------------------------------------------
--  Package for fifo Component
-------------------------------------------------------------------------------
 
library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use ieee.std_logic_1164.all;
 

package fifo_pkg is

  component fifo
 
   generic (
        NUM_DATA_BITS     : INTEGER := 8; --Width of data bus
        DEPTH             : INTEGER := 256; --Depth of fifo
        DEFAULT_PIN_DELAY : time := 1 ns;
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/fifo_delays";
        CVE_NAME          : string := ""; --Logical name of this instance
        CVE_OPTIONS       : string := "" --Instance options
   );
 
   port (
        AEF : out std_logic := 'Z'; --Almost-empty flag (active low)
        AFF : out std_logic := 'Z'; --Almost-full flag (active low)
        D   : in std_logic_vector ( NUM_DATA_BITS-1 downto 0 ); --Input databus
        EF  : out std_logic := 'Z'; --Empty flag (active low)
        FF  : out std_logic := 'Z'; --Full flag (active low)
        HF  : out std_logic := 'Z'; --Half-full flag (active low)
        Q   : out std_logic_vector ( NUM_DATA_BITS-1 downto 0 ) := (others => 'Z'); --Output databus
        RE  : in std_logic; --Read enable (active low)
        RS  : in std_logic; --Reset (active low)
        WE  : in std_logic --Write enable (active low)
      );
  end component;
 
end fifo_pkg;
 
-------------------------------------------------------------------------------
