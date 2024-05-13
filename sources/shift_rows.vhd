----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2024 16:12:48
-- Design Name: 
-- Module Name: shift_rows - Behavioral
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

entity shift_rows is
port(
        shift_in    : in std_logic_vector (127 downto 0);
        shift_out   : out std_logic_vector (127 downto 0)
);

end shift_rows;

architecture Behavioral of shift_rows is

signal p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15 : std_logic_vector (7 downto 0);

begin

 p0  <=shift_in(127 downto 120);
 p1  <=shift_in(119 downto 112);
 p2  <=shift_in(111 downto 104);
 p3  <=shift_in(103 downto 96);
 p4  <=shift_in(95 downto 88);
 p5  <=shift_in(87 downto 80);
 p6  <=shift_in(79 downto 72);
 p7  <=shift_in(71 downto 64);
 p8  <=shift_in(63 downto 56);
 p9  <=shift_in(55 downto 48);
 p10 <=shift_in(47 downto 40);
 p11 <=shift_in(39 downto 32);	
 p12 <=shift_in(31 downto 24);	
 p13 <=shift_in(23 downto 16);	
 p14 <=shift_in(15 downto 8);	
 p15 <=shift_in(7 downto 0);	 
 	 	

shift_out <=p0&p5&p10&p15&p4&p9&p14&p3&p8&p13&p2&p7&p12&p1&p6&p11;	

end Behavioral;
