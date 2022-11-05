-- VHDL Entity TIMER_Vhdl.Timer_tb.symbol
--
-- Created:
--          by - user.group (host.domain)
--          at - 10:08:55 04/12/05
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.1
--


ENTITY Timer_tb IS
-- Declarations

END Timer_tb ;

--
-- VHDL Architecture TIMER_Vhdl.Timer_tb.struct
--
-- Created:
--          by - user.group (host.domain)
--          at - 10:08:56 04/12/05
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

-- pragma synthesis_off
LIBRARY TIMER_Vhdl;
-- pragma synthesis_on

ARCHITECTURE struct OF Timer_tb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL alarm : std_logic;
   SIGNAL clk   : std_logic;
   SIGNAL d     : std_logic_vector(9 DOWNTO 0);
   SIGNAL high  : std_logic_vector(3 DOWNTO 0);
   SIGNAL low   : std_logic_vector(3 DOWNTO 0);
   SIGNAL reset : std_logic;
   SIGNAL start : std_logic;
   SIGNAL stop  : std_logic;


   -- Component Declarations
   COMPONENT Timer
   PORT (
      clk   : IN     std_logic ;
      d     : IN     std_logic_vector (9 DOWNTO 0);
      reset : IN     std_logic ;
      start : IN     std_logic ;
      stop  : IN     std_logic ;
      alarm : OUT    std_logic ;
      high  : OUT    std_logic_vector (3 DOWNTO 0);
      low   : OUT    std_logic_vector (3 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT Timer_tester
   PORT (
      alarm : IN     std_logic ;
      high  : IN     std_logic_vector (3 DOWNTO 0);
      low   : IN     std_logic_vector (3 DOWNTO 0);
      clk   : OUT    std_logic ;
      d     : OUT    std_logic_vector (9 DOWNTO 0);
      reset : OUT    std_logic ;
      start : OUT    std_logic ;
      stop  : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Timer USE ENTITY TIMER_Vhdl.Timer;
   FOR ALL : Timer_tester USE ENTITY TIMER_Vhdl.Timer_tester;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   I0 : Timer
      PORT MAP (
         clk   => clk,
         d     => d,
         reset => reset,
         start => start,
         stop  => stop,
         alarm => alarm,
         high  => high,
         low   => low
      );
   I1 : Timer_tester
      PORT MAP (
         alarm => alarm,
         high  => high,
         low   => low,
         clk   => clk,
         d     => d,
         reset => reset,
         start => start,
         stop  => stop
      );

END struct;
