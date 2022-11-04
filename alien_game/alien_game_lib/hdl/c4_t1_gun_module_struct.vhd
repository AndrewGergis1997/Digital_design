-- VHDL Entity alien_game_lib.c4_t1_gun_module.symbol
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-714-SPC)
--          at - 16:47:51  4.11.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c4_t1_gun_module IS
   PORT( 
      btn          : IN     std_logic_vector (3 DOWNTO 0);
      clk          : IN     std_logic;
      enable       : IN     std_logic;
      gun_px_idx   : IN     std_logic_vector (1 DOWNTO 0);
      rst_n        : IN     std_logic;
      gun_color    : OUT    std_logic_vector (23 DOWNTO 0);
      x_coordinate : OUT    std_logic_vector (7 DOWNTO 0);
      y_coordinate : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c4_t1_gun_module ;

--
-- VHDL Architecture alien_game_lib.c4_t1_gun_module.struct
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-714-SPC)
--          at - 16:47:51  4.11.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c4_t1_gun_module IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL din0          : std_logic_vector(7 DOWNTO 0);
   SIGNAL din1          : std_logic_vector(7 DOWNTO 0);
   SIGNAL din2          : std_logic_vector(7 DOWNTO 0);
   SIGNAL din3          : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout          : std_logic;
   SIGNAL x_coordinate1 : std_logic_vector(7 DOWNTO 0);
   SIGNAL x_coordinate2 : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT c4_t1_m1
   PORT (
      btn          : IN     std_logic_vector (3 DOWNTO 0);
      clk          : IN     std_logic ;
      enable       : IN     std_logic ;
      rst_n        : IN     std_logic ;
      x_coordinate : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c4_t1_m2
   PORT (
      btn          : IN     std_logic_vector (3 DOWNTO 0);
      clk          : IN     std_logic ;
      enable       : IN     std_logic ;
      rst_n        : IN     std_logic ;
      x_coordinate : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c4_t1_m3
   PORT (
      btn          : IN     std_logic_vector (3 DOWNTO 0);
      clk          : IN     std_logic ;
      enable       : IN     std_logic ;
      rst_n        : IN     std_logic ;
      x_coordinate : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c4_t1_m1 USE ENTITY alien_game_lib.c4_t1_m1;
   FOR ALL : c4_t1_m2 USE ENTITY alien_game_lib.c4_t1_m2;
   FOR ALL : c4_t1_m3 USE ENTITY alien_game_lib.c4_t1_m3;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_3' of 'and'
   dout <= gun_px_idx(0) AND gun_px_idx(1);

   -- ModuleWare code(v1.12) for instance 'U_5' of 'constval'
   din0 <= "10000000";

   -- ModuleWare code(v1.12) for instance 'U_7' of 'constval'
   din1 <= "01000000";

   -- ModuleWare code(v1.12) for instance 'U_8' of 'constval'
   gun_color <= "FF0000";

   -- ModuleWare code(v1.12) for instance 'U_4' of 'mux'
   u_4combo_proc: PROCESS(din0, din1, dout)
   BEGIN
      CASE dout IS
      WHEN '0' => y_coordinate <= din0;
      WHEN '1' => y_coordinate <= din1;
      WHEN OTHERS => y_coordinate <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_4combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'mux'
   u_6combo_proc: PROCESS(din2, x_coordinate1, x_coordinate2, din3, 
                          gun_px_idx)
   BEGIN
      CASE gun_px_idx IS
      WHEN "00" => x_coordinate <= din2;
      WHEN "01" => x_coordinate <= x_coordinate1;
      WHEN "10" => x_coordinate <= x_coordinate2;
      WHEN "11" => x_coordinate <= din3;
      WHEN OTHERS => x_coordinate <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_6combo_proc;

   -- Instance port mappings.
   U_0 : c4_t1_m1
      PORT MAP (
         btn          => btn,
         clk          => clk,
         enable       => enable,
         rst_n        => rst_n,
         x_coordinate => din2
      );
   U_1 : c4_t1_m2
      PORT MAP (
         btn          => btn,
         clk          => clk,
         enable       => enable,
         rst_n        => rst_n,
         x_coordinate => x_coordinate1
      );
   U_9 : c4_t1_m2
      PORT MAP (
         btn          => btn,
         clk          => clk,
         enable       => enable,
         rst_n        => rst_n,
         x_coordinate => din3
      );
   U_2 : c4_t1_m3
      PORT MAP (
         btn          => btn,
         clk          => clk,
         enable       => enable,
         rst_n        => rst_n,
         x_coordinate => x_coordinate2
      );

END struct;
