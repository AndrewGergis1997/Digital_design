----------------------------------------------------------------------------
--
-- Copyright (c) 1990, 1991 by Synopsys, Inc.  All rights reserved.
-- 
-- This source file may be used and distributed without restriction 
-- provided that this copyright statement is not removed from the file 
-- and that any derivative work contains this copyright notice.
--
--	Package name: TYPES
--
--	Purpose: This package defines the types, logic functions,
--		 truth tables, definitions for wired signals, and
--		 conversion functions for the Synopsys Standard Logic library.
--
--	Author: JT, PH, GWH
--
--	Modified with attributes for Synopsys synthesis.
--
--	Also synthesis_off and synthesis_on pairs required because
--	synthesis does not fully support or gives warnings about:
--	    1) Multi-dimentional arrays
--	    2) aliases  
--	    3) assert
--
----------------------------------------------------------------------------
-- Exemplar : Added Synthesis Directive Attributes for CORE 
--      These attributes work like the Synopsys pragmas. The
--      attributes are declared in the "attributes" vhdl package 
----------------------------------------------------------------------------

package body TYPES is


	-----------------------------------------------------------------------
	--
	-- logical functions for scalar type of MVL7
	--
	-----------------------------------------------------------------------

	function "and" (L, R: MVL7) return MVL7 is
	  -- pragma built_in SYN_AND
--synopsys synthesis_off
            variable result : MVL7 ;
            -- Set Exemplar Synthesis Directive for this function
            attribute SYNTHESIS_RETURN of result:variable IS "AND" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		result := tbl_AND(L, R);
                return result ;
--synopsys synthesis_on
	end "and";



	function "nand" (L, R: MVL7) return MVL7 is
	  -- pragma built_in SYN_NAND
--synopsys synthesis_off
            variable result : MVL7 ;
            -- Set Exemplar Synthesis Directive for this function
            attribute SYNTHESIS_RETURN of result:variable IS "NAND" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		result := tbl_NOT(tbl_AND(L, R));
                return result ;
--synopsys synthesis_on
	end "nand";



	function "or" (L, R: MVL7) return MVL7 is
	  -- pragma built_in SYN_OR
--synopsys synthesis_off
            variable result : MVL7 ;
            -- Set Exemplar Synthesis Directive for this function
            attribute SYNTHESIS_RETURN of result:variable IS "OR" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		result := tbl_OR(L, R);
                return result ;
--synopsys synthesis_on
	end "or";



	function "nor" (L, R: MVL7) return MVL7 is
	  -- pragma built_in SYN_NOR
--synopsys synthesis_off
            variable result : MVL7 ;
            -- Set Exemplar Synthesis Directive for this function
            attribute SYNTHESIS_RETURN of result:variable IS "NOR" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		result := tbl_NOT(tbl_OR(L, R));
                return result ;
--synopsys synthesis_on
	end "nor";



	function "xor" (L, R: MVL7) return MVL7 is
	  -- pragma built_in SYN_XOR
--synopsys synthesis_off
            variable result : MVL7 ;
            -- Set Exemplar Synthesis Directive for this function
            attribute SYNTHESIS_RETURN of result:variable IS "XOR" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		result := tbl_XOR(L, R);
                return result ;
--synopsys synthesis_on
	end "xor";


	function nxor (L, R: MVL7) return MVL7 is
	  -- pragma built_in SYN_XNOR
--synopsys synthesis_off
            variable result : MVL7 ;
            -- Set Exemplar Synthesis Directive for this function
            attribute SYNTHESIS_RETURN of result:variable IS "XNOR" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		result := tbl_NOT(tbl_XOR(L, R));
                return result ;
--synopsys synthesis_on
	end nxor;


	function "not" (R: MVL7) return MVL7 is
	  -- pragma built_in SYN_NOT
--synopsys synthesis_off
            variable result : MVL7 ;
            -- Set Exemplar Synthesis Directive for this function
            attribute SYNTHESIS_RETURN of result:variable IS "NOT" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		result := tbl_NOT(R);
                return result ;
--synopsys synthesis_on
	end "not";


	function buf (R: MVL7) return MVL7 is
	  -- pragma built_in SYN_BUF
--synopsys synthesis_off
            variable result : MVL7 ;
            -- Set Exemplar Synthesis Directive for this function
            attribute SYNTHESIS_RETURN of result:variable IS "FEED_THROUGH" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		result := tbl_BUF(R);
                return result ;
--synopsys synthesis_on
	end buf;



	-----------------------------------------------------------------------
	--
	-- logical functions for composite type of MVL7_VECTOR
	--
	-----------------------------------------------------------------------

	function "and" (L, R: MVL7_VECTOR) return MVL7_VECTOR is
	  -- pragma built_in SYN_AND
--synopsys synthesis_off
		alias LV: MVL7_VECTOR (L'length-1 downto 0) is L;
		alias RV: MVL7_VECTOR (R'length-1 downto 0) is R;
		variable result: MVL7_VECTOR (L'length-1 downto 0);
                -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "AND" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		assert L'length = R'length;
		for i in result'range loop
			result (i) := tbl_AND(LV (i), RV (i));
		end loop;
		return result;
--synopsys synthesis_on
	end "and";


	function "nand" (L, R: MVL7_VECTOR) return MVL7_VECTOR is
	  -- pragma built_in SYN_NAND
--synopsys synthesis_off
		alias LV: MVL7_VECTOR (L'length-1 downto 0) is L;
		alias RV: MVL7_VECTOR (R'length-1 downto 0) is R;
		variable result: MVL7_VECTOR (L'length-1 downto 0);
                -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "NAND" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		assert L'length = R'length;
		for i in result'range loop
			result (i) := tbl_NOT(tbl_AND(LV (i), RV (i)));
		end loop;
		return result;
--synopsys synthesis_on
	end "nand";


	function "or" (L, R: MVL7_VECTOR) return MVL7_VECTOR is
	  -- pragma built_in SYN_OR
--synopsys synthesis_off
		alias LV: MVL7_VECTOR (L'length-1 downto 0) is L;
		alias RV: MVL7_VECTOR (R'length-1 downto 0) is R;
		variable result: MVL7_VECTOR (L'length-1 downto 0);
                -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "OR" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		assert L'length = R'length;
		for i in result'range loop
			result (i) := tbl_OR(LV (i), RV (i));
		end loop;
		return result;
--synopsys synthesis_on
	end "or";


	function "nor" (L, R: MVL7_VECTOR) return MVL7_VECTOR is
	  -- pragma built_in SYN_NOR
--synopsys synthesis_off
		alias LV: MVL7_VECTOR (L'length-1 downto 0) is L;
		alias RV: MVL7_VECTOR (R'length-1 downto 0) is R;
		variable result: MVL7_VECTOR (L'length-1 downto 0);
                -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "NOR" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		assert L'length = R'length;
		for i in result'range loop
			result (i) := tbl_NOT(tbl_OR(LV (i), RV (i)));
		end loop;
		return result;
--synopsys synthesis_on
	end "nor";


	function "xor" (L, R: MVL7_VECTOR) return MVL7_VECTOR is
	  -- pragma built_in SYN_XOR
--synopsys synthesis_off
		alias LV: MVL7_VECTOR (L'length-1 downto 0) is L;
		alias RV: MVL7_VECTOR (R'length-1 downto 0) is R;
		variable result: MVL7_VECTOR (L'length-1 downto 0);
                -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "XOR" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		assert L'length = R'length;
		for i in result'range loop
			result (i) := tbl_XOR(LV (i), RV (i));
		end loop;
		return result;
--synopsys synthesis_on
	end "xor";


	function nxor (L, R: MVL7_VECTOR) return MVL7_VECTOR is
	  -- pragma built_in SYN_XNOR
--synopsys synthesis_off
		alias LV: MVL7_VECTOR (L'length-1 downto 0) is L;
		alias RV: MVL7_VECTOR (R'length-1 downto 0) is R;
		variable result: MVL7_VECTOR (L'length-1 downto 0);
                -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "XNOR" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		assert L'length = R'length;
		for i in result'range loop
			 result(i) := tbl_NOT(tbl_XOR(LV(i), RV(i)));
		end loop;
		return result;
--synopsys synthesis_on
	end nxor;


	function "not" (R: MVL7_VECTOR) return MVL7_VECTOR is
	  -- pragma built_in SYN_NOT
--synopsys synthesis_off
		alias RV: MVL7_VECTOR (R'length-1 downto 0) is R;
		variable result: MVL7_VECTOR (R'length-1 downto 0);
                -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "NOT" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		for i in result'range loop
			result (i) := tbl_NOT( RV(i) );
		end loop;
		return result;
--synopsys synthesis_on
	end "not";


	function buf (R: MVL7_VECTOR) return MVL7_VECTOR is
	  -- pragma built_in SYN_BUF
--synopsys synthesis_off
		alias RV: MVL7_VECTOR (R'length-1 downto 0) is R;
		variable result: MVL7_VECTOR (R'length-1 downto 0);
                -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "FEED_THROUGH" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		for i in result'range loop
		 	 result(i) := tbl_BUF( RV(i) );
		end loop;
		return result;
--synopsys synthesis_on
	end buf;




	-----------------------------------------------------------------------
	--
	-- resolution functions for wired signals 
	--
	-----------------------------------------------------------------------


	function WiredX (V: MVL7_VECTOR) return MVL7 is
	  -- pragma resolution_method three_state

		variable result: MVL7;
                -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "WIRED_THREE_STATE" ;
	begin
--synopsys synthesis_off
		result := 'Z';
		for i in V'range loop
			result := tbl_WIREDX(result, V(i));
			exit when result = 'X';		
		end loop;
		return result;
--synopsys synthesis_on
	end WiredX;




	-----------------------------------------------------------------------
	--
	-- conversion functions for driving various types
	--
	-----------------------------------------------------------------------



	function Drive (V: BusX) return MVL7_VECTOR is
	begin
		return MVL7_VECTOR(V);
	end Drive;




	function Drive (V: MVL7_VECTOR) return BusX is
	begin
		return BusX(V);
	end Drive;


	-----------------------------------------------------------------------
	--
	-- conversion functions for sensing various types
	--
	-- (the second argument allows the user to specify the value to
	--  be returned when the network is undriven)
	--
	-----------------------------------------------------------------------
-- synopsys synthesis_off

	function Sense (V: MVL7; vZ: MVL7) return MVL7 is
	begin
		if V = 'Z' then
			return vZ;
		else
			return V;
		end if;
	end Sense;


	function Sense (V: MVL7_VECTOR; vZ: MVL7) return MVL7_VECTOR is
		alias Value: MVL7_VECTOR (V'length-1 downto 0) is V;
		variable Result: MVL7_VECTOR (V'length-1 downto 0);
	begin
		for i in Value'range loop
			if ( Value(i) = 'Z' ) then
				Result(i) := vZ;
			else
				Result(i) := Value(i);
			end if;
		end loop;
		return Result;
	end Sense;


	function Sense (V: BusX; vZ: MVL7) return MVL7_VECTOR is
		alias Value: BusX (V'length-1 downto 0) is V;
		variable Result: MVL7_VECTOR (V'length-1 downto 0);
	begin
		for i in Value'range loop
			if ( Value(i) = 'Z' ) then
				Result(i) := vZ;
			else
				Result(i) := Value(i);
			end if;
		end loop;
		return Result;
	end Sense;

-- synopsys synthesis_on

	-----------------------------------------------------------------------
	--
	--	Function: BVtoMVL7V
	--
	--	Purpose: Conversion function from BIT_VECTOR to MVL7_VECTOR
	--
	--	Mapping:	0 --> 0
	--			1 --> 1
	--
	-----------------------------------------------------------------------

	function BVtoMVL7V (V: BIT_VECTOR) return MVL7_VECTOR is
	  -- pragma built_in SYN_FEED_THRU
--synopsys synthesis_off
		alias Value: BIT_VECTOR (V'length-1 downto 0) is V;
		variable Result: MVL7_VECTOR (V'length-1 downto 0);
          -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "FEED_THROUGH" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		for i in Value'range loop
			if ( Value(i) = '0' ) then
				Result(i) := '0';
			else
				Result(i) := '1';
			end if;
		end loop;
		return Result;
--synopsys synthesis_on
	end BVtoMVL7V;



	-----------------------------------------------------------------------
	--
	--	Function: MVL7VtoBV
	--
	--	Purpose: Conversion function from MVL7_VECTOR to BIT_VECTOR
	--
	--	Mapping:	0, L --> 0
	--			1, H --> 1
	--			X --> vX if Xflag is TRUE
	--			X --> 0  if Xflag is FALSE
	--			Z --> vZ if Zflag is TRUE
	--			Z --> 0  if Zflag is FALSE
	--
	-----------------------------------------------------------------------

	function MVL7VtoBV (V: MVL7_VECTOR
--synopsys synthesis_off
		; vX, vZ: BIT := '0'; Xflag, Zflag: BOOLEAN := FALSE
--synopsys synthesis_on
			   ) return BIT_VECTOR is
	  -- pragma built_in SYN_FEED_THRU
--synopsys synthesis_off
		alias Value: MVL7_VECTOR (V'length-1 downto 0) is V;
		variable Result: BIT_VECTOR (V'length-1 downto 0);
          -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "FEED_THROUGH" ;
--synopsys synthesis_on
	begin
--synopsys synthesis_off
		for i in Value'range loop
			case Value(i) is
				when '0' | 'L' =>
					Result(i) := '0';
				when '1' | 'H' =>
					Result(i) := '1';
				when 'X' | 'W' =>
					if ( Xflag ) then
						Result(i) := vX;
					else
						Result(i) := '0';
				 		assert FALSE
					 	    report "MVL7VtoBV: X --> 0"
					 	    severity WARNING;
					end if;
				when others =>
					if ( Zflag ) then
						Result(i) := vZ;
					else
						Result(i) := '0';
						assert FALSE
						    report "MVL7VtoBV: Z --> 0"
						    severity WARNING;
					end if;
			end case;
		end loop;
		return Result;
--synopsys synthesis_on
	end MVL7VtoBV;



	-----------------------------------------------------------------------
	--
	--	Function: BITtoMVL7
	--
	--	Purpose: Conversion function from BIT to MVL7
	--
	--	Mapping:	0 --> 0
	--			1 --> 1
	--
	-----------------------------------------------------------------------

	function BITtoMVL7 (V: BIT) return MVL7 is
		variable Result: MVL7;
	  -- pragma built_in SYN_FEED_THRU
          -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "FEED_THROUGH" ;
	begin
		if ( V = '0' ) then
			Result := '0';
		else
			Result := '1';
		end if;
		return Result;
	end BITtoMVL7;




	-----------------------------------------------------------------------
	--
	--	Function: MVL7toBIT
	--
	--	Purpose: Conversion function from MVL7 to BIT
	--
	--	Mapping:	0, L --> 0
	--			1, H --> 1
	--			X --> vX if Xflag is TRUE
	--			X --> 0  if Xflag is FALSE
	--			Z --> vZ if Zflag is TRUE
	--			Z --> 0  if Zflag is FALSE
	--
	-----------------------------------------------------------------------

	function MVL7toBIT (V: MVL7
--synopsys synthesis_off
		; vX, vZ: BIT := '0'; Xflag, Zflag: BOOLEAN := FALSE
--synopsys synthesis_on
			   ) return BIT is
	  -- pragma built_in SYN_FEED_THRU
		variable Result: BIT;
          -- Set Exemplar Synthesis Directive for this function
                attribute SYNTHESIS_RETURN of result:variable IS "FEED_THROUGH" ;
	begin
--synopsys synthesis_off
		case V is
			when '0' | 'L' =>
				Result := '0';
			when '1' | 'H' =>
				Result := '1';
			when 'X' | 'W' =>
				if ( Xflag ) then
					Result := vX;
				else
					Result := '0';
			 		assert FALSE
				 	    report "MVL7toBIT: X --> 0"
				 	    severity WARNING;
				end if;
			when others =>
				if ( Zflag ) then
					Result := vZ;
				else
					Result := '0';
					assert FALSE
					    report "MVL7toBIT: Z --> 0"
					    severity WARNING;
				end if;
		end case;
		return Result;
--synopsys synthesis_on
	end MVL7toBIT;

end TYPES;

