-- Copyright Mentor Graphics Corporation 2004
--
--    All Rights Reserved.
--
-- THIS WORK CONTAINS TRADE SECRET
-- AND PROPRIETARY INFORMATION WHICH IS THE
-- PROPERTY OF MENTOR GRAPHICS
-- CORPORATION OR ITS LICENSORS AND IS
-- SUBJECT TO LICENSE TERMS. 

--**************************************************************************
--** Release            : 1
--** Release date       : 05 Aug 2003
--** Developer          : SHL
--**
--**************************************************************************
-- 
-- ************************************************************************

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

library work;
use work.sram_pkg.all;

-------------------------------------------------------------------------------
--  entity of bbc_sram declaration
-------------------------------------------------------------------------------
entity bbc_sram is
   generic (
    size 	: integer range 1 to 4;
    devaddr 	: std_logic_vector(31 downto 0);
    devamax	: integer range 2 to 32;
    addr_size   : integer range 2 to 32
   );
   port (
      CLK       : in  	std_logic;
      RESETn    : in 	std_logic;
      
      ADDR	: in   std_logic_vector(31 downto 0);
      SEL	: in  std_logic;
      WR        : in   std_logic;
      WBE   	: in   std_logic_vector(3 downto 0);
      RDATA     : out  std_logic_vector(31 downto 0);
      WDATA     : in   std_logic_vector(31 downto 0)
   );
end bbc_sram;


-------------------------------------------------------------------------------
--  architecture of bbc_sram declaration
-------------------------------------------------------------------------------
architecture interface of bbc_sram  is
 
-- components

--   for all : sram use entity work.sram(interface);

 
signal DQ       : std_logic_vector (31 downto 0):= (others => '0');
signal ADDR_OK  : std_logic := '0';
signal OE       : std_logic := '1';
signal CE       : std_logic := '1';
signal WE       : std_logic_vector(3 downto 0) := (others => '1');

signal RDATA_EN : std_logic := '0';

begin -- architecture interface begins here

  RDATA(8*size-1 downto 0) <= DQ(8*size-1 downto 0) when 
    (WR = '0' and ADDR_OK = '1' and RDATA_EN = '1') else (others => 'Z');


  ADDR_OK <= '1' when 
     (ADDR(devamax-1 downto addr_size) = devaddr(devamax-1 downto
     addr_size) and SEL = '1') else '0';

  
  DQ <= WDATA when
    (OE = '1' and ADDR_OK = '1') else (others => 'Z');

  CE <= not ADDR_OK;

  process(SEL, WR)
  begin
    if(SEL'event and SEL = '1') then
      if(WR = '1') then
        WE <= not WBE after 1 ns;
	RDATA_EN <= '0';
      else
        OE <= '0';
	RDATA_EN <= '1';
      end if;
    elsif(SEL'event and SEL = '0') then
      OE <= '1';
    elsif(WR'event and WR = '0') then
      WE <= "1111";
    end if;
  end process;

-----------------------------------------------
-- Component mappings
-----------------------------------------------
s : for i in 0 to size-1 generate
    gen_sram : sram 
       generic map (
         NUM_ADDR_BITS => addr_size - size/2, 
         NUM_DATA_BITS => 8) 
       port map (
         ADDR => ADDR(addr_size-1 downto size/2),
         CE => CE,
         DQ => DQ(7+8*i downto 8*i),
         OE => OE,
         WE => WE(i));
    end generate;
    

end interface;



-------------------------------------------------------------------------------
--  Package for bbc_sram Component
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

package bbc_sram_pkg is
   component bbc_sram
   generic (
    size 	: integer range 1 to 4;
    devaddr 	: std_logic_vector(31 downto 0);
    devamax	: integer range 2 to 32;
    addr_size   : integer range 2 to 32
   );
   port (
      CLK       : in  	std_logic;
      RESETn    : in 	std_logic;
      
      ADDR	: in   std_logic_vector(31 downto 0);
      SEL	: in  std_logic;
      WR        : in   std_logic;
      WBE   	: in   std_logic_vector(3 downto 0);
      RDATA     : out  std_logic_vector(31 downto 0);
      WDATA     : in   std_logic_vector(31 downto 0)
   );
   end component;
end bbc_sram_pkg;
-------------------------------------------------------------------------------

