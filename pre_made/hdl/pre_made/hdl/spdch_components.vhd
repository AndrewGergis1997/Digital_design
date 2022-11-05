--
--	The format of this file proprietary information belonging
--	to Speed S.A. All copies of this file must include this notice.
--		Copyright (c) 1992,1993 and 1994 by SPEED S.A.
--

library SPDCH;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package SPDCH_components is

Component SPDCH_AN2
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end component;

Component SPDCH_AN2_V
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_AN3
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		O  : out STD_LOGIC
	);
end component;

Component SPDCH_AN3_V
	generic (width : natural := 2);
	port (
		I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	);
end component;

Component SPDCH_AN4
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 I3 : in STD_LOGIC;
		 I4 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end component;

Component SPDCH_AN4_V
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I4 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_D12H
	port (
		 A  : in STD_LOGIC;
		 Z0 : out STD_LOGIC;
		 Z1 : out STD_LOGIC
	     );
end component;

Component SPDCH_D12L
	port (
		 A  : in STD_LOGIC;
		 Z0 : out STD_LOGIC;
		 Z1 : out STD_LOGIC
	     );
end component;

Component SPDCH_D24H
	port (
		 A  : in STD_LOGIC;
		 B  : in STD_LOGIC;
		 Z0 : out STD_LOGIC;
		 Z1 : out STD_LOGIC;
		 Z2 : out STD_LOGIC;
		 Z3 : out STD_LOGIC
	     );
end component;

Component SPDCH_D24L
	port (
		 A  : in STD_LOGIC;
		 B  : in STD_LOGIC;
		 Z0 : out STD_LOGIC;
		 Z1 : out STD_LOGIC;
		 Z2 : out STD_LOGIC;
		 Z3 : out STD_LOGIC
	     );
end component;

Component SPDCH_D38H
	port (
		 A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 C : in STD_LOGIC;
		 Z0 : out STD_LOGIC;
		 Z1 : out STD_LOGIC;
		 Z2 : out STD_LOGIC;
		 Z3 : out STD_LOGIC;
		 Z4 : out STD_LOGIC;
		 Z5 : out STD_LOGIC;
		 Z6 : out STD_LOGIC;
		 Z7 : out STD_LOGIC
	     );
end component;

Component SPDCH_D38L
	port (
		 A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 C : in STD_LOGIC;
		 Z0 : out STD_LOGIC;
		 Z1 : out STD_LOGIC;
		 Z2 : out STD_LOGIC;
		 Z3 : out STD_LOGIC;
		 Z4 : out STD_LOGIC;
		 Z5 : out STD_LOGIC;
		 Z6 : out STD_LOGIC;
		 Z7 : out STD_LOGIC
	     );
end component;

Component SPDCH_EN
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end component;

Component SPDCH_EN_V
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_EO
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end component;

Component SPDCH_EO_V
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_FA
	port (
		 A  : in STD_LOGIC;
		 B  : in STD_LOGIC;
		 CI : in STD_LOGIC;
		 Y  : out STD_LOGIC;
		 CO : out STD_LOGIC
	     );
end component;

Component SPDCH_FD1
	port (
		 CK : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_FD1_V
	generic (width : natural := 2);
	port (
		 CK : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_FD2
	port (
		 CK : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_FD2_V
	generic (width : natural := 2);
	port (
		 CK : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_FD3
	port (
		 CK : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_FD3_V
	generic (width : natural := 2);
	port (
		 CK : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_FD4
        port (
                 CK : in STD_LOGIC;
                 RN : in STD_LOGIC;
                 SN : in STD_LOGIC;
                 D  : in STD_LOGIC;
                 Q  : out STD_LOGIC;
                 QN : out STD_LOGIC
             );
end component;

Component SPDCH_FD4_V
        generic (width : natural := 2);
        port (
                 CK : in STD_LOGIC;
                 RN : in STD_LOGIC;
                 SN : in STD_LOGIC;
                 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
                 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
                 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
             );
end component;

Component SPDCH_FJK1
	port (
		 CK : in STD_LOGIC;
		 J  : in STD_LOGIC;
		 K  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_FJK2
	port (
		 CK : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 J  : in STD_LOGIC;
		 K  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_FJK3
	port (
		 CK : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 J  : in STD_LOGIC;
		 K  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_FJK4
        port (
                 CK : in STD_LOGIC;
                 RN : in STD_LOGIC;
                 SN : in STD_LOGIC;
                 J  : in STD_LOGIC;
                 K  : in STD_LOGIC;
                 Q  : out STD_LOGIC;
                 QN : out STD_LOGIC
             );
end component;

Component SPDCH_GND
	port (
		 O : out STD_LOGIC
	     );
end component;

Component SPDCH_GND_V
	generic (width : natural := 2);
	port (
		 O : out STD_logic_Vector(width-1 downto 0)
	     );
end component;

Component SPDCH_HA
	port (
		 A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 Y : out STD_LOGIC;
		 CO : out STD_LOGIC
	     );
end component;

Component SPDCH_IV
	port (
		 I : in STD_LOGIC;
		 O : out STD_LOGIC
	     );
end component;

Component SPDCH_IV_V
	generic (width : natural := 2);
	port (
		 I : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_LD1
	port (
		 G  : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_LD1_V
	generic (width : natural := 2);
	port (
		 G  : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_LD2
	port (
		 GN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_LD2_V
	generic (width : natural := 2);
	port (
		 GN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_LD3
	port (
		 G  : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_LD3_V
	generic (width : natural := 2);
	port (
		 G  : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_LD4
	port (
		 GN : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_LD4_V
	generic (width : natural := 2);
	port (
		 GN : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_LD5
	port (
		 G  : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_LD5_V
	generic (width : natural := 2);
	port (
		 G  : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_LD6
	port (
		 GN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_LD6_V
	generic (width : natural := 2);
	port (
		 GN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_LD7
	port (
		 G  : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_LD7_V
	generic (width : natural := 2);
	port (
		 G  : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_LD8
	port (
		 GN : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end component;

Component SPDCH_LD8_V
	generic (width : natural := 2);
	port (
		 GN : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_LSRA
	port (
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 Q  : out STD_LOGIC
	     );
end component;

Component SPDCH_LSRB
	port (
		 R : in STD_LOGIC;
		 S : in STD_LOGIC;
		 Q : out STD_LOGIC
	     );
end component;

Component SPDCH_MX21
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		S  : in STD_LOGIC;
		O  : out STD_LOGIC
	     );
end component;

Component SPDCH_MX21_V
	generic (width : natural := 2);
	port (
		I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		S  : in STD_LOGIC;
		O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_MX41
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		I4 : in STD_LOGIC;
		A  : in STD_LOGIC;
		B  : in STD_LOGIC;
		O  : out STD_LOGIC
	     );
end component;

Component SPDCH_MX41_V
	generic (width : natural := 2);
	port (
		I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I4 : in STD_LOGIC_VECTOR(width-1 downto 0);
		A  : in STD_LOGIC;
		B  : in STD_LOGIC;
		O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_ND2
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end component;

Component SPDCH_ND2_V
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_ND3
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		O  : out STD_LOGIC
	);
end component;

Component SPDCH_ND3_V
	generic (width : natural := 2);
	port (
		I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	);
end component;

Component SPDCH_ND4
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 I3 : in STD_LOGIC;
		 I4 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end component;

Component SPDCH_ND4_V
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I4 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_NOP
	port (
		 Nop : in STD_LOGIC
	     );
end component;

Component SPDCH_NOP_V
	generic (width : natural := 2);
	port (
		 Nop : in STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_NR2
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end component;

Component SPDCH_NR2_V
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_NR3
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		O  : out STD_LOGIC
	);
end component;

Component SPDCH_NR3_V
	generic (width : natural := 2);
	port (
		I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	);
end component;

Component SPDCH_NR4
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 I3 : in STD_LOGIC;
		 I4 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end component;

Component SPDCH_NR4_V
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I4 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_OR2
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end component;

Component SPDCH_OR2_V
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_OR3
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		O  : out STD_LOGIC
	);
end component;

Component SPDCH_OR3_V
	generic (width : natural := 2);
	port (
		I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	);
end component;

Component SPDCH_OR4
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 I3 : in STD_LOGIC;
		 I4 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end component;

Component SPDCH_OR4_V
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I4 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end component;

Component SPDCH_PD
	port (
		 O : out STD_LOGIC
	     );
end component;

Component SPDCH_PU
	port (
		 O : out STD_LOGIC
	     );
end component;

Component SPDCH_VDD
	port (
		 O : out STD_LOGIC
	     );
end component;

Component SPDCH_VDD_V
	generic (width : natural := 2);
	port (
		 O : out STD_logic_Vector(width-1 downto 0)
	     );
end component;

end;
