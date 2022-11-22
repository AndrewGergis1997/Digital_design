-- VHDL Entity alien_game_lib.c6_t2_x_coord_vic.symbol
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-722-SPC)
--          at - 16:34:29 22.11.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c6_t2_x_coord_vic IS
   PORT( 
      mux_signal : IN     std_logic_vector (3 DOWNTO 0);
      x_coord    : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c6_t2_x_coord_vic ;

--
-- VHDL Architecture alien_game_lib.c6_t2_x_coord_vic.struct
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-722-SPC)
--          at - 17:18:13 22.11.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c6_t2_x_coord_vic IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL din0  : std_logic_vector(7 DOWNTO 0);
   SIGNAL din1  : std_logic_vector(7 DOWNTO 0);
   SIGNAL din14 : std_logic_vector(7 DOWNTO 0);
   SIGNAL din2  : std_logic_vector(7 DOWNTO 0);
   SIGNAL din3  : std_logic_vector(7 DOWNTO 0);
   SIGNAL din9  : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout  : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout1 : std_logic_vector(7 DOWNTO 0);



BEGIN

   -- ModuleWare code(v1.12) for instance 'u_1' of 'constval'
   dout <= "00000001";

   -- ModuleWare code(v1.12) for instance 'u_2' of 'constval'
   din0 <= "00000010";

   -- ModuleWare code(v1.12) for instance 'u_3' of 'constval'
   din1 <= "00000100";

   -- ModuleWare code(v1.12) for instance 'u_4' of 'constval'
   dout1 <= "00001000";

   -- ModuleWare code(v1.12) for instance 'u_5' of 'constval'
   din14 <= "00010000";

   -- ModuleWare code(v1.12) for instance 'u_6' of 'constval'
   din2 <= "00100000";

   -- ModuleWare code(v1.12) for instance 'u_7' of 'constval'
   din3 <= "01000000";

   -- ModuleWare code(v1.12) for instance 'u_8' of 'constval'
   din9 <= "10000000";

   -- ModuleWare code(v1.12) for instance 'U_0' of 'mux'
   u_0combo_proc: PROCESS(din0, din1, din2, din3, dout, din9, dout1, 
                          din14, mux_signal)
   BEGIN
      CASE mux_signal IS
      WHEN "0000" => x_coord <= din0;
      WHEN "0001" => x_coord <= din1;
      WHEN "0010" => x_coord <= din2;
      WHEN "0011" => x_coord <= din3;
      WHEN "0100" => x_coord <= din0;
      WHEN "0101" => x_coord <= din1;
      WHEN "0110" => x_coord <= din2;
      WHEN "0111" => x_coord <= din3;
      WHEN "1000" => x_coord <= dout;
      WHEN "1001" => x_coord <= din9;
      WHEN "1010" => x_coord <= din0;
      WHEN "1011" => x_coord <= din3;
      WHEN "1100" => x_coord <= din1;
      WHEN "1101" => x_coord <= dout1;
      WHEN "1110" => x_coord <= din14;
      WHEN "1111" => x_coord <= din2;
      WHEN OTHERS => x_coord <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_0combo_proc;

   -- Instance port mappings.

END struct;
