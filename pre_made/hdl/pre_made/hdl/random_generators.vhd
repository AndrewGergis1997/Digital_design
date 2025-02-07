--
-- VHDL Package Header hds_package_library.random_generators
--
-- Created:
--          by - Waseem Raslan
--          at - 18:02:10 14/05/03
--
-- Generated by Mentor Graphics' HDL Designer(TM) 
--
LIBRARY IEEE; 
USE ieee.std_logic_1164.ALL;

PACKAGE random_generators IS

   constant NTAB : integer := 32;
   type genstatus1 is array (0 to NTAB+1) of integer;
   type genstatus2 is array (0 to 3) of real;
   constant PI : real := 3.141592653;
    
-- Mathematical functions needed to perform the random number generation
    FUNCTION sqrt   ( val : REAL ) RETURN  real;
    FUNCTION isqrt  ( val : REAL ) RETURN  real;
    FUNCTION exp    ( val : REAL ) RETURN  real;
    FUNCTION log    ( val : REAL ) RETURN  real;
    FUNCTION ilog   ( val : REAL ) RETURN  real;
    FUNCTION log10  ( val : REAL ) RETURN  real;
    FUNCTION sin    ( val : REAL ) RETURN  real;
    FUNCTION cos    ( val : REAL ) RETURN  real;
    FUNCTION isin   ( val : REAL ) RETURN  real;
    FUNCTION icos   ( val : REAL ) RETURN  real;
    FUNCTION tan    ( val : REAL ) RETURN  real;
    FUNCTION floor  ( val : REAL ) RETURN  real;
    FUNCTION ceil   ( val : REAL ) RETURN  real;
    FUNCTION gammln ( val : REAL ) RETURN  real;
    FUNCTION modl   ( val : REAL ) RETURN  real;   
    FUNCTION pow    ( val : REAL ; p : REAL) RETURN real;

-- Random number generation functions
    PROCEDURE random ( variable seed : inout INTEGER; variable rndval : out REAL; variable iv : inout genstatus1);

    PROCEDURE dist_exponential (variable seed : inout INTEGER; variable rndval : out REAL; mean : real; variable iv : inout genstatus1);

    PROCEDURE dist_exponential (variable seed : inout INTEGER; variable rndval : out INTEGER; mean : real; variable iv : inout genstatus1);

    PROCEDURE dist_normal (variable seed : inout INTEGER; variable rndval : out REAL; mean : REAL; stddev : REAL; variable iv : inout genstatus1; variable iy : inout genstatus2 );

    PROCEDURE dist_normal (variable seed : inout INTEGER; variable rndval : out INTEGER; mean : REAL; stddev : REAL; variable iv : inout genstatus1; variable iy : inout genstatus2 );

    PROCEDURE dist_uniform (variable seed : inout INTEGER; variable rndval : out INTEGER; startpoint : REAL; endpoint : REAL; variable iv : inout genstatus1 );

    PROCEDURE dist_poisson (variable seed : inout INTEGER; variable rndval : out INTEGER; mean : REAL; variable iv : inout genstatus1; variable iy : inout genstatus2 );
 
    PROCEDURE dist_gamma (variable seed : inout INTEGER; variable rndval : out REAL; alpha : REAL; beta : REAL; variable iv : inout genstatus1);

    PROCEDURE dist_chi_square (variable seed : inout INTEGER; variable rndval : out INTEGER ; n : REAL ; variable iv : inout genstatus1);

    PROCEDURE dist_erlang(variable seed : inout INTEGER; variable rndval : out INTEGER ; alpha : REAL ;beta : REAL; variable iv : inout genstatus1);

    PROCEDURE dist_t (variable seed : inout INTEGER; variable rndval : out INTEGER ; n : REAL ; variable iv : inout genstatus1;variable iy: inout genstatus2);

    PROCEDURE dist_beta (variable seed : inout INTEGER; variable rndval : out REAL ; a : REAL ; b : REAL ; variable iv : inout genstatus1);

END random_generators;
