-- VHDL Entity tb_lib.tb_victory.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-710-SPC)
--          at - 16:21:43 06/04/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_victory IS
-- Declarations

END tb_victory ;

--
-- VHDL Architecture tb_lib.tb_victory.struct
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-722-SPC)
--          at - 17:55:48 22.11.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_victory IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL clk          : std_logic;
   SIGNAL color        : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixel_amount : std_logic_vector(5 DOWNTO 0);
   SIGNAL rst_n        : std_logic;
   SIGNAL x_coordinate : std_logic_vector(7 DOWNTO 0);
   SIGNAL y_coordinate : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT c6_t2_victory_effect
   PORT (
      clk     : IN     std_logic ;
      rst_n   : IN     std_logic ;
      color   : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT victory_text_test_block
   PORT (
      color        : IN     std_logic_vector (23 DOWNTO 0);
      pixel_amount : IN     std_logic_vector (5 DOWNTO 0);
      x_data       : IN     std_logic_vector (7 DOWNTO 0);
      y_data       : IN     std_logic_vector (7 DOWNTO 0);
      clk          : OUT    std_logic;
      rst_n        : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c6_t2_victory_effect USE ENTITY alien_game_lib.c6_t2_victory_effect;
   FOR ALL : victory_text_test_block USE ENTITY tb_lib.victory_text_test_block;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'pixel_amount' of 'constval'
   pixel_amount <= "010111";

   -- Instance port mappings.
   U_1 : c6_t2_victory_effect
      PORT MAP (
         clk     => clk,
         rst_n   => rst_n,
         color   => color,
         x_coord => x_coordinate,
         y_coord => y_coordinate
      );
   U_0 : victory_text_test_block
      PORT MAP (
         clk          => clk,
         rst_n        => rst_n,
         color        => color,
         x_data       => x_coordinate,
         y_data       => y_coordinate,
         pixel_amount => pixel_amount
      );

END struct;
