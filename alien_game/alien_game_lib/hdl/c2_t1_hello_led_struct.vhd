-- VHDL Entity alien_game_lib.c2_t1_hello_led.symbol
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-704-SPC)
--          at - 13:29:33 30.09.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t1_hello_led IS
   PORT( 
      btn       : IN     std_logic_vector (3 DOWNTO 0);
      color_BGR : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord   : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord   : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c2_t1_hello_led ;

--
-- VHDL Architecture alien_game_lib.c2_t1_hello_led.struct
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-704-SPC)
--          at - 13:29:33 30.09.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c2_t1_hello_led IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL dout  : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout1 : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout2 : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout3 : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout4 : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout5 : std_logic_vector(7 DOWNTO 0);



BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'constval'
   dout2 <= "00000001";

   -- ModuleWare code(v1.12) for instance 'U_1' of 'constval'
   dout <= "111111110000000000000000";

   -- ModuleWare code(v1.12) for instance 'U_2' of 'constval'
   dout4 <= "01000000";

   -- ModuleWare code(v1.12) for instance 'U_5' of 'constval'
   dout1 <= "111111110000000011111111";

   -- ModuleWare code(v1.12) for instance 'U_7' of 'constval'
   dout3 <= "00001000";

   -- ModuleWare code(v1.12) for instance 'U_8' of 'constval'
   dout5 <= "00000100";

   -- ModuleWare code(v1.12) for instance 'U_3' of 'mux'
   u_3combo_proc: PROCESS(dout2, dout3, btn)
   BEGIN
      CASE btn(0) IS
      WHEN '0' => x_coord <= dout2;
      WHEN '1' => x_coord <= dout3;
      WHEN OTHERS => x_coord <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_3combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'mux'
   u_4combo_proc: PROCESS(dout4, dout5, btn)
   BEGIN
      CASE btn(0) IS
      WHEN '0' => y_coord <= dout4;
      WHEN '1' => y_coord <= dout5;
      WHEN OTHERS => y_coord <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_4combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'mux'
   u_6combo_proc: PROCESS(dout, dout1, btn)
   BEGIN
      CASE btn(0) IS
      WHEN '0' => color_BGR <= dout;
      WHEN '1' => color_BGR <= dout1;
      WHEN OTHERS => color_BGR <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_6combo_proc;

   -- Instance port mappings.

END struct;
