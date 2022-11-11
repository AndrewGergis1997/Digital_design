-- VHDL Entity lpm.lpm_ff.symbol
--
-- Created:
--          by - user.group (host.domain)
--          at - 12:04:35 02/18/03
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2003.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY lpm_ff IS
   GENERIC( 
      lpm_WIDTH  : natural;
      lpm_AVALUE : string := "UNUSED";
      lpm_SVALUE : string := "UNUSED";
      lpm_PVALUE : string := "UNUSED";
      lpm_FFTYPE : string := "DFF";
      lpm_TYPE   : string := "LPM_FF";
      lpm_HINT   : string := "UNUSED"
   );
   PORT( 
      aclr   : IN     std_logic  := '0';
      aload  : IN     std_logic  := '0';
      aset   : IN     std_logic  := '0';
      clock  : IN     std_logic;
      data   : IN     std_logic_vector (lpm_WIDTH-1 DOWNTO 0);
      enable : IN     std_logic  := '1';
      sclr   : IN     std_logic  := '0';
      sload  : IN     std_logic  := '0';
      sset   : IN     std_logic  := '0';
      q      : OUT    std_logic_vector (lpm_WIDTH-1 DOWNTO 0)
   );

-- Declarations

END lpm_ff ;


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
architecture lpm_syn of lpm_ff is

signal IQ : std_logic_vector(LPM_WIDTH-1 downto 0) := (OTHERS => '0');
signal INIT : std_logic := '0';

begin

	process (DATA, CLOCK, ACLR, ASET, ALOAD, INIT)
	variable IAVALUE, ISVALUE : integer;
	begin
		-- INITIALIZE TO PVALUE --
		if INIT = '0' then
			if LPM_PVALUE /= "UNUSED" then
				IQ <= conv_std_logic_vector(str_to_int(LPM_PVALUE), LPM_WIDTH);
			end if;
            if LPM_FFTYPE /= "DFF" and LPM_FFTYPE /= "TFF" then
                ASSERT FALSE
                REPORT "Illegal LPM_FFTYPE property value for LPM_FF!"
                SEVERITY ERROR;
            end if;
			INIT <= '1';
		elsif ACLR =  '1' then
			IQ <= (OTHERS => '0');
		elsif ASET = '1' then
			if LPM_AVALUE = "UNUSED" then
				IQ <= (OTHERS => '1');
			else
				IAVALUE := str_to_int(LPM_AVALUE);
				IQ <= conv_std_logic_vector(IAVALUE, LPM_WIDTH);
			end if;
		elsif ALOAD = '1' then
			if LPM_FFTYPE = "TFF" then
				IQ <= DATA;
			end if;
        elsif CLOCK'event and CLOCK = '1' and NOW > 0 ns then
			if ENABLE = '1' then
				if SCLR = '1' then
					IQ <= (OTHERS => '0');
				elsif SSET = '1' then
					if LPM_SVALUE = "UNUSED" then
						IQ <= (OTHERS => '1');
					else
						ISVALUE := str_to_int(LPM_SVALUE);
						IQ <= conv_std_logic_vector(ISVALUE, LPM_WIDTH);
					end if;
				elsif  SLOAD = '1' then
					if LPM_FFTYPE = "TFF" then
						IQ <= DATA;
					end if;
				else
					if LPM_FFTYPE = "TFF" then
						for i in 0 to LPM_WIDTH-1 loop
							if DATA(i) = '1' then
								IQ(i) <= not IQ(i);
							end if;
						end loop;
					else
						IQ <= DATA;
					end if;
				end if;
			end if;
		end if;
	end process;

	Q <= IQ;

end lpm_syn;
