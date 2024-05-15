----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2024 12:33:05
-- Design Name: 
-- Module Name: tb_key_exp - Behavioral
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity tb_key_exp is
end tb_key_exp;

architecture Behavioral of tb_key_exp is

component key_expansion

 port(
        key_i       : in std_logic_vector (127 downto 0);
        key_vld_i   : in std_logic;
        clk_i         : in std_logic;
        rst_i         : in std_logic;
        key_exp_o   : out std_logic_vector (127 downto 0)
    );
end component;

signal      key_i       :  std_logic_vector (127 downto 0);
signal      key_vld_i   :  std_logic;
signal      clk         :  std_logic;
signal      rst         :  std_logic;
signal      key_exp_o   :  std_logic_vector (127 downto 0);

constant clk_i_period : time := 2 ns;

begin

uut: key_expansion port map
(
key_i      => key_i,    
key_vld_i  => key_vld_i, 
clk_i        => clk,       
rst_i        => rst,       
key_exp_o  => key_exp_o 
);

    clk_i_process : process
begin
    clk <= '0';
    wait for clk_i_period/2; 
    clk <= '1';
    wait for clk_i_period/2;
end process;    

 --Test
 process
 begin
 wait for clk_i_period;
 key_i  <= x"603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4";
 --key        <= x"000102030405060708090a0b0c0d0e0f";
		
 
wait for clk_i_period;
wait;
end process;

end Behavioral;
