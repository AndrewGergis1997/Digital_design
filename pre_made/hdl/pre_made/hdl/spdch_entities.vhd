--
--	The format of this file is proprietary information belonging
--	to Speed S.A. All copies of this file must include this notice.
--		Copyright (c) 1992,1993 and 1994 by SPEED S.A.
--

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_AN2 is
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end SPDCH_AN2;

Architecture SPDCH_AN2_ARCH of SPDCH_AN2 is
begin
	O <= I1 and I2;
end SPDCH_AN2_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_AN2_V is
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_AN2_V;

Architecture SPDCH_AN2_V_ARCH of SPDCH_AN2_V is
begin
	O <= I1 and I2;
end SPDCH_AN2_V_ARCH;


library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_AN3 is
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		O  : out STD_LOGIC
	);
end SPDCH_AN3;

Architecture SPDCH_AN3_ARCH of SPDCH_AN3 is
begin
	O <= I1 and I2 and I3;
end SPDCH_AN3_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_AN3_V is
	generic (width : natural := 2);
	port (
		I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	);
end SPDCH_AN3_V;

Architecture SPDCH_AN3_V_ARCH of SPDCH_AN3_V is
begin
	O <= I1 and I2 and I3;
end SPDCH_AN3_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_AN4 is
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 I3 : in STD_LOGIC;
		 I4 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end SPDCH_AN4;

Architecture SPDCH_AN4_ARCH of SPDCH_AN4 is
begin
	O <= I1 and I2 and I3 and I4;
end SPDCH_AN4_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_AN4_V is
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I4 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_AN4_V;

Architecture SPDCH_AN4_V_ARCH of SPDCH_AN4_V is
begin
	O <= I1 and I2 and I3 and I4;
end SPDCH_AN4_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_D12H is
	port (
		 A  : in STD_LOGIC;
		 Z0 : out STD_LOGIC;
		 Z1 : out STD_LOGIC
	     );
end SPDCH_D12H;

Architecture SPDCH_D12H_ARCH of SPDCH_D12H is
begin
	Z0 <= '1' when ( A = '0' ) else '0';
	Z1 <= '1' when ( A = '1' ) else '0';
end SPDCH_D12H_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_D12L is
	port (
		 A  : in STD_LOGIC;
		 Z0 : out STD_LOGIC;
		 Z1 : out STD_LOGIC
	     );
end SPDCH_D12L;

Architecture SPDCH_D12L_ARCH of SPDCH_D12L is
begin
	Z0 <= '0' when ( A = '0' ) else '1';
	Z1 <= '0' when ( A = '1' ) else '1';
end SPDCH_D12L_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_D24H is
	port (
		 A  : in STD_LOGIC;
		 B  : in STD_LOGIC;
		 Z0 : out STD_LOGIC;
		 Z1 : out STD_LOGIC;
		 Z2 : out STD_LOGIC;
		 Z3 : out STD_LOGIC
	     );
end SPDCH_D24H;

Architecture SPDCH_D24H_ARCH of SPDCH_D24H is
begin
	Z0 <= '1' when ( A = '0' and B = '0' ) else '0';
	Z1 <= '1' when ( A = '0' and B = '1' ) else '0';
	Z2 <= '1' when ( A = '1' and B = '0' ) else '0';
	Z3 <= '1' when ( A = '1' and B = '1' ) else '0';
end SPDCH_D24H_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_D24L is
	port (
		 A  : in STD_LOGIC;
		 B  : in STD_LOGIC;
		 Z0 : out STD_LOGIC;
		 Z1 : out STD_LOGIC;
		 Z2 : out STD_LOGIC;
		 Z3 : out STD_LOGIC
	     );
end SPDCH_D24L;

Architecture SPDCH_D24L_ARCH of SPDCH_D24L is
begin
	Z0 <= '0' when ( A = '0' and B = '0' ) else '1';
	Z1 <= '0' when ( A = '0' and B = '1' ) else '1';
	Z2 <= '0' when ( A = '1' and B = '0' ) else '1';
	Z3 <= '0' when ( A = '1' and B = '1' ) else '1';
end SPDCH_D24L_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_D38H is
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
end SPDCH_D38H;

Architecture SPDCH_D38H_ARCH of SPDCH_D38H is
begin
	Z0 <= '1' when (A='0' and B='0' and C='0') else '0';
	Z1 <= '1' when (A='0' and B='0' and C='1') else '0';
	Z2 <= '1' when (A='0' and B='1' and C='0') else '0';
	Z3 <= '1' when (A='0' and B='1' and C='1') else '0';
	Z4 <= '1' when (A='1' and B='0' and C='0') else '0';
	Z5 <= '1' when (A='1' and B='0' and C='1') else '0';
	Z6 <= '1' when (A='1' and B='1' and C='0') else '0';
	Z7 <= '1' when (A='1' and B='1' and C='1') else '0';
end SPDCH_D38H_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_D38L is
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
end SPDCH_D38L;

Architecture SPDCH_D38L_ARCH of SPDCH_D38L is
begin
	Z0 <= '0' when (A='0' and B='0' and C='0') else '1';
	Z1 <= '0' when (A='0' and B='0' and C='1') else '1';
	Z2 <= '0' when (A='0' and B='1' and C='0') else '1';
	Z3 <= '0' when (A='0' and B='1' and C='1') else '1';
	Z4 <= '0' when (A='1' and B='0' and C='0') else '1';
	Z5 <= '0' when (A='1' and B='0' and C='1') else '1';
	Z6 <= '0' when (A='1' and B='1' and C='0') else '1';
	Z7 <= '0' when (A='1' and B='1' and C='1') else '1';
end SPDCH_D38L_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_EN is
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end SPDCH_EN;

Architecture SPDCH_EN_ARCH of SPDCH_EN is
begin
	O <= not(I1 xor I2);
end SPDCH_EN_ARCH;


library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_EN_V is
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_EN_V;

Architecture SPDCH_EN_V_ARCH of SPDCH_EN_V is
begin
	O <= not(I1 xor I2);
end SPDCH_EN_V_ARCH;


library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_EO is
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end SPDCH_EO;

Architecture SPDCH_EO_ARCH of SPDCH_EO is
begin
	O <= I1 xor I2;
end SPDCH_EO_ARCH;


library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_EO_V is
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_EO_V;

Architecture SPDCH_EO_V_ARCH of SPDCH_EO_V is
begin
	O <= I1 xor I2;
end SPDCH_EO_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_FA is
	port (
		 A  : in STD_LOGIC;
		 B  : in STD_LOGIC;
		 CI : in STD_LOGIC;
		 Y  : out STD_LOGIC;
		 CO : out STD_LOGIC
	     );
end SPDCH_FA;

Architecture SPDCH_FA_ARCH of SPDCH_FA is
begin
	Y<= (not CI and (A xor B)) or
		(CI and (not (A xor B)));
	CO<= (A and B) or ((A xor B) and CI);
end SPDCH_FA_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_FD1 is
	port (
		 CK : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_FD1;

Architecture SPDCH_FD1_ARCH of SPDCH_FD1 is
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;

	Process(CK)
	begin
		if ( CK'event and CK = '1' ) then
			MEM  <= D;
		end if;
	end process;
end SPDCH_FD1_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_FD1_V is
	generic (width : natural := 2);
	port (
		 CK : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_FD1_V;

Architecture SPDCH_FD1_V_ARCH of SPDCH_FD1_V is
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;

	Process(CK)
	begin
		if ( CK'event and CK = '1' ) then
			MEM  <= D;
		end if;
	end process;
end SPDCH_FD1_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_FD2 is
	port (
		 CK : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_FD2;

Architecture SPDCH_FD2_ARCH of SPDCH_FD2 is
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;

	Process(CK, RN)
	begin
		if ( RN = '0' ) then
			MEM  <= '0';
		elsif ( CK'event and CK = '1' ) then
			MEM  <= D;
		end if;
	end process;
end SPDCH_FD2_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_FD2_V is
	generic (width : natural := 2);
	port (
		 CK : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_FD2_V;

Architecture SPDCH_FD2_V_ARCH of SPDCH_FD2_V is
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;

	Process(CK, RN)
	begin
		if ( RN = '0' ) then
			MEM <= (others => '0');
		elsif ( CK'event and CK = '1' ) then
			MEM  <= D;
		end if;
	end process;
end SPDCH_FD2_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_FD3 is
	port (
		 CK : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_FD3;

Architecture SPDCH_FD3_ARCH of SPDCH_FD3 is
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;

	Process(CK, SN)
	begin
		if ( SN = '0' ) then
			MEM  <= '1';
		elsif ( CK'event and CK = '1' ) then
			MEM  <= D;
		end if;
	end process;
end SPDCH_FD3_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_FD3_V is
	generic (width : natural := 2);
	port (
		 CK : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_FD3_V;

Architecture SPDCH_FD3_V_ARCH of SPDCH_FD3_V is
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;

	Process(CK, SN)
	begin
		if ( SN = '0' ) then
			MEM <= (others => '1');
		elsif ( CK'event and CK = '1' ) then
			MEM  <= D;
		end if;
	end process;
end SPDCH_FD3_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_FD4 is
	port (
		 CK : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_FD4;

Architecture SPDCH_FD4_ARCH of SPDCH_FD4 is
	attribute async_set_reset_local of infer : label is "SN , RN ";
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;
	infer : Process(CK, SN, RN)
	begin
		if ( SN = '0' ) then
			MEM  <= '1';
		elsif ( RN = '0' ) then
			MEM  <= '0';
		elsif ( CK'event and CK = '1' ) then
			MEM  <= D;
		end if;
	end process infer;
end SPDCH_FD4_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_FD4_V is
	generic (width : natural := 2);
	port (
		 CK : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_FD4_V;

Architecture SPDCH_FD4_V_ARCH of SPDCH_FD4_V is
	attribute async_set_reset_local of infer : label is "SN , RN ";
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;
	infer : Process(CK, SN, RN)
	begin
		if ( SN = '0' ) then
			MEM <= (others => '1');
		elsif ( RN = '0' ) then
			MEM <= (others => '0');
		elsif ( CK'event and CK = '1' ) then
			MEM  <= D;
		end if;
	end process infer;
end SPDCH_FD4_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_FJK1 is
	port (
		 CK : in STD_LOGIC;
		 J  : in STD_LOGIC;
		 K  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_FJK1;

Architecture SPDCH_FJK1_ARCH of SPDCH_FJK1 is
	Signal MEM: STD_LOGIC;
begin
	Q <= MEM;
	QN<= NOT MEM;
	
	Process(CK)
	begin
		if ( CK'event and CK = '1' ) then
			if ( j = '0' and k = '1' ) then
				MEM <= '0';
			elsif ( j = '1' and k = '0' ) then
				MEM <= '1';
			elsif ( j = '1' and k = '1' ) then
				MEM <= not MEM;
			end if;
		end if;
	end process;
end SPDCH_FJK1_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_FJK2 is
	port (
		 CK : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 J  : in STD_LOGIC;
		 K  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_FJK2;

Architecture SPDCH_FJK2_ARCH of SPDCH_FJK2 is
	Signal MEM: STD_LOGIC;
begin
	Q <= MEM;
	QN<= NOT MEM;
	
	Process(CK, RN)
	begin
		if ( RN = '0' ) then
			MEM <= '0';
		elsif ( CK'event and CK = '1' ) then
			if ( j = '0' and k = '1' ) then
				MEM <= '0';
			elsif ( j = '1' and k = '0' ) then
				MEM <= '1';
			elsif ( j = '1' and k = '1' ) then
				MEM <= not MEM;
			end if;
		end if;
	end process;
end SPDCH_FJK2_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_FJK3 is
	port (
		 CK : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 J  : in STD_LOGIC;
		 K  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_FJK3;

Architecture SPDCH_FJK3_ARCH of SPDCH_FJK3 is
	Signal MEM: STD_LOGIC;
begin
	Q <= MEM;
	QN<= NOT MEM;
	
	Process(CK, SN)
	begin
		if ( SN = '0' ) then
			MEM <= '1';
		elsif ( CK'event and CK = '1' ) then
			if ( j = '0' and k = '1' ) then
				MEM <= '0';
			elsif ( j = '1' and k = '0' ) then
				MEM <= '1';
			elsif ( j = '1' and k = '1' ) then
				MEM <= not MEM;
			end if;
		end if;
	end process;
end SPDCH_FJK3_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_FJK4 is
	port (
		 CK : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 J  : in STD_LOGIC;
		 K  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_FJK4;

Architecture SPDCH_FJK4_ARCH of SPDCH_FJK4 is
	Signal MEM: STD_LOGIC;
begin
	Q <= MEM;
	QN<= NOT MEM;
	
	Process(CK, SN, RN)
	begin
		if ( SN = '0' ) then
			MEM <= '1';
		elsif ( RN = '0' ) then
			MEM <= '0';
		elsif ( CK'event and CK = '1' ) then
			if ( j = '0' and k = '1' ) then
				MEM <= '0';
			elsif ( j = '1' and k = '0' ) then
				MEM <= '1';
			elsif ( j = '1' and k = '1' ) then
				MEM <= not MEM;
			end if;
		end if;
	end process;
end SPDCH_FJK4_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_GND is
	port (
		 O : out STD_LOGIC
	     );
end SPDCH_GND;

Architecture SPDCH_GND_ARCH of SPDCH_GND is
begin
	O<='0';
end SPDCH_GND_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_GND_V is
	generic (width : natural := 2);
	port (
		 O : out STD_logic_Vector(width-1 downto 0)
	     );
end SPDCH_GND_V;

Architecture SPDCH_GND_V_ARCH of SPDCH_GND_V is
begin
	O <= (others => '0');
end SPDCH_GND_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_HA is
	port (
		 A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 Y : out STD_LOGIC;
		 CO : out STD_LOGIC
	     );
end SPDCH_HA;

Architecture SPDCH_HA_ARCH of SPDCH_HA is
begin
	Y<= A xor B;
	CO<=A and B;
end SPDCH_HA_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_IV is
	port (
		 I : in STD_LOGIC;
		 O : out STD_LOGIC
	     );
end SPDCH_IV;

Architecture SPDCH_IV_ARCH of SPDCH_IV is
begin
	O <= not I;
end SPDCH_IV_ARCH;


library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_IV_V is
	generic (width : natural := 2);
	port (
		 I : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_IV_V;

Architecture SPDCH_IV_V_ARCH of SPDCH_IV_V is
begin

	O <= not I;
end SPDCH_IV_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_LD1 is
	port (
		 G  : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_LD1;

Architecture SPDCH_LD1_ARCH of SPDCH_LD1 is
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <= D when ( G = '1' ) else MEM;
	infer: process(G,D)
	begin
		if (G = '1') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD1_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_LD1_V is
	generic (width : natural := 2);
	port (
		 G  : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_LD1_V;

Architecture SPDCH_LD1_V_ARCH of SPDCH_LD1_V is
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <= D when ( G = '1' ) else MEM;
	infer: process(G,D)
	begin
		if (G = '1') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD1_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_LD2 is
	port (
		 GN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_LD2;

Architecture SPDCH_LD2_ARCH of SPDCH_LD2 is
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <= D when ( GN = '0' ) else MEM;
	infer: process(GN,D)
	begin
		if (GN = '0') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD2_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_LD2_V is
	generic (width : natural := 2);
	port (
		 GN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_LD2_V;

Architecture SPDCH_LD2_V_ARCH of SPDCH_LD2_V is
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <= D when ( GN = '0' ) else MEM;
	infer: process(GN,D)
	begin
		if (GN = '0') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD2_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD3 is
	port (
		 G  : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_LD3;

Architecture SPDCH_LD3_ARCH of SPDCH_LD3 is
	attribute async_set_reset of RN : signal is "true";
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  '0' when ( RN = '0' ) else
--		D when ( G = '1' ) else MEM;
	infer: process(G,RN,D)
	begin
		if (RN = '0') then
			MEM <= '0';
		elsif (G = '1') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD3_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD3_V is
	generic (width : natural := 2);
	port (
		 G  : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_LD3_V;

Architecture SPDCH_LD3_V_ARCH of SPDCH_LD3_V is
	attribute async_set_reset of RN : signal is "true";
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  ( others => '0' ) when ( RN = '0' ) else
--		D when ( G = '1' ) else MEM;
	infer: process(G,RN,D)
	begin
		if (RN = '0') then
			MEM <= (others => '0');
		elsif (G = '1') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD3_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD4 is
	port (
		 GN : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_LD4;

Architecture SPDCH_LD4_ARCH of SPDCH_LD4 is
	attribute async_set_reset of RN : signal is "true";
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  '0' when ( RN = '0' ) else
--		D when ( GN = '0' ) else MEM;
	infer: process(GN,RN,D)
	begin
		if (RN = '0') then
			MEM <= '0';
		elsif (GN = '0') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD4_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD4_V is
	generic (width : natural := 2);
	port (
		 GN : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_LD4_V;

Architecture SPDCH_LD4_V_ARCH of SPDCH_LD4_V is
	attribute async_set_reset of RN : signal is "true";
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  ( others => '0' ) when ( RN = '0' ) else
--		D when ( GN = '0' ) else MEM;
	infer: process(GN,RN,D)
	begin
		if (RN = '0') then
			MEM <= (others => '0');
		elsif (GN = '0') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD4_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD5 is
	port (
		 G  : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_LD5;

Architecture SPDCH_LD5_ARCH of SPDCH_LD5 is
	attribute async_set_reset of SN : signal is "true";
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  '1' when ( SN = '0' ) else
--		D when ( G = '1' ) else MEM;
	infer: process(G,SN,D)
	begin
		if (SN = '0') then
			MEM <= '1';
		elsif (G = '1') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD5_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD5_V is
	generic (width : natural := 2);
	port (
		 G  : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_LD5_V;

Architecture SPDCH_LD5_V_ARCH of SPDCH_LD5_V is
	attribute async_set_reset of SN : signal is "true";
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  ( others => '1' ) when ( SN = '0' ) else
--		D when ( G = '1' ) else MEM;
	infer: process(G,SN,D)
	begin
		if (SN = '0') then
			MEM <= (others => '1');
		elsif (G = '1') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD5_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD6 is
	port (
		 GN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_LD6;

Architecture SPDCH_LD6_ARCH of SPDCH_LD6 is
	attribute async_set_reset of SN : signal is "true";
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  '1' when ( SN = '0' ) else
--		D when ( GN = '0' ) else MEM;
	infer: process(GN,SN,D)
	begin
		if (SN = '0') then
			MEM <= '1';
		elsif (GN = '0') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD6_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD6_V is
	generic (width : natural := 2);
	port (
		 GN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_LD6_V;

Architecture SPDCH_LD6_V_ARCH of SPDCH_LD6_V is
	attribute async_set_reset of SN : signal is "true";
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  ( others => '1' ) when ( SN = '0' ) else
--		D when ( GN = '0' ) else MEM;
	infer: process(GN,SN,D)
	begin
		if (SN = '0') then
			MEM <= (others => '1');
		elsif (GN = '0') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD6_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD7 is
	port (
		 G  : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_LD7;

Architecture SPDCH_LD7_ARCH of SPDCH_LD7 is
	attribute async_set_reset_local of infer : label is "SN , RN";
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  '0' when ( RN = '0' ) else
--		'1' when ( SN = '0' ) else
--		D when ( G = '1' ) else MEM;
	infer: process(G,RN,SN,D)
	begin
		if (SN = '0') then
			MEM <= '1';
		elsif (RN = '0') then
			MEM <= '0';
		elsif (G = '1') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD7_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD7_V is
	generic (width : natural := 2);
	port (
		 G  : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_LD7_V;

Architecture SPDCH_LD7_V_ARCH of SPDCH_LD7_V is
	attribute async_set_reset_local of infer : label is "SN , RN";
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  ( others => '0' ) when ( RN = '0' ) else
--		( others => '1' ) when ( SN = '0' ) else
--		D when ( G = '1' ) else MEM;
	infer: process(G,RN,SN,D)
	begin
		if (SN = '0') then
			MEM <= (others => '1');
		elsif (RN = '0') then
			MEM <= (others => '0');
		elsif (G = '1') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD7_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD8 is
	port (
		 GN : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC;
		 Q  : out STD_LOGIC;
		 QN : out STD_LOGIC
	     );
end SPDCH_LD8;

Architecture SPDCH_LD8_ARCH of SPDCH_LD8 is
	attribute async_set_reset_local of infer : label is "SN , RN";
	Signal	MEM : STD_LOGIC;
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  '0' when ( RN = '0' ) else
--		'1' when ( SN = '0' ) else
--		D when ( GN = '0' ) else MEM;
	infer: process(GN,RN,SN,D)
	begin
		if (SN = '0') then
			MEM <= '1';
		elsif (RN = '0') then
			MEM <= '0';
		elsif (GN = '0') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD8_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.all;

Entity SPDCH_LD8_V is
	generic (width : natural := 2);
	port (
		 GN : in STD_LOGIC;
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 D  : in STD_LOGIC_VECTOR(width-1 downto 0);
		 Q  : out STD_LOGIC_VECTOR(width-1 downto 0);
		 QN : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_LD8_V;

Architecture SPDCH_LD8_V_ARCH of SPDCH_LD8_V is
	attribute async_set_reset_local of infer : label is "SN , RN ";
	Signal	MEM : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	Q  <= MEM;
	QN <= not MEM;
--	MEM <=  ( others => '0' ) when ( RN = '0' ) else
--		( others => '1' ) when ( SN = '0' ) else
--		D when ( GN = '0' ) else MEM;
	infer: process(GN,RN,SN,D)
	begin
		if (SN = '0') then
			MEM <= (others => '1');
		elsif (RN = '0') then
			MEM <= (others => '0');
		elsif (GN = '0') then
			MEM <= D;
		end if;
	end process infer;
end SPDCH_LD8_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_LSRA is
	port (
		 RN : in STD_LOGIC;
		 SN : in STD_LOGIC;
		 Q  : out STD_LOGIC
	     );
end SPDCH_LSRA;

Architecture SPDCH_LSRA_ARCH of SPDCH_LSRA is
begin
	Process(RN, SN)
	begin
		if ( SN='0' and RN='0') then
			Q<='0';
		elsif ( SN='0' and RN='1') then
			Q<='1';
		elsif ( SN='1' and RN='0') then
			Q<='0';
		end if;
	end process;
end SPDCH_LSRA_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_LSRB is
	port (
		 R : in STD_LOGIC;
		 S : in STD_LOGIC;
		 Q : out STD_LOGIC
	     );
end SPDCH_LSRB;

Architecture SPDCH_LSRB_ARCH of SPDCH_LSRB is
begin
	Process(R, S)
	begin
		if ( S='0' and R='1') then
			Q<='0';
		elsif ( S='1' and R='0') then
			Q<='1';
		elsif ( S='1' and R='1') then
			Q<='1';
		end if;
	end process;
end SPDCH_LSRB_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_MX21 is
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		S  : in STD_LOGIC;
		O  : out STD_LOGIC
	     );
end SPDCH_MX21;

Architecture SPDCH_MX21_ARCH of SPDCH_MX21 is
begin
	O <= I1 when ( S = '0' ) else I2;
end SPDCH_MX21_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_MX21_V is
	generic (width : natural := 2);
	port (
		I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		S  : in STD_LOGIC;
		O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_MX21_V;

Architecture SPDCH_MX21_V_ARCH of SPDCH_MX21_V is
begin
	O <= I1 when ( S = '0' ) else I2;
end SPDCH_MX21_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_MX41 is
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		I4 : in STD_LOGIC;
		A  : in STD_LOGIC;
		B  : in STD_LOGIC;
		O  : out STD_LOGIC
	     );
end SPDCH_MX41;

Architecture SPDCH_MX41_ARCH of SPDCH_MX41 is
begin
	O <= 	I1 when ( A = '0' and B = '0' ) else
		I2 when ( A = '0' and B = '1' ) else
		I3 when ( A = '1' and B = '0' ) else I4;
end SPDCH_MX41_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_MX41_V is
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
end SPDCH_MX41_V;

Architecture SPDCH_MX41_V_ARCH of SPDCH_MX41_V is
begin
	O <= 	I1 when ( A = '0' and B = '0' ) else
		I2 when ( A = '0' and B = '1' ) else
		I3 when ( A = '1' and B = '0' ) else I4;
end SPDCH_MX41_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_ND2 is
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end SPDCH_ND2;

Architecture SPDCH_ND2_ARCH of SPDCH_ND2 is
begin
	O <= not(I1 and I2);
end SPDCH_ND2_ARCH;


library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_ND2_V is
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_ND2_V;

Architecture SPDCH_ND2_V_ARCH of SPDCH_ND2_V is
begin
	O <= not(I1 and I2);
end SPDCH_ND2_V_ARCH;


library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_ND3 is
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		O  : out STD_LOGIC
	);
end SPDCH_ND3;

Architecture SPDCH_ND3_ARCH of SPDCH_ND3 is
begin
	O <= not(I1 and I2 and I3);
end SPDCH_ND3_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_ND3_V is
	generic (width : natural := 2);
	port (
		I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	);
end SPDCH_ND3_V;

Architecture SPDCH_ND3_V_ARCH of SPDCH_ND3_V is
begin
	O <= not(I1 and I2 and I3);
end SPDCH_ND3_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_ND4 is
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 I3 : in STD_LOGIC;
		 I4 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end SPDCH_ND4;

Architecture SPDCH_ND4_ARCH of SPDCH_ND4 is
begin
	O <= not(I1 and I2 and I3 and I4);
end SPDCH_ND4_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_ND4_V is
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I4 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_ND4_V;

Architecture SPDCH_ND4_V_ARCH of SPDCH_ND4_V is
begin
	O <= not(I1 and I2 and I3 and I4);
end SPDCH_ND4_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_NOP is
	port (
		 Nop : in STD_LOGIC
	     );
end SPDCH_NOP;

Architecture SPDCH_NOP_ARCH of SPDCH_NOP is
begin
end SPDCH_NOP_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_NOP_V is
	generic (width : natural := 2);
	port (
		 Nop : in STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_NOP_V;

Architecture SPDCH_NOP_V_ARCH of SPDCH_NOP_V is
begin
end SPDCH_NOP_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_NR2 is
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end SPDCH_NR2;

Architecture SPDCH_NR2_ARCH of SPDCH_NR2 is
begin
	O <= not(I1 or I2);
end SPDCH_NR2_ARCH;


library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_NR2_V is
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_NR2_V;

Architecture SPDCH_NR2_V_ARCH of SPDCH_NR2_V is
begin
	O <= not(I1 or I2);
end SPDCH_NR2_V_ARCH;


library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_NR3 is
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		O  : out STD_LOGIC
	);
end SPDCH_NR3;

Architecture SPDCH_NR3_ARCH of SPDCH_NR3 is
begin
	O <= not(I1 or I2 or I3);
end SPDCH_NR3_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_NR3_V is
	generic (width : natural := 2);
	port (
		I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	);
end SPDCH_NR3_V;

Architecture SPDCH_NR3_V_ARCH of SPDCH_NR3_V is
begin
	O <= not(I1 or I2 or I3);
end SPDCH_NR3_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_NR4 is
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 I3 : in STD_LOGIC;
		 I4 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end SPDCH_NR4;

Architecture SPDCH_NR4_ARCH of SPDCH_NR4 is
begin
	O <= not(I1 or I2 or I3 or I4);
end SPDCH_NR4_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_NR4_V is
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I4 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_NR4_V;

Architecture SPDCH_NR4_V_ARCH of SPDCH_NR4_V is
begin
	O <= not(I1 or I2 or I3 or I4);
end SPDCH_NR4_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_OR2 is
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end SPDCH_OR2;

Architecture SPDCH_OR2_ARCH of SPDCH_OR2 is
begin
	O <= I1 or I2;
end SPDCH_OR2_ARCH;


library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_OR2_V is
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_OR2_V;

Architecture SPDCH_OR2_V_ARCH of SPDCH_OR2_V is
begin
	O <= I1 or I2;
end SPDCH_OR2_V_ARCH;


library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_OR3 is
	port (
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		O  : out STD_LOGIC
	);
end SPDCH_OR3;

Architecture SPDCH_OR3_ARCH of SPDCH_OR3 is
begin
	O <= I1 or I2 or I3;
end SPDCH_OR3_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_OR3_V is
	generic (width : natural := 2);
	port (
		I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	);
end SPDCH_OR3_V;

Architecture SPDCH_OR3_V_ARCH of SPDCH_OR3_V is
begin
	O <= I1 or I2 or I3;
end SPDCH_OR3_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_OR4 is
	port (
		 I1 : in STD_LOGIC;
		 I2 : in STD_LOGIC;
		 I3 : in STD_LOGIC;
		 I4 : in STD_LOGIC;
		 O  : out STD_LOGIC
	     );
end SPDCH_OR4;

Architecture SPDCH_OR4_ARCH of SPDCH_OR4 is
begin
	O <= I1 or I2 or I3 or I4;
end SPDCH_OR4_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_OR4_V is
	generic (width : natural := 2);
	port (
		 I1 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I2 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I3 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 I4 : in STD_LOGIC_VECTOR(width-1 downto 0);
		 O  : out STD_LOGIC_VECTOR(width-1 downto 0)
	     );
end SPDCH_OR4_V;

Architecture SPDCH_OR4_V_ARCH of SPDCH_OR4_V is
begin
	O <= I1 or I2 or I3 or I4;
end SPDCH_OR4_V_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_PD is
	port (
		 O : out STD_LOGIC
	     );
end SPDCH_PD;

Architecture SPDCH_PD_ARCH of SPDCH_PD is
begin
	O <= 'L';
end SPDCH_PD_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_PU is
	port (
		 O : out STD_LOGIC
	     );
end SPDCH_PU;

Architecture SPDCH_PU_ARCH of SPDCH_PU is
begin
	O <= 'H';
end SPDCH_PU_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_VDD is
	port (
		 O : out STD_LOGIC
	     );
end SPDCH_VDD;

Architecture SPDCH_VDD_ARCH of SPDCH_VDD is
begin
	O<='1';
end SPDCH_VDD_ARCH;

library SPDCH;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SPDCH_VDD_V is
	generic (width : natural := 2);
	port (
		 O : out STD_logic_Vector(width-1 downto 0)
	     );
end SPDCH_VDD_V;

Architecture SPDCH_VDD_V_ARCH of SPDCH_VDD_V is
begin
	O <= (others => '1');
end SPDCH_VDD_V_ARCH;
