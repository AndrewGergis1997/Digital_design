library cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
--------------------------------------------------------------------------------
--
--   mc68040 Model QuickHDL VHDL Interface
--
--   Copyright (c) MENTOR GRAPHICS CORPORATION 1996,1997 All Rights Reserved
--                      UNPUBLISHED, LICENSED SOFTWARE.
--         CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
--         PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS.
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Bridge to mc68040 Model engine
--
--  The foreign attribute causes the bridge function for the Model to
--  be executed.
--------------------------------------------------------------------------------

entity mc68040_engine_e is
  attribute foreign : string;
end mc68040_engine_e;

architecture engine_a of mc68040_engine_e is
  attribute foreign of engine_a : architecture is
	"mc68040_InitQhdl $CVE_HOME/lib/mc68040_qhdl.slib;";
begin
end engine_a;

--------------------------------------------------------------------------------
--  mc68040 Pin Interface
--------------------------------------------------------------------------------

library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use std.textio.all;
use ieee.std_logic_1164.all;


entity mc68040 is
   generic (
        DEFAULT_PIN_DELAY : time := 1 ns; --Default output delay
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/mc68040_20MHz";
        CVE_NAME          : string := ""; --Logical name for instance
        CVE_CPU_TYPE      : string := "68040" --Type of 68040, Do Not Modify
           );
   port (
        A         : inout std_logic_vector ( 31 downto 0 ) := (others => 'Z');
        D         : inout std_logic_vector ( 31 downto 0 ) := (others => 'Z');
        TT        : inout std_logic_vector ( 1 downto 0 ) := (others => 'Z');
        TM        : out std_logic_vector ( 2 downto 0 ) := (others => 'Z');
        TLN       : out std_logic_vector ( 1 downto 0 ) := (others => 'Z');
        UPA       : out std_logic_vector ( 1 downto 0 ) := (others => 'Z');
        R_W_BAR   : inout std_logic := 'Z';
        SIZ       : inout std_logic_vector ( 1 downto 0 ) := (others => 'Z');
        LOCK_BAR  : out std_logic := 'Z';
        LOCKE_BAR : out std_logic := 'Z';
        CIOUT_BAR : out std_logic := 'Z';
        TS_BAR    : inout std_logic := 'Z';
        TIP_BAR   : out std_logic := 'Z';
        TA_BAR    : inout std_logic := 'Z';
        TEA_BAR   : in std_logic;
        TCI_BAR   : in std_logic;
        TBI_BAR   : in std_logic;
        DLE       : in std_logic;
        SC        : inout std_logic_vector ( 1 downto 0 ) := (others => 'Z');
        MI_BAR    : out std_logic := 'Z';
        BR_BAR    : out std_logic := 'Z';
        BG_BAR    : in std_logic;
        BB_BAR    : inout std_logic := 'Z';
        CDIS_BAR  : in std_logic;
        MDIS_BAR  : in std_logic;
        RSTI_BAR  : in std_logic;
        RSTO_BAR  : out std_logic := 'Z';
        IPL0_BAR  : in std_logic;
        IPL1_BAR  : in std_logic;
        IPL2_BAR  : in std_logic;
        IPEND_BAR : out std_logic := 'Z';
        AVEC_BAR  : in std_logic;
        PST       : out std_logic_vector ( 3 downto 0 ) := (others => 'Z');
        BCLK      : in std_logic;
        PCLK      : in std_logic;
        TCK       : in std_logic;
        TMS       : in std_logic;
        TDI       : in std_logic;
        TDO       : out std_logic := 'Z';
        TRST_BAR  : in std_logic
        );

end mc68040;

architecture interface of mc68040 is


  component mc68040_engine_e
  end component;

  for all : mc68040_engine_e use entity cve_qhdl_vhdl_lib.mc68040_engine_e(engine_a);


begin

-- This dummy process makes generics visible.  It must appear before
-- the instance of the model engine so that the model engine can see the
-- generics when it is allocating and initializing.

  process ( RSTI_BAR )
    begin
    end process;

-- Bridge to Model

  engine : mc68040_engine_e;

end interface;

-------------------------------------------------------------------------------
--  Package for mc68040 Component
-------------------------------------------------------------------------------
 
library ieee, cve_qhdl_vhdl_lib;
use cve_qhdl_vhdl_lib.all;
use ieee.std_logic_1164.all;
 

package mc68040_pkg is

  component mc68040
 
   generic (
        DEFAULT_PIN_DELAY : time := 1 ns; --Default output delay
        PIN_DELAY_FILE    : string := "$CVE_HOME/delays/mc68040_20MHz";
        CVE_NAME          : string := ""; --Logical name for instance
        CVE_CPU_TYPE      : string := "68040" --Type of 68040, Do Not Modify
   );
 
   port (
        A         : inout std_logic_vector ( 31 downto 0 ) := (others => 'Z');
        D         : inout std_logic_vector ( 31 downto 0 ) := (others => 'Z');
        TT        : inout std_logic_vector ( 1 downto 0 ) := (others => 'Z');
        TM        : out std_logic_vector ( 2 downto 0 ) := (others => 'Z');
        TLN       : out std_logic_vector ( 1 downto 0 ) := (others => 'Z');
        UPA       : out std_logic_vector ( 1 downto 0 ) := (others => 'Z');
        R_W_BAR   : inout std_logic := 'Z';
        SIZ       : inout std_logic_vector ( 1 downto 0 ) := (others => 'Z');
        LOCK_BAR  : out std_logic := 'Z';
        LOCKE_BAR : out std_logic := 'Z';
        CIOUT_BAR : out std_logic := 'Z';
        TS_BAR    : inout std_logic := 'Z';
        TIP_BAR   : out std_logic := 'Z';
        TA_BAR    : inout std_logic := 'Z';
        TEA_BAR   : in std_logic;
        TCI_BAR   : in std_logic;
        TBI_BAR   : in std_logic;
        DLE       : in std_logic;
        SC        : inout std_logic_vector ( 1 downto 0 ) := (others => 'Z');
        MI_BAR    : out std_logic := 'Z';
        BR_BAR    : out std_logic := 'Z';
        BG_BAR    : in std_logic;
        BB_BAR    : inout std_logic := 'Z';
        CDIS_BAR  : in std_logic;
        MDIS_BAR  : in std_logic;
        RSTI_BAR  : in std_logic;
        RSTO_BAR  : out std_logic := 'Z';
        IPL0_BAR  : in std_logic;
        IPL1_BAR  : in std_logic;
        IPL2_BAR  : in std_logic;
        IPEND_BAR : out std_logic := 'Z';
        AVEC_BAR  : in std_logic;
        PST       : out std_logic_vector ( 3 downto 0 ) := (others => 'Z');
        BCLK      : in std_logic;
        PCLK      : in std_logic;
        TCK       : in std_logic;
        TMS       : in std_logic;
        TDI       : in std_logic;
        TDO       : out std_logic := 'Z';
        TRST_BAR  : in std_logic
      );
  end component;
 
end mc68040_pkg;
 
-------------------------------------------------------------------------------
