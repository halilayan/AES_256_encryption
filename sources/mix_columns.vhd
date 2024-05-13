----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2024 16:01:08
-- Design Name: 
-- Module Name: mix_columns - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity mix_columns is
port (
        mix_in : in std_logic_vector (127 downto 0);
        mix_out : out std_logic_vector (127 downto 0)
        
      );
end mix_columns;

architecture Behavioral of mix_columns is


signal  s00,     s01,     s02,     s03: std_logic_vector (7 downto 0);
signal  s10,     s11,     s12,     s13: std_logic_vector (7 downto 0); 
signal  s20,     s21,     s22,     s23: std_logic_vector (7 downto 0);
signal  s30,     s31,     s32,     s33: std_logic_vector (7 downto 0);

signal  s002,    s012,    s022,     s032: std_logic_vector (7 downto 0);
signal  s102,    s112,    s122,     s132: std_logic_vector (7 downto 0); 
signal  s202,    s212,    s222,     s232: std_logic_vector (7 downto 0);
signal  s302,    s312,    s322,     s332: std_logic_vector (7 downto 0);

signal  s003,    s013,    s023,     s033: std_logic_vector (7 downto 0);
signal  s103,    s113,    s123,     s133: std_logic_vector (7 downto 0); 
signal  s203,    s213,    s223,     s233: std_logic_vector (7 downto 0);
signal  s303,    s313,    s323,     s333: std_logic_vector (7 downto 0);

signal  s004,    s014,    s024,     s034: std_logic_vector (7 downto 0);
signal  s104,    s114,    s124,     s134: std_logic_vector (7 downto 0); 
signal  s204,    s214,    s224,     s234: std_logic_vector (7 downto 0);
signal  s304,    s314,    s324,     s334: std_logic_vector (7 downto 0);



 
component gf2 is
port(
         port_in  : in std_logic_vector (7 downto 0);
         port_out : out std_logic_vector (7 downto 0)
         
    );
end component;

component gf3 is
port(
        port_in  : in std_logic_vector (7 downto 0);
        port_out : out std_logic_vector (7 downto 0)
        
);

end component; 
    
begin

s00 <= mix_in(127 downto 120);      s01 <= mix_in(95 downto 88);   s02 <= mix_in(63 downto 56);      s03 <= mix_in(31 downto 24);    
s10 <= mix_in(119 downto 112);      s11 <= mix_in(87 downto 80);   s12 <= mix_in(55 downto 48);      s13 <= mix_in(23 downto 16);
s20 <= mix_in(111 downto 104);      s21 <= mix_in(79 downto 72);   s22 <= mix_in(47 downto 40);      s23 <= mix_in(15 downto 8);
s30 <= mix_in(103 downto 96);       s31 <= mix_in(71 downto 64);   s32 <= mix_in(39 downto 32);      s33 <= mix_in(7  downto 0);

--gf2mult

gfmult2_inst_00 : gf2
port map
(
    port_in  => s00,
    port_out => s002
  
);

gfmult2_inst_01 : gf2
port map
(
    port_in  => s01,
    port_out => s012
    
);

gfmult2_inst_02 : gf2
port map
(
    port_in  => s02,
    port_out => s022
   
);

gfmult2_inst_03 : gf2
port map
(
    port_in  => s03,
    port_out => s032
   
);

gfmult2_inst_10 : gf2
port map
(
    port_in  => s10,
    port_out => s102
    
);

gfmult2_inst_11 : gf2
port map
(
    port_in  => s11,
    port_out => s112
    
);

gfmult2_inst_12 : gf2
port map
(
    port_in  => s12,
    port_out => s122
   
);

gfmult2_inst_13 : gf2
port map
(
    port_in  => s13,
    port_out => s132
    
);

gfmult2_inst_20 : gf2
port map
(
    port_in  => s20,
    port_out => s202
    
);

gfmult2_inst_21 : gf2
port map
(
    port_in  => s21,
    port_out => s212
);

gfmult2_inst_22 : gf2
port map
(
    port_in  => s22,
    port_out => s222
);

gfmult2_inst_23 : gf2
port map
(
    port_in  => s23,
    port_out => s232
);

gfmult2_inst_30 : gf2
port map
(
    port_in  => s30,
    port_out => s302
);

gfmult2_inst_31 : gf2
port map
(
    port_in  => s31,
    port_out => s312
);

gfmult2_inst_32 : gf2
port map
(
    port_in  => s32,
    port_out => s322
);

gfmult2_inst_33 : gf2
port map
(
    port_in  => s33,
    port_out => s332
);


--gf3mult

gf3_inst_00 : gf3
port map
(
    port_in  => s00,
    port_out => s003
);

gf3_inst_01 : gf3
port map
(
    port_in  => s01,
    port_out => s013
);

gf3_inst_02 : gf3
port map
(
    port_in  => s02,
    port_out => s023
);

gf3_inst_03 : gf3
port map
(
    port_in  => s03,
    port_out => s033
);

gf3_inst_10 : gf3
port map
(
    port_in  => s10,
    port_out => s103
);

gf3_inst_11 : gf3
port map
(
    port_in  => s11,
    port_out => s113
);

gf3_inst_12 : gf3
port map
(
    port_in  => s12,
    port_out => s123
);

gf3_inst_13 : gf3
port map
(
    port_in  => s13,
    port_out => s133
);

gf3_inst_20 : gf3
port map
(
    port_in  => s20,
    port_out => s203
);

gf3_inst_21 : gf3
port map
(
    port_in  => s21,
    port_out => s213
);

gf3_inst_22 : gf3
port map
(
    port_in  => s22,
    port_out => s223
);

gf3_inst_23 : gf3
port map
(
    port_in  => s23,
    port_out => s233
);

gf3_inst_30 : gf3
port map
(
    port_in  => s30,
    port_out => s303
);

gf3_inst_31 : gf3
port map
(
    port_in  => s31,
    port_out => s313
);

gf3_inst_32 : gf3
port map
(
    port_in  => s32,
    port_out => s323
);

gf3_inst_33 : gf3
port map
(
    port_in  => s33,
    port_out => s333
);

s004 <= s002 xor s103 xor s20 xor s30;
s104 <= s00 xor s102 xor s203 xor s30;
s204 <= s00 xor s10 xor s202 xor s303;
s304 <= s003 xor s10 xor s20 xor s302;
                                     
s014 <= s012 xor s113 xor s21 xor s31;
s114 <= s01 xor s112 xor s213 xor s31;
s214 <= s01 xor s11 xor s212 xor s313;
s314 <= s013 xor s11 xor s21 xor s312;
                                     
s024 <= s022 xor s123 xor s22 xor s32;
s124 <= s02 xor s122 xor s223 xor s32;
s224 <= s02 xor s12 xor s222 xor s323;
s324 <= s023 xor s12 xor s22 xor s322;
                                     
s034 <= s032 xor s133 xor s23 xor s33;
s134 <= s03 xor s132 xor s233 xor s33;
s234 <= s03 xor s13 xor s232 xor s333;
s334 <= s033 xor s13 xor s23 xor s332;


mix_out <= s004 & s104 & s204 & s304 & s014 & s114 & s214 & s314 & s024 & s124 & s224 & s324 & s034 & s134 & s234 & s334;

end Behavioral;
