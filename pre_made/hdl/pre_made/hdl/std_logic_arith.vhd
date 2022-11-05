--------------------------------------------------------------------------
--                                                                      --
-- Copyright (c) 1990,1991,1992 by Synopsys, Inc.  All rights reserved. --
--                                                                      --
-- This source file may be used and distributed without restriction     --
-- provided that this copyright statement is not removed from the file  --
-- and that any derivative work contains this copyright notice.         --
--                                                                      --
--	Package name: STD_LOGIC_ARITH					--
--									--
--	Purpose: 							--
--	 A set of arithemtic, conversion, and comparison functions 	--
--	 for SIGNED, UNSIGNED, SMALL_INT, INTEGER, 			--
--	 STD_ULOGIC, STD_LOGIC, and STD_LOGIC_VECTOR.			--
--									--
--------------------------------------------------------------------------

---------------------------------------------------
-- Attributes added to invoke MTI builtin functions
---------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package std_logic_arith is

    type UNSIGNED is array (NATURAL range <>) of STD_LOGIC;
    type SIGNED is array (NATURAL range <>) of STD_LOGIC;
    subtype SMALL_INT is INTEGER range 0 to 1;

    attribute builtin_subprogram: string;

    function "+"(L: UNSIGNED; R: UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "+"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "stdarith_plus_uuu";

    function "+"(L: SIGNED; R: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "+"[SIGNED, SIGNED return SIGNED]: function is "stdarith_plus_sss";

    function "+"(L: UNSIGNED; R: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "+"[UNSIGNED, SIGNED return SIGNED]: function is "stdarith_plus_uss";

    function "+"(L: SIGNED; R: UNSIGNED) return SIGNED;
    attribute builtin_subprogram of
        "+"[SIGNED, UNSIGNED return SIGNED]: function is "stdarith_plus_sus";

    function "+"(L: UNSIGNED; R: INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        "+"[UNSIGNED, INTEGER return UNSIGNED]: function is "stdarith_plus_uiu";

    function "+"(L: INTEGER; R: UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "+"[INTEGER, UNSIGNED return UNSIGNED]: function is "stdarith_plus_iuu";

    function "+"(L: SIGNED; R: INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "+"[SIGNED, INTEGER return SIGNED]: function is "stdarith_plus_sis";

    function "+"(L: INTEGER; R: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "+"[INTEGER, SIGNED return SIGNED]: function is "stdarith_plus_iss";

    function "+"(L: UNSIGNED; R: STD_ULOGIC) return UNSIGNED;
    attribute builtin_subprogram of
        "+"[UNSIGNED, STD_ULOGIC return UNSIGNED]: function is "stdarith_plus_uxu";

    function "+"(L: STD_ULOGIC; R: UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "+"[STD_ULOGIC, UNSIGNED return UNSIGNED]: function is "stdarith_plus_xuu";

    function "+"(L: SIGNED; R: STD_ULOGIC) return SIGNED;
    attribute builtin_subprogram of
        "+"[SIGNED, STD_ULOGIC return SIGNED]: function is "stdarith_plus_sxs";

    function "+"(L: STD_ULOGIC; R: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "+"[STD_ULOGIC, SIGNED return SIGNED]: function is "stdarith_plus_xss";

    function "+"(L: UNSIGNED; R: UNSIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[UNSIGNED, UNSIGNED return STD_LOGIC_VECTOR]: function is "stdarith_plus_uuu";

    function "+"(L: SIGNED; R: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[SIGNED, SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_plus_sss";

    function "+"(L: UNSIGNED; R: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[UNSIGNED, SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_plus_uss";

    function "+"(L: SIGNED; R: UNSIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[SIGNED, UNSIGNED return STD_LOGIC_VECTOR]: function is "stdarith_plus_sus";

    function "+"(L: UNSIGNED; R: INTEGER) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[UNSIGNED, INTEGER return STD_LOGIC_VECTOR]: function is "stdarith_plus_uiu";

    function "+"(L: INTEGER; R: UNSIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[INTEGER, UNSIGNED return STD_LOGIC_VECTOR]: function is "stdarith_plus_iuu";

    function "+"(L: SIGNED; R: INTEGER) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[SIGNED, INTEGER return STD_LOGIC_VECTOR]: function is "stdarith_plus_sis";

    function "+"(L: INTEGER; R: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[INTEGER, SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_plus_iss";

    function "+"(L: UNSIGNED; R: STD_ULOGIC) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[UNSIGNED, STD_ULOGIC return STD_LOGIC_VECTOR]: function is "stdarith_plus_uxu";

    function "+"(L: STD_ULOGIC; R: UNSIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_ULOGIC, UNSIGNED return STD_LOGIC_VECTOR]: function is "stdarith_plus_xuu";

    function "+"(L: SIGNED; R: STD_ULOGIC) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[SIGNED, STD_ULOGIC return STD_LOGIC_VECTOR]: function is "stdarith_plus_sxs";

    function "+"(L: STD_ULOGIC; R: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_ULOGIC, SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_plus_xss";


    function "-"(L: UNSIGNED; R: UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "-"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "stdarith_minus_uuu";

    function "-"(L: SIGNED; R: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "-"[SIGNED, SIGNED return SIGNED]: function is "stdarith_minus_sss";

    function "-"(L: UNSIGNED; R: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "-"[UNSIGNED, SIGNED return SIGNED]: function is "stdarith_minus_uss";

    function "-"(L: SIGNED; R: UNSIGNED) return SIGNED;
    attribute builtin_subprogram of
        "-"[SIGNED, UNSIGNED return SIGNED]: function is "stdarith_minus_sus";

    function "-"(L: UNSIGNED; R: INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        "-"[UNSIGNED, INTEGER return UNSIGNED]: function is "stdarith_minus_uiu";

    function "-"(L: INTEGER; R: UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "-"[INTEGER, UNSIGNED return UNSIGNED]: function is "stdarith_minus_iuu";

    function "-"(L: SIGNED; R: INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "-"[SIGNED, INTEGER return SIGNED]: function is "stdarith_minus_sis";

    function "-"(L: INTEGER; R: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "-"[INTEGER, SIGNED return SIGNED]: function is "stdarith_minus_iss";

    function "-"(L: UNSIGNED; R: STD_ULOGIC) return UNSIGNED;
    attribute builtin_subprogram of
        "-"[UNSIGNED, STD_ULOGIC return UNSIGNED]: function is "stdarith_minus_uxu";

    function "-"(L: STD_ULOGIC; R: UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "-"[STD_ULOGIC, UNSIGNED return UNSIGNED]: function is "stdarith_minus_xuu";

    function "-"(L: SIGNED; R: STD_ULOGIC) return SIGNED;
    attribute builtin_subprogram of
        "-"[SIGNED, STD_ULOGIC return SIGNED]: function is "stdarith_minus_sxs";

    function "-"(L: STD_ULOGIC; R: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "-"[STD_ULOGIC, SIGNED return SIGNED]: function is "stdarith_minus_xss";

    function "-"(L: UNSIGNED; R: UNSIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[UNSIGNED, UNSIGNED return STD_LOGIC_VECTOR]: function is "stdarith_minus_uuu";

    function "-"(L: SIGNED; R: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[SIGNED, SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_minus_sss";

    function "-"(L: UNSIGNED; R: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[UNSIGNED, SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_minus_uss";

    function "-"(L: SIGNED; R: UNSIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[SIGNED, UNSIGNED return STD_LOGIC_VECTOR]: function is "stdarith_minus_sus";

    function "-"(L: UNSIGNED; R: INTEGER) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[UNSIGNED, INTEGER return STD_LOGIC_VECTOR]: function is "stdarith_minus_uiu";

    function "-"(L: INTEGER; R: UNSIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[INTEGER, UNSIGNED return STD_LOGIC_VECTOR]: function is "stdarith_minus_iuu";

    function "-"(L: SIGNED; R: INTEGER) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[SIGNED, INTEGER return STD_LOGIC_VECTOR]: function is "stdarith_minus_sis";

    function "-"(L: INTEGER; R: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[INTEGER, SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_minus_iss";

    function "-"(L: UNSIGNED; R: STD_ULOGIC) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[UNSIGNED, STD_ULOGIC return STD_LOGIC_VECTOR]: function is "stdarith_minus_uxu";

    function "-"(L: STD_ULOGIC; R: UNSIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_ULOGIC, UNSIGNED return STD_LOGIC_VECTOR]: function is "stdarith_minus_xuu";

    function "-"(L: SIGNED; R: STD_ULOGIC) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[SIGNED, STD_ULOGIC return STD_LOGIC_VECTOR]: function is "stdarith_minus_sxs";

    function "-"(L: STD_ULOGIC; R: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_ULOGIC, SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_minus_xss";

    function "+"(L: UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "+"[UNSIGNED return UNSIGNED]: function is "stdarith_unary_plus_uu";

    function "+"(L: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "+"[SIGNED return SIGNED]: function is "stdarith_unary_plus_ss";

    function "-"(L: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "-"[SIGNED return SIGNED]: function is "stdarith_unary_minus_ss";

    function "ABS"(L: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "ABS"[SIGNED return SIGNED]: function is "stdarith_abs_ss";


    function "+"(L: UNSIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[UNSIGNED return STD_LOGIC_VECTOR]: function is "stdarith_unary_plus_uu";

    function "+"(L: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_unary_plus_ss";

    function "-"(L: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_unary_minus_ss";

    function "ABS"(L: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "ABS"[SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_abs_ss";

    function "*"(L: UNSIGNED; R: UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "*"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "stdarith_mult_uuu";

    function "*"(L: SIGNED; R: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "*"[SIGNED, SIGNED return SIGNED]: function is "stdarith_mult_sss";

    function "*"(L: SIGNED; R: UNSIGNED) return SIGNED;
    attribute builtin_subprogram of
        "*"[SIGNED, UNSIGNED return SIGNED]: function is "stdarith_mult_sus";

    function "*"(L: UNSIGNED; R: SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "*"[UNSIGNED, SIGNED return SIGNED]: function is "stdarith_mult_uss";


    function "*"(L: UNSIGNED; R: UNSIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "*"[UNSIGNED, UNSIGNED return STD_LOGIC_VECTOR]: function is "stdarith_mult_uuu";

    function "*"(L: SIGNED; R: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "*"[SIGNED, SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_mult_sss";

    function "*"(L: SIGNED; R: UNSIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "*"[SIGNED, UNSIGNED return STD_LOGIC_VECTOR]: function is "stdarith_mult_sus";

    function "*"(L: UNSIGNED; R: SIGNED) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        "*"[UNSIGNED, SIGNED return STD_LOGIC_VECTOR]: function is "stdarith_mult_uss";


    function "<"(L: UNSIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[UNSIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_lt_uu";

    function "<"(L: SIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[SIGNED, SIGNED return BOOLEAN]: function is "stdarith_lt_ss";

    function "<"(L: UNSIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[UNSIGNED, SIGNED return BOOLEAN]: function is "stdarith_lt_us";

    function "<"(L: SIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[SIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_lt_su";

    function "<"(L: UNSIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[UNSIGNED, INTEGER return BOOLEAN]: function is "stdarith_lt_ui";

    function "<"(L: INTEGER; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[INTEGER, UNSIGNED return BOOLEAN]: function is "stdarith_lt_iu";

    function "<"(L: SIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[SIGNED, INTEGER return BOOLEAN]: function is "stdarith_lt_si";

    function "<"(L: INTEGER; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[INTEGER, SIGNED return BOOLEAN]: function is "stdarith_lt_is";

    function "<="(L: UNSIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[UNSIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_lte_uu";

    function "<="(L: SIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[SIGNED, SIGNED return BOOLEAN]: function is "stdarith_lte_ss";

    function "<="(L: UNSIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[UNSIGNED, SIGNED return BOOLEAN]: function is "stdarith_lte_us";

    function "<="(L: SIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[SIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_lte_su";

    function "<="(L: UNSIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[UNSIGNED, INTEGER return BOOLEAN]: function is "stdarith_lte_ui";

    function "<="(L: INTEGER; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[INTEGER, UNSIGNED return BOOLEAN]: function is "stdarith_lte_iu";

    function "<="(L: SIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[SIGNED, INTEGER return BOOLEAN]: function is "stdarith_lte_si";

    function "<="(L: INTEGER; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[INTEGER, SIGNED return BOOLEAN]: function is "stdarith_lte_is";


    function ">"(L: UNSIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[UNSIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_gt_uu";

    function ">"(L: SIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[SIGNED, SIGNED return BOOLEAN]: function is "stdarith_gt_ss";

    function ">"(L: UNSIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[UNSIGNED, SIGNED return BOOLEAN]: function is "stdarith_gt_us";

    function ">"(L: SIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[SIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_gt_su";

    function ">"(L: UNSIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[UNSIGNED, INTEGER return BOOLEAN]: function is "stdarith_gt_ui";

    function ">"(L: INTEGER; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[INTEGER, UNSIGNED return BOOLEAN]: function is "stdarith_gt_iu";

    function ">"(L: SIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[SIGNED, INTEGER return BOOLEAN]: function is "stdarith_gt_si";

    function ">"(L: INTEGER; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[INTEGER, SIGNED return BOOLEAN]: function is "stdarith_gt_is";


    function ">="(L: UNSIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[UNSIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_gte_uu";

    function ">="(L: SIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[SIGNED, SIGNED return BOOLEAN]: function is "stdarith_gte_ss";

    function ">="(L: UNSIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[UNSIGNED, SIGNED return BOOLEAN]: function is "stdarith_gte_us";

    function ">="(L: SIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[SIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_gte_su";

    function ">="(L: UNSIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[UNSIGNED, INTEGER return BOOLEAN]: function is "stdarith_gte_ui";

    function ">="(L: INTEGER; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[INTEGER, UNSIGNED return BOOLEAN]: function is "stdarith_gte_iu";

    function ">="(L: SIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[SIGNED, INTEGER return BOOLEAN]: function is "stdarith_gte_si";

    function ">="(L: INTEGER; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[INTEGER, SIGNED return BOOLEAN]: function is "stdarith_gte_is";


    function "="(L: UNSIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "="[UNSIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_eq_uu";

    function "="(L: SIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "="[SIGNED, SIGNED return BOOLEAN]: function is "stdarith_eq_ss";

    function "="(L: UNSIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "="[UNSIGNED, SIGNED return BOOLEAN]: function is "stdarith_eq_us";

    function "="(L: SIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "="[SIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_eq_su";

    function "="(L: UNSIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "="[UNSIGNED, INTEGER return BOOLEAN]: function is "stdarith_eq_ui";

    function "="(L: INTEGER; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "="[INTEGER, UNSIGNED return BOOLEAN]: function is "stdarith_eq_iu";

    function "="(L: SIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "="[SIGNED, INTEGER return BOOLEAN]: function is "stdarith_eq_si";

    function "="(L: INTEGER; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "="[INTEGER, SIGNED return BOOLEAN]: function is "stdarith_eq_is";


    function "/="(L: UNSIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[UNSIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_neq_uu";

    function "/="(L: SIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[SIGNED, SIGNED return BOOLEAN]: function is "stdarith_neq_ss";

    function "/="(L: UNSIGNED; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[UNSIGNED, SIGNED return BOOLEAN]: function is "stdarith_neq_us";

    function "/="(L: SIGNED; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[SIGNED, UNSIGNED return BOOLEAN]: function is "stdarith_neq_su";

    function "/="(L: UNSIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[UNSIGNED, INTEGER return BOOLEAN]: function is "stdarith_neq_ui";

    function "/="(L: INTEGER; R: UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[INTEGER, UNSIGNED return BOOLEAN]: function is "stdarith_neq_iu";

    function "/="(L: SIGNED; R: INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[SIGNED, INTEGER return BOOLEAN]: function is "stdarith_neq_si";

    function "/="(L: INTEGER; R: SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[INTEGER, SIGNED return BOOLEAN]: function is "stdarith_neq_is";


    function SHL(ARG: UNSIGNED; COUNT: UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        SHL[UNSIGNED, UNSIGNED return UNSIGNED]: function is "stdarith_shl_uuu";

    function SHL(ARG: SIGNED; COUNT: UNSIGNED) return SIGNED;
    attribute builtin_subprogram of
        SHL[SIGNED, UNSIGNED return SIGNED]: function is "stdarith_shl_sus";

    function SHR(ARG: UNSIGNED; COUNT: UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        SHR[UNSIGNED, UNSIGNED return UNSIGNED]: function is "stdarith_shr_uuu";

    function SHR(ARG: SIGNED; COUNT: UNSIGNED) return SIGNED;
    attribute builtin_subprogram of
        SHR[SIGNED, UNSIGNED return SIGNED]: function is "stdarith_shr_sus";


    function CONV_INTEGER(ARG: INTEGER) return INTEGER;
    attribute builtin_subprogram of
        CONV_INTEGER[INTEGER return INTEGER]: function is "stdarith_conv_integer_ii"; 

    function CONV_INTEGER(ARG: UNSIGNED) return INTEGER;
    attribute builtin_subprogram of
        CONV_INTEGER[UNSIGNED return INTEGER]: function is "stdarith_conv_integer_ui2"; 
------------------------------------------------------------------------------------------
--  If desired, you may select an optional implementation for CONV_INTEGER(UNSIGNED)
--  by changing the value of the attribute:
--      stdarith_conv_integer_ui implements the original CONV_INTEGER(UNSIGNED) VHDL which
--          generates an error if the argument is larger than 31 bits.
--      stdarith_conv_integer_ui2 allows 32 bits. It generates a warning if the
--          argument is 32 bits and the MSB is not zero.
--      The default is stdarith_conv_integer_ui2.
--
--    attribute builtin_subprogram of
--        CONV_INTEGER[UNSIGNED return INTEGER]: function is "stdarith_conv_integer_ui"; 
------------------------------------------------------------------------------------------

    function CONV_INTEGER(ARG: SIGNED) return INTEGER;
    attribute builtin_subprogram of
        CONV_INTEGER[SIGNED return INTEGER]: function is "stdarith_conv_integer_si"; 

    function CONV_INTEGER(ARG: STD_ULOGIC) return SMALL_INT;
    attribute builtin_subprogram of
        CONV_INTEGER[STD_ULOGIC return SMALL_INT]: function is "stdarith_conv_integer_xz"; 


    function CONV_UNSIGNED(ARG: INTEGER; SIZE: INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        CONV_UNSIGNED [INTEGER, INTEGER return UNSIGNED]: function is "stdarith_conv_unsigned_iu";

    function CONV_UNSIGNED(ARG: UNSIGNED; SIZE: INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        CONV_UNSIGNED [UNSIGNED, INTEGER return UNSIGNED]: function is "stdarith_conv_unsigned_uu";

    function CONV_UNSIGNED(ARG: SIGNED; SIZE: INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        CONV_UNSIGNED [SIGNED, INTEGER return UNSIGNED]: function is "stdarith_conv_unsigned_su";

    function CONV_UNSIGNED(ARG: STD_ULOGIC; SIZE: INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        CONV_UNSIGNED [STD_ULOGIC, INTEGER return UNSIGNED]: function is "stdarith_conv_unsigned_xu";


    function CONV_SIGNED(ARG: INTEGER; SIZE: INTEGER) return SIGNED;
    attribute builtin_subprogram of
        CONV_SIGNED [INTEGER, INTEGER return SIGNED]: function is "stdarith_conv_signed_is";

    function CONV_SIGNED(ARG: UNSIGNED; SIZE: INTEGER) return SIGNED;
    attribute builtin_subprogram of
        CONV_SIGNED [UNSIGNED, INTEGER return SIGNED]: function is "stdarith_conv_signed_us";

    function CONV_SIGNED(ARG: SIGNED; SIZE: INTEGER) return SIGNED;
    attribute builtin_subprogram of
        CONV_SIGNED [SIGNED, INTEGER return SIGNED]: function is "stdarith_conv_signed_ss";

    function CONV_SIGNED(ARG: STD_ULOGIC; SIZE: INTEGER) return SIGNED;
    attribute builtin_subprogram of
        CONV_SIGNED [STD_ULOGIC, INTEGER return SIGNED]: function is "stdarith_conv_signed_xs";



    function CONV_STD_LOGIC_VECTOR(ARG: INTEGER; SIZE: INTEGER) 
						       return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        CONV_STD_LOGIC_VECTOR [INTEGER, INTEGER return STD_LOGIC_VECTOR]: function is 
            "stdarith_conv_slv_iv";

    function CONV_STD_LOGIC_VECTOR(ARG: UNSIGNED; SIZE: INTEGER) 
						       return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        CONV_STD_LOGIC_VECTOR [UNSIGNED, INTEGER return STD_LOGIC_VECTOR]: function is 
            "stdarith_conv_slv_uv";

    function CONV_STD_LOGIC_VECTOR(ARG: SIGNED; SIZE: INTEGER) 
						       return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        CONV_STD_LOGIC_VECTOR [SIGNED, INTEGER return STD_LOGIC_VECTOR]: function is 
            "stdarith_conv_slv_sv";

    function CONV_STD_LOGIC_VECTOR(ARG: STD_ULOGIC; SIZE: INTEGER) 
						       return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        CONV_STD_LOGIC_VECTOR [STD_ULOGIC, INTEGER return STD_LOGIC_VECTOR]: function is 
            "stdarith_conv_slv_xv";

    -- zero extend STD_LOGIC_VECTOR (ARG) to SIZE, 
    -- SIZE < 0 is same as SIZE = 0
    -- returns STD_LOGIC_VECTOR(SIZE-1 downto 0)
    function EXT(ARG: STD_LOGIC_VECTOR; SIZE: INTEGER) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        EXT [STD_LOGIC_VECTOR, INTEGER return STD_LOGIC_VECTOR]: function is 
            "stdarith_zeroextend_vv";


    -- sign extend STD_LOGIC_VECTOR (ARG) to SIZE, 
    -- SIZE < 0 is same as SIZE = 0
    -- return STD_LOGIC_VECTOR(SIZE-1 downto 0)
    function SXT(ARG: STD_LOGIC_VECTOR; SIZE: INTEGER) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        SXT [STD_LOGIC_VECTOR, INTEGER return STD_LOGIC_VECTOR]: function is 
            "stdarith_signextend_vv";


end Std_logic_arith;

