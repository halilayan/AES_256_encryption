----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2024 18:18:20
-- Design Name: 
-- Module Name: tb_aes_256 - Behavioral
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


entity tb_aes_256 is
end tb_aes_256;


architecture Behavioral of tb_aes_256 is

component AES_256

port(
         plaintext_i         : in std_logic_vector (127 downto 0);
         key_i               : in std_logic_vector (127 downto 0);
         cipher_text_o       : out std_logic_vector (127 downto 0);
         key_vld_i           : in std_logic;
         key_ready_o         : out std_logic;
         plaintext_vld_i     : in std_logic;
         plaintext_ready_o   : out std_logic;
         cipher_text_ready_i : in std_logic;
         cipher_text_vld_o   : out std_logic;
         clk_i               : in std_logic;
         rst_i               : in std_logic
);
end component;

signal plaintext_i            : std_logic_vector (127 downto 0);
signal key_i                  : std_logic_vector (127 downto 0);
signal cipher_text_o          : std_logic_vector (127 downto 0);
signal key_vld_i              : std_logic := '0' ;
signal key_ready_o            : std_logic := '0' ;
signal plaintext_vld_i        : std_logic := '0' ;
signal plaintext_ready_o      : std_logic := '0' ;
signal cipher_text_ready_i    : std_logic := '0' ;
signal cipher_text_vld_o      : std_logic := '0' ;
signal clk_i                  : std_logic := '0' ;
signal rst_i                  : std_logic := '0' ;


constant clk_i_period : time := 10 ns;

begin

uut : AES_256 port map 
(
    plaintext_i         => plaintext_i,
    key_i               => key_i,
    cipher_text_o       => cipher_text_o,
    key_vld_i           => key_vld_i,
    key_ready_o         => key_ready_o,
    plaintext_vld_i     => plaintext_vld_i,
    plaintext_ready_o   => plaintext_ready_o,
    cipher_text_ready_i => cipher_text_ready_i,
    cipher_text_vld_o   => cipher_text_vld_o,    
    clk_i               => clk_i,    
    rst_i               => rst_i    
);

clk_i_process : process
begin
    clk_i <= '1';
    wait for clk_i_period/2; 
    clk_i <= '0';
    wait for clk_i_period/2;
end process;    

 --Test
 process
 begin
 
 rst_i <= '1';
		wait for clk_i_period * 2 ;
		rst_i <= '0';
 
 
 
 plaintext_vld_i <= '1';
 plaintext_i  <= x"00112233445566778899aabbccddeeff";
 wait for clk_i_period;
 plaintext_vld_i <= '0';
 plaintext_i <= (others => '0');
 
 
 wait for clk_i_period;
 key_vld_i <= '1';
 key_i        <= x"000102030405060708090a0b0c0d0e0f";
 wait for clk_i_period;
 key_vld_i <= '1';
 key_i         <= x"101112131415161718191a1b1c1d1e1f";
 wait for clk_i_period;
 key_vld_i <= '0';
 key_i <= (others => '0');

 
 wait for clk_i_period * 15;
 cipher_text_vld_o <= '1'; 
 cipher_text_ready_i <= '1';
 wait for clk_i_period;
 
 ---------------------------------------------------------------------------------
 --2.kez
 ---------------------------------------------------------------------------------
  plaintext_vld_i <= '1';
 plaintext_i  <= x"00000000000000000000000000000000";
 wait for clk_i_period;
 plaintext_vld_i <= '0';
 plaintext_i <= (others => '0');
 
 
 wait for clk_i_period;
 key_vld_i <= '1';
 key_i        <= x"c0000000000000000000000000000000";
 wait for clk_i_period;
 key_vld_i <= '1';
 key_i         <= x"00000000000000000000000000000000";
 wait for clk_i_period;
 key_vld_i <= '0';
 key_i <= (others => '0');

 
 wait for clk_i_period * 15;
 cipher_text_vld_o <= '1'; 
 cipher_text_ready_i <= '1';
 wait for clk_i_period;

 wait;
 end process;
 

    
end Behavioral;
