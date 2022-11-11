


package body NUMERIC_EXTRA is

  --
  -- Reducing logical functions.
  --

  FUNCTION and_reduce(arg: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
    VARIABLE result: STD_LOGIC;
    -- Exemplar synthesis directive attributes for this function
    ATTRIBUTE synthesis_RETURN OF result:VARIABLE IS "REDUCE_AND" ;
  BEGIN
    result := '1';
    FOR i IN arg'RANGE LOOP
      result := result AND arg(i);
    END LOOP;
    RETURN result;
  END;

  FUNCTION nand_reduce(arg: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
    VARIABLE result: STD_LOGIC;
    ATTRIBUTE synthesis_RETURN OF result:VARIABLE IS "REDUCE_NAND" ;
  BEGIN
      result := NOT and_reduce(arg);
      RETURN result;
  END;

  FUNCTION or_reduce(arg: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
    VARIABLE result: STD_LOGIC;
    -- Exemplar synthesis directive attributes for this function
    ATTRIBUTE synthesis_return OF result:VARIABLE IS "REDUCE_OR" ;
  BEGIN
    result := '0';
    FOR i IN arg'RANGE LOOP
      result := result OR arg(i);
    END LOOP;
    RETURN result;
  END;

  FUNCTION nor_reduce(arg: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
    VARIABLE result: STD_LOGIC;
    ATTRIBUTE synthesis_RETURN OF result:VARIABLE IS "REDUCE_NOR" ;
  BEGIN
    result := NOT or_reduce(arg);
    RETURN result;
  END;

  FUNCTION xor_reduce(arg: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
    VARIABLE result: STD_LOGIC;
    -- Exemplar synthesis directive attributes for this function
    ATTRIBUTE synthesis_return OF result:VARIABLE IS "REDUCE_XOR" ;
  BEGIN
    result := '0';
    FOR i IN arg'RANGE LOOP
      result := result XOR arg(i);
    END LOOP;
    RETURN result;
  END;

  FUNCTION xnor_reduce(arg: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
    VARIABLE result: STD_LOGIC;
    ATTRIBUTE synthesis_RETURN OF result:VARIABLE IS "REDUCE_XNOR" ;
  BEGIN
    result := NOT xor_reduce(arg);
    RETURN result;
  END;

  function TO_STD_LOGIC(arg : BOOLEAN) return STD_LOGIC is
  begin
    if(arg = true) then
        return('1');
    else
        return('0');
    end if;
  end;

end NUMERIC_EXTRA;
