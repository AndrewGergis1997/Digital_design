-- VHDL Entity lpm.lpm_xor.symbol
--
-- Created:
--          by - user.group (host.domain)
--          at - 12:04:43 02/18/03
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2003.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY lpm_xor IS
   GENERIC( 
      lpm_WIDTH : natural;
      lpm_SIZE  : natural;
      lpm_TYPE  : string := "LPM_XOR";
      lpm_HINT  : string := "UNUSED"
   );
   PORT( 
      data   : IN     std_logic_2d (lpm_SIZE-1 DOWNTO 0, lpm_WIDTH-1 DOWNTO 0);
      result : OUT    std_logic_vector (lpm_WIDTH-1 DOWNTO 0)
   );

-- Declarations

END lpm_xor ;


--------------------------------------------------------------------------
--   This VHDL file was developed by Altera Corporation.  It may be
-- freely copied and/or distributed at no cost.  Any persons using this
-- file for any purpose do so at their own risk, and are responsible for
-- the results of such use.  Altera Corporation does not guarantee that
-- this file is complete, correct, or fit for any particular purpose.
-- NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  This notice must
-- accompany any copy of this file.
--
--------------------------------------------------------------------------
-- LPM Synthesizable Models (Support string type generic)
-- These models are based on LPM version 220 (EIA-IS103 October 1998).
-------------------------------------------------------------------------
-- Version Quartus v1.1 (lpm 220)      Date 02/01/01
--------------------------------------------------------------------------
architecture lpm_syn of lpm_xor is

signal RESULT_INT : std_logic_2d(LPM_SIZE-1 downto 0,LPM_WIDTH-1 downto 0);

begin

L1: for i in 0 to LPM_WIDTH-1 generate
		RESULT_INT(0,i) <= DATA(0,i);
L2:     for j in 0 to LPM_SIZE-2 generate
			RESULT_INT(j+1,i) <=  RESULT_INT(j,i) xor DATA(j+1,i);
L3:         if j = LPM_SIZE-2 generate
				RESULT(i) <= RESULT_INT(LPM_SIZE-1,i);
			end generate L3;
		end generate L2;
	end generate L1;

end lpm_syn;
