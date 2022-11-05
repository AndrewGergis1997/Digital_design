


package body NUMERIC_UNSIGNED is

  function "+" (L, R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) + UNSIGNED(R)));
  end;

  function "+" (L: INTEGER; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(L + UNSIGNED(R)));
  end;

  function "+" (L: STD_LOGIC_VECTOR; R: INTEGER) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) + R));
  end;

  function "-" (L, R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) - UNSIGNED(R)));
  end;

  function "-" (L: INTEGER; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(L - UNSIGNED(R)));
  end;

  function "-" (L: STD_LOGIC_VECTOR; R: INTEGER) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) - R));
  end;

  function "*" (L, R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) * UNSIGNED(R)));
  end;

  function "*" (L: STD_LOGIC_VECTOR; R: INTEGER) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) * R));
  end;

  function "*" (L: INTEGER; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(L * UNSIGNED(R)));
  end;

  function "/" (L, R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) / UNSIGNED(R)));
  end;

  function "/" (L: STD_LOGIC_VECTOR; R: INTEGER) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) / R));
  end;

  function "/" (L: INTEGER; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(L / UNSIGNED(R)));
  end;

  function "rem" (L, R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) rem UNSIGNED(R)));
  end;

  function "rem" (L: STD_LOGIC_VECTOR; R: INTEGER) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) rem R));
  end;

  function "rem" (L: INTEGER; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(L rem UNSIGNED(R)));
  end;

  function "mod" (L, R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) mod UNSIGNED(R)));
  end;

  function "mod" (L: STD_LOGIC_VECTOR; R: INTEGER) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(UNSIGNED(L) mod R));
  end;

  function "mod" (L: INTEGER; R: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(L mod UNSIGNED(R)));
  end;

  function SHIFT_LEFT (ARG: STD_LOGIC_VECTOR; COUNT: NATURAL) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(SHIFT_LEFT(UNSIGNED(ARG), COUNT)));
  end;

  function SHIFT_RIGHT (ARG: STD_LOGIC_VECTOR; COUNT: NATURAL) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(SHIFT_RIGHT(UNSIGNED(ARG), COUNT)));
  end;

  function ROTATE_LEFT (ARG: STD_LOGIC_VECTOR; COUNT: NATURAL) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(ROTATE_LEFT(UNSIGNED(ARG), COUNT)));
  end;

  function ROTATE_RIGHT (ARG: STD_LOGIC_VECTOR; COUNT: NATURAL) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(ROTATE_RIGHT(UNSIGNED(ARG), COUNT)));
  end;

  function "SLL" (ARG: STD_LOGIC_VECTOR; COUNT: INTEGER) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(SHIFT_LEFT(UNSIGNED(ARG), COUNT)));
  end;

  function "SRL" (ARG: STD_LOGIC_VECTOR; COUNT: integer) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(SHIFT_RIGHT(UNSIGNED(ARG), COUNT)));
  end;

  function "ROL" (ARG: STD_LOGIC_VECTOR; COUNT: INTEGER) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(ROTATE_LEFT(UNSIGNED(ARG), COUNT)));
  end;

  function "ROR" (ARG: STD_LOGIC_VECTOR; COUNT: integer) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(ROTATE_RIGHT(UNSIGNED(ARG), COUNT)));
  end;

  function RESIZE (ARG: STD_LOGIC_VECTOR; NEW_SIZE: NATURAL) return STD_LOGIC_VECTOR is
  begin
    return(STD_LOGIC_VECTOR(RESIZE(UNSIGNED(ARG), NEW_SIZE)));
  end;

  function TO_INTEGER (ARG: STD_LOGIC_VECTOR) return INTEGER is
  begin
    return(TO_INTEGER(UNSIGNED(ARG)));
  end;

end NUMERIC_UNSIGNED;
