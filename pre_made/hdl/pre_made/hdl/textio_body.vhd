--*******************************************************
--**                                                   **
--** Copyright 1991-2010 Mentor Graphics Corporation      **
--**                                                   **
--** All Rights Reserved                               **
--**                                                   **
--** THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY   **
--** INFORMATION WHICH IS THE PROPERTY OF MENTOR       **
--** GRAPHICS CORPORATION OR ITS LICENSORS AND IS      **
--** SUBJECT TO LICENSE TERMS.                         **
--**                                                   **
--*******************************************************


--   There is no true source-code package body for textio
--   since the code is all accellerated

package body TEXTIO is

  constant NBSP : CHARACTER      := CHARACTER'val(160);  -- space character
  
    function JUSTIFY (VALUE : STRING; JUSTIFIED : SIDE := right; FIELD : WIDTH := 0) return STRING is
    begin
      assert false report "ERROR: builtin subprogram JUSTIFY not called" severity note;
      return value;
    end;

    procedure READLINE(file f: TEXT; L: out LINE) is
    begin
      assert false report "ERROR: builtin subprogram READLINE not called" severity note;
    end;

    procedure READ(L:inout LINE; VALUE: out bit; GOOD : out BOOLEAN) is
    begin
      assert false report "ERROR: builtin subprogram RAD(line,bit.boolead) not called" severity note;
    end;
      
    procedure READ(L:inout LINE; VALUE: out bit) is
    begin
      assert false report "ERROR: builtin subprogram read(line,bit) not called" severity note;
    end;

    procedure READ(L:inout LINE; VALUE: out bit_vector; GOOD : out BOOLEAN) is
    begin
      assert false report "ERROR: builtin subprogram read(line,bit_vector,boolean) not called" severity note;
    end;
      
    procedure READ(L:inout LINE; VALUE: out bit_vector) is
    begin
      assert false report "ERROR: builtin subprogram read(line,bit_vector) not called" severity note;
    end;

    procedure READ(L:inout LINE; VALUE: out BOOLEAN; GOOD : out BOOLEAN) is
    begin
      assert false report "ERROR: builtin subprogram read(line,boolean,boolean) not called" severity note;
    end;
      
    procedure READ(L:inout LINE; VALUE: out BOOLEAN) is
    begin
      assert false report "ERROR: builtin subprogram READ(line,boolean) not called" severity note;
    end;

    procedure READ(L:inout LINE; VALUE: out character; GOOD : out BOOLEAN) is
    begin
      assert false report "ERROR: builtin subprogram read(line,character,boolean) not called" severity note;
    end;
      
    procedure READ(L:inout LINE; VALUE: out character) is
    begin
      assert false report "ERROR: builtin subprogram read(line,character) not called" severity note;
    end;

    procedure READ(L:inout LINE; VALUE: out integer; GOOD : out BOOLEAN) is
    begin
      assert false report "ERROR: builtin subprogram READ(line,integer,boolean) not called" severity note;
    end;
      
    procedure READ(L:inout LINE; VALUE: out integer) is
    begin
      assert false report "ERROR: builtin subprogram READ(line,integer) not called" severity note;
    end;

    procedure READ(L:inout LINE; VALUE: out real; GOOD : out BOOLEAN) is
    begin
      assert false report "ERROR: builtin subprogram READ(line,read,boolean) not called" severity note;
    end;
      
    procedure READ(L:inout LINE; VALUE: out real) is
    begin
      assert false report "ERROR: builtin subprogram READ(line,real) not called" severity note;
    end;

    procedure READ(L:inout LINE; VALUE: out string; GOOD : out BOOLEAN) is
    begin
      assert false report "ERROR: builtin subprogram READ(line,string,boolean) not called" severity note;
    end;
      
    procedure READ(L:inout LINE; VALUE: out string) is
    begin
      assert false report "ERROR: builtin subprogram READ(Line,string) not called" severity note;
    end;

    procedure READ(L:inout LINE; VALUE: out time; GOOD : out BOOLEAN) is
    begin
      assert false report "ERROR: builtin subprogram READ(line,string,boolean) not called" severity note;
    end;
      
    procedure READ(L:inout LINE; VALUE: out time) is
    begin
      assert false report "ERROR: builtin subprogram READ(line,time) not called" severity note;
    end;

    procedure SREAD (L    : inout LINE; VALUE : out STRING; STRLEN : out NATURAL) is
    begin
      assert false report "ERROR: builtin subprogram SREAD not called" severity note;
    end;

  -- Procedure only visible internally.
  procedure Char2TriBits (C           :     CHARACTER;
                          RESULT      : out BIT_VECTOR(2 downto 0);
                          GOOD        : out BOOLEAN;
                          ISSUE_ERROR : in  BOOLEAN) is
  begin
    case c is
      when '0'    => result := o"0"; good := true;
      when '1'    => result := o"1"; good := true;
      when '2'    => result := o"2"; good := true;
      when '3'    => result := o"3"; good := true;
      when '4'    => result := o"4"; good := true;
      when '5'    => result := o"5"; good := true;
      when '6'    => result := o"6"; good := true;
      when '7'    => result := o"7"; good := true;
      when others =>
        assert not ISSUE_ERROR
          report
          "TEXTIO.OREAD Error: Read a '" & c &
          "', expected an Octal character (0-7)."
          severity error;
        GOOD := false;
    end case;
  end procedure Char2TriBits;

   procedure OREAD (L     : inout LINE;
                   VALUE : out   BIT_VECTOR;
                   GOOD  : out   BOOLEAN) is
    variable ok  : BOOLEAN;
    variable c   : CHARACTER;
    constant ne  : INTEGER                   := (VALUE'length+2)/3;
    constant pad : INTEGER                   := ne*3 - VALUE'length;
    variable sv  : BIT_VECTOR(0 to ne*3 - 1) := (others => '0');
    variable s   : STRING(1 to ne-1);
  begin
    VALUE (VALUE'range) := (others => '0');
    loop                                -- skip white space
      read(l, c, ok);
      exit when (ok = false) or ((c /= ' ') and (c /= NBSP) and (c /= HT));
    end loop;
    -- Bail out if there was a bad read
    if not ok then
      GOOD := false;
      return;
    end if;
    Char2TriBits(c, sv(0 to 2), ok, false);
    if not ok then
      GOOD := false;
      return;
    end if;
    read(L, s, ok);
    if not ok then
      GOOD := false;
      return;
    end if;
    for i in 1 to ne-1 loop
      Char2TriBits(s(i), sv(3*i to 3*i+2), ok, false);
      if not ok then
        GOOD := false;
        return;
      end if;
    end loop;
    if (or(sv (0 to pad-1))) = '1' then
      GOOD := false;                    -- vector was truncated.
    else
      GOOD  := true;
      VALUE := sv (pad to sv'high);
    end if;
  end procedure OREAD;

  procedure OREAD (L     : inout LINE;
                   VALUE : out   BIT_VECTOR) is
    variable c   : CHARACTER;
    variable ok  : BOOLEAN;
    constant ne  : INTEGER                   := (VALUE'length+2)/3;
    constant pad : INTEGER                   := ne*3 - VALUE'length;
    variable sv  : BIT_VECTOR(0 to ne*3 - 1) := (others => '0');
    variable s   : STRING(1 to ne-1);
  begin
    VALUE (VALUE'range) := (others => '0');
    loop                                -- skip white space
      read(l, c, ok);
      exit when (ok = false) or ((c /= ' ') and (c /= NBSP) and (c /= HT));
    end loop;
    -- Bail out if there was a bad read
    if not ok then
      report "TEXTIO.OREAD Error: Failed skipping white space"
        severity error;
      return;
    end if;
    Char2TriBits(c, sv(0 to 2), ok, true);
    if not ok then
      return;
    end if;
    read(L, s, ok);
    if not ok then
      report "TEXTIO.OREAD Error: Failed to read the STRING"
        severity error;
      return;
    end if;
    for i in 1 to ne-1 loop
      Char2TriBits(s(i), sv(3*i to 3*i+2), ok, true);
      if not ok then
        return;
      end if;
    end loop;
    if (or(sv (0 to pad-1))) = '1' then
      report "TEXTIO.OREAD Error: Vector truncated"
        severity error;
    else
      VALUE := sv (pad to sv'high);
    end if;
  end procedure OREAD;

  -- Hex Read and Write procedures for bit_vector.
  -- Procedure only visible internally.
  procedure Char2QuadBits (C           :     CHARACTER;
                           RESULT      : out BIT_VECTOR(3 downto 0);
                           GOOD        : out BOOLEAN;
                           ISSUE_ERROR : in  BOOLEAN) is
  begin
    case c is
      when '0'       => result := x"0"; good := true;
      when '1'       => result := x"1"; good := true;
      when '2'       => result := x"2"; good := true;
      when '3'       => result := x"3"; good := true;
      when '4'       => result := x"4"; good := true;
      when '5'       => result := x"5"; good := true;
      when '6'       => result := x"6"; good := true;
      when '7'       => result := x"7"; good := true;
      when '8'       => result := x"8"; good := true;
      when '9'       => result := x"9"; good := true;
      when 'A' | 'a' => result := x"A"; good := true;
      when 'B' | 'b' => result := x"B"; good := true;
      when 'C' | 'c' => result := x"C"; good := true;
      when 'D' | 'd' => result := x"D"; good := true;
      when 'E' | 'e' => result := x"E"; good := true;
      when 'F' | 'f' => result := x"F"; good := true;
      when others    =>
        assert not ISSUE_ERROR report
          "TEXTIO.HREAD Error: Read a '" & c &
          "', expected a Hex character (0-F)." severity error;
        GOOD := false;
    end case;
  end procedure Char2QuadBits;

  procedure HREAD (L     : inout LINE;
                   VALUE : out   BIT_VECTOR;
                   GOOD  : out   BOOLEAN) is
    variable ok  : BOOLEAN;
    variable c   : CHARACTER;
    constant ne  : INTEGER                    := (VALUE'length+3)/4;
    constant pad : INTEGER                    := ne*4 - VALUE'length;
    variable sv  : BIT_VECTOR (0 to ne*4 - 1) := (others => '0');
    variable s   : STRING(1 to ne-1);
  begin
    VALUE (VALUE'range) := (others => '0');
    loop                                -- skip white space
      read(l, c, ok);
      exit when (ok = false) or ((c /= ' ') and (c /= NBSP) and (c /= HT));
    end loop;
    -- Bail out if there was a bad read
    if not ok then
      GOOD := false;
      return;
    end if;
    Char2QuadBits(c, sv(0 to 3), ok, false);
    if not ok then
      GOOD := false;
      return;
    end if;
    read(L, s, ok);
    if not ok then
      GOOD := false;
      return;
    end if;
    for i in 1 to ne-1 loop
      Char2QuadBits(s(i), sv(4*i to 4*i+3), ok, false);
      if not ok then
        GOOD := false;
        return;
      end if;
    end loop;
    if (or(sv (0 to pad-1))) = '1' then
      GOOD := false;                    -- vector was truncated.
    else
      GOOD  := true;
      VALUE := sv (pad to sv'high);
    end if;
  end procedure HREAD;

  procedure HREAD (L     : inout LINE;
                   VALUE : out   BIT_VECTOR) is
    variable ok  : BOOLEAN;
    variable c   : CHARACTER;
    constant ne  : INTEGER                   := (VALUE'length+3)/4;
    constant pad : INTEGER                   := ne*4 - VALUE'length;
    variable sv  : BIT_VECTOR(0 to ne*4 - 1) := (others => '0');
    variable s   : STRING(1 to ne-1);
  begin
    VALUE (VALUE'range) := (others => '0');
    loop                                -- skip white space
      read(l, c, ok);
      exit when (ok = false) or ((c /= ' ') and (c /= NBSP) and (c /= HT));
    end loop;
    -- Bail out if there was a bad read
    if not ok then
      report "TEXTIO.HREAD Error: Failed skipping white space"
        severity error;
      return;
    end if;
    Char2QuadBits(c, sv(0 to 3), ok, true);
    if not ok then
      return;
    end if;
    read(L, s, ok);
    if not ok then
      report "TEXTIO.HREAD Error: Failed to read the STRING"
        severity error;
      return;
    end if;
    for i in 1 to ne-1 loop
      Char2QuadBits(s(i), sv(4*i to 4*i+3), ok, true);
      if not ok then
        return;
      end if;
    end loop;
    if (or (sv (0 to pad-1))) = '1' then
      report "TEXTIO.HREAD Error: Vector truncated"
        severity error;
    else
      VALUE := sv (pad to sv'high);
    end if;
  end procedure HREAD;

    procedure WRITELINE(file f : TEXT; L : inout LINE) is
    begin
      assert false report "ERROR: builtin subprogram WRITELINE not called" severity note;
    end;

  -- Writes L to a file without modifying the contents of the line
  procedure tee (file F : TEXT; variable L : inout LINE) is
  begin
    write (OUTPUT, L.all & LF);
    writeline(F, L);
  end procedure tee;

    procedure WRITE(L : inout LINE; VALUE : in bit;
	      JUSTIFIED: in SIDE := right; FIELD: in WIDTH := 0) is
    begin
      assert false report "ERROR: builtin subprogram WRITE(line,bit,side,width) not called" severity note;
    end;

    procedure WRITE(L : inout LINE; VALUE : in bit_vector;
	      JUSTIFIED: in SIDE := right; FIELD: in WIDTH := 0) is
    begin
      assert false report "ERROR: builtin subprogram WRITE(line,bit_vector) not called" severity note;
    end;

    procedure WRITE(L : inout LINE; VALUE : in BOOLEAN;
	      JUSTIFIED: in SIDE := right; FIELD: in WIDTH := 0) is
    begin
      assert false report "ERROR: builtin subprogram WRITE(line,boolean) not called" severity note;
    end;

    procedure WRITE(L : inout LINE; VALUE : in character;
	      JUSTIFIED: in SIDE := right; FIELD: in WIDTH := 0) is
    begin
      assert false report "ERROR: builtin subprogram WRITE(line,character) not called" severity note;
    end;

    procedure WRITE(L : inout LINE; VALUE : in integer;
	      JUSTIFIED: in SIDE := right; FIELD: in WIDTH := 0) is
    begin
      assert false report "ERROR: builtin subprogram WRITE(line,integer) not called" severity note;
    end;

    procedure WRITE(L : inout LINE; VALUE : in real;
	      JUSTIFIED: in SIDE := right; FIELD: in WIDTH := 0;
	      DIGITS: in NATURAL := 0) is
    begin
      assert false report "ERROR: builtin subprogram WRITE(line,real) not called" severity note;
    end;

    procedure WRITE(L : inout LINE; VALUE : in STRING;
	      JUSTIFIED: in SIDE := right; FIELD: in WIDTH := 0) is
    begin
      assert false report "ERROR: builtin subprogram WRITE(line,string) not called" severity note;
    end;

    procedure WRITE(L : inout LINE; VALUE : in TIME;
	      JUSTIFIED: in SIDE := right;
	      FIELD: in WIDTH := 0;
	      UNIT: in TIME := ns) is
    begin
      assert false report "ERROR: builtin subprogram WRITE(line,time) not called" severity note;
    end;

  procedure OWRITE (L         : inout LINE;
                    VALUE     : in    BIT_VECTOR;
                    JUSTIFIED : in    SIDE  := right;
                    FIELD     : in    WIDTH := 0) is
  begin
    write (L         => L,
           VALUE     => to_ostring(VALUE),
           JUSTIFIED => JUSTIFIED,
           FIELD     => FIELD);
  end procedure OWRITE;

  procedure HWRITE (L         : inout LINE;
                    VALUE     : in    BIT_VECTOR;
                    JUSTIFIED : in    SIDE  := right;
                    FIELD     : in    WIDTH := 0) is
  begin
    write (L         => L,
           VALUE     => to_hstring(VALUE),
           JUSTIFIED => JUSTIFIED,
           FIELD     => FIELD);
  end procedure HWRITE;

  procedure WRITE (L: inout LINE; VALUE: in REAL;
                   FORMAT: in STRING) is
  begin
    swrite ( L => L,
             VALUE => to_string (VALUE, FORMAT));
  end procedure WRITE;

end textio;
