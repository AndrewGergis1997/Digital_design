-- VHDL Entity alien_game_lib.c3_t1_basic_alien.symbol
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-720-SPC)
--          at - 12:43:54 14.10.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c3_t1_basic_alien IS
   PORT( 
      Enable       : IN     std_logic;
      clk          : IN     std_logic;
      hit          : IN     std_logic;
      rst          : IN     std_logic;
      Alien_Color  : OUT    std_logic_vector (23 DOWNTO 0);
      X_coordinate : OUT    std_logic_vector (7 DOWNTO 0);
      Y_coordinate : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c3_t1_basic_alien ;

--
-- VHDL Architecture alien_game_lib.c3_t1_basic_alien.struct
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-720-SPC)
--          at - 12:43:54 14.10.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c3_t1_basic_alien IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL current_point : std_logic;
   SIGNAL defeated      : std_logic;
   SIGNAL din1          : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout          : std_logic_vector(23 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL X_coordinate_internal : std_logic_vector (7 DOWNTO 0);


   -- Component Declarations
   COMPONENT c3_alien_movement
   PORT (
      clk          : IN     std_logic ;
      currentpoint : IN     std_logic ;
      enable       : IN     std_logic ;
      rst          : IN     std_logic ;
      x_coord      : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c3_current_point
   PORT (
      clk           : IN     std_logic ;
      rst           : IN     std_logic ;
      x_coord       : IN     std_logic_vector (7 DOWNTO 0);
      current_point : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT c3_hit_defeated
   PORT (
      clk      : IN     std_logic ;
      hit      : IN     std_logic ;
      rst      : IN     std_logic ;
      defeated : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c3_alien_movement USE ENTITY alien_game_lib.c3_alien_movement;
   FOR ALL : c3_current_point USE ENTITY alien_game_lib.c3_current_point;
   FOR ALL : c3_hit_defeated USE ENTITY alien_game_lib.c3_hit_defeated;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_3' of 'constval'
   Y_coordinate <= "00000001";

   -- ModuleWare code(v1.12) for instance 'U_4' of 'constval'
   dout <= x"FFFFFF";

   -- ModuleWare code(v1.12) for instance 'U_5' of 'constval'
   din1 <= x"000000";

   -- ModuleWare code(v1.12) for instance 'U_6' of 'mux'
   u_6combo_proc: PROCESS(dout, din1, defeated)
   BEGIN
      CASE defeated IS
      WHEN '0' => Alien_Color <= dout;
      WHEN '1' => Alien_Color <= din1;
      WHEN OTHERS => Alien_Color <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_6combo_proc;

   -- Instance port mappings.
   U_2 : c3_alien_movement
      PORT MAP (
         Enable       => Enable,
         clk          => clk,
         currentpoint => current_point,
         rst          => rst,
         x_coord      => X_coordinate_internal
      );
   U_1 : c3_current_point
      PORT MAP (
         clk           => clk,
         rst           => rst,
         x_coord       => X_coordinate_internal,
         current_point => current_point
      );
   U_0 : c3_hit_defeated
      PORT MAP (
         clk      => clk,
         hit      => hit,
         rst      => rst,
         defeated => defeated
      );

   -- Implicit buffered output assignments
   X_coordinate <= X_coordinate_internal;

END struct;
