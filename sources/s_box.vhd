----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2024 16:09:08
-- Design Name: 
-- Module Name: s_box - Behavioral
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

entity s_box is

port(
    sbox_in  : in std_logic_vector (7 downto 0);
    sbox_out : out std_logic_vector (7 downto 0)
    );

end s_box;


architecture Behavioral of s_box is
 
begin
 
	process(sbox_in)

	begin

		case sbox_in is

			when "00000000"=>sbox_out<=x"63";

			when "00000001"=>sbox_out<=x"7c";

			when "00000010"=>sbox_out<=x"77";

			when "00000011"=>sbox_out<=x"7b";

			when "00000100"=>sbox_out<=x"f2";

			when "00000101"=>sbox_out<=x"6b";

			when "00000110"=>sbox_out<=x"6f";

			when "00000111"=>sbox_out<=x"c5";

			when "00001000"=>sbox_out<=x"30";

			when "00001001"=>sbox_out<=x"01";

			when "00001010"=>sbox_out<=x"67";

			when "00001011"=>sbox_out<=x"2b";

			when "00001100"=>sbox_out<=x"fe";

			when "00001101"=>sbox_out<=x"d7";

			when "00001110"=>sbox_out<=x"ab";

			when "00001111"=>sbox_out<=x"76";

			when "00010000"=>sbox_out<=x"ca";

			when "00010001"=>sbox_out<=x"82";

			when "00010010"=>sbox_out<=x"c9";

			when "00010011"=>sbox_out<=x"7d";

			when "00010100"=>sbox_out<=x"fa";

			when "00010101"=>sbox_out<=x"59";

			when "00010110"=>sbox_out<=x"47";

			when "00010111"=>sbox_out<=x"f0";

			when "00011000"=>sbox_out<=x"ad";

			when "00011001"=>sbox_out<=x"d4";

			when "00011010"=>sbox_out<=x"a2";

			when "00011011"=>sbox_out<=x"af";

			when "00011100"=>sbox_out<=x"9c";

			when "00011101"=>sbox_out<=x"a4";

			when "00011110"=>sbox_out<=x"72";

			when "00011111"=>sbox_out<=x"c0";

			when "00100000"=>sbox_out<=x"b7";

			when "00100001"=>sbox_out<=x"fd";

			when "00100010"=>sbox_out<=x"93";

			when "00100011"=>sbox_out<=x"26";

			when "00100100"=>sbox_out<=x"36";

			when "00100101"=>sbox_out<=x"3f";

			when "00100110"=>sbox_out<=x"f7";

			when "00100111"=>sbox_out<=x"cc";

			when "00101000"=>sbox_out<=x"34";

			when "00101001"=>sbox_out<=x"a5";

			when "00101010"=>sbox_out<=x"e5";

			when "00101011"=>sbox_out<=x"f1";

			when "00101100"=>sbox_out<=x"71";

			when "00101101"=>sbox_out<=x"d8";

			when "00101110"=>sbox_out<=x"31";

			when "00101111"=>sbox_out<=x"15";

			when "00110000"=>sbox_out<=x"04";

			when "00110001"=>sbox_out<=x"c7";

			when "00110010"=>sbox_out<=x"23";

			when "00110011"=>sbox_out<=x"c3";

			when "00110100"=>sbox_out<=x"18";

			when "00110101"=>sbox_out<=x"96";				

			when "00110110"=>sbox_out<=x"05";

			when "00110111"=>sbox_out<=x"9a";

			when "00111000"=>sbox_out<=x"07";

			when "00111001"=>sbox_out<=x"12";

			when "00111010"=>sbox_out<=x"80";

			when "00111011"=>sbox_out<=x"e2";

			when "00111100"=>sbox_out<=x"eb";

			when "00111101"=>sbox_out<=x"27";

			when "00111110"=>sbox_out<=x"b2";

			when "00111111"=>sbox_out<=x"75";

			when "01000000"=>sbox_out<=x"09";

			when "01000001"=>sbox_out<=x"83";

			when "01000010"=>sbox_out<=x"2c";

			when "01000011"=>sbox_out<=x"1a";

			when "01000100"=>sbox_out<=x"1b";

			when "01000101"=>sbox_out<=x"6e";

			when "01000110"=>sbox_out<=x"5a";

            when "01000111"=>sbox_out<=x"a0";

			when "01001000"=>sbox_out<=x"52";

			when "01001001"=>sbox_out<=x"3b";

			when "01001010"=>sbox_out<=x"d6";

			when "01001011"=>sbox_out<=x"b3";

			when "01001100"=>sbox_out<=x"29";

			when "01001101"=>sbox_out<=x"e3";

			when "01001110"=>sbox_out<=x"2f";

		    when "01001111"=>sbox_out<=x"84";

			when "01010000"=>sbox_out<=x"53";

			when "01010001"=>sbox_out<=x"d1";

			when "01010010"=>sbox_out<=x"00";

			when "01010011"=>sbox_out<=x"ed";

			when "01010100"=>sbox_out<=x"20";

			when "01010101"=>sbox_out<=x"fc";

			when "01010110"=>sbox_out<=x"b1";

			when "01010111"=>sbox_out<=x"5b";

			when "01011000"=>sbox_out<=x"6a";

			when "01011001"=>sbox_out<=x"cb";

			when "01011010"=>sbox_out<=x"be";

			when "01011011"=>sbox_out<=x"39";

			when "01011100"=>sbox_out<=x"4a";

			when "01011101"=>sbox_out<=x"4c";

			when "01011110"=>sbox_out<=x"58";

			when "01011111"=>sbox_out<=x"cf";

			when "01100000"=>sbox_out<=x"d0";

			when "01100001"=>sbox_out<=x"ef";

			when "01100010"=>sbox_out<=x"aa";

			when "01100011"=>sbox_out<=x"fb";

			when "01100100"=>sbox_out<=x"43";

			when "01100101"=>sbox_out<=x"4d";

			when "01100110"=>sbox_out<=x"33";

			when "01100111"=>sbox_out<=x"85";

			when "01101000"=>sbox_out<=x"45";

			when "01101001"=>sbox_out<=x"f9";

		    when "01101010"=>sbox_out<=x"02";

			when "01101011"=>sbox_out<=x"7f";

			when "01101100"=>sbox_out<=x"50";

			when "01101101"=>sbox_out<=x"3c";

			when "01101110"=>sbox_out<=x"9f";

			when "01101111"=>sbox_out<=x"a8";

			when "01110000"=>sbox_out<=x"51";

			when "01110001"=>sbox_out<=x"a3";

			when "01110010"=>sbox_out<=x"40";

			when "01110011"=>sbox_out<=x"8f";

			when "01110100"=>sbox_out<=x"92";

			when "01110101"=>sbox_out<=x"9d";

			when "01110110"=>sbox_out<=x"38";

		    when "01110111"=>sbox_out<=x"f5";

			when "01111000"=>sbox_out<=x"bc";

			when "01111001"=>sbox_out<=x"b6";

			when "01111010"=>sbox_out<=x"da";

			when "01111011"=>sbox_out<=x"21";

			when "01111100"=>sbox_out<=x"10";

			when "01111101"=>sbox_out<=x"ff";

			when "01111110"=>sbox_out<=x"f3";

			when "01111111"=>sbox_out<=x"d2";

			when "10000000"=>sbox_out<=x"cd";

			when "10000001"=>sbox_out<=x"0c";

			when "10000010"=>sbox_out<=x"13";

			when "10000011"=>sbox_out<=x"ec";

			when "10000100"=>sbox_out<=x"5f";

			when "10000101"=>sbox_out<=x"97";

			when "10000110"=>sbox_out<=x"44";

			when "10000111"=>sbox_out<=x"17";

			when "10001000"=>sbox_out<=x"c4";

			when "10001001"=>sbox_out<=x"a7";

			when "10001010"=>sbox_out<=x"7e";

			when "10001011"=>sbox_out<=x"3d";

			when "10001100"=>sbox_out<=x"64";

			when "10001101"=>sbox_out<=x"5d";

			when "10001110"=>sbox_out<=x"19";

			when "10001111"=>sbox_out<=x"73";

			when "10010000"=>sbox_out<=x"60";

			when "10010001"=>sbox_out<=x"81";

			when "10010010"=>sbox_out<=x"4f";

			when "10010011"=>sbox_out<=x"dc";

			when "10010100"=>sbox_out<=x"22";

			when "10010101"=>sbox_out<=x"2a";

			when "10010110"=>sbox_out<=x"90";

			when "10010111"=>sbox_out<=x"88";

			when "10011000"=>sbox_out<=x"46";

			when "10011001"=>sbox_out<=x"ee";

			when "10011010"=>sbox_out<=x"b8";

			when "10011011"=>sbox_out<=x"14";

			when "10011100"=>sbox_out<=x"de";

			when "10011101"=>sbox_out<=x"5e";

			when "10011110"=>sbox_out<=x"0b";

			when "10011111"=>sbox_out<=x"db";

			when "10100000"=>sbox_out<=x"e0";

			when "10100001"=>sbox_out<=x"32";

			when "10100010"=>sbox_out<=x"3a";

			when "10100011"=>sbox_out<=x"0a";

			when "10100100"=>sbox_out<=x"49";

			when "10100101"=>sbox_out<=x"06";

			when "10100110"=>sbox_out<=x"24";

			when "10100111"=>sbox_out<=x"5c";

			when "10101000"=>sbox_out<=x"c2";

			when "10101001"=>sbox_out<=x"d3";

			when "10101010"=>sbox_out<=x"ac";

			when "10101011"=>sbox_out<=x"62";

			when "10101100"=>sbox_out<=x"91";

			when "10101101"=>sbox_out<=x"95";

			when "10101110"=>sbox_out<=x"e4";

			when "10101111"=>sbox_out<=x"79";

			when "10110000"=>sbox_out<=x"e7";

			when "10110001"=>sbox_out<=x"c8";

			when "10110010"=>sbox_out<=x"37";

			when "10110011"=>sbox_out<=x"6d";

			when "10110100"=>sbox_out<=x"8d";

			when "10110101"=>sbox_out<=x"d5";

			when "10110110"=>sbox_out<=x"4e";

			when "10110111"=>sbox_out<=x"a9";

			when "10111000"=>sbox_out<=x"6c";

			when "10111001"=>sbox_out<=x"56";

			when "10111010"=>sbox_out<=x"f4";

			when "10111011"=>sbox_out<=x"ea";

			when "10111100"=>sbox_out<=x"65";

			when "10111101"=>sbox_out<=x"7a";

			when "10111110"=>sbox_out<=x"ae";

			when "10111111"=>sbox_out<=x"08";

			when "11000000"=>sbox_out<=x"ba";

			when "11000001"=>sbox_out<=x"78";

			when "11000010"=>sbox_out<=x"25";

			when "11000011"=>sbox_out<=x"2e";

			when "11000100"=>sbox_out<=x"1c";

			when "11000101"=>sbox_out<=x"a6";

			when "11000110"=>sbox_out<=x"b4";

			when "11000111"=>sbox_out<=x"c6";

			when "11001000"=>sbox_out<=x"e8";

			when "11001001"=>sbox_out<=x"dd";

			when "11001010"=>sbox_out<=x"74";

			when "11001011"=>sbox_out<=x"1f";

			when "11001100"=>sbox_out<=x"4b";

			when "11001101"=>sbox_out<=x"bd";

			when "11001110"=>sbox_out<=x"8b";

			when "11001111"=>sbox_out<=x"8a";

			when "11010000"=>sbox_out<=x"70";

			when "11010001"=>sbox_out<=x"3e";

			when "11010010"=>sbox_out<=x"b5";

			when "11010011"=>sbox_out<=x"66";

			when "11010100"=>sbox_out<=x"48";

			when "11010101"=>sbox_out<=x"03";

			when "11010110"=>sbox_out<=x"f6";

		    when "11010111"=>sbox_out<=x"0e";

			when "11011000"=>sbox_out<=x"61";

			when "11011001"=>sbox_out<=x"35";

			when "11011010"=>sbox_out<=x"57";

			when "11011011"=>sbox_out<=x"b9";

			when "11011100"=>sbox_out<=x"86";

			when "11011101"=>sbox_out<=x"c1";

			when "11011110"=>sbox_out<=x"1d";

			when "11011111"=>sbox_out<=x"9e";

			when "11100000"=>sbox_out<=x"e1";

			when "11100001"=>sbox_out<=x"f8";

			when "11100010"=>sbox_out<=x"98";

			when "11100011"=>sbox_out<=x"11";

			when "11100100"=>sbox_out<=x"69";

			when "11100101"=>sbox_out<=x"d9";

			when "11100110"=>sbox_out<=x"8e";

			when "11100111"=>sbox_out<=x"94";

			when "11101000"=>sbox_out<=x"9b";

			when "11101001"=>sbox_out<=x"1e";

			when "11101010"=>sbox_out<=x"87";

			when "11101011"=>sbox_out<=x"e9";

			when "11101100"=>sbox_out<=x"ce";

			when "11101101"=>sbox_out<=x"55";

			when "11101110"=>sbox_out<=x"28";

			when "11101111"=>sbox_out<=x"df";

			when "11110000"=>sbox_out<=x"8c";

			when "11110001"=>sbox_out<=x"a1";

			when "11110010"=>sbox_out<=x"89";

			when "11110011"=>sbox_out<=x"0d";

			when "11110100"=>sbox_out<=x"bf";

			when "11110101"=>sbox_out<=x"e6";

			when "11110110"=>sbox_out<=x"42";

			when "11110111"=>sbox_out<=x"68";

			when "11111000"=>sbox_out<=x"41";

			when "11111001"=>sbox_out<=x"99";

			when "11111010"=>sbox_out<=x"2d";

			when "11111011"=>sbox_out<=x"0f";

			when "11111100"=>sbox_out<=x"b0";

			when "11111101"=>sbox_out<=x"54";

			when "11111110"=>sbox_out<=x"bb";

			when "11111111"=>sbox_out<=x"16";

			when others=> sbox_out <= x"00";

		end case;

	end process;
 
end Behavioral;
