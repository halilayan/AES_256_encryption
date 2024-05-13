----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2024 17:11:14
-- Design Name: 
-- Module Name: gf2 - Behavioral
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


entity gf2 is

port(
        port_in  : in std_logic_vector (7 downto 0);
        port_out : out std_logic_vector (7 downto 0)
);

end gf2;

architecture Behavioral of gf2 is

begin
    process(port_in)
    begin
        if (port_in(7) = '1') then
            port_out <= port_in (6 downto 0) & '0' xor "00011011";
        else
            port_out <= port_in (6 downto 0) & '0';
        end if;
     end process;       
end Behavioral;
