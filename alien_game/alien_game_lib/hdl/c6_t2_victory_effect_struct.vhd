-- VHDL Entity alien_game_lib.c6_t2_victory_effect.symbol
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-722-SPC)
--          at - 17:51:22 22.11.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c6_t2_victory_effect IS
   PORT( 
      clk     : IN     std_logic;
      rst_n   : IN     std_logic;
      color   : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c6_t2_victory_effect ;

--
-- VHDL Architecture alien_game_lib.c6_t2_victory_effect.struct
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-715-SPC)
--          at - 12:58:48  2.12.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c6_t2_victory_effect IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL dout     : std_logic_vector(23 DOWNTO 0);
   SIGNAL x        : std_logic_vector(3 DOWNTO 0);
   SIGNAL x_coord1 : std_logic_vector(7 DOWNTO 0);
   SIGNAL y        : std_logic_vector(3 DOWNTO 0);
   SIGNAL y_coord1 : std_logic_vector(7 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_3' of 'adff'
   SIGNAL mw_U_3reg_cval : std_logic_vector(23 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_4' of 'adff'
   SIGNAL mw_U_4reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_5' of 'adff'
   SIGNAL mw_U_5reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_6' of 'adff'
   SIGNAL mw_U_6reg_cval : std_logic_vector(3 DOWNTO 0);

   -- Component Declarations
   COMPONENT c6_t2_x_coord_vic
   PORT (
      mux_signal : IN     std_logic_vector (3 DOWNTO 0);
      x_coord    : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c6_t2_y_coord_vic
   PORT (
      mux_signal : IN     std_logic_vector (3 DOWNTO 0);
      y_coord    : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT incrementer_4_bit
   PORT (
      x : IN     std_logic_vector (3 DOWNTO 0);
      y : OUT    std_logic_vector (3 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c6_t2_x_coord_vic USE ENTITY alien_game_lib.c6_t2_x_coord_vic;
   FOR ALL : c6_t2_y_coord_vic USE ENTITY alien_game_lib.c6_t2_y_coord_vic;
   FOR ALL : incrementer_4_bit USE ENTITY alien_game_lib.incrementer_4_bit;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_3' of 'adff'
   color <= mw_U_3reg_cval;
   u_3seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_3reg_cval <= "000000000000000000000001";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_3reg_cval <= dout;
      END IF;
   END PROCESS u_3seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'adff'
   x_coord <= mw_U_4reg_cval;
   u_4seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_4reg_cval <= "00000001";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_4reg_cval <= x_coord1;
      END IF;
   END PROCESS u_4seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'adff'
   y_coord <= mw_U_5reg_cval;
   u_5seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_5reg_cval <= "00000001";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_5reg_cval <= y_coord1;
      END IF;
   END PROCESS u_5seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'adff'
   x <= mw_U_6reg_cval;
   u_6seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_6reg_cval <= "0001";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_6reg_cval <= y;
      END IF;
   END PROCESS u_6seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_7' of 'constval'
   dout <= x"FFF00F";

   -- Instance port mappings.
   U_1 : c6_t2_x_coord_vic
      PORT MAP (
         mux_signal => y,
         x_coord    => x_coord1
      );
   U_2 : c6_t2_y_coord_vic
      PORT MAP (
         mux_signal => y,
         y_coord    => y_coord1
      );
   U_0 : incrementer_4_bit
      PORT MAP (
         x => x,
         y => y
      );

END struct;
