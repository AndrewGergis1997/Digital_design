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
-- Entity: 	ahb_iface
-- File:	ahb_iface.vhd
-- Author:	SHL
-- Description:	AHB interface for BBC.
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.conv_integer;

library work;
use work.amba.all;

entity ahb_iface is
  generic(
    DEVADDR_NUM : integer
  );
  port (
    CLK    	: in  std_logic;
    RESETn 	: in  std_logic;

    ahbsi  	: in  ahb_slv_in_type;
    ahbso  	: out ahb_slv_out_type;

    REG_ADDR	: out std_logic_vector(31 downto 0);
    REG_SEL	: out std_logic;
    REG_ACK 	: in  std_logic_vector(DEVADDR_NUM-1 downto 0);
    REG_WR 	: out std_logic;
    REG_WBE	: out std_logic_vector(3 downto 0);
    REG_WDATA   : out std_logic_vector(31 downto 0);
    REG_RDATA   : in std_logic_vector(31 downto 0)
    
  );
end ahb_iface;

-------------------------------------------------------------------------------
--  architecture of ahb_iface declaration
-------------------------------------------------------------------------------
architecture behavioural of ahb_iface is

type reg_type is record
  write  : std_logic;
  hready : std_logic;
  addr   : std_logic_vector(31 downto 0);
  size   : std_logic_vector(1 downto 0);
end record;


begin

ahbso.hresp <= "00"; ahbso.hsplit <= (others => '0');
REG_WDATA <= ahbsi.hwdata;
ahbso.hrdata <= REG_RDATA after 3 ns;


  
  
  comb : process (CLK, RESETn)
  variable v, q : reg_type;
  variable addr_ok : std_logic;
  variable busy_v : std_logic;
  variable busy_q : std_logic;
  variable hready : std_logic;
  variable cs_cur : integer range 0 to 32;

  begin
    v.write := '0';
    
    addr_ok := '0';
    cs_cur := 0;


    if RESETn = '0' then 
      v.write := '0';
      ahbso.hready <= '1';
      busy_q := '0';
      busy_v := '0';
      REG_WR <= '0';
      REG_WBE <= (others => '0');
      hready := '1';
    elsif (CLK'event and CLK ='1') then
      if (ahbsi.hready and ahbsi.hsel and ahbsi.htrans(1) 
       and not busy_v) = '1' then
        v.write := ahbsi.hwrite;
        v.addr := ahbsi.haddr(31 downto 0);
        v.size := ahbsi.hsize(1 downto 0);
        busy_v := '1';
      end if;

      if (busy_v = '1' and busy_q = '0') then
        busy_q := '1';
        q := v;
        busy_v := '0';

        REG_SEL <= '1' after 1 ns;
	REG_ADDR <= q.addr;
        REG_WR <= q.write;
        hready := '1';
        
	if q.write = '1' then
          case q.size(1 downto 0) is
            when "00" => REG_WBE (conv_integer(q.addr(1 downto 0))) <= '1';
            when "01" => REG_WBE <= q.addr(1) & q.addr(1) & not (q.addr(1) & q.addr(1));
            when others => REG_WBE <= (others => '1');
          end case;
        end if;
      
      elsif (busy_q = '1' and hready = '1') then
        REG_WR <= '0';
	REG_WBE    <= (others => '0');
	busy_q := '0';
        REG_SEL <= '0' after 3 ns;
      end if; 
    end if;
     
 
  end process;



end behavioural;


-------------------------------------------------------------------------------
--  Package 
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.amba.all;

package ahb_iface_pkg is  
  component ahb_iface
  generic(
    DEVADDR_NUM : integer
  );
  port (
    CLK    	: in  std_logic;
    RESETn 	: in  std_logic;

    ahbsi  	: in  ahb_slv_in_type;
    ahbso  	: out ahb_slv_out_type;

    REG_ADDR	: out std_logic_vector(31 downto 0);
    REG_SEL	: out std_logic;
    REG_ACK 	: in  std_logic_vector(DEVADDR_NUM-1 downto 0);
    REG_WR 	: out std_logic;
    REG_WBE	: out std_logic_vector(3 downto 0);
    REG_WDATA   : out std_logic_vector(31 downto 0);
    REG_RDATA   : in std_logic_vector(31 downto 0)
    
  );
  end component;

end ahb_iface_pkg;

-------------------------------------------------------------------------------


