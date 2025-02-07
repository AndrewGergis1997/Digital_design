-- VHDL Entity UART.xmit_rcv_control.interface
--
-- Created:
--          by - user.group (host.domain)
--          at - 16:41:24 06/15/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2004.1
--
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

--
-- VHDL Architecture UART.xmit_rcv_control.asm
--
-- Created:
--          by - user.group (host.domain)
--          at - 16:41:24 06/15/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2004.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE asm OF xmit_rcv_control IS

   -- Architecture Declarations
   SIGNAL xmit_bit_cnt : std_logic_vector( 2 DOWNTO 0 );  

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
   SIGNAL rcv_current_state : RCV_STATE_TYPE;
   SIGNAL rcv_next_state : RCV_STATE_TYPE;

   SIGNAL xmit_current_state : XMIT_STATE_TYPE;
   SIGNAL xmit_next_state : XMIT_STATE_TYPE;

   -- Declare any pre-registered internal signals
   SIGNAL enable_xmit_clk_cld : std_logic ;
   SIGNAL rcv_bit_cnt_cld : std_logic_vector (2 DOWNTO 0);
   SIGNAL sout_cld : std_logic ;
   SIGNAL xmitting_cld : std_logic ;

BEGIN

   -----------------------------------------------------------------
   rcv_clocked_proc : PROCESS ( 
      clk,
      rst
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rst = '0') THEN
         rcv_current_state <= waiting;
         -- Default Reset Values
         rcv_bit_cnt_cld <= (others=>'0');
      ELSIF (clk'EVENT AND clk = '1') THEN
         rcv_current_state <= rcv_next_state;

         -- Combined Actions
         CASE rcv_current_state IS
         WHEN waiting => 
            rcv_bit_cnt_cld <= "000";
            IF (sin='0') THEN 
               rcv_bit_cnt_cld <= "000";
            END IF;
         WHEN incr_count2 => 
            IF (sample='1') THEN 
               IF (NOT(rcv_bit_cnt_cld = "111")) THEN 
                  rcv_bit_cnt_cld <= 
                     unsigned(rcv_bit_cnt_cld) + 1;
               END IF;
            END IF;
         WHEN OTHERS =>
            NULL;
         END CASE;
      END IF;
   END PROCESS rcv_clocked_proc;
 
   -----------------------------------------------------------------
   rcv_nextstate_proc : PROCESS ( 
      rcv_bit_cnt_cld,
      rcv_current_state,
      sample,
      sin
   )
   -----------------------------------------------------------------
   BEGIN
      CASE rcv_current_state IS
      WHEN waiting => 
         IF (sin='0') THEN 
            rcv_next_state <= check_lock;
         ELSE
            rcv_next_state <= waiting;
         END IF;
      WHEN check_lock => 
         IF (sin='1') THEN 
            rcv_next_state <= waiting;
         ELSIF (sin='0') THEN 
            rcv_next_state <= rcv_locked;
         ELSE
            rcv_next_state <= check_lock;
         END IF;
      WHEN rcv_locked => 
         IF (sample='1') THEN 
            rcv_next_state <= read_data;
         ELSE
            rcv_next_state <= rcv_locked;
         END IF;
      WHEN read_data => 
         IF (sample='0') THEN 
            rcv_next_state <= incr_count2;
         ELSE
            rcv_next_state <= read_data;
         END IF;
      WHEN incr_count2 => 
         IF (sample='1') THEN 
            IF (rcv_bit_cnt_cld = "111") THEN 
               rcv_next_state <= done_read;
            ELSE
               rcv_next_state <= read_data;
            END IF;
         ELSE
            rcv_next_state <= incr_count2;
         END IF;
      WHEN done_read => 
         IF (sample='0') THEN 
            rcv_next_state <= read_stop_bit;
         ELSE
            rcv_next_state <= done_read;
         END IF;
      WHEN read_stop_bit => 
         IF (sample='1') THEN 
            rcv_next_state <= finish_rcv;
         ELSE
            rcv_next_state <= read_stop_bit;
         END IF;
      WHEN finish_rcv => 
         rcv_next_state <= waiting;
      WHEN OTHERS =>
         rcv_next_state <= waiting;
      END CASE;
   END PROCESS rcv_nextstate_proc;
 
   -----------------------------------------------------------------
   rcv_output_proc : PROCESS ( 
      rcv_current_state,
      sample,
      sin
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      done_rcving <= '0';
      enable_rcv_clk <= '0';
      rcving <= '0';
      read_bit <= '0';

      -- Combined Actions
      CASE rcv_current_state IS
      WHEN waiting => 
         IF (sin='0') THEN 
            enable_rcv_clk <= '1';
         END IF;
      WHEN check_lock => 
         enable_rcv_clk<='1';
         IF (sin='1') THEN 
            enable_rcv_clk <= '0';
         ELSE
         END IF;
      WHEN rcv_locked => 
         rcving <= '1';
         enable_rcv_clk <= '1';
      WHEN read_data => 
         rcving <= '1';
         enable_rcv_clk <= '1';
      WHEN incr_count2 => 
         rcving <= '1';
         enable_rcv_clk <= '1';
         IF (sample='1') THEN 
            read_bit <= '1';
         END IF;
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

   END PROCESS rcv_output_proc;
 
   -----------------------------------------------------------------
   xmit_clocked_proc : PROCESS ( 
      clk,
      rst
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rst = '0') THEN
         xmit_current_state <= waiting_to_xmit;
         -- Default Reset Values
         enable_xmit_clk_cld <= '0';
         sout_cld <= '1';
         xmitting_cld <= '0';
         xmit_bit_cnt <= (others=>'0');
      ELSIF (clk'EVENT AND clk = '1') THEN
         xmit_current_state <= xmit_next_state;
         -- Default Assignment To Internals
         xmit_bit_cnt <= (others=>'0');
         sout_cld <= '1';

         -- Combined Actions
         CASE xmit_current_state IS
         WHEN waiting_to_xmit => 
            xmit_bit_cnt <= "000";
         WHEN send_start => 
            sout_cld <= '0';
            enable_xmit_clk_cld <= '1';
            xmitting_cld <= '1';
         WHEN send_data => 
            sout_cld <= xmitdt(CONV_INTEGER(unsigned(xmit_bit_cnt)));
            IF (sample='0') THEN 
               xmit_bit_cnt <= unsigned(xmit_bit_cnt) + 1;
            END IF;
         WHEN incr_count => 
            sout_cld <= xmitdt(CONV_INTEGER(unsigned(xmit_bit_cnt)));
         WHEN finish_xmit => 
            enable_xmit_clk_cld <= '0';
            xmitting_cld <= '0';
         WHEN OTHERS =>
            NULL;
         END CASE;
      END IF;
   END PROCESS xmit_clocked_proc;
 
   -----------------------------------------------------------------
   xmit_nextstate_proc : PROCESS ( 
      sample,
      start_xmit,
      xmit_bit_cnt,
      xmit_current_state
   )
   -----------------------------------------------------------------
   BEGIN
      CASE xmit_current_state IS
      WHEN waiting_to_xmit => 
         IF (start_xmit='1') THEN 
            xmit_next_state <= send_start;
         ELSE
            xmit_next_state <= waiting_to_xmit;
         END IF;
      WHEN send_start => 
         IF (sample='1') THEN 
            xmit_next_state <= send_data;
         ELSE
            xmit_next_state <= send_start;
         END IF;
      WHEN send_data => 
         IF (sample='0') THEN 
            xmit_next_state <= incr_count;
         ELSE
            xmit_next_state <= send_data;
         END IF;
      WHEN incr_count => 
         IF (sample='1') THEN 
            IF (xmit_bit_cnt = "000") THEN 
               xmit_next_state <= done_xmit;
            ELSE
               xmit_next_state <= send_data;
            END IF;
         ELSE
            xmit_next_state <= incr_count;
         END IF;
      WHEN done_xmit => 
         IF (sample='0') THEN 
            xmit_next_state <= send_stop_bit;
         ELSE
            xmit_next_state <= done_xmit;
         END IF;
      WHEN send_stop_bit => 
         xmit_next_state <= finish_xmit;
      WHEN finish_xmit => 
         xmit_next_state <= waiting_to_xmit;
      WHEN OTHERS =>
         xmit_next_state <= waiting_to_xmit;
      END CASE;
   END PROCESS xmit_nextstate_proc;
 
   -----------------------------------------------------------------
   xmit_output_proc : PROCESS ( 
      xmit_current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      done_xmitting <= '0';

      -- Combined Actions
      CASE xmit_current_state IS
      WHEN send_stop_bit => 
         done_xmitting <= '1';
      WHEN OTHERS =>
         NULL;
      END CASE;

   END PROCESS xmit_output_proc;
 
   -- Concurrent Statements
   -- Clocked output assignments
   enable_xmit_clk <= enable_xmit_clk_cld;
   rcv_bit_cnt <= rcv_bit_cnt_cld;
   sout <= sout_cld;
   xmitting <= xmitting_cld;
END asm;
