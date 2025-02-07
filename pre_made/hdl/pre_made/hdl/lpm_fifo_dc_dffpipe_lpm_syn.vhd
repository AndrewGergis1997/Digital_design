-- VHDL Entity lpm.lpm_fifo_dc_dffpipe.symbol
--
-- Created:
--          by - user.group (host.domain)
--          at - 12:04:44 02/18/03
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2003.1
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE IEEE.std_logic_unsigned.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY lpm_fifo_dc_dffpipe IS
   GENERIC( 
      lpm_DELAY : natural
   );
   PORT( 
      D     : IN     integer;
      Q     : OUT    integer    := 0;
      CLOCK : IN     std_logic;
      ACLR  : IN     std_logic  := '0'
   );

-- Declarations

END lpm_fifo_dc_dffpipe ;


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
architecture lpm_syn of lpm_fifo_dc_dffpipe is
type delaypipe is array (LPM_DELAY downto 0) of integer;

begin

    process (clock, aclr, d)
    variable intpipe : delaypipe := (OTHERS => 0);
    variable delay : integer := LPM_DELAY-1;
    variable init : integer := 0;
    begin
        if (LPM_DELAY = 0) then
            if (aclr = '1' or init = 0) then
                q <= 0;
                init := 1;
            else
                q <= d;
            end if;
        else
            if (aclr = '1' or init = 0) then
                for i in LPM_DELAY downto 0 loop
                    intpipe(i) := 0;
                end loop;
                init := 1;
                q <= 0;
            end if;
            if (clock'event and clock = '1' and NOW > 0 ns) then
                if (delay > 0) then
                    for i in delay downto 1 loop
                        intpipe(i) := intpipe(i-1);
                    end loop;
                end if;
                intpipe(0) := d;
                q <= intpipe(delay);
            end if;
        end if;
    end process;

end lpm_syn;
