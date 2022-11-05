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
--**************************************************************************
--- *************************************************************************

library ieee;
use     ieee.std_logic_1164.all;
use 	IEEE.std_logic_arith.all;

entity $BBCId:BIFName$_bif is
  port (

--------------------------------- PVCI Master interface ------------------------------
    CLOCK    :   in  std_logic;
    ACK  	: in std_logic;
    VAL         : out std_logic;
    ADDRESS        : out std_logic_vector(15 downto 0);
    RD         : out std_logic;
    RDATA          : in std_logic_vector(7 downto 0);
    WDATA          : out std_logic_vector(7 downto 0)
    );

end $BBCId:BIFName$_bif ;


architecture structural of $BBCId:BIFName$_bif is


begin

----------------------------------------
-- empty
----------------------------------------

end structural ;


-------------------------------------------------------------------------------

library ieee;
use     ieee.std_logic_1164.all;
use 	IEEE.std_logic_arith.all;

package $BBCId:BIFName$_bif_pkg is  
  component $BBCId:BIFName$_bif
  port (
  
--------------------------------- PVCI Master interface ------------------------------
    CLOCK    :   in  std_logic;
    ACK  	: in std_logic;
    VAL         : out std_logic;
    ADDRESS        : out std_logic_vector(15 downto 0);
    RD         : out std_logic;
    RDATA          : in std_logic_vector(7 downto 0);
    WDATA          : out std_logic_vector(7 downto 0)
    );

  end component;

end $BBCId:BIFName$_bif_pkg;



