-- VHDL Entity tb_lib.tb_basic_alien.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-720-SPC)
--          at - 15:04:21 08/16/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_basic_alien IS
-- Declarations

END tb_basic_alien ;

--
-- VHDL Architecture tb_lib.tb_basic_alien.struct
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-720-SPC)
--          at - 11:52:20 14.10.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_basic_alien IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL clk           : std_logic;
   SIGNAL duv_color_out : std_logic_vector(23 DOWNTO 0);
   SIGNAL duv_x_out     : std_logic_vector(7 DOWNTO 0);
   SIGNAL duv_y_out     : std_logic_vector(7 DOWNTO 0);
   SIGNAL en            : std_logic;
   SIGNAL hit           : std_logic;
   SIGNAL rst_n         : std_logic;


   -- Component Declarations
   COMPONENT c3_t1_basic_alien
   PORT (
      Enable       : IN     std_logic ;
      clk          : IN     std_logic ;
      hit          : IN     std_logic ;
      rst          : IN     std_logic ;
      Alien_Color  : OUT    std_logic_vector (23 DOWNTO 0);
      X_coordinate : OUT    std_logic_vector (7 DOWNTO 0);
      Y_coordinate : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT basic_alien_tester
   PORT (
      duv_color_out : IN     std_logic_vector (23 DOWNTO 0);
      duv_x_out     : IN     std_logic_vector (7 DOWNTO 0);
      duv_y_out     : IN     std_logic_vector (7 DOWNTO 0);
      clk           : OUT    std_logic;
      en            : OUT    std_logic;
      hit           : OUT    std_logic;
      rst_n         : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : basic_alien_tester USE ENTITY tb_lib.basic_alien_tester;
   FOR ALL : c3_t1_basic_alien USE ENTITY alien_game_lib.c3_t1_basic_alien;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : c3_t1_basic_alien
      PORT MAP (
         Enable       => en,
         clk          => clk,
         hit          => hit,
         rst          => rst_n,
         Alien_Color  => duv_color_out,
         X_coordinate => duv_x_out,
         Y_coordinate => duv_y_out
      );
   U_0 : basic_alien_tester
      PORT MAP (
         duv_x_out     => duv_x_out,
         duv_y_out     => duv_y_out,
         duv_color_out => duv_color_out,
         clk           => clk,
         en            => en,
         rst_n         => rst_n,
         hit           => hit
      );

END struct;
