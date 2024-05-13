----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2024 09:43:07
-- Design Name: 
-- Module Name: sub_shift - Behavioral
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
    
entity sub_shift is
    port(
            sub_in      : in std_logic_vector (127 downto 0);
            sub_out     : out std_logic_vector (127 downto 0)               
        );
end sub_shift;

architecture behavioral of sub_shift is

component s_box is
port(
    sbox_in     : in std_logic_vector (7 downto 0);
    sbox_out    : out std_logic_vector (7 downto 0)
);

end component;

begin

s1  : s_box port map (sbox_in => sub_in(127 downto 120),sbox_out =>sub_out(127 downto 120)); 
s2  : s_box port map (sbox_in => sub_in(119 downto 112),sbox_out =>sub_out(119 downto 112)); 
s3  : s_box port map (sbox_in => sub_in(111 downto 104),sbox_out =>sub_out(111 downto 104)); 
s4  : s_box port map (sbox_in => sub_in(103 downto 96),sbox_out =>sub_out (103 downto 96)); 
s5  : s_box port map (sbox_in => sub_in(95 downto 88),sbox_out =>sub_out (95 downto 88)); 
s6  : s_box port map (sbox_in => sub_in(87 downto 80),sbox_out =>sub_out (87 downto 80)); 
s7  : s_box port map (sbox_in => sub_in(79 downto 72),sbox_out =>sub_out (79 downto 72)); 
s8  : s_box port map (sbox_in => sub_in(71 downto 64),sbox_out =>sub_out (71 downto 64)); 
s9  : s_box port map (sbox_in => sub_in(63 downto 56),sbox_out =>sub_out (63 downto 56)); 
s10 : s_box port map (sbox_in => sub_in(55 downto 48),sbox_out =>sub_out (55 downto 48)); 
s11 : s_box port map (sbox_in => sub_in(47 downto 40),sbox_out =>sub_out (47 downto 40)); 
s12 : s_box port map (sbox_in => sub_in(39 downto 32),sbox_out =>sub_out (39 downto 32)); 
s13 : s_box port map (sbox_in => sub_in(31 downto 24),sbox_out =>sub_out (31 downto 24)); 
s14 : s_box port map (sbox_in => sub_in(23 downto 16),sbox_out =>sub_out (23 downto 16)); 
s15 : s_box port map (sbox_in => sub_in(15 downto 8),sbox_out =>sub_out (15 downto 8)); 
s16 : s_box port map (sbox_in => sub_in(7 downto 0),sbox_out =>sub_out   (7 downto 0)); 

end behavioral;
