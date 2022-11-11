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
-- Entity: 	apb_iface
-- File:	apb_iface.vhd
-- Author:	SHL
-- Description:	APB interface.
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity apb_iface is
  generic(
    DEVADDR_NUM : integer
  );
  port (
    CLK    	: in  std_logic;
    RESETn 	: in  std_logic;

    PSEL        : in std_logic;
    PENABLE     : in std_logic;
    PADDR       : in std_logic_vector(31 downto 0);
    PWRITE      : in std_logic;
    PWDATA      : in std_logic_vector(31 downto 0);
    PRDATA      : out std_logic_vector(31 downto 0);

    REG_ADDR	: out std_logic_vector(31 downto 0);
    REG_SEL	: out std_logic;
    REG_ACK 	: in  std_logic_vector(DEVADDR_NUM-1 downto 0);
    REG_WR 	: out std_logic;
    REG_WBE	: out std_logic_vector(3 downto 0);
    REG_WDATA   : out std_logic_vector(31 downto 0);
    REG_RDATA   : in std_logic_vector(31 downto 0)
    
  );
end apb_iface;

architecture behavioural of apb_iface is


begin

REG_ADDR (31 downto 2) <= paddr(31 downto 2);
REG_ADDR (1 downto 0) <= "00";
REG_SEL <= PSEL;
REG_WR <= PWRITE;
PRDATA <= REG_RDATA when (PENABLE = '1' and PWRITE = '0') else (others => '0');
REG_WDATA <= PWDATA;
REG_WBE <= "1111" when (PENABLE = '1' and PWRITE = '1') else "0000";
REG_WR <= '1' when (PSEL = '1' and PWRITE = '1') else '0';


end behavioural;


-------------------------------------------------------------------------------
--  Package 
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;


package apb_iface_pkg is  
  component apb_iface
  generic(
    DEVADDR_NUM : integer
  );
  port (
    CLK    	: in  std_logic;
    RESETn 	: in  std_logic;

    PSEL        : in std_logic;
    PENABLE     : in std_logic;
    PADDR       : in std_logic_vector(31 downto 0);
    PWRITE      : in std_logic;
    PWDATA      : in std_logic_vector(31 downto 0);
    PRDATA      : out std_logic_vector(31 downto 0);

    REG_ADDR	: out  std_logic_vector(31 downto 0);
    REG_SEL	: out  std_logic;
    REG_ACK 	: in  std_logic_vector(DEVADDR_NUM-1 downto 0);
    REG_WR 	: out  std_logic;
    REG_WBE	: out  std_logic_vector(3 downto 0);
    REG_WDATA   : out std_logic_vector(31 downto 0);
    REG_RDATA   : in std_logic_vector(31 downto 0)
   
  );
  end component;

end apb_iface_pkg;

-------------------------------------------------------------------------------


