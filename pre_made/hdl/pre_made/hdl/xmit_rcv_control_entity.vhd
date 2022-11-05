--
-- VHDL Entity UART.xmit_rcv_control.interface
--
-- Created:
--          by - user.group (host.domain)
--          at - 17:25:36 12/06/2001
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5
--
-- hds interface_start
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY xmit_rcv_control IS
   PORT( 
      clk             : IN     std_logic;
      rst             : IN     std_logic;
      sample          : IN     std_logic;
      sin             : IN     std_logic;
      start_xmit      : IN     std_logic;
      xmitdt          : IN     std_logic_vector (7 DOWNTO 0);
      done_rcving     : OUT    std_logic;
      done_xmitting   : OUT    std_logic;
      enable_rcv_clk  : OUT    std_logic;
      enable_xmit_clk : OUT    std_logic;
      rcv_bit_cnt     : OUT    std_logic_vector (2 DOWNTO 0);
      rcving          : OUT    std_logic;
      read_bit        : OUT    std_logic;
      sout            : OUT    std_logic;
      xmitting        : OUT    std_logic
   );

-- Declarations

END xmit_rcv_control ;

-- hds interface_end
--
-- VHDL Architecture UART.xmit_rcv_control.fsm
--
-- Created:
--          by - user.group (host.domain)
--          at - 17:25:36 12/06/2001
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ARCHITECTURE fsm OF xmit_rcv_control IS

   -- Architecture Declarations
   SIGNAL xmit_bit_cnt : std_logic_vector(2 downto 0) := "000";

   TYPE RCV_STATE_TYPE IS (
      waiting,
      check_lock,
      rcv_locked,
      read_data,
      incr_count2,
      done_read,
      read_stop_bit,
      finish_rcv
   );
   TYPE XMIT_STATE_TYPE IS (
      waiting_to_xmit,
      send_start,
      send_data,
      incr_count,
      done_xmit,
      send_stop_bit,
      finish_xmit
   );


   -- Declare current and next state signals
   SIGNAL Rcv_current_state : RCV_STATE_TYPE ;
   SIGNAL Rcv_next_state : RCV_STATE_TYPE ;
   -- pragma synthesis_off
   SIGNAL Rcv_hds_next,Rcv_hds_current,Rcv_hds_clock: INTEGER;
   -- pragma synthesis_on
   SIGNAL Xmit_current_state : XMIT_STATE_TYPE ;
   SIGNAL Xmit_next_state : XMIT_STATE_TYPE ;

   -- Declare any pre-registered internal signals
   SIGNAL enable_xmit_clk_cld : std_logic  ;
   SIGNAL rcv_bit_cnt_cld : std_logic_vector (2 DOWNTO 0) ;
   SIGNAL sout_cld : std_logic  ;
   SIGNAL xmitting_cld : std_logic  ;

BEGIN

   ----------------------------------------------------------------------------
   Rcv_clocked : PROCESS(
      clk,
      rst
   )
   ----------------------------------------------------------------------------
   BEGIN
      IF (rst = '0') THEN
         Rcv_current_state <= waiting;
         -- Reset Values
         rcv_bit_cnt_cld <= (others=>'0');
         -- pragma synthesis_off
         Rcv_hds_current <= 0;
         -- pragma synthesis_on
      ELSIF (clk'EVENT AND clk = '1') THEN
         Rcv_current_state <= Rcv_next_state;
         -- pragma synthesis_off
         Rcv_hds_current <= Rcv_hds_next;
         Rcv_hds_clock <= -1;
         Rcv_hds_clock <= 0;
         -- pragma synthesis_on
         -- Default Assignment To Internals

         -- State Actions for internal signals only
         CASE Rcv_current_state IS
         WHEN waiting =>
            rcv_bit_cnt_cld <= "000";
         WHEN OTHERS =>
            NULL;
         END CASE;

         -- Transition Actions for internal signals only
         CASE Rcv_current_state IS
         WHEN waiting =>
            IF (sin='0') THEN
               rcv_bit_cnt_cld <= "000";
            END IF;
         WHEN incr_count2 =>
            IF (sample='1' AND rcv_bit_cnt_cld /= "111") THEN
               rcv_bit_cnt_cld <= unsigned(rcv_bit_cnt_cld) + 1;
            END IF;
         WHEN OTHERS =>
            NULL;
         END CASE;

      END IF;

   END PROCESS Rcv_clocked;

   ----------------------------------------------------------------------------
   Rcv_nextstate : PROCESS (
      Rcv_current_state,
      rcv_bit_cnt_cld,
      sample,
      sin
   )
   ----------------------------------------------------------------------------
   BEGIN
      CASE Rcv_current_state IS
      WHEN waiting =>
         IF (sin='0') THEN
            Rcv_next_state <= check_lock;
            -- pragma synthesis_off
            Rcv_hds_next <= 1;
            -- pragma synthesis_on
         ELSE
            Rcv_next_state <= waiting;
            -- pragma synthesis_off
            Rcv_hds_next <= 0;
            -- pragma synthesis_on
         END IF;
      WHEN check_lock =>
         IF (sin='1') THEN
            Rcv_next_state <= waiting;
            -- pragma synthesis_off
            Rcv_hds_next <= 2;
            -- pragma synthesis_on
         ELSIF (sin='0') THEN
            Rcv_next_state <= rcv_locked;
            -- pragma synthesis_off
            Rcv_hds_next <= 3;
            -- pragma synthesis_on
         ELSE
            Rcv_next_state <= check_lock;
            -- pragma synthesis_off
            Rcv_hds_next <= 0;
            -- pragma synthesis_on
         END IF;
      WHEN rcv_locked =>
         IF (sample='1') THEN
            Rcv_next_state <= read_data;
            -- pragma synthesis_off
            Rcv_hds_next <= 4;
            -- pragma synthesis_on
         ELSE
            Rcv_next_state <= rcv_locked;
            -- pragma synthesis_off
            Rcv_hds_next <= 0;
            -- pragma synthesis_on
         END IF;
      WHEN read_data =>
         IF (sample='0') THEN
            Rcv_next_state <= incr_count2;
            -- pragma synthesis_off
            Rcv_hds_next <= 5;
            -- pragma synthesis_on
         ELSE
            Rcv_next_state <= read_data;
            -- pragma synthesis_off
            Rcv_hds_next <= 0;
            -- pragma synthesis_on
         END IF;
      WHEN incr_count2 =>
         IF (sample='1' AND rcv_bit_cnt_cld /= "111") THEN
            Rcv_next_state <= read_data;
            -- pragma synthesis_off
            Rcv_hds_next <= 6;
            -- pragma synthesis_on
         ELSIF (sample='1' AND rcv_bit_cnt_cld = "111") THEN
            Rcv_next_state <= done_read;
            -- pragma synthesis_off
            Rcv_hds_next <= 7;
            -- pragma synthesis_on
         ELSE
            Rcv_next_state <= incr_count2;
            -- pragma synthesis_off
            Rcv_hds_next <= 0;
            -- pragma synthesis_on
         END IF;
      WHEN done_read =>
         IF (sample='0') THEN
            Rcv_next_state <= read_stop_bit;
            -- pragma synthesis_off
            Rcv_hds_next <= 8;
            -- pragma synthesis_on
         ELSE
            Rcv_next_state <= done_read;
            -- pragma synthesis_off
            Rcv_hds_next <= 0;
            -- pragma synthesis_on
         END IF;
      WHEN read_stop_bit =>
         IF (sample='1') THEN
            Rcv_next_state <= finish_rcv;
            -- pragma synthesis_off
            Rcv_hds_next <= 9;
            -- pragma synthesis_on
         ELSE
            Rcv_next_state <= read_stop_bit;
            -- pragma synthesis_off
            Rcv_hds_next <= 0;
            -- pragma synthesis_on
         END IF;
      WHEN finish_rcv =>
            Rcv_next_state <= waiting;
            -- pragma synthesis_off
            Rcv_hds_next <= 10;
            -- pragma synthesis_on
      WHEN OTHERS =>
         Rcv_next_state <= waiting;
         -- pragma synthesis_off
         Rcv_hds_next <= 0;
         -- pragma synthesis_on
      END CASE;

   END PROCESS Rcv_nextstate;

   ----------------------------------------------------------------------------
   Rcv_output : PROCESS (
      Rcv_current_state,
      rcv_bit_cnt_cld,
      sample,
      sin
   )
   ----------------------------------------------------------------------------
   BEGIN
      -- Default Assignment
      done_rcving <= '0';
      enable_rcv_clk <= '0';
      rcving <= '0';
      read_bit <= '0';
      -- Default Assignment To Internals

      -- State Actions
      CASE Rcv_current_state IS
      WHEN check_lock =>
         enable_rcv_clk <= '1';
      WHEN rcv_locked =>
         rcving <= '1';
         enable_rcv_clk <= '1';
      WHEN read_data =>
         rcving <= '1';
         enable_rcv_clk <= '1';
      WHEN incr_count2 =>
         rcving <= '1';
         enable_rcv_clk <= '1';
      WHEN done_read =>
         rcving <= '1';
         enable_rcv_clk <= '1';
      WHEN read_stop_bit =>
         rcving <= '1';
         enable_rcv_clk <= '1';
      WHEN finish_rcv =>
         enable_rcv_clk <= '0';
         rcving <= '0';
         done_rcving <= '1';
      WHEN OTHERS =>
         NULL;
      END CASE;

      -- Transition Actions
      CASE Rcv_current_state IS
      WHEN waiting =>
         IF (sin='0') THEN
            enable_rcv_clk <= '1';
         END IF;
      WHEN check_lock =>
         IF (sin='1') THEN
            enable_rcv_clk <= '0';
         END IF;
      WHEN incr_count2 =>
         IF (sample='1' AND rcv_bit_cnt_cld /= "111") THEN
            read_bit <= '1';
         ELSIF (sample='1' AND rcv_bit_cnt_cld = "111") THEN
            read_bit <= '1';
         END IF;
      WHEN OTHERS =>
         NULL;
      END CASE;

   END PROCESS Rcv_output;

   ----------------------------------------------------------------------------
   Xmit_clocked : PROCESS(
      clk,
      rst
   )
   ----------------------------------------------------------------------------
   BEGIN
      IF (rst = '0') THEN
         Xmit_current_state <= waiting_to_xmit;
         -- Reset Values
         enable_xmit_clk_cld <= '0';
         sout_cld <= '1';
         xmitting_cld <= '0';
         xmit_bit_cnt <= (others=>'0');
      ELSIF (clk'EVENT AND clk = '1') THEN
         Xmit_current_state <= Xmit_next_state;
         -- Default Assignment To Internals
         sout_cld <= '1';

         -- State Actions for internal signals only
         CASE Xmit_current_state IS
         WHEN waiting_to_xmit =>
            xmit_bit_cnt <= "000";
         WHEN send_start =>
            sout_cld <= '0';
            enable_xmit_clk_cld <= '1';
            xmitting_cld <= '1';
         WHEN send_data =>
            sout_cld <= xmitdt(CONV_INTEGER(unsigned(xmit_bit_cnt)));
         WHEN incr_count =>
            sout_cld <= xmitdt(CONV_INTEGER(unsigned(xmit_bit_cnt)));
         WHEN finish_xmit =>
            enable_xmit_clk_cld <= '0';
            xmitting_cld <= '0';
         WHEN OTHERS =>
            NULL;
         END CASE;

         -- Transition Actions for internal signals only
         CASE Xmit_current_state IS
         WHEN send_data =>
            IF (sample='0') THEN
               xmit_bit_cnt <= unsigned(xmit_bit_cnt) + 1;
            END IF;
         WHEN OTHERS =>
            NULL;
         END CASE;

      END IF;

   END PROCESS Xmit_clocked;

   ----------------------------------------------------------------------------
   Xmit_nextstate : PROCESS (
      Xmit_current_state,
      sample,
      start_xmit,
      xmit_bit_cnt
   )
   ----------------------------------------------------------------------------
   BEGIN
      CASE Xmit_current_state IS
      WHEN waiting_to_xmit =>
         IF (start_xmit='1') THEN
            Xmit_next_state <= send_start;
         ELSE
            Xmit_next_state <= waiting_to_xmit;
         END IF;
      WHEN send_start =>
         IF (sample='1') THEN
            Xmit_next_state <= send_data;
         ELSE
            Xmit_next_state <= send_start;
         END IF;
      WHEN send_data =>
         IF (sample='0') THEN
            Xmit_next_state <= incr_count;
         ELSE
            Xmit_next_state <= send_data;
         END IF;
      WHEN incr_count =>
         IF (sample='1' AND xmit_bit_cnt /= "000") THEN
            Xmit_next_state <= send_data;
         ELSIF (sample='1' AND xmit_bit_cnt = "000") THEN
            Xmit_next_state <= done_xmit;
         ELSE
            Xmit_next_state <= incr_count;
         END IF;
      WHEN done_xmit =>
         IF (sample='0') THEN
            Xmit_next_state <= send_stop_bit;
         ELSE
            Xmit_next_state <= done_xmit;
         END IF;
      WHEN send_stop_bit =>
            Xmit_next_state <= finish_xmit;
      WHEN finish_xmit =>
            Xmit_next_state <= waiting_to_xmit;
      WHEN OTHERS =>
         Xmit_next_state <= waiting_to_xmit;
      END CASE;

   END PROCESS Xmit_nextstate;

   ----------------------------------------------------------------------------
   Xmit_output : PROCESS (
      Xmit_current_state
   )
   ----------------------------------------------------------------------------
   BEGIN
      -- Default Assignment
      done_xmitting <= '0';
      -- Default Assignment To Internals

      -- State Actions
      CASE Xmit_current_state IS
      WHEN send_stop_bit =>
         done_xmitting <= '1';
      WHEN OTHERS =>
         NULL;
      END CASE;

   END PROCESS Xmit_output;

   -- Concurrent Statements
   -- Clocked output assignments
   enable_xmit_clk <= enable_xmit_clk_cld;
   rcv_bit_cnt <= rcv_bit_cnt_cld;
   sout <= sout_cld;
   xmitting <= xmitting_cld;


END fsm;
