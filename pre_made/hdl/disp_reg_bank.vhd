--* ><(((('> * Puli puli * ><(((('> // Ƹ̵̡Ӝ̵̨̄Ʒ * swish swish* Ƹ̵̡Ӝ̵̨̄Ʒ Ƹ̵̡Ӝ̵̨̄Ʒ // (っ◕‿◕)╭∩╮^H^H^Hっ 
LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all; ENTITY reg_bank_1px IS PORT(clk:IN std_logic;nullify:IN std_logic;pixd_in:IN std_logic_vector(23 DOWNTO 0);rst_n:IN std_logic;write:IN std_logic;pixd_out:OUT std_logic_vector(23 DOWNTO 0));END reg_bank_1px ;LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all;ARCHITECTURE struct OF reg_bank_1px IS SIGNAL z5bf0509d2:std_logic_vector(23 DOWNTO 0);SIGNAL z508ec0017:std_logic_vector(23 DOWNTO 0);SIGNAL z6981ad0b9:std_logic_vector(1 DOWNTO 0);SIGNAL zf6569350a:std_logic_vector(23 DOWNTO 0);SIGNAL zeca5e5e74:std_logic_vector(23 DOWNTO 0);BEGIN zf6569350a<=zeca5e5e74;z126461a59:PROCESS(clk, rst_n)BEGIN IF(rst_n='0')THEN zeca5e5e74<="000000000000000000000000";ELSIF(clk'EVENT AND clk='1')THEN zeca5e5e74<=z508ec0017;END IF;END PROCESS z126461a59;z5bf0509d2<="000000000000000000000000";z6981ad0b9<=nullify & write;z430e8384e:PROCESS(zf6569350a, pixd_in, z5bf0509d2, z6981ad0b9)BEGIN CASE z6981ad0b9 IS WHEN"00"=>z508ec0017<=zf6569350a;WHEN"01"=>z508ec0017<=pixd_in;WHEN"10"=>z508ec0017<=z5bf0509d2;WHEN"11"=>z508ec0017<=z5bf0509d2;WHEN OTHERS=>z508ec0017<=(OTHERS=>'X');END CASE;END PROCESS z430e8384e;pixd_out<=zf6569350a;END struct; LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all; ENTITY reg_bank_1col IS PORT(clk:IN std_logic;nullify:IN std_logic;pixd_in:IN std_logic_vector(23 DOWNTO 0);rst_n:IN std_logic;write:IN std_logic;y:IN std_logic_vector(7 DOWNTO 0);pixd_out:OUT std_logic_vector(23 DOWNTO 0));END reg_bank_1col ;LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all;ARCHITECTURE struct OF reg_bank_1col IS SIGNAL z60a67f27d:std_logic_vector(23 DOWNTO 0);SIGNAL zc44f0ab3b:std_logic_vector(23 DOWNTO 0);SIGNAL ze64054cb6:std_logic_vector(23 DOWNTO 0);SIGNAL z508ec0017:std_logic;SIGNAL z1934d98a3:std_logic;SIGNAL zb48298c48:std_logic;SIGNAL z9f041aaff:std_logic;SIGNAL zcf058ee7c:std_logic;SIGNAL ze6d31b4ac:std_logic;SIGNAL z1b791bfd5:std_logic;SIGNAL z45a1dff88:std_logic;SIGNAL zc83e54d35:std_logic;SIGNAL z22f92b4dd:std_logic_vector(3 DOWNTO 0);SIGNAL z197a0495d:std_logic_vector(2 DOWNTO 0);SIGNAL z75dc1577a:std_logic;SIGNAL z833ab3bd5:std_logic;SIGNAL zc57c46db4:std_logic;SIGNAL z1ea89dc0d:std_logic;SIGNAL zcd48e1f4f:std_logic;SIGNAL z36424fa31:std_logic;SIGNAL z0068e7d64:std_logic;SIGNAL zb30429bb4:std_logic;SIGNAL z564ee05a3:std_logic_vector(23 DOWNTO 0);SIGNAL z0a9315da3:std_logic_vector(23 DOWNTO 0);SIGNAL z6bb6c7052:std_logic_vector(23 DOWNTO 0);SIGNAL z163c5325c:std_logic_vector(23 DOWNTO 0);SIGNAL z84b2eb77e:std_logic_vector(23 DOWNTO 0);SIGNAL zf5226fb5c:std_logic_vector(7 DOWNTO 0);COMPONENT reg_bank_1px PORT(clk:IN std_logic ;nullify:IN std_logic ;pixd_in:IN std_logic_vector(23 DOWNTO 0);rst_n:IN std_logic ;write:IN std_logic ;pixd_out:OUT std_logic_vector(23 DOWNTO 0));END COMPONENT;BEGIN zc57c46db4<=write AND z1934d98a3;z1ea89dc0d<=write AND zb48298c48;zcd48e1f4f<=write AND z75dc1577a;z36424fa31<=write AND z833ab3bd5;z508ec0017<=write AND z0068e7d64;ze6d31b4ac<=write AND zb30429bb4;z1b791bfd5<=write AND z9f041aaff;z45a1dff88<=write AND zcf058ee7c;zc83e54d35<='1';zf57631b0a:PROCESS(zc83e54d35, y)BEGIN IF(y(0)=zc83e54d35)THEN z22f92b4dd<="0000";ELSIF(y(1)=zc83e54d35)THEN z22f92b4dd<="0001";ELSIF(y(2)=zc83e54d35)THEN z22f92b4dd<="0010";ELSIF(y(3)=zc83e54d35)THEN z22f92b4dd<="0011";ELSIF(y(4)=zc83e54d35)THEN z22f92b4dd<="0100";ELSIF(y(5)=zc83e54d35)THEN z22f92b4dd<="0101";ELSIF(y(6)=zc83e54d35)THEN z22f92b4dd<="0110";ELSIF(y(7)=zc83e54d35)THEN z22f92b4dd<="0111";ELSE z22f92b4dd<="1000";END IF;END PROCESS zf57631b0a;z197a0495d<=z22f92b4dd(2)& z22f92b4dd(1)& z22f92b4dd(0);z7d086e91c:PROCESS(z163c5325c, z6bb6c7052, z0a9315da3, z564ee05a3, z84b2eb77e, z60a67f27d, zc44f0ab3b, ze64054cb6, z197a0495d)BEGIN CASE z197a0495d IS WHEN"000"=>pixd_out<=z163c5325c;WHEN"001"=>pixd_out<=z6bb6c7052;WHEN"010"=>pixd_out<=z0a9315da3;WHEN"011"=>pixd_out<=z564ee05a3;WHEN"100"=>pixd_out<=z84b2eb77e;WHEN"101"=>pixd_out<=z60a67f27d;WHEN"110"=>pixd_out<=zc44f0ab3b;WHEN"111"=>pixd_out<=ze64054cb6;WHEN OTHERS=>pixd_out<=(OTHERS=>'X');END CASE;END PROCESS z7d086e91c;zf5226fb5c<=y;z16921971f:PROCESS(zf5226fb5c)VARIABLE z925f2bf10:std_logic_vector(7 DOWNTO 0);BEGIN z925f2bf10:=zf5226fb5c(7 DOWNTO 0);z1934d98a3<=z925f2bf10(0);zb48298c48<=z925f2bf10(1);z75dc1577a<=z925f2bf10(2);z833ab3bd5<=z925f2bf10(3);z0068e7d64<=z925f2bf10(4);zb30429bb4<=z925f2bf10(5);z9f041aaff<=z925f2bf10(6);zcf058ee7c<=z925f2bf10(7);END PROCESS z16921971f;U_0:reg_bank_1px PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>pixd_in,rst_n=>rst_n,write=>zc57c46db4,pixd_out=>z163c5325c);U_1:reg_bank_1px PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>pixd_in,rst_n=>rst_n,write=>z1ea89dc0d,pixd_out=>z6bb6c7052);U_3:reg_bank_1px PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>pixd_in,rst_n=>rst_n,write=>zcd48e1f4f,pixd_out=>z0a9315da3);U_4:reg_bank_1px PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>pixd_in,rst_n=>rst_n,write=>z36424fa31,pixd_out=>z564ee05a3);U_5:reg_bank_1px PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>pixd_in,rst_n=>rst_n,write=>z508ec0017,pixd_out=>z84b2eb77e);U_6:reg_bank_1px PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>pixd_in,rst_n=>rst_n,write=>ze6d31b4ac,pixd_out=>z60a67f27d);U_11:reg_bank_1px PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>pixd_in,rst_n=>rst_n,write=>z1b791bfd5,pixd_out=>zc44f0ab3b);U_12:reg_bank_1px PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>pixd_in,rst_n=>rst_n,write=>z45a1dff88,pixd_out=>ze64054cb6);END struct; LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all; ENTITY reg_bank_64px IS PORT(clk:IN std_logic;nullify:IN std_logic;zd58ce0c39:IN std_logic_vector(23 DOWNTO 0);rst_n:IN std_logic;write:IN std_logic;x:IN std_logic_vector(7 DOWNTO 0);y:IN std_logic_vector(7 DOWNTO 0);pix_out:OUT std_logic_vector(23 DOWNTO 0));END reg_bank_64px ;LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all; ARCHITECTURE struct OF reg_bank_64px IS SIGNAL z508ec0017:std_logic;SIGNAL z1934d98a3:std_logic;SIGNAL zb48298c48:std_logic;SIGNAL z9f041aaff:std_logic;SIGNAL zcf058ee7c:std_logic;SIGNAL ze6d31b4ac:std_logic;SIGNAL z1b791bfd5:std_logic;SIGNAL z45a1dff88:std_logic;SIGNAL zc83e54d35:std_logic_vector(2 DOWNTO 0);SIGNAL z22f92b4dd:std_logic;SIGNAL z75dc1577a:std_logic;SIGNAL z833ab3bd5:std_logic;SIGNAL zc57c46db4:std_logic;SIGNAL z1ea89dc0d:std_logic;SIGNAL zcd48e1f4f:std_logic;SIGNAL z36424fa31:std_logic;SIGNAL z0068e7d64:std_logic;SIGNAL zb30429bb4:std_logic;SIGNAL z36f79a239:std_logic_vector(3 DOWNTO 0);SIGNAL pixd_out:std_logic_vector(23 DOWNTO 0);SIGNAL z564ee05a3:std_logic_vector(23 DOWNTO 0);SIGNAL z0a9315da3:std_logic_vector(23 DOWNTO 0);SIGNAL z6bb6c7052:std_logic_vector(23 DOWNTO 0);SIGNAL z163c5325c:std_logic_vector(23 DOWNTO 0);SIGNAL z84b2eb77e:std_logic_vector(23 DOWNTO 0);SIGNAL zed22165f2:std_logic_vector(23 DOWNTO 0);SIGNAL z90a7dbf30:std_logic_vector(23 DOWNTO 0);SIGNAL zf090fac59:std_logic_vector(7 DOWNTO 0);COMPONENT reg_bank_1col PORT(clk:IN std_logic ;nullify:IN std_logic ;pixd_in:IN std_logic_vector(23 DOWNTO 0);rst_n:IN std_logic ;write:IN std_logic ;y:IN std_logic_vector(7 DOWNTO 0);pixd_out:OUT std_logic_vector(23 DOWNTO 0));END COMPONENT;BEGIN z508ec0017<=write AND z1934d98a3;zb48298c48<=write AND z0068e7d64;z75dc1577a<=write AND zb30429bb4;z833ab3bd5<=write AND z9f041aaff;zc57c46db4<=write AND zcf058ee7c;z1ea89dc0d<=write AND ze6d31b4ac;zcd48e1f4f<=write AND z1b791bfd5;z36424fa31<=write AND z45a1dff88;z22f92b4dd<='1';zd4351336a:PROCESS(z22f92b4dd, x)BEGIN IF(x(0)=z22f92b4dd)THEN z36f79a239<="0000";ELSIF(x(1)=z22f92b4dd)THEN z36f79a239<="0001";ELSIF(x(2)=z22f92b4dd)THEN z36f79a239<="0010";ELSIF(x(3)=z22f92b4dd)THEN z36f79a239<="0011";ELSIF(x(4)=z22f92b4dd)THEN z36f79a239<="0100";ELSIF(x(5)=z22f92b4dd)THEN z36f79a239<="0101";ELSIF(x(6)=z22f92b4dd)THEN z36f79a239<="0110";ELSIF(x(7)=z22f92b4dd)THEN z36f79a239<="0111";ELSE z36f79a239<="1000";END IF;END PROCESS zd4351336a;zc83e54d35<=z36f79a239(2)& z36f79a239(1)& z36f79a239(0);z16921971f:PROCESS(pixd_out, z564ee05a3, z0a9315da3, z6bb6c7052, z163c5325c, z84b2eb77e, zed22165f2, z90a7dbf30, zc83e54d35)BEGIN CASE zc83e54d35 IS WHEN"000"=>pix_out<=pixd_out;WHEN"001"=>pix_out<=z564ee05a3;WHEN"010"=>pix_out<=z0a9315da3;WHEN"011"=>pix_out<=z6bb6c7052;WHEN"100"=>pix_out<=z163c5325c;WHEN"101"=>pix_out<=z84b2eb77e;WHEN"110"=>pix_out<=zed22165f2;WHEN"111"=>pix_out<=z90a7dbf30;WHEN OTHERS=>pix_out<=(OTHERS=>'X');END CASE;END PROCESS z16921971f;zf090fac59<=x;z193f2f0f4:PROCESS(zf090fac59)VARIABLE z925f2bf10:std_logic_vector(7 DOWNTO 0);BEGIN z925f2bf10:=zf090fac59(7 DOWNTO 0);z1934d98a3<=z925f2bf10(0);z0068e7d64<=z925f2bf10(1);zb30429bb4<=z925f2bf10(2);z9f041aaff<=z925f2bf10(3);zcf058ee7c<=z925f2bf10(4);ze6d31b4ac<=z925f2bf10(5);z1b791bfd5<=z925f2bf10(6);z45a1dff88<=z925f2bf10(7);END PROCESS z193f2f0f4;U_0:reg_bank_1col PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>zd58ce0c39,rst_n=>rst_n,write=>z508ec0017,y=>y,pixd_out=>pixd_out);U_1:reg_bank_1col PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>zd58ce0c39,rst_n=>rst_n,write=>zb48298c48,y=>y,pixd_out=>z564ee05a3);U_2:reg_bank_1col PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>zd58ce0c39,rst_n=>rst_n,write=>z75dc1577a,y=>y,pixd_out=>z0a9315da3);U_3:reg_bank_1col PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>zd58ce0c39,rst_n=>rst_n,write=>z833ab3bd5,y=>y,pixd_out=>z6bb6c7052);U_4:reg_bank_1col PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>zd58ce0c39,rst_n=>rst_n,write=>zc57c46db4,y=>y,pixd_out=>z163c5325c);U_5:reg_bank_1col PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>zd58ce0c39,rst_n=>rst_n,write=>z1ea89dc0d,y=>y,pixd_out=>z84b2eb77e);U_6:reg_bank_1col PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>zd58ce0c39,rst_n=>rst_n,write=>zcd48e1f4f,y=>y,pixd_out=>zed22165f2);U_7:reg_bank_1col PORT MAP(clk=>clk,nullify=>nullify,pixd_in=>zd58ce0c39,rst_n=>rst_n,write=>z36424fa31,y=>y,pixd_out=>z90a7dbf30);END struct; LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all; ENTITY mem_ctl_block IS PORT(clk:IN std_logic;pixd_w_done:IN std_logic;rst_n:IN std_logic;banksel:OUT std_logic;nullify:OUT std_logic;w_rdy:OUT std_logic);END mem_ctl_block ;LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all;ARCHITECTURE fsm OF mem_ctl_block IS TYPE STATE_TYPE IS(z77ca48e55,zd561de642,zfbdccd934,z0f0974e71);SIGNAL zdf0be1ce6:STATE_TYPE;SIGNAL ze8e79043b:STATE_TYPE;SIGNAL ze03a9bfed:std_logic ;SIGNAL z0650cbe3e:std_logic ;BEGIN z9149816e0:PROCESS(clk,rst_n)BEGIN IF(rst_n='0')THEN zdf0be1ce6<=z77ca48e55;ze03a9bfed<='0';z0650cbe3e<='0';ELSIF(clk'EVENT AND clk='1')THEN zdf0be1ce6<=ze8e79043b;CASE zdf0be1ce6 IS WHEN zd561de642=>ze03a9bfed<=not ze03a9bfed;WHEN zfbdccd934=>z0650cbe3e<='1';WHEN z0f0974e71=>z0650cbe3e<='0';WHEN OTHERS=>NULL;END CASE;END IF;END PROCESS z9149816e0;z145fbcc0d:PROCESS(zdf0be1ce6,pixd_w_done)BEGIN CASE zdf0be1ce6 IS WHEN z77ca48e55=>IF(pixd_w_done='1')THEN ze8e79043b<=zd561de642;ELSE ze8e79043b<=z77ca48e55;END IF;WHEN zd561de642=>ze8e79043b<=zfbdccd934;WHEN zfbdccd934=>ze8e79043b<=z0f0974e71;WHEN z0f0974e71=>IF(pixd_w_done='0')THEN ze8e79043b<=z77ca48e55;ELSE ze8e79043b<=z0f0974e71;END IF;WHEN OTHERS=>ze8e79043b<=z77ca48e55;END CASE;END PROCESS z145fbcc0d;z822bdb2c3:PROCESS(zdf0be1ce6)BEGIN w_rdy<='0';CASE zdf0be1ce6 IS WHEN z77ca48e55=>w_rdy<='1';WHEN OTHERS=>NULL;END CASE;END PROCESS z822bdb2c3;banksel<=ze03a9bfed;nullify<=z0650cbe3e;END fsm; LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all; ENTITY disp_reg_bank IS PORT(clk:IN std_logic;pixd_in:IN std_logic_vector(23 DOWNTO 0);rst_n:IN std_logic;w_done:IN std_logic;write:IN std_logic;xr:IN std_logic_vector(7 DOWNTO 0);xw:IN std_logic_vector(7 DOWNTO 0);yr:IN std_logic_vector(7 DOWNTO 0);yw:IN std_logic_vector(7 DOWNTO 0);pixd_out:OUT std_logic_vector(23 DOWNTO 0);w_rdy:OUT std_logic);END disp_reg_bank ;LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all;ARCHITECTURE struct OF disp_reg_bank IS SIGNAL banksel:std_logic;SIGNAL ze72d2c2a4:std_logic_vector(7 DOWNTO 0);SIGNAL z508ec0017:std_logic;SIGNAL zb48298c48:std_logic;SIGNAL z9f041aaff:std_logic;SIGNAL zcf058ee7c:std_logic;SIGNAL z75dc1577a:std_logic_vector(7 DOWNTO 0);SIGNAL z833ab3bd5:std_logic_vector(7 DOWNTO 0);SIGNAL zc57c46db4:std_logic_vector(7 DOWNTO 0);SIGNAL z1ea89dc0d:std_logic_vector(7 DOWNTO 0);SIGNAL zcd48e1f4f:std_logic_vector(7 DOWNTO 0);SIGNAL z36424fa31:std_logic_vector(7 DOWNTO 0);SIGNAL z0068e7d64:std_logic_vector(7 DOWNTO 0);SIGNAL zb30429bb4:std_logic_vector(7 DOWNTO 0);SIGNAL nullify:std_logic;SIGNAL pix_out:std_logic_vector(23 DOWNTO 0);SIGNAL zb488040b4:std_logic_vector(23 DOWNTO 0);SIGNAL x:std_logic_vector(7 DOWNTO 0);SIGNAL z00b23bf66:std_logic_vector(7 DOWNTO 0);SIGNAL y:std_logic_vector(7 DOWNTO 0);SIGNAL zd4810c102:std_logic_vector(7 DOWNTO 0);COMPONENT mem_ctl_block PORT(clk:IN std_logic ;pixd_w_done:IN std_logic ;rst_n:IN std_logic ;banksel:OUT std_logic ;nullify:OUT std_logic ;w_rdy:OUT std_logic);END COMPONENT;COMPONENT reg_bank_64px PORT(clk:IN std_logic ;nullify:IN std_logic ;zd58ce0c39:IN std_logic_vector(23 DOWNTO 0);rst_n:IN std_logic ;write:IN std_logic ;x:IN std_logic_vector(7 DOWNTO 0);y:IN std_logic_vector(7 DOWNTO 0);pix_out:OUT std_logic_vector(23 DOWNTO 0));END COMPONENT;BEGIN z508ec0017<=nullify AND banksel;zb48298c48<=nullify AND NOT(banksel);z75dc1577a<=xw AND ze72d2c2a4;z833ab3bd5<=NOT(ze72d2c2a4)AND xr;zc57c46db4<=yw AND ze72d2c2a4;z1ea89dc0d<=NOT(ze72d2c2a4)AND yr;zcd48e1f4f<=xw AND NOT(ze72d2c2a4);z36424fa31<=ze72d2c2a4 AND xr;z0068e7d64<=yw AND NOT(ze72d2c2a4);zb30429bb4<=ze72d2c2a4 AND yr;z9f041aaff<=NOT(banksel)AND write;zcf058ee7c<=write AND banksel;ze72d2c2a4<=banksel & banksel & banksel & banksel & banksel & banksel & banksel & banksel;z33254a172:PROCESS(pix_out, zb488040b4, banksel)BEGIN CASE banksel IS WHEN'0'=>pixd_out<=pix_out;WHEN'1'=>pixd_out<=zb488040b4;WHEN OTHERS=>pixd_out<=(OTHERS=>'X');END CASE;END PROCESS z33254a172;x<=z75dc1577a OR z833ab3bd5;z00b23bf66<=zcd48e1f4f OR z36424fa31;y<=zc57c46db4 OR z1ea89dc0d;zd4810c102<=z0068e7d64 OR zb30429bb4;U_2:mem_ctl_block PORT MAP(clk=>clk,pixd_w_done=>w_done,rst_n=>rst_n,banksel=>banksel,nullify=>nullify,w_rdy=>w_rdy);U_0:reg_bank_64px PORT MAP(clk=>clk,nullify=>z508ec0017,zd58ce0c39=>pixd_in,rst_n=>rst_n,write=>zcf058ee7c,x=>x,y=>y,pix_out=>pix_out);U_1:reg_bank_64px PORT MAP(clk=>clk,nullify=>zb48298c48,zd58ce0c39=>pixd_in,rst_n=>rst_n,write=>z9f041aaff,x=>z00b23bf66,y=>zd4810c102,pix_out=>zb488040b4);END struct;