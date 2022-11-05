--------------------------------------------------------------------------
--                                                                      --
-- Copyright (c) 1990, 1991, 1992 by Synopsys, Inc.                     --
--                                             All rights reserved.     --
--                                                                      --
-- This source file may be used and distributed without restriction     --
-- provided that this copyright statement is not removed from the file  --
-- and that any derivative work contains this copyright notice.         --
--                                                                      --
--	Package name: STD_LOGIC_SIGNED                                  --
--                                 					--
--									--
--      Date:        09/11/91 KN                                        --
--                   10/08/92 AMT change std_ulogic to signed std_logic --
--		     10/28/92 AMT added signed functions, -, ABS	--
--									--
--	Purpose: 							--
--	 A set of signed arithemtic, conversion,                        --
--           and comparision functions for STD_LOGIC_VECTOR.            --
--									--
--	Note:	Comparision of same length std_logic_vector is defined  --
--		in the LRM.  The interpretation is for unsigned vectors --
--		This package will "overload" that definition.		--
--									--
--------------------------------------------------------------------------

---------------------------------------------------
-- Attributes added to invoke MTI builtin functions
---------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

package STD_LOGIC_SIGNED is

    function "+"(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_plus_sss";

    function "+"(L: STD_LOGIC_VECTOR; R: INTEGER) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_LOGIC_VECTOR, INTEGER return STD_LOGIC_VECTOR]: 
		function is "stdarith_plus_sis";

    function "+"(L: INTEGER; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[INTEGER, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_plus_iss";

    function "+"(L: STD_LOGIC_VECTOR; R: STD_LOGIC) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_LOGIC_VECTOR, STD_LOGIC return STD_LOGIC_VECTOR]: 
		function is "stdarith_plus_sxs";

    function "+"(L: STD_LOGIC; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_LOGIC, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_plus_xss";


    function "-"(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_minus_sss";

    function "-"(L: STD_LOGIC_VECTOR; R: INTEGER) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_LOGIC_VECTOR, INTEGER return STD_LOGIC_VECTOR]: 
		function is "stdarith_minus_sis";

    function "-"(L: INTEGER; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[INTEGER, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_minus_iss";

    function "-"(L: STD_LOGIC_VECTOR; R: STD_LOGIC) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_LOGIC_VECTOR, STD_LOGIC return STD_LOGIC_VECTOR]: 
		function is "stdarith_minus_sxs";

    function "-"(L: STD_LOGIC; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_LOGIC, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_minus_xss";


    function "+"(L: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_unary_plus_ss";

    function "-"(L: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_unary_minus_ss";

    function "ABS"(L: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "ABS"[STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_abs_ss";



    function "*"(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "*"[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: 
		function is "stdarith_mult_sss";


    function "<"(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_lt_ss";

    function "<"(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_lt_si";

    function "<"(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_lt_is";


    function "<="(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_lte_ss";

    function "<="(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_lte_si";

    function "<="(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_lte_is";


    function ">"(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_gt_ss";

    function ">"(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_gt_si";

    function ">"(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_gt_is";


    function ">="(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_gte_ss";

    function ">="(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_gte_si";

    function ">="(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_gte_is";


    function "="(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "="[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_eq_ss";

    function "="(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "="[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_eq_si";

    function "="(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "="[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_eq_is";


    function "/="(L: STD_LOGIC_VECTOR; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_neq_ss";

    function "/="(L: STD_LOGIC_VECTOR; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[STD_LOGIC_VECTOR, INTEGER return BOOLEAN]: 
		function is "stdarith_neq_si";

    function "/="(L: INTEGER; R: STD_LOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[INTEGER, STD_LOGIC_VECTOR return BOOLEAN]: 
		function is "stdarith_neq_is";

    function SHL(ARG:STD_LOGIC_VECTOR;COUNT: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR; 
    attribute builtin_subprogram of
        SHL[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: function is "stdarith_shl_sus";

    function SHR(ARG:STD_LOGIC_VECTOR;COUNT: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR; 
    attribute builtin_subprogram of
        SHR[STD_LOGIC_VECTOR, STD_LOGIC_VECTOR return STD_LOGIC_VECTOR]: function is "stdarith_shr_sus";

    function CONV_INTEGER(ARG: STD_LOGIC_VECTOR) return INTEGER;
    attribute builtin_subprogram of
        CONV_INTEGER[STD_LOGIC_VECTOR return INTEGER]: 
		function is "stdarith_conv_integer_si"; 


-- remove this since it is already in std_logic_arith
--    function CONV_STD_LOGIC_VECTOR(ARG: INTEGER; SIZE: INTEGER) return STD_LOGIC_VECTOR;

end STD_LOGIC_SIGNED;

