-- VHDL Entity alien_game_lib.c2_t1_hello_led_c.symbol
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-704-SPC)
--          at - 12:12:34  7.10.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t1_hello_led_c IS
   PORT( 
      btn : IN     std_logic_vector (3 DOWNTO 0);
      sw0 : IN     std_logic;
      RGB : OUT    std_logic_vector (23 DOWNTO 0);
      X   : OUT    std_logic_vector (7 DOWNTO 0);
      Y   : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c2_t1_hello_led_c ;

--
-- VHDL Architecture alien_game_lib.c2_t1_hello_led_c.struct
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-704-SPC)
--          at - 12:12:34  7.10.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c2_t1_hello_led_c IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL color_BGR  : std_logic_vector(23 DOWNTO 0);
   SIGNAL color_BGR1 : std_logic_vector(23 DOWNTO 0);
   SIGNAL x_coord    : std_logic_vector(7 DOWNTO 0);
   SIGNAL x_coord1   : std_logic_vector(7 DOWNTO 0);
   SIGNAL y_coord    : std_logic_vector(7 DOWNTO 0);
   SIGNAL y_coord1   : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT c2_t1_hello_led
   PORT (
      btn       : IN     std_logic_vector (3 DOWNTO 0);
      color_BGR : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord   : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord   : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c2_t1_hello_led_a
   PORT (
      color_BGR : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord   : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord   : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c2_t1_hello_led USE ENTITY alien_game_lib.c2_t1_hello_led;
   FOR ALL : c2_t1_hello_led_a USE ENTITY alien_game_lib.c2_t1_hello_led_a;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_2' of 'mux'
   u_2combo_proc: PROCESS(color_BGR, color_BGR1, sw0)
   BEGIN
      CASE sw0 IS
      WHEN '0' => RGB <= color_BGR;
      WHEN '1' => RGB <= color_BGR1;
      WHEN OTHERS => RGB <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_2combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'mux'
   u_3combo_proc: PROCESS(x_coord, x_coord1, sw0)
   BEGIN
      CASE sw0 IS
      WHEN '0' => X <= x_coord;
      WHEN '1' => X <= x_coord1;
      WHEN OTHERS => X <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_3combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'mux'
   u_4combo_proc: PROCESS(y_coord, y_coord1, sw0)
   BEGIN
      CASE sw0 IS
      WHEN '0' => Y <= y_coord;
      WHEN '1' => Y <= y_coord1;
      WHEN OTHERS => Y <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_4combo_proc;

   -- Instance port mappings.
   U_1 : c2_t1_hello_led
      PORT MAP (
         btn       => btn,
         color_BGR => color_BGR1,
         x_coord   => x_coord1,
         y_coord   => y_coord1
      );
   U_0 : c2_t1_hello_led_a
      PORT MAP (
         color_BGR => color_BGR,
         x_coord   => x_coord,
         y_coord   => y_coord
      );

END struct;
