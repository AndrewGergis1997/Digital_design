--
--  Copyright Model Technology, a  Mentor Graphics
--  Corporation company 2003, - All rights reserved.
-- 

package body vl_types is
	function resolved (s : vl_ulogic_vector) return vl_ulogic is
		variable max0, max1, min0, min1 : integer := 0;
		variable result, str_hi, str_lo : integer;
		variable val : vl_value;
	begin
		for i in s'range loop
			result := vl_ulogic'pos(s(i));
			str_lo := (result / 4) mod 8;
			str_hi := result / 32;
			val := vl_value'val(result mod 4);
			if val = v0 then
				if str_lo > min0 then min0 := str_lo; end if;
				if str_hi > max0 then max0 := str_hi; end if;
			elsif val = v1 then
				if str_lo > min1 then min1 := str_lo; end if;
				if str_hi > max1 then max1 := str_hi; end if;
			elsif val = vX then
				if str_lo > max1 then max1 := str_lo; end if;
				if str_hi > max0 then max0 := str_hi; end if;
			end if;
		end loop;
		if min1 > max0 then
			result := (max1 * 32) + (min1 * 4) + 1;
		elsif (min0 > max1) then
			result := (max0 * 32) + (min0 * 4);
		elsif ((max1 /= 0) or (max0 /= 0)) then
			result := (max0 * 32) + (max1 * 4) + 3;
		else
			result := 2;
		end if;
		return vl_ulogic'val(result);
	end resolved;

	function to_bit (s : vl_ulogic) return bit is
		variable val : vl_value;
	begin
		val := vl_value'val(vl_ulogic'pos(s) mod 4);
		if val = v1 then
			return('1');
		else
			return ('0');
		end if;
	end;

	function to_bitvector (s : vl_ulogic_vector) return bit_vector is
		alias sv : vl_ulogic_vector(s'length-1 downto 0) is s;
		variable result : bit_vector(s'length-1 downto 0);
		variable val : vl_value;
	begin
		for i in result'range loop
			val := vl_value'val(vl_ulogic'pos(sv(i)) mod 4);
			if val = v1 then
				result(i) := '1';
			else
				result(i) := '0';
			end if;
		end loop;
		return result;
	end;

	function to_bitvector (s : vl_logic_vector) return bit_vector is
		alias sv : vl_logic_vector(s'length-1 downto 0) is s;
		variable result : bit_vector(s'length-1 downto 0);
		variable val : vl_value;
	begin
		for i in result'range loop
			val := vl_value'val(vl_ulogic'pos(sv(i)) mod 4);
			if val = v1 then
				result(i) := '1';
			else
				result(i) := '0';
			end if;
		end loop;
		return result;
	end;

	function to_vlULogic (s : bit) return vl_ulogic is
	begin
		case s is
			when '0' => return St0;
			when '1' => return St1;
		end case;
	end;

	function to_vlULogicVector (s : bit_vector) return vl_ulogic_vector is
		alias sv : bit_vector(s'length-1 downto 0) is s;
		variable result : vl_ulogic_vector(s'length-1 downto 0);
	begin
		for i in result'range loop
			case sv(i) is
				when '0' => result(i) := St0;
				when '1' => result(i) := St1;
			end case;
		end loop;
		return result;
	end;

	function to_vlLogicVector (s : bit_vector) return vl_logic_vector is
		alias sv : bit_vector(s'length-1 downto 0) is s;
		variable result : vl_logic_vector(s'length-1 downto 0);
	begin
		for i in result'range loop
			case sv(i) is
				when '0' => result(i) := St0;
				when '1' => result(i) := St1;
			end case;
		end loop;
		return result;
	end;
end vl_types;
