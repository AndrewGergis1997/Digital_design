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
--** Release date       : 12 Aug 2003
--** Developer          : SHL
--**
--**************************************************************************
-- *************************************************************************

library  ieee;
use     ieee.std_logic_1164.all;

-------------------------------------------------------------------------------
--  entity of bbc_intc declaration
-------------------------------------------------------------------------------
entity bbc_intc is
  generic (
    size 	: integer range 1 to 32;
    level_mask	: std_logic_vector(31 downto 0)
    
  );
  port (
      CLK       : in  	std_logic;
      RESETn    : in 	std_logic;
      
      IRQI	: in std_logic_vector((size-1) downto 0);
      IRQOn	: out std_logic
  );


end bbc_intc;


-------------------------------------------------------------------------------
--  architecture of bbc_intc declaration
-------------------------------------------------------------------------------

architecture behavioural of bbc_intc is
	

-------------------------------------------------------------------------------
--  Signal declarations
-------------------------------------------------------------------------------

begin


  process (IRQI,RESETn)
  variable tmp_irq : std_logic := '0';
  begin
    if (RESETn = '0') then
      IRQOn <= '1';
    else
      tmp_irq := '0';
      for i in 0 to size - 1 loop
        if ( (IRQI(i) = '0' and level_mask(i) = '0') or 
        (IRQI(i) = '1' and level_mask(i) = '1') ) then
          tmp_irq := '1';
        end if;
      end loop;
      if (tmp_irq = '1') then
        IRQOn <= '0';
      else  
        IRQOn <= '1';
      end if;
    end if;
  end process;

end behavioural ;

--------------------------------------------------------------------------------
--  Package for  bbc_intc declaration
-------------------------------------------------------------------------------
library  ieee;
use     ieee.std_logic_1164.all;

package bbc_intc_pkg is  
  component bbc_intc
  generic (
    size 	: integer range 1 to 32;
    level_mask	: std_logic_vector(31 downto 0)
    
  );
  port (
      CLK       : in  	std_logic;
      RESETn    : in 	std_logic;
      
      IRQI	: in std_logic_vector((size-1) downto 0);
      IRQOn	: out std_logic
  );
 end component;

end bbc_intc_pkg;

-------------------------------------------------------------------------------

