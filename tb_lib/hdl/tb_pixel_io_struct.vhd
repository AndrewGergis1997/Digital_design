-- VHDL Entity tb_lib.tb_pixel_io.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-704-SPC)
--          at - 10:32:45 07/03/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_pixel_io IS
-- Declarations

END tb_pixel_io ;

--
-- VHDL Architecture tb_lib.tb_pixel_io.struct
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-704-SPC)
--          at - 13:23:39 30.09.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_pixel_io IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL btn   : std_logic_vector(3 DOWNTO 0);
   SIGNAL color : std_logic_vector(23 DOWNTO 0);
   SIGNAL sw0   : std_logic;
   SIGNAL x     : std_logic_vector(7 DOWNTO 0);
   SIGNAL y     : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT c2_t1_hello_led_c
   PORT (
      btn : IN     std_logic_vector (3 DOWNTO 0);
      sw0 : IN     std_logic ;
      RGB : OUT    std_logic_vector (23 DOWNTO 0);
      X   : OUT    std_logic_vector (7 DOWNTO 0);
      Y   : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT pixel_io_tester
   PORT (
      color : IN     std_logic_vector (23 DOWNTO 0);
      x     : IN     std_logic_vector (7 DOWNTO 0);
      y     : IN     std_logic_vector (7 DOWNTO 0);
      btn   : OUT    std_logic_vector (3 DOWNTO 0);
      sw0   : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c2_t1_hello_led_c USE ENTITY alien_game_lib.c2_t1_hello_led_c;
   FOR ALL : pixel_io_tester USE ENTITY tb_lib.pixel_io_tester;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : c2_t1_hello_led_c
      PORT MAP (
         btn => btn,
         sw0 => sw0,
         RGB => color,
         X   => x,
         Y   => y
      );
   U_0 : pixel_io_tester
      PORT MAP (
         color => color,
         x     => x,
         y     => y,
         btn   => btn,
         sw0   => sw0
      );

END struct;
