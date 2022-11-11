-- VHDL Entity TIMER_Vhdl.Timer_tester.symbol
--
-- Created:
--          by - user.group (host.domain)
--          at - 10:08:55 04/12/05
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Timer_tester IS
   PORT( 
      alarm : IN     std_logic;
      high  : IN     std_logic_vector (3 DOWNTO 0);
      low   : IN     std_logic_vector (3 DOWNTO 0);
      clk   : OUT    std_logic;
      d     : OUT    std_logic_vector (9 DOWNTO 0);
      reset : OUT    std_logic;
      start : OUT    std_logic;
      stop  : OUT    std_logic
   );

-- Declarations

END Timer_tester ;

--
-- VHDL Architecture TIMER_Vhdl.Timer_tester.test
--
-- Created:
--          by - user.group (host.domain)
--          at - 10:08:55 04/12/05
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.all;
ARCHITECTURE test OF Timer_tester IS

   -- Architecture declarations
   -- Architecture declarations
   CONSTANT clk_prd : time := 100 ns;
   SIGNAL iclk : std_logic;
   SIGNAL high_temp : std_logic_vector(3 DOWNTO 0);
   SIGNAL low_temp : std_logic_vector(3 DOWNTO 0);
   PROCEDURE wait_clock(CONSTANT clk_ticks:integer) IS
   VARIABLE i : integer := 0;
   BEGIN
     FOR i IN 0 TO clk_ticks LOOP
        WAIT UNTIL rising_edge(iclk);
     END LOOP;
   END wait_clock;

BEGIN

   -----------------------------------------------------------------
   monitor_proc : PROCESS
   -----------------------------------------------------------------

   -- Process declarations
   -- Process declarations
   VARIABLE d_var : std_logic_vector(9 DOWNTO 0) := "0000000000";
   VARIABLE b_var : std_logic_vector(3 DOWNTO 0) := "0000";


   BEGIN
      stop<='0'; 
      start<='0'; 
      reset<='0'; 
      d<="0000000000"; 
      wait_clock(2); 
      reset<='1'; 
      wait_clock(6); 
      reset<='0';
      L1: FOR j IN 0 TO 9 LOOP
         d_var:="0000000000"; 
         d_var(j):='1'; 
         d<=d_var; 
         wait_clock(4); 
         ASSERT ((high=b_var)AND(low=b_var)) 
         REPORT "Decoder or Load failure." 
         SEVERITY failure; 
         b_var:=unsigned(b_var)+1;
      END LOOP L1;
      d<="0000001000"; 
      wait_clock(4); 
      start<='1'; 
      wait_clock(4); 
      start<='0'; 
      d<="0000000000"; 
      wait_clock(8);
      stop<='1'; 
      wait_clock(1); 
      -- Store high and low values 
      high_temp<=high; 
      low_temp<=low; 
      wait_clock(3);

      IF  (high=high_temp) 
                  AND (low=low_temp)  THEN
         ASSERT false 
         REPORT "Count suspended correctly" 
         SEVERITY note;
      ELSE
         ASSERT false 
         REPORT "Count did not suspend" 
         SEVERITY warning;
      END IF;
      wait_clock(4);
      stop<='0';
            wait until ((high="0000")AND(low="0000")) for 6000 ns ;
            wait for 200 ns ;
      IF  alarm='1'  THEN
         ASSERT false 
         REPORT "Alarm asserted correctly" 
         SEVERITY note;
      ELSE
         ASSERT false 
         REPORT "No alarm" 
         SEVERITY warning;
      END IF;

      -- Report completion
      stop<='1';
      wait_clock(2);
      stop<='0';
      wait_clock(4);
      ASSERT false
      REPORT "Timer test completed"
      SEVERITY Failure;
        wait;
   END PROCESS monitor_proc;

   -----------------------------------------------------------------
   clockgen_proc : PROCESS
   -----------------------------------------------------------------
   BEGIN
      iclk <= '0';
         WAIT FOR clk_prd/2;
      iclk <= '1';
         WAIT FOR clk_prd/2;
   END PROCESS clockgen_proc;


-- Architecture concurrent statements
clk <= iclk;

END test;
