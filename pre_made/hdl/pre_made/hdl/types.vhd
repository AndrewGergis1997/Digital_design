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
--synopsys translate_off
library SYNOPSYS;
use SYNOPSYS.ATTRIBUTES.all;
--synopsys translate_on


package TYPES is

	---------------------------------------------------------------------
	-- 
	-- Definitions for Standard Logic types
	--
	---------------------------------------------------------------------

	-- multi-valued logic 7 states:

	type MVL7 is ('X', 	-- strong X (strong unknown)
		      '0', 	-- strong 0 (strong low)
		      '1', 	-- strong 1 (strong high)
		      'Z', 	-- tristate X (high impedance)
		      'W', 	-- weak X (weak unknown)
		      'L', 	-- weak 0 (weak low)
		      'H'); 	-- weak 1 (weak high)

       attribute ENUM_ENCODING : STRING;
       attribute ENUM_ENCODING of MVL7 : type is "D 0 1 Z U 0 1";

        -- Exemplar Synthesis encoding :
        attribute LOGIC_TYPE_ENCODING : STRING ;
        attribute LOGIC_TYPE_ENCODING of MVL7:type is ('X','0','1','Z','X','0','1') ;

        -- Declaration of Exemplar Synthesis Directive attributes
        attribute IS_SIGNED : BOOLEAN ;
        attribute SYNTHESIS_RETURN : STRING ;

	-- vector of MVL7

	type MVL7_VECTOR is array (Natural range <>) of MVL7;
	



	-- output-strength types

	type STRENGTH is (X01, X0H, XL1, X0Z, XZ1, WLH, WLZ, WZH, W0H, WL1);


	
	-----------------------------------------------------------------------
	--
	-- Internal types for table look up 
	--
	----------------------------------------------------------------------

--synopsys synthesis_off
	type MVL7_TAB1D is array (MVL7) of MVL7;	-- one dimensional

	type MVL7_TABLE is array (MVL7, MVL7) of MVL7;  -- two dimensional



	type STRN_MVL7_TABLE is array (MVL7,STRENGTH) of MVL7;

	type MUX_TABLE is array (MVL7 range 'X' to '1', 
				 MVL7 range 'X' to '1', 
				 MVL7 range 'X' to '1') of MVL7;

	type TRISTATE_TABLE is array (STRENGTH, 
				      MVL7 range 'X' to '1', 
				      MVL7 range 'X' to '1') of MVL7;

	type MINOMAX is array (1 to 3) of TIME;

	


	-----------------------------------------------------------------------
	--
	-- Truth tables for output strength --> MVL7 lookup
	--
	-----------------------------------------------------------------------

	-- truth table for output strength --> MVL7 lookup
	constant tbl_STRN_MVL7: STRN_MVL7_TABLE := 
	--  ------------------------------------------------------------------
	--  | X01  X0H  XL1  X0Z  XZ1  WLH  WLZ  WZH  W0H  WL1 | strn/ output|
	--  ------------------------------------------------------------------
	    (('X', 'X', 'X', 'X', 'X', 'W', 'W', 'W', 'W', 'W'),  -- |   X   |
	     ('0', '0', 'L', '0', 'Z', 'L', 'L', 'Z', '0', 'L'),  -- |   0   |
	     ('1', 'H', '1', 'Z', '1', 'H', 'Z', 'H', 'H', '1'),  -- |   1   |
	     ('X', 'X', 'X', 'X', 'X', 'W', 'W', 'W', 'W', 'W'),  -- |   Z   |
	     ('X', 'X', 'X', 'X', 'X', 'W', 'W', 'W', 'W', 'W'),  -- |   W   |
	     ('0', '0', 'L', '0', 'Z', 'L', 'L', 'Z', '0', 'L'),  -- |   L   |
	     ('1', 'H', '1', 'Z', '1', 'H', 'Z', 'H', 'H', '1')); -- |   H   |



	-----------------------------------------------------------------------
	--
	-- Truth tables for strength --> MVL7 mapping ('Z' pass through)
	--
	-----------------------------------------------------------------------

	-- truth table for output strength --> MVL7 lookup
	constant tbl_STRN_MVL7_Z: STRN_MVL7_TABLE := 
	--  ------------------------------------------------------------------
	--  | X01  X0H  XL1  X0Z  XZ1  WLH  WLZ  WZH  W0H  WL1 | strn/ output|
	--  ------------------------------------------------------------------
	    (('X', 'X', 'X', 'X', 'X', 'W', 'W', 'W', 'W', 'W'),  -- |   X   |
	     ('0', '0', 'L', '0', 'Z', 'L', 'L', 'Z', '0', 'L'),  -- |   0   |
	     ('1', 'H', '1', 'Z', '1', 'H', 'Z', 'H', 'H', '1'),  -- |   1   |
	     ('Z', 'Z', 'Z', 'Z', 'Z', 'Z', 'Z', 'Z', 'Z', 'Z'),  -- |   Z   |
	     ('X', 'X', 'X', 'X', 'X', 'W', 'W', 'W', 'W', 'W'),  -- |   W   |
	     ('0', '0', 'L', '0', 'Z', 'L', 'L', 'Z', '0', 'L'),  -- |   L   |
	     ('1', 'H', '1', 'Z', '1', 'H', 'Z', 'H', 'H', '1')); -- |   H   |



	-----------------------------------------------------------------------
	--
	-- Truth tables for logical operations
	--
	-----------------------------------------------------------------------


	-- truth table for "and" function
	constant tbl_AND: MVL7_TABLE := 
	--  -----------------------------------------------
	--  |  X    0    1    Z    W    L    H |	  |
	--  -----------------------------------------------
	    (('X', '0', 'X', 'X', 'X', '0', 'X'),  -- | X |
	     ('0', '0', '0', '0', '0', '0', '0'),  -- | 0 |
	     ('X', '0', '1', 'X', 'X', '0', '1'),  -- | 1 |
	     ('X', '0', 'X', 'X', 'X', '0', 'X'),  -- | Z |
	     ('X', '0', 'X', 'X', 'X', '0', 'X'),  -- | W |
	     ('0', '0', '0', '0', '0', '0', '0'),  -- | L |
	     ('X', '0', '1', 'X', 'X', '0', '1')); -- | H |


	-- truth table for "or" function
	constant tbl_OR: MVL7_TABLE := 
	--  -----------------------------------------------
	--  |  X    0    1    Z    W    L    H |	  |
	--  -----------------------------------------------
	    (('X', 'X', '1', 'X', 'X', 'X', '1'),  -- | X |
	     ('X', '0', '1', 'X', 'X', '0', '1'),  -- | 0 |
	     ('1', '1', '1', '1', '1', '1', '1'),  -- | 1 |
	     ('X', 'X', '1', 'X', 'X', 'X', '1'),  -- | Z |
	     ('X', 'X', '1', 'X', 'X', 'X', '1'),  -- | W |
	     ('X', '0', '1', 'X', 'X', '0', '1'),  -- | L |
	     ('1', '1', '1', '1', '1', '1', '1')); -- | H |


	-- truth table for "xor" function
	constant tbl_XOR: MVL7_TABLE := 
	--  -----------------------------------------------
	--  |  X    0    1    Z    W    L    H |	  |
	--  -----------------------------------------------
	    (('X', 'X', 'X', 'X', 'X', 'X', 'X'),  -- | X |
	     ('X', '0', '1', 'X', 'X', '0', '1'),  -- | 0 |
	     ('X', '1', '0', 'X', 'X', '1', '0'),  -- | 1 |
	     ('X', 'X', 'X', 'X', 'X', 'X', 'X'),  -- | Z |
	     ('X', 'X', 'X', 'X', 'X', 'X', 'X'),  -- | W |
	     ('X', '0', '1', 'X', 'X', '0', '1'),  -- | L |
	     ('X', '1', '0', 'X', 'X', '1', '0')); -- | H |


	-- truth table for "not" function
	constant tbl_NOT: MVL7_TAB1D := 
	--  -------------------------------------
	--  |  X    0    1    Z    W    L    H  |
	--  -------------------------------------
	     ('X', '1', '0', 'X', 'X', '1', '0'); 


	-- truth table for "buf" function
	constant tbl_BUF: MVL7_TAB1D := 
	--  -------------------------------------
	--  |  X    0    1    Z    W    L    H  |
	--  -------------------------------------
	     ('X', '0', '1', 'X', 'X', '0', '1'); 



	-- truth table for tristate "buf" function (Enable active High)
	constant tbl_BUF3S: TRISTATE_TABLE := 
	--  ----------------------------------------
	--  |  X    0    1       | Enable Strength |
	--  ----------------------------------------
	   ((('X', 'X', 'X'),  --|   X       X01   |
	     ('Z', 'Z', 'Z'),  --|   0       X01   |
	     ('X', '0', '1')), --|   1       X01   |

	    (('X', 'X', 'X'),  --|   X       X0H   |
	     ('Z', 'Z', 'Z'),  --|   0       X0H   |
	     ('X', '0', 'H')), --|   1       X0H   |

	    (('X', 'X', 'X'),  --|   X       XL1   |
	     ('Z', 'Z', 'Z'),  --|   0       XL1   |
	     ('X', 'L', '1')), --|   1       XL1   |

	    (('X', 'X', 'Z'),  --|   X       X0Z   |
	     ('Z', 'Z', 'Z'),  --|   0       X0Z   |
	     ('X', '0', 'Z')), --|   1       X0Z   |

	    (('X', 'X', 'X'),  --|   X       XZ1   |
	     ('Z', 'Z', 'Z'),  --|   0       XZ1   |
	     ('X', 'Z', '1')), --|   1       XZ1   |

	    (('W', 'W', 'W'),  --|   X       WLH   |
	     ('Z', 'Z', 'Z'),  --|   0       WLH   |
	     ('W', 'L', 'H')), --|   1       WLH   |

	    (('W', 'W', 'Z'),  --|   X       WLZ   |
	     ('Z', 'Z', 'Z'),  --|   0       WLZ   |
	     ('W', 'L', 'Z')), --|   1       WLZ   |

	    (('W', 'W', 'W'),  --|   X       WZH   |
	     ('Z', 'Z', 'Z'),  --|   0       WZH   |
	     ('W', 'Z', 'H')), --|   1       WZH   |

	    (('W', 'W', 'W'),  --|   X       W0H   |
	     ('Z', 'Z', 'Z'),  --|   0       W0H   |
	     ('W', '0', 'H')), --|   1       W0H   |

	    (('W', 'W', 'W'),  --|   X       WL1   |
	     ('Z', 'Z', 'Z'),  --|   0       WL1   |
	     ('W', 'L', '1')));--|   1       WL1   |




	-- truth table for tristate "buf" function (Enable active Low)
	constant tbl_BUF3SL: TRISTATE_TABLE := 
	--  ----------------------------------------
	--  |  X    0    1       | Enable Strength |
	--  ----------------------------------------
	   ((('X', 'X', 'X'),  --|   X       X01   |
	     ('X', '0', '1'),  --|   0       X01   |
	     ('Z', 'Z', 'Z')), --|   1       X01   |

	    (('X', 'X', 'X'),  --|   X       X0H   |
	     ('X', '0', 'H'),  --|   0       X0H   |
	     ('Z', 'Z', 'Z')), --|   1       X0H   |

	    (('X', 'X', 'X'),  --|   X       XL1   |
	     ('X', 'L', '1'),  --|   0       XL1   |
	     ('Z', 'Z', 'Z')), --|   1       XL1   |

	    (('X', 'X', 'Z'),  --|   X       X0Z   |
	     ('X', '0', 'Z'),  --|   0       X0Z   |
	     ('Z', 'Z', 'Z')), --|   1       X0Z   |

	    (('X', 'X', 'X'),  --|   X       XZ1   |
	     ('X', 'Z', '1'),  --|   0       XZ1   |
	     ('Z', 'Z', 'Z')), --|   1       XZ1   |

	    (('W', 'W', 'W'),  --|   X       WLH   |
	     ('W', 'L', 'H'),  --|   0       WLH   |
	     ('Z', 'Z', 'Z')), --|   1       WLH   |

	    (('W', 'W', 'Z'),  --|   X       WLZ   |
	     ('W', 'L', 'Z'),  --|   0       WLZ   |
	     ('Z', 'Z', 'Z')), --|   1       WLZ   |

	    (('W', 'W', 'W'),  --|   X       WZH   |
	     ('W', 'Z', 'H'),  --|   0       WZH   |
	     ('Z', 'Z', 'Z')), --|   1       WZH   |

	    (('W', 'W', 'W'),  --|   X       W0H   |
	     ('W', '0', 'H'),  --|   0       W0H   |
	     ('Z', 'Z', 'Z')), --|   1       W0H   |

	    (('W', 'W', 'W'),  --|   X       WL1   |
	     ('W', 'L', '1'),  --|   0       WL1   |
	     ('Z', 'Z', 'Z')));--|   1       WL1   |




	-- truth table for "MUX2x1" function
	constant tbl_MUX2x1: MUX_TABLE :=
	---------------------------------------
        --| In0  'X'  '0'  '1'      | Sel In1 |
	---------------------------------------
	      ((('X', 'X', 'X'),  --| 'X' 'X' |
		('X', '0', '1'),  --| '0' 'X' |
		('X', 'X', 'X')), --| '1' 'X' |
	       (('X', '0', 'X'),  --| 'X' '0' |
		('X', '0', '1'),  --| '0' '0' |
		('0', '0', '0')), --| '1' '0' |
	       (('X', 'X', '1'),  --| 'X' '1' |
		('X', '0', '1'),  --| '0' '1' |
		('1', '1', '1')));--| '1' '1' |



	----------------------------------------------------------------------
	--
	-- Truth tables for resolution functions
	--
	----------------------------------------------------------------------


	-- truth table for "WiredX" function
	constant tbl_WIREDX: MVL7_TABLE := 
	--  -----------------------------------------------
	--  |  X    0    1    Z    W    L    H |	  |
	--  -----------------------------------------------
	    (('X', 'X', 'X', 'X', 'X', 'X', 'X'),  -- | X |
	     ('X', '0', 'X', '0', '0', '0', '0'),  -- | 0 |
	     ('X', 'X', '1', '1', '1', '1', '1'),  -- | 1 |
	     ('X', '0', '1', 'Z', 'W', 'L', 'H'),  -- | Z |
	     ('X', '0', '1', 'W', 'W', 'W', 'W'),  -- | W |
	     ('X', '0', '1', 'L', 'W', 'L', 'W'),  -- | L |
	     ('X', '0', '1', 'H', 'W', 'W', 'H')); -- | H |

--synopsys synthesis_on


	-----------------------------------------------------------------------
	--
	-- logical functions for scalar type of MVL7
	--
	-----------------------------------------------------------------------

	function "and" (L, R: MVL7) return MVL7;

	function "nand" (L, R: MVL7) return MVL7;

	function "or" (L, R: MVL7) return MVL7;

	function "nor" (L, R: MVL7) return MVL7;

	function "xor" (L, R: MVL7) return MVL7;

	function nxor (L, R: MVL7) return MVL7;

	function "not" (R: MVL7) return MVL7;

	function buf (R: MVL7) return MVL7;



	-----------------------------------------------------------------------
	--
	-- logical functions for composite type of MVL7_VECTOR
	--
	-----------------------------------------------------------------------

	function "and" (L, R: MVL7_VECTOR) return MVL7_VECTOR;

	function "nand" (L, R: MVL7_VECTOR) return MVL7_VECTOR;

	function "or" (L, R: MVL7_VECTOR) return MVL7_VECTOR;

	function "nor" (L, R: MVL7_VECTOR) return MVL7_VECTOR;

	function "xor" (L, R: MVL7_VECTOR) return MVL7_VECTOR;

	function nxor (L, R: MVL7_VECTOR) return MVL7_VECTOR;

	function "not" (R: MVL7_VECTOR) return MVL7_VECTOR;

	function buf (R: MVL7_VECTOR) return MVL7_VECTOR;



	-----------------------------------------------------------------------
	--
	-- resolution functions for wired signals and its attributes
	--
	-----------------------------------------------------------------------

	function WiredX (V: MVL7_VECTOR) return MVL7;

--synopsys translate_off
	attribute REFLEXIVE of WiredX: function is TRUE;
	attribute RESULT_INITIAL_VALUE of WiredX: function is MVL7'POS('Z');
	attribute TABLE_NAME of WiredX: function is "TYPES.tbl_WIREDX";
--synopsys translate_on




	-----------------------------------------------------------------------
	--
	-- Definitions for wired signals (scalars and vectors)
	--
	-----------------------------------------------------------------------

	subtype DotX is WiredX MVL7;


	type BusX is array (Natural range <>) of DotX;



	-----------------------------------------------------------------------
	--
	-- conversion functions for driving various types
	--
	-----------------------------------------------------------------------

	function Drive (V: MVL7_VECTOR) return BusX;
	function Drive (V: BusX) return MVL7_VECTOR;

--synopsys translate_off
	attribute CLOSELY_RELATED_TCF of Drive: function is TRUE;
--synopsys translate_on



--synopsys synthesis_off
	-----------------------------------------------------------------------
	--
	-- conversion functions for sensing various types
	-- (the second argument allows the user to specify the value to
	--  be returned when the network is undriven)
	--
	-----------------------------------------------------------------------

	function Sense (V: MVL7; vZ: MVL7) return MVL7;
	function Sense (V: MVL7_VECTOR; vZ: MVL7) return MVL7_VECTOR;
	function Sense (V: BusX; vZ: MVL7) return MVL7_VECTOR;
--synopsys synthesis_on


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

	function BVtoMVL7V (V: BIT_VECTOR) return MVL7_VECTOR;


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
		) return BIT_VECTOR;
	

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

	function BITtoMVL7 (V: BIT) return MVL7;


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
		) return BIT;



--synopsys synthesis_off
	-----------------------------------------------------------------------
	--
	--	Truth tables for unidirectional transistors
	--
	-----------------------------------------------------------------------


        -- truth table for reduce function
        constant tbl_REDUCE: MVL7_TAB1D :=
        -- ------------------------------------
        -- | X    0    1    Z    W    L    H  |
        -- ------------------------------------
           ('W', 'L', 'H', 'Z', 'W', 'L', 'H');

        constant tbl_NXFER: MVL7_TABLE :=
        ----------------------------------------------------------
        -- | Input  'X'  '0'  '1'  'Z'  'W'  'L'  'H'   |   Enable
        ----------------------------------------------------------
	          (('X', 'X', 'X', 'X', 'X', 'X', 'X'),   -- 'X'
	           ('Z', 'Z', 'Z', 'Z', 'Z', 'Z', 'Z'),   -- '0'
	           ('X', '0', '1', 'Z', 'W', 'L', 'H'),   -- '1'
	           ('X', 'X', 'X', 'X', 'X', 'X', 'X'),   -- 'Z'
	           ('X', 'X', 'X', 'X', 'X', 'X', 'X'),   -- 'W'
	           ('Z', 'Z', 'Z', 'Z', 'Z', 'Z', 'Z'),   -- 'L'
	           ('X', '0', '1', 'Z', 'W', 'L', 'H'));  -- 'H'
    
        constant tbl_PXFER: MVL7_TABLE :=
        ----------------------------------------------------------
        -- | Input  'X'  '0'  '1'  'Z'  'W'  'L'  'H'   |   Enable
        ----------------------------------------------------------
	          (('X', 'X', 'X', 'X', 'X', 'X', 'X'),   -- 'X'
	           ('X', '0', '1', 'Z', 'W', 'L', 'H'),   -- '0'
	           ('Z', 'Z', 'Z', 'Z', 'Z', 'Z', 'Z'),   -- '1'
	           ('X', 'X', 'X', 'X', 'X', 'X', 'X'),   -- 'Z'
	           ('X', 'X', 'X', 'X', 'X', 'X', 'X'),   -- 'W'
	           ('X', '0', '1', 'Z', 'W', 'L', 'H'),   -- 'L'
	           ('Z', 'Z', 'Z', 'Z', 'Z', 'Z', 'Z'));  -- 'H'
--synopsys synthesis_on
    
end TYPES;




