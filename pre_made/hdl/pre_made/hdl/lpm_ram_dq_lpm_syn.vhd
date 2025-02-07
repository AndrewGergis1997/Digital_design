-- VHDL Entity lpm.lpm_ram_dq.symbol
--
-- Created:
--          by - user.group (host.domain)
--          at - 12:04:41 02/18/03
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2003.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;
LIBRARY lpm;
USE lpm.lpm_components.all;
LIBRARY std;
USE std.textio.all;

ENTITY lpm_ram_dq IS
   GENERIC( 
      lpm_WIDTH              : natural;
      lpm_WIDTHAD            : natural;
      lpm_NUMWORDS           : natural := 0;
      lpm_INDATA             : string  := "REGISTERED";
      lpm_ADDRESS_CONTROL    : string  := "REGISTERED";
      lpm_OUTDATA            : string  := "REGISTERED";
      lpm_FILE               : string  := "UNUSED";
      lpm_TYPE               : string  := "LPM_RAM_DQ";
      USE_EAB                : string  := "OFF";
      INTENDED_DEVICE_FAMILY : string  := "UNUSED";
      lpm_HINT               : string  := "UNUSED"
   );
   PORT( 
      address  : IN     std_logic_vector (lpm_WIDTHAD-1 DOWNTO 0);
      data     : IN     std_logic_vector (lpm_WIDTH-1 DOWNTO 0);
      inclock  : IN     std_logic  := '0';
      outclock : IN     std_logic  := '0';
      we       : IN     std_logic;
      q        : OUT    std_logic_vector (lpm_WIDTH-1 DOWNTO 0)
   );


-- Declarations

-- Declarations

function int_to_str( value : integer ) return string is
   variable ivalue,index : integer;
   variable digit : integer;
   variable line_no: string(8 downto 1) := "        ";  
   begin
      ivalue := value;
      index := 1;
      while (ivalue > 0) loop
         digit := ivalue MOD 10;
         ivalue := ivalue/10;
         case digit is
            when 0 =>
               line_no(index) := '0';
            when 1 =>
               line_no(index) := '1';
            when 2 =>
               line_no(index) := '2';
            when 3 =>
               line_no(index) := '3';
            when 4 =>
               line_no(index) := '4';
            when 5 =>
               line_no(index) := '5';
            when 6 =>
               line_no(index) := '6';
            when 7 =>
               line_no(index) := '7';
            when 8 =>
               line_no(index) := '8';
            when 9 =>
               line_no(index) := '9';
            when others =>
               ASSERT FALSE
               REPORT "Illegal number!"
               SEVERITY ERROR;
         end case;
         index := index + 1;
      end loop;
      return line_no;
   end;

   function hex_str_to_int( str : string ) return integer is
   variable len : integer := str'length;
   variable ivalue : integer := 0;
   variable digit : integer;
   begin
      for i in len downto 1 loop
         case str(i) is
            when '0' =>
               digit := 0;
            when '1' =>
               digit := 1;
            when '2' =>
               digit := 2;
            when '3' =>
               digit := 3;
            when '4' =>
               digit := 4;
            when '5' =>
               digit := 5;
            when '6' =>
               digit := 6;
            when '7' =>
               digit := 7;
            when '8' =>
               digit := 8;
            when '9' =>
               digit := 9;
            when 'A' =>
               digit := 10;
            when 'a' =>
               digit := 10;
            when 'B' =>
               digit := 11;
            when 'b' =>
               digit := 11;
            when 'C' =>
               digit := 12;
            when 'c' =>
               digit := 12;
            when 'D' =>
               digit := 13;
            when 'd' =>
               digit := 13;
            when 'E' =>
               digit := 14;
            when 'e' =>
               digit := 14;
            when 'F' =>
               digit := 15;
            when 'f' =>
               digit := 15;
            when others =>
               ASSERT FALSE
               REPORT "Illegal character "&  str(i) & "in Intel Hex File! "
               SEVERITY ERROR;
         end case;
         ivalue := ivalue * 16 + digit;
      end loop;
      return ivalue;
   end;

   procedure Shrink_line(L : inout LINE; pos : in integer) is
   subtype nstring is string(1 to pos);
   variable stmp : nstring;
   begin
      if pos >= 1 then
         read(l, stmp);
      end if;
   end;


END lpm_ram_dq ;


--------------------------------------------------------------------------
--   This VHDL file was developed by Altera Corporation.  It may be
-- freely copied and/or distributed at no cost.  Any persons using this
-- file for any purpose do so at their own risk, and are responsible for
-- the results of such use.  Altera Corporation does not guarantee that
-- this file is complete, correct, or fit for any particular purpose.
-- NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  This notice must
-- accompany any copy of this file.
--
--------------------------------------------------------------------------
-- LPM Synthesizable Models (Support string type generic)
-- These models are based on LPM version 220 (EIA-IS103 October 1998).
-------------------------------------------------------------------------
-- Version Quartus v1.1 (lpm 220)      Date 02/01/01
--------------------------------------------------------------------------
architecture lpm_syn of lpm_ram_dq is

--type lpm_memory is array(lpm_numwords-1 downto 0) of std_logic_vector(lpm_width-1 downto 0);
type lpm_memory is array((2**lpm_widthad)-1 downto 0) of std_logic_vector(lpm_width-1 downto 0);

signal data_tmp : std_logic_vector(lpm_width-1 downto 0);
signal data_reg : std_logic_vector(lpm_width-1 downto 0) := (others => '0');
signal q_tmp : std_logic_vector(lpm_width-1 downto 0) := (others => '0');
signal q_reg : std_logic_vector(lpm_width-1 downto 0) := (others => '0');
signal address_tmp : std_logic_vector(lpm_widthad-1 downto 0);
signal address_reg : std_logic_vector(lpm_widthad-1 downto 0) := (others => '0');
signal we_tmp : std_logic;
signal we_reg : std_logic := '0';

begin

	sync: process(data, data_reg, address, address_reg,
				  we, we_reg, q_tmp, q_reg)
	begin
		if (lpm_address_control = "REGISTERED") then
			address_tmp <= address_reg;
			we_tmp <= we_reg;
        elsif (lpm_address_control = "UNREGISTERED") then
			address_tmp <= address;
			we_tmp <= we;
        else
            ASSERT FALSE
            REPORT "Illegal LPM_ADDRESS_CONTROL property value for LPM_RAM_DQ!"
            SEVERITY ERROR;
		end if;
		if (lpm_indata = "REGISTERED") then
			data_tmp <= data_reg;
        elsif (lpm_indata = "UNREGISTERED") then
			data_tmp <= data;
        else
            ASSERT FALSE
            REPORT "Illegal LPM_INDATA property value for LPM_RAM_DQ!"
            SEVERITY ERROR;
		end if;
		if (lpm_outdata = "REGISTERED") then
			q <= q_reg;
        elsif (lpm_outdata = "UNREGISTERED") then
			q <= q_tmp;
        else
            ASSERT FALSE
            REPORT "Illegal LPM_OUTDATA property value for LPM_RAM_DQ!"
            SEVERITY ERROR;
		end if;
	end process;

	input_reg: process (inclock)
	begin
		if inclock'event and inclock = '1' then
			data_reg <= data;
			address_reg <= address;
			we_reg <= we;
		end if;
	end process;

	output_reg: process (outclock)
	begin
		if outclock'event and outclock = '1' then
			q_reg <= q_tmp;
		end if;
	end process;

	memory: process(data_tmp, we_tmp, address_tmp, inclock)
	variable mem_data : lpm_memory;
        variable mem_data_word : std_logic_vector(lpm_width-1 downto 0);
	variable mem_init: boolean := false;
	variable i,j,k,n,m,lineno: integer := 0;
	variable buf: line ;
	variable booval: boolean ;
	FILE unused_file: TEXT IS OUT "UNUSED";
	FILE mem_data_file: TEXT IS IN LPM_FILE;
	variable base, byte, rec_type, datain, addr, checksum: string(2 downto 1);
	variable startadd: string(4 downto 1);
	variable ibase: integer := 0;
	variable ibyte: integer := 0;
	variable istartadd: integer := 0;
	variable check_sum_vec, check_sum_vec_tmp: std_logic_vector(7 downto 0);
	begin
		-- INITIALIZE --
		if NOT(mem_init) then
			-- INITIALIZE TO 0 --
			for i in mem_data'LOW to mem_data'HIGH loop
				mem_data(i) := (OTHERS => '0');
			end loop;

			if (LPM_FILE = "UNUSED") then
				ASSERT FALSE
				REPORT "Initialization file not found!"
				SEVERITY WARNING;
			else
				WHILE NOT ENDFILE(mem_data_file) loop
					booval := true;
					READLINE(mem_data_file, buf);
					lineno := lineno + 1;
					check_sum_vec := (OTHERS => '0');
					if (buf(buf'LOW) = ':') then
						i := 1;
						shrink_line(buf, i);
						READ(L=>buf, VALUE=>byte, good=>booval);
						if not (booval) then
							ASSERT FALSE
							REPORT "[Line "& int_to_str(lineno) & "]:Illegal Intel Hex Format!"
							SEVERITY ERROR;
						end if;
						ibyte := hex_str_to_int(byte);
						check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(ibyte, 8));
						READ(L=>buf, VALUE=>startadd, good=>booval);
						if not (booval) then
							ASSERT FALSE
							REPORT "[Line "& int_to_str(lineno) & "]:Illegal Intel Hex Format! "
							SEVERITY ERROR;
						end if;
						istartadd := hex_str_to_int(startadd);
						addr(2) := startadd(4);
						addr(1) := startadd(3);
						check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(hex_str_to_int(addr), 8));
						addr(2) := startadd(2);
						addr(1) := startadd(1);
						check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(hex_str_to_int(addr), 8));
						READ(L=>buf, VALUE=>rec_type, good=>booval);
						if not (booval) then
							ASSERT FALSE
							REPORT "[Line "& int_to_str(lineno) & "]:Illegal Intel Hex Format! "
							SEVERITY ERROR;
						end if;
						check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(hex_str_to_int(rec_type), 8));
					else
						ASSERT FALSE
						REPORT "[Line "& int_to_str(lineno) & "]:Illegal Intel Hex Format! "
						SEVERITY ERROR;
					end if;
					case rec_type is
						when "00"=>     -- Data record
							i := 0;
							k := lpm_width / 8;
							if ((lpm_width MOD 8) /= 0) then
								k := k + 1; 
							end if;
							-- k = no. of bytes per CAM entry.
							while (i < ibyte) loop
                                                                mem_data_word := (others => '0');
                                                                n := (k - 1)*8;
                                                                m := lpm_width - 1;
								for j in 1 to k loop
									READ(L=>buf, VALUE=>datain,good=>booval); -- read in data a byte (2 hex chars) at a time.
									if not (booval) then
										ASSERT FALSE
										REPORT "[Line "& int_to_str(lineno) & "]:Illegal Intel Hex Format! "
										SEVERITY ERROR;
									end if;
									check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(hex_str_to_int(datain), 8));
                                                                        mem_data_word(m downto n) := CONV_STD_LOGIC_VECTOR(hex_str_to_int(datain), m-n+1);
                                                                        m := n - 1;
                                                                        n := n - 8;
								end loop;
								i := i + k;
								mem_data(ibase + istartadd) := mem_data_word;
								istartadd := istartadd + 1;
							end loop;
						when "01"=>
							exit;
						when "02"=>
							ibase := 0;
							if (ibyte /= 2) then
								ASSERT FALSE
								REPORT "[Line "& int_to_str(lineno) & "]:Illegal Intel Hex Format for record type 02! "
								SEVERITY ERROR;
							end if;
							for i in 0 to (ibyte-1) loop
								READ(L=>buf, VALUE=>base,good=>booval);
								ibase := ibase * 256 + hex_str_to_int(base);
								if not (booval) then
									ASSERT FALSE
									REPORT "[Line "& int_to_str(lineno) & "]:Illegal Intel Hex Format! "
									SEVERITY ERROR;
								end if;
								check_sum_vec := unsigned(check_sum_vec) + unsigned(CONV_STD_LOGIC_VECTOR(hex_str_to_int(base), 8));
							end loop;
							ibase := ibase * 16;
						when OTHERS =>
							ASSERT FALSE
							REPORT "[Line "& int_to_str(lineno) & "]:Illegal record type in Intel Hex File! "
							SEVERITY ERROR;
					end case;
					READ(L=>buf, VALUE=>checksum,good=>booval);
					if not (booval) then
						ASSERT FALSE
						REPORT "[Line "& int_to_str(lineno) & "]:Checksum is missing! "
						SEVERITY ERROR;
					end if;

					check_sum_vec := unsigned(not (check_sum_vec)) + 1 ;
					check_sum_vec_tmp := CONV_STD_LOGIC_VECTOR(hex_str_to_int(checksum),8);

					if (unsigned(check_sum_vec) /= unsigned(check_sum_vec_tmp)) then
						ASSERT FALSE
						REPORT "[Line "& int_to_str(lineno) & "]:Incorrect checksum!"
						SEVERITY ERROR;
					end if;
				end loop;
			end if;
			mem_init := TRUE;
		end if;

		-- MEMORY FUNCTION --
		if we_tmp = '1' then
                        if (((use_eab = "ON") or (lpm_hint = "USE_EAB=ON")) and (lpm_address_control = "REGISTERED")) then
			    if (inclock = '0') then
                                mem_data (conv_integer(address_tmp)) := data_tmp ;
                            end if;
                        else
			    mem_data (conv_integer(address_tmp)) := data_tmp;
                        end if;
		end if;
		q_tmp <= mem_data(conv_integer(address_tmp));
	end process;

end lpm_syn;
