-- VHDL Entity alien_game_lib.c2_t3_bin2onehot.symbol
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-704-SPC)
--          at - 13:43:54 30.09.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t3_bin2onehot IS
   PORT( 
      binary_in   : IN     std_logic_vector (2 DOWNTO 0);
      one_hot_out : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c2_t3_bin2onehot ;

--
-- VHDL Architecture alien_game_lib.c2_t3_bin2onehot.tbl
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-704-SPC)
--          at - 14:02:10 30.09.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
ARCHITECTURE tbl OF c2_t3_bin2onehot IS
   
      -- Architecture declarations
    

BEGIN

   -----------------------------------------------------------------
   truth_process_proc: PROCESS(binary_in)
   -----------------------------------------------------------------
   BEGIN
      -- Block 1
      IF (binary_in = "000") THEN
         one_hot_out <= "00000001";
      ELSIF (binary_in = "001") THEN
         one_hot_out <= "00000010";
      ELSIF (binary_in = "010") THEN
         one_hot_out <= "00000100";
      ELSIF (binary_in = "011") THEN
         one_hot_out <= "00001000";
      ELSIF (binary_in = "100") THEN
         one_hot_out <= "00010000";
      ELSIF (binary_in = "101") THEN
         one_hot_out <= "00100000";
      ELSIF (binary_in = "110") THEN
         one_hot_out <= "01000000";
      ELSIF (binary_in = "111") THEN
         one_hot_out <= "10000000";
      END IF;

   END PROCESS truth_process_proc;

-- Architecture concurrent statements
 

END tbl;
