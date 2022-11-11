--------------------------------------------------------------------------
--                                                                      --
-- Copyright (c) 1990, 1991, 1992 by Synopsys, Inc.                     --
--                                             All rights reserved.     --
--                                                                      --
-- This source file may be used and distributed without restriction     --
-- provided that this copyright statement is not removed from the file  --
-- and that any derivative work contains this copyright notice.         --
--                                                                      --
--	Package name: STD_LOGIC_UNSIGNED                                --
--                                 					--
--									--
--      Date:        	09/11/92	KN				--
--			10/08/92 	AMT				--
--									--
--	Purpose: 							--
--	 A set of unsigned arithemtic, conversion,                      --
--           and comparision functions for STD_LOGIC_VECTOR.            --
--									--
--	Note:  comparision of same length discrete arrays is defined	--
--		by the LRM.  This package will "overload" those 	--
--		definitions						--
--									--
--------------------------------------------------------------------------

---------------------------------------------------
-- Attributes added to invoke MTI builtin functions
---------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

package STD_LOGIC_UNSIGNED is

    attribute builtin_subprogram: string;

    function "+"(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_plus_uuu";

    function "+"(L: STD_LOGIC_VECTOR; R: INTEGER) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_LOGIC_VECTOR, INTEGER return STD_LOGIC_VECTOR]: 
		function is "stdarith_plus_uiu";

    function "+"(L: INTEGER; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[INTEGER, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_plus_iuu";

    function "+"(L: STD_LOGIC_VECTOR; R: STD_LOGIC) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_LOGIC_VECTOR, STD_LOGIC return STD_LOGIC_VECTOR]: 
		function is "stdarith_plus_uxu";

    function "+"(L: STD_LOGIC; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_LOGIC, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_plus_xuu";


    function "-"(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_minus_uuu";

    function "-"(L: STD_LOGIC_VECTOR; R: INTEGER) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_LOGIC_VECTOR, INTEGER return STD_LOGIC_VECTOR]: 
		function is "stdarith_minus_uiu";

    function "-"(L: INTEGER; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[INTEGER, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_minus_iuu";

    function "-"(L: STD_LOGIC_VECTOR; R: STD_LOGIC) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_LOGIC_VECTOR, STD_LOGIC return STD_LOGIC_VECTOR]: 
		function is "stdarith_minus_uxu";

    function "-"(L: STD_LOGIC; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_LOGIC, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_minus_xuu";


    function "+"(L: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_unary_plus_uu";


    function "*"(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "*"[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_mult_uuu";


    function "<"(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_lt_uu";

    function "<"(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_lt_ui";

    function "<"(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_lt_iu";


    function "<="(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_lte_uu";

    function "<="(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_lte_ui";

    function "<="(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_lte_iu";


    function ">"(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_gt_uu";

    function ">"(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_gt_ui";

    function ">"(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_gt_iu";


    function ">="(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_gte_uu";

    function ">="(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_gte_ui";

    function ">="(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_gte_iu";


    function "="(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "="[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_eq_uu";

    function "="(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "="[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_eq_ui";

    function "="(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "="[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_eq_iu";


    function "/="(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_neq_uu";

    function "/="(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_neq_ui";

    function "/="(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_neq_iu";

    function SHL(ARG:STD_LOGIC_VECTOR;COUNT: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        SHL[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: function is "stdarith_shl_uuu";

    function SHR(ARG:STD_LOGIC_VECTOR;COUNT: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        SHR[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: function is "stdarith_shr_uuu";

    function CONV_INTEGER(ARG: STD_LOGIC_VECTOR) return INTEGER;
    attribute builtin_subprogram of
        CONV_INTEGER[STD_LOGIC_VECTOR return INTEGER]: 
		function is "stdarith_conv_integer_ui2"; 
------------------------------------------------------------------------------------------
--  If desired, you may select an optional implementation for CONV_INTEGER(STD_LOGIC_VECTOR)
--  by changing the value of the attribute:
--      stdarith_conv_integer_ui implements the original CONV_INTEGER(STD_LOGIC_VECTOR) VHDL which
--          generates an error if the argument is larger than 31 bits.
--      stdarith_conv_integer_ui2 allows 32 bits. It generates a warning if the
--          argument is 32 bits and the MSB is not zero.
--      The default is stdarith_conv_integer_ui2.
--
--    attribute builtin_subprogram of
--        CONV_INTEGER[STD_LOGIC_VECTOR return INTEGER]: function is "stdarith_conv_integer_ui"; 
------------------------------------------------------------------------------------------


-- remove this since it is already in std_logic_arith
--    function CONV_STD_LOGIC_VECTOR(ARG: INTEGER; SIZE: INTEGER) return STD_LOGIC_VECTOR;

end STD_LOGIC_UNSIGNED;

