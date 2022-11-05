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
--**
--** Release            : 2
--** Release date       : 02 jul 2003
--** Developer          : SHL
--**
--**************************************************************************
-- *************************************************************************

library  ieee;
use     ieee.std_logic_1164.all;
use 	ieee.std_logic_arith.all;

-------------------------------------------------------------------------------
--  entity of bbcreg declaration
-------------------------------------------------------------------------------
entity bbcreg is
  generic (
    size 	: integer range 1 to 4;
    devaddr 	: std_logic_vector(31 downto 0);
    devamax	: integer range 2 to 32;
    init_data 	: std_logic_vector(31 downto 0);
    read_only 	: std_logic;
    mpi_mask 	: std_logic_vector(31 downto 0);
    wmask	: std_logic_vector(31 downto 0)
    
  );
  port (
      CLK       : in  	std_logic;
      RESETn    : in 	std_logic;
      
      ADDR	: in   std_logic_vector(31 downto 0);
      SEL	: in  std_logic;
      WR        : in   std_logic;
      WBE   	: in   std_logic_vector(3 downto 0);
      RDATA     : out  std_logic_vector(31 downto 0);
      WDATA     : in   std_logic_vector(31 downto 0);
      
      MPI	: in std_logic_vector((8*size-1) downto 0);
      MPO	: out std_logic_vector((8*size-1) downto 0)
  );


end bbcreg;


-------------------------------------------------------------------------------
--  architecture of bbcreg declaration
-------------------------------------------------------------------------------
library  ieee;
use     ieee.std_logic_1164.all;
use 	ieee.std_logic_arith.all;
use     ieee.std_logic_unsigned.conv_integer;

architecture behavioural of bbcreg is
	

-------------------------------------------------------------------------------
--  Signal declarations
-------------------------------------------------------------------------------

signal L_DATA   : std_logic_vector(31 downto 0);
--signal CS	: std_logic;
signal ADDR_OK	: std_logic;

signal RDATA_EN : std_logic := '0';

begin


ADDR_OK <= '1' when 
     (ADDR(devamax-1 downto size/2) = devaddr(devamax-1 downto size/2) and 
      SEL = '1') else '0';

RDATA(8*size-1 downto 0) <= L_DATA(8*size-1 downto 0) when 
     (WR = '0' and ADDR_OK = '1' and RDATA_EN = '1') else (others => 'Z');

MPO <= L_DATA(8*size-1 downto 0);
L_DATA(8*size-1 downto 0) <= MPI;

  process(SEL)
  begin
      if(WR = '1') then
	RDATA_EN <= '0';
      else
	RDATA_EN <= '1';
      end if;
  end process;

reg_wr_pr :    process (CLK, RESETn)
  variable k : integer range 0 to 8;
  begin

    if RESETn /= '1' then 
      L_DATA <= init_data;

    elsif (CLK'event and CLK ='1') then
    
     
      if (WR = '1' and ADDR_OK = '1' and read_only = '0') then
        for i in 0 to 3 loop
          if(WBE(i) = '1') then
	    case size is
	      
	      when 1 =>
	      
--	        for j in 0 to 7 loop
--		  if(wmask(j) = '1') then
--		    L_DATA(j) <= WDATA(j+8*i);
--		  end if;
--	        end loop;

	      when 2 =>

	        k := 0;
--		if(i= 1 or i=3) then
--		  k := 8;
--	        end if;
--	        for j in 0 to 7 loop
--		  if(wmask(j+k) = '1') then
--		    L_DATA(j+k) <= WDATA(j+8*i);
--		  end if;
--	        end loop;

	      when others =>

--	        for j in 0 to 7 loop
--		  if(wmask(j+8*i) = '1') then
--		    L_DATA(j+8*i) <= WDATA(j+8*i);
--		  end if;
--	        end loop;


	    end case;

	  end if;
	end loop;
--    elsif(mpi_mask /= X"00000000") then
--	for j in 0 to 31 loop
--	  if(wmask(j) = '0' and mpi_mask(j) = '1') then
    end if;
          L_DATA(8*size-1 downto 0) <= MPI;

	  end if;
--	end loop;
--      end if;

  end process reg_wr_pr;


end behavioural ;

--------------------------------------------------------------------------------
--  Package for  bbcreg declaration
-------------------------------------------------------------------------------
library  ieee;
use     ieee.std_logic_1164.all;

package bbcreg_pkg is  
  component bbcreg
  generic (
    size 	: integer range 1 to 4;
    devaddr 	: std_logic_vector(31 downto 0);
    devamax	: integer range 2 to 32;
    init_data 	: std_logic_vector(31 downto 0);
    read_only 	: std_logic;
    mpi_mask 	: std_logic_vector(31 downto 0);
    wmask	: std_logic_vector(31 downto 0)
    
  );
  port (
      CLK       : in  	std_logic;
      RESETn    : in 	std_logic;
      
      ADDR	: in   std_logic_vector(31 downto 0);
      SEL	: in  std_logic;
      WR        : in   std_logic;
      WBE   	: in   std_logic_vector(3 downto 0);
      RDATA     : out  std_logic_vector(31 downto 0);
      WDATA     : in   std_logic_vector(31 downto 0);
      
      MPI	: in std_logic_vector((8*size-1) downto 0);
      MPO	: out std_logic_vector((8*size-1) downto 0)
  );
  end component;

end bbcreg_pkg;

-------------------------------------------------------------------------------

