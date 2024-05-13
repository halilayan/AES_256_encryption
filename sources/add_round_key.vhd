----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2024 17:49:21
-- Design Name: 
-- Module Name: add_round_key - Behavioral
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

entity add_round_key is
    port (
            data_1      : in std_logic_vector (127 downto 0);
            data_2      : in std_logic_vector (127 downto 0);
            data_out    : out std_logic_vector (127 downto 0)       
        );
end add_round_key;

architecture Behavioral of add_round_key is

begin

data_out <= data_1 xor data_2;

end behavioral;
