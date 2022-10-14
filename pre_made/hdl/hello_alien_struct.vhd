-- VHDL Entity pre_made.HELLO_ALIEN.symbol
--
-- Created:
--          by - oinonen2.UNKNOWN (WS-12212-PC)
--          at - 18:44:20 12.09.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY HELLO_ALIEN IS
   PORT( 
      btn     : IN     std_logic_vector (3 DOWNTO 0);
      clk     : IN     std_logic;
      rst_n   : IN     std_logic;
      channel : OUT    std_logic_vector (7 DOWNTO 0);
      lat     : OUT    std_logic;
      s_clk   : OUT    std_logic;
      s_rst   : OUT    std_logic;
      s_sda   : OUT    std_logic;
      sb      : OUT    std_logic
   );

-- Declarations

END HELLO_ALIEN ;

--
-- VHDL Architecture pre_made.HELLO_ALIEN.struct
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-720-SPC)
--          at - 12:30:33 14.10.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY pre_made;

ARCHITECTURE struct OF HELLO_ALIEN IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL alien_color : std_logic_vector(23 DOWNTO 0);
   SIGNAL alien_x     : std_logic_vector(7 DOWNTO 0);
   SIGNAL alien_y     : std_logic_vector(7 DOWNTO 0);
   SIGNAL enable      : std_logic;
   SIGNAL q           : std_logic;
   SIGNAL write       : std_logic;


   -- ModuleWare signal declarations(v1.12) for instance 'convenience_ff' of 'adff'
   SIGNAL mw_convenience_ffreg_cval : std_logic;

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
   COMPONENT display_controller
   PORT (
      clk        : IN     std_logic ;
      color_BGR  : IN     std_logic_vector (23 DOWNTO 0);
      frame_done : IN     std_logic ;
      rst_n      : IN     std_logic ;
      write      : IN     std_logic ;
      x_coord    : IN     std_logic_vector (7 DOWNTO 0);
      y_coord    : IN     std_logic_vector (7 DOWNTO 0);
      channel    : OUT    std_logic_vector (7 DOWNTO 0);
      lat        : OUT    std_logic ;
      s_clk      : OUT    std_logic ;
      s_rst      : OUT    std_logic ;
      s_sda      : OUT    std_logic ;
      sb         : OUT    std_logic ;
      w_rdy      : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT en_wr
   PORT (
      clk    : IN     std_logic;
      rst_n  : IN     std_logic;
      enable : OUT    std_logic;
      wr     : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c3_t1_basic_alien USE ENTITY alien_game_lib.c3_t1_basic_alien;
   FOR ALL : display_controller USE ENTITY pre_made.display_controller;
   FOR ALL : en_wr USE ENTITY pre_made.en_wr;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'convenience_ff' of 'adff'
   q <= mw_convenience_ffreg_cval;
   convenience_ffseq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_convenience_ffreg_cval <= '0';
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_convenience_ffreg_cval <= write;
      END IF;
   END PROCESS convenience_ffseq_proc;

   -- Instance port mappings.
   U_1 : c3_t1_basic_alien
      PORT MAP (
         Enable       => enable,
         clk          => clk,
         hit          => btn(0),
         rst          => rst_n,
         Alien_Color  => alien_color,
         X_coordinate => alien_x,
         Y_coordinate => alien_y
      );
   U_0 : display_controller
      PORT MAP (
         clk        => clk,
         color_BGR  => alien_color,
         frame_done => q,
         rst_n      => rst_n,
         write      => write,
         x_coord    => alien_x,
         y_coord    => alien_y,
         channel    => channel,
         lat        => lat,
         s_clk      => s_clk,
         s_rst      => s_rst,
         s_sda      => s_sda,
         sb         => sb,
         w_rdy      => OPEN
      );
   U_2 : en_wr
      PORT MAP (
         clk    => clk,
         rst_n  => rst_n,
         enable => enable,
         wr     => write
      );

END struct;
