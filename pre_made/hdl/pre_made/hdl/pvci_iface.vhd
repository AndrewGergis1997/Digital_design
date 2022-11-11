-- Copyright Mentor Graphics Corporation 2004
--
--    All Rights Reserved.
--
-- THIS WORK CONTAINS TRADE SECRET
-- AND PROPRIETARY INFORMATION WHICH IS THE
-- PROPERTY OF MENTOR GRAPHICS
-- CORPORATION OR ITS LICENSORS AND IS
-- SUBJECT TO LICENSE TERMS. 

-----------------------------------------------------------------------------
-- Entity: 	pvci_iface
-- File:	pvci_iface.vhd
-- Author:	SHL
-- Description:	pvci interface.
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity pvci_iface is
  generic(
    DEVADDR_NUM : integer
  );
  port (
    CLK    	: in  std_logic;
    RESETn 	: in  std_logic;

    VAL         : in std_logic;
    ADDR        : in std_logic_vector(15 downto 0);
    RNW         : in std_logic;
    ACK  	: out std_logic;
    DI          : in std_logic_vector(7 downto 0);
    DO          : out std_logic_vector(7 downto 0);

    REG_ADDR	: out std_logic_vector(31 downto 0);
    REG_SEL	: out std_logic;
    REG_ACK 	: in  std_logic_vector(DEVADDR_NUM-1 downto 0);
    REG_WR 	: out std_logic;
    REG_WBE	: out std_logic_vector(3 downto 0);
    REG_WDATA   : out std_logic_vector(31 downto 0);
    REG_RDATA   : in std_logic_vector(31 downto 0)
    
  );
end pvci_iface;

architecture behavioural of pvci_iface is


begin

REG_ADDR (15 downto 2) <= ADDR(15 downto 2);
REG_ADDR (1 downto 0) <= "00";
REG_SEL <= VAL;
REG_WR <= not RNW;
DO <= REG_RDATA(7 downto 0) when (VAL = '1' and RNW = '1') else (others => '0');
REG_WDATA(7 downto 0) <= DI;
REG_WBE <= "1111" when (VAL = '1' and RNW = '0') else "0000";
REG_WR <= '1' when (VAL = '1' and RNW = '0') else '0';


end behavioural;


-------------------------------------------------------------------------------
--  Package 
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

package pvci_iface_pkg is  
  component pvci_iface
  generic(
    DEVADDR_NUM : integer
  );
  port (
    CLK    	: in  std_logic;
    RESETn 	: in  std_logic;


    VAL         : in std_logic;
    ADDR        : in std_logic_vector(15 downto 0);
    RNW         : in std_logic;
    ACK  	: out std_logic;
    DI          : in std_logic_vector(7 downto 0);
    DO          : out std_logic_vector(7 downto 0);

    REG_ADDR	: out  std_logic_vector(31 downto 0);
    REG_SEL	: out  std_logic;
    REG_ACK 	: in  std_logic_vector(DEVADDR_NUM-1 downto 0);
    REG_WR 	: out  std_logic;
    REG_WBE	: out  std_logic_vector(3 downto 0);
    REG_WDATA   : out std_logic_vector(31 downto 0);
    REG_RDATA   : in std_logic_vector(31 downto 0)
   
  );
  end component;

end pvci_iface_pkg;

-------------------------------------------------------------------------------


