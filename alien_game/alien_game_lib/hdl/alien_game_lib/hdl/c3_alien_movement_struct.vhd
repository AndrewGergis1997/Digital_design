-- VHDL Entity alien_game_lib.c3_alien_movement.symbol
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-720-SPC)
--          at - 11:37:31 14.10.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c3_alien_movement IS
   PORT( 
      clk          : IN     std_logic;
      currentpoint : IN     std_logic;
      enable       : IN     std_logic;
      rst          : IN     std_logic;
      x_coord      : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c3_alien_movement ;

--
-- VHDL Architecture alien_game_lib.c3_alien_movement.struct
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-720-SPC)
--          at - 11:37:31 14.10.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c3_alien_movement IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL d    : std_logic_vector(2 DOWNTO 0);
   SIGNAL din1 : std_logic_vector(2 DOWNTO 0);
   SIGNAL q    : std_logic_vector(2 DOWNTO 0);
   SIGNAL y    : std_logic_vector(2 DOWNTO 0);
   SIGNAL y1   : std_logic_vector(2 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_1' of 'adff'
   SIGNAL mw_U_1reg_cval : std_logic_vector(2 DOWNTO 0);

   -- Component Declarations
   COMPONENT c1_t3_incrementer
   PORT (
      x : IN     std_logic_vector (2 DOWNTO 0);
      y : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c1_t4_decrementer
   PORT (
      x : IN     std_logic_vector (2 DOWNTO 0);
      y : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c2_t3_bin2onehot
   PORT (
      binary_in   : IN     std_logic_vector (2 DOWNTO 0);
      one_hot_out : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c1_t3_incrementer USE ENTITY alien_game_lib.c1_t3_incrementer;
   FOR ALL : c1_t4_decrementer USE ENTITY alien_game_lib.c1_t4_decrementer;
   FOR ALL : c2_t3_bin2onehot USE ENTITY alien_game_lib.c2_t3_bin2onehot;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_1' of 'adff'
   q <= mw_U_1reg_cval;
   u_1seq_proc: PROCESS (clk, rst)
   BEGIN
      IF (rst = '0') THEN
         mw_U_1reg_cval <= "001";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_1reg_cval <= d;
      END IF;
   END PROCESS u_1seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'mux'
   u_4combo_proc: PROCESS(q, din1, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => d <= q;
      WHEN '1' => d <= din1;
      WHEN OTHERS => d <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_4combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'mux'
   u_5combo_proc: PROCESS(y1, y, currentpoint)
   BEGIN
      CASE currentpoint IS
      WHEN '0' => din1 <= y1;
      WHEN '1' => din1 <= y;
      WHEN OTHERS => din1 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_5combo_proc;

   -- Instance port mappings.
   U_0 : c1_t3_incrementer
      PORT MAP (
         x => q,
         y => y1
      );
   U_2 : c1_t4_decrementer
      PORT MAP (
         x => q,
         y => y
      );
   U_3 : c2_t3_bin2onehot
      PORT MAP (
         binary_in   => q,
         one_hot_out => x_coord
      );

END struct;
