-- VHDL Entity lpm.lpm_counter.symbol
--
-- Created:
--          by - user.group (host.domain)
--          at - 12:04:33 02/18/03
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2003.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY lpm_counter IS
   GENERIC( 
      lpm_WIDTH     : natural;
      lpm_MODULUS   : natural := 0;
      lpm_DIRECTION : string  := "UNUSED";
      lpm_AVALUE    : string  := "UNUSED";
      lpm_SVALUE    : string  := "UNUSED";
      lpm_PVALUE    : string  := "UNUSED";
      lpm_TYPE      : string  := "LPM_COUNTER";
      lpm_HINT      : string  := "UNUSED"
   );
   PORT( 
      aclr   : IN     std_logic                               := '0';
      aload  : IN     std_logic                               := '0';
      aset   : IN     std_logic                               := '0';
      cin    : IN     std_logic                               := '1';
      clk_en : IN     std_logic                               := '1';
      clock  : IN     std_logic;
      cnt_en : IN     std_logic                               := '1';
      data   : IN     std_logic_vector (lpm_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
      sclr   : IN     std_logic                               := '0';
      sload  : IN     std_logic                               := '0';
      sset   : IN     std_logic                               := '0';
      updown : IN     std_logic                               := '1';
      cout   : OUT    std_logic                               := '0';
      q      : OUT    std_logic_vector (lpm_WIDTH-1 DOWNTO 0)
   );

-- Declarations

END lpm_counter ;


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
architecture lpm_syn of lpm_counter is

signal COUNT : std_logic_vector(LPM_WIDTH downto 0);
signal INIT : std_logic := '0';
signal DIR : std_logic_vector(1 downto 0);

begin

    Direction: process (UPDOWN)
    begin
        if LPM_DIRECTION = "UP" then
            DIR <= "01";    -- increment
        elsif LPM_DIRECTION = "DOWN" then
            DIR <= "00";    -- decrement
        else
            DIR(0) <= UPDOWN;
            if UPDOWN = '0' or UPDOWN = '1' then
                DIR(1) <= '0';  -- increment or decrement
            else
                DIR(1) <= '1';  -- unknown
            end if;
        end if;
    end process Direction;

    Counter: process (CLOCK, ACLR, ASET, ALOAD, DATA, INIT)
	variable IAVALUE, ISVALUE : integer;
	variable IMODULUS : integer;
	begin
		if INIT = '0' then

            -- INITIALIZE TO PVALUE & SETUP VARIABLES --
			if LPM_PVALUE /= "UNUSED" then
				COUNT <= conv_std_logic_vector(str_to_int(LPM_PVALUE), LPM_WIDTH+1);
			else
				COUNT <= (OTHERS => '0');
			end if;

			if LPM_MODULUS = 0 then
				IMODULUS := 2 ** LPM_WIDTH;
			else
				IMODULUS := LPM_MODULUS;
			end if;

            -- CHECK PARAMETERS VALIDITY --
            if (LPM_DIRECTION /= "UNUSED" and LPM_DIRECTION /= "UP" and LPM_DIRECTION /= "DOWN") then
                ASSERT FALSE
                REPORT "Illegal LPM_DIRECTION property value for LPM_COUNTER!"
                SEVERITY ERROR;
            end if;

			INIT <= '1';
		else
			if ACLR =  '1' then
				COUNT <= (OTHERS => '0');
			elsif ASET = '1' then
				if LPM_AVALUE = "UNUSED" then
					COUNT <= (OTHERS => '1');
				else
					IAVALUE := str_to_int(LPM_AVALUE);
					COUNT <= conv_std_logic_vector(IAVALUE, LPM_WIDTH+1);
				end if;
			elsif ALOAD = '1' then
				COUNT(LPM_WIDTH-1 downto 0) <= DATA;
			elsif CLOCK'event and CLOCK = '1' then
				if CLK_EN = '1' then
					if SCLR = '1' then
						COUNT <= (OTHERS => '0');
					elsif SSET = '1' then
						if LPM_SVALUE = "UNUSED" then
							COUNT <= (OTHERS => '1');
						else
							ISVALUE := str_to_int(LPM_SVALUE);
							COUNT <= conv_std_logic_vector(ISVALUE, LPM_WIDTH+1);
						end if;
					elsif SLOAD = '1' then
						COUNT(LPM_WIDTH-1 downto 0) <= DATA;
					elsif CNT_EN = '1' then
						if IMODULUS = 1 then
							COUNT <= (OTHERS => '0');
                        elsif CIN = '1' then
                            if DIR(0) = '1' and DIR(1) = '0' then
                                -- INCREMENT --
                                if COUNT + 1 = IMODULUS then
                                    COUNT <= conv_std_logic_vector(0, LPM_WIDTH+1);
                                else
                                    COUNT <= COUNT + 1;
                                end if;
                            elsif DIR(0) = '0' and DIR(1) = '0' then
                                -- DECREMENT --
                                if COUNT = 0 then
                                    COUNT <= conv_std_logic_vector(IMODULUS-1, LPM_WIDTH+1);
                                else
                                    COUNT <= COUNT - 1;
                                end if;
                            end if;
						end if;
					end if;
				end if;
			end if;
		end if;
		
		COUNT(LPM_WIDTH) <= '0';
	end process Counter;

    CarryOut: process (COUNT, CIN, INIT, DIR)
	variable IMODULUS : integer;
	begin
		if INIT = '1' then
			if LPM_MODULUS = 0 then
				IMODULUS := 2 ** LPM_WIDTH;
			else
				IMODULUS := LPM_MODULUS;
			end if;

            if (DIR(1) = '0') then
                COUT <= '0';
                if IMODULUS = 1 then
                    COUT <= '1';
                elsif CIN = '1' then
                    if ((DIR(0) = '0' and COUNT = 0) or
                        (DIR(0) = '1' and (COUNT = IMODULUS - 1 or
                                           COUNT = 2**LPM_WIDTH-1) )) then
                        COUT <= '1';
                    end if;
                end if;
            end if;
		end if;
	end process CarryOut;

	Q <= COUNT(LPM_WIDTH-1 downto 0);

end lpm_syn;
