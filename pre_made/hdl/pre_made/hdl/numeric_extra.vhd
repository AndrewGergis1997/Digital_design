--   Title      : NUMERIC_EXTRA arithmetic package for synthesis
--              : Rev. 1.0 (April 17 1995)
--              :
--   Library    : This package shall be compiled into a library symbolically
--              : named IEEE.
--              :
--   Developers : Mentor Graphics
--              :
--   Purpose    : This package defines additional functions for numeric_std.
--              :
-- ----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

package NUMERIC_EXTRA is

  -- Exemplar Synthesis Directive Attributes
  attribute IS_SIGNED : BOOLEAN ;
  attribute SYNTHESIS_RETURN : STRING ;

  --
  -- Reducing logical functions.
  --

  FUNCTION  and_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC;
  -- Result subtype: STD_LOGIC.
  -- Result: Result of and'ing all of the bits of the vector.

  FUNCTION nand_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC;
  -- Result subtype: STD_LOGIC.
  -- Result: Result of nand'ing all of the bits of the vector.

  FUNCTION   or_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC;
  -- Result subtype: STD_LOGIC.
  -- Result: Result of or'ing all of the bits of the vector.

  FUNCTION  nor_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC;
  -- Result subtype: STD_LOGIC.
  -- Result: Result of nor'ing all of the bits of the vector.

  FUNCTION  xor_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC;
  -- Result subtype: STD_LOGIC.
  -- Result: Result of xor'ing all of the bits of the vector.

  FUNCTION xnor_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC;
  -- Result subtype: STD_LOGIC.
  -- Result: Result of xnor'ing all of the bits of the vector.

  --
  -- Conversion functions.
  --

  function TO_STD_LOGIC(arg : BOOLEAN) return STD_LOGIC;
  -- Result subtype: STD_LOGIC
  -- Result: Converts a BOOLEAN to a STD_LOGIC..

end NUMERIC_EXTRA;
