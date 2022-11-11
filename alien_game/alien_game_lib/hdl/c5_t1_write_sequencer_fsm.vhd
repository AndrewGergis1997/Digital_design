-- VHDL Entity alien_game_lib.c5_t1_write_sequencer.symbol
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-715-SPC)
--          at - 13:31:21 11.11.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c5_t1_write_sequencer IS
   PORT( 
      alien_defeated : IN     std_logic;
      clk            : IN     std_logic;
      enable         : IN     std_logic;
      rst_n          : IN     std_logic;
      write_ready    : IN     std_logic;
      frame_done     : OUT    std_logic;
      gun_px_idx     : OUT    std_logic_vector (1 DOWNTO 0);
      module_select  : OUT    std_logic_vector (1 DOWNTO 0);
      write          : OUT    std_logic
   );

-- Declarations

END c5_t1_write_sequencer ;

--
-- VHDL Architecture alien_game_lib.c5_t1_write_sequencer.fsm
--
-- Created:
--          by - mqange.UNKNOWN (HTC219-715-SPC)
--          at - 13:31:20 11.11.2022
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF c5_t1_write_sequencer IS

   TYPE STATE_TYPE IS (
      Start,
      WR,
      s0,
      W
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

   -- Declare Wait State internal signals
   SIGNAL csm_timer : std_logic_vector(1 DOWNTO 0);
   SIGNAL csm_next_timer : std_logic_vector(1 DOWNTO 0);
   SIGNAL csm_timeout : std_logic;
   SIGNAL csm_to_s0 : std_logic;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rising_edge(clk)) THEN
         IF (rst_n = '1') THEN
            current_state <= next_state;
            csm_timer <= csm_next_timer;
         END IF;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      csm_timeout,
      current_state,
      write_ready
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default assignments to Wait State entry flags
      csm_to_s0 <= '0';
      CASE current_state IS
         WHEN Start => 
            IF (write_ready = '1') THEN 
               next_state <= WR;
            ELSE
               next_state <= Start;
            END IF;
         WHEN WR => 
            next_state <= s0;
            csm_to_s0 <= '1';
         WHEN s0 => 
            IF (csm_timeout = '1') THEN 
               next_state <= W;
            ELSE
               next_state <= s0;
            END IF;
         WHEN W => 
            next_state <= W;
         WHEN OTHERS =>
            next_state <= Start;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN

      -- Combined Actions
      CASE current_state IS
         WHEN WR => 
            write <= '0';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
   -----------------------------------------------------------------
   csm_wait_combo_proc: PROCESS (
      csm_timer,
      csm_to_s0
   )
   -----------------------------------------------------------------
   VARIABLE csm_temp_timeout : std_logic;
   BEGIN
      IF (unsigned(csm_timer) = 0) THEN
         csm_temp_timeout := '1';
      ELSE
         csm_temp_timeout := '0';
      END IF;

      IF (csm_to_s0 = '1') THEN
         csm_next_timer <= "01"; -- no cycles(2)-1=1
      ELSE
         IF (csm_temp_timeout = '1') THEN
            csm_next_timer <= (OTHERS=>'0');
         ELSE
            csm_next_timer <= unsigned(csm_timer) - '1';
         END IF;
      END IF;
      csm_timeout <= csm_temp_timeout;
   END PROCESS csm_wait_combo_proc;

END fsm;
