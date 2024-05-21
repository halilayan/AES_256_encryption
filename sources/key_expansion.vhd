----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2024 14:50:05
-- Design Name: 
-- Module Name: key_expansion - Behavioral
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




entity key_expansion is
 port(
        key_i             : in std_logic_vector (127 downto 0);
        key_vld_i         : in std_logic;
        clk_i             : in std_logic;
        rst_i             : in std_logic;
        key_ready_ke_o    : in std_logic := '0';
        key_exp_enable_i  : in std_logic;
        for_key_exp_sel_i : in std_logic;
        key_exp_o         : out std_logic_vector (127 downto 0)
    );
end key_expansion;

architecture Behavioral of key_expansion is

type vector_nr is array(0 to 8) of std_logic_vector(31 downto 0);
    constant rcon : vector_nr := (x"00000000" ,x"01000000",x"02000000",x"04000000",x"08000000",x"10000000",x"20000000",x"40000000",x"80000000"); 
    
    

component s_box is
port(
    sbox_in     : in std_logic_vector (7 downto 0);
    sbox_out    : out std_logic_vector (7 downto 0)
);
end component;

signal a1, a2, a3, a4, a5, a6, a7, a8               : std_logic_vector (31 downto 0);
signal wi0, wi1, wi2, wi3, wi4, wi5, wi6, wi7 , wi_a: std_logic_vector (31 downto 0);
signal wi0_0, wi0_1, wi0_2, wi0_3, wi_4             : std_logic_vector (7 downto 0);
signal a1_1, a1_2, a1_3, a1_4                       : std_logic_vector (7 downto 0);
signal key_reg, key_next                            : std_logic_vector (255 downto 0);
signal enc_out, enc_in                              : std_logic_vector (255 downto 0);
signal flag_reg, flag_next                          : std_logic;
signal round_counter_reg, round_counter_next        : unsigned (2 downto 0);


------------------------------------------------------------------------------
--Key_Exp_Sequential
-------------------------------------------------------------------------------  
begin

seq: process(clk_i)
begin
    if rising_edge(clk_i) then
        key_reg <= key_next;
        flag_reg <= flag_next;
        round_counter_reg <= round_counter_next;
    end if;        
end process;



flag_next <=    '0' when rst_i = '1' else 
                not (flag_reg) when key_vld_i = '1' and key_ready_ke_o = '1'  else
                flag_reg;
             
key_next (255 downto 128) <=  (others => '0') when rst_i = '1' else
                               key_i when key_vld_i = '1' and key_ready_ke_o = '1' and flag_reg = '0'  and key_exp_enable_i = '0' else
                               enc_out (255 downto 128) when for_key_exp_sel_i = '1' else
                               key_reg (255 downto 128);
                               
key_next (127 downto 0) <= (others => '0') when rst_i = '1' else
                            key_i when key_vld_i = '1' and key_ready_ke_o = '1' and flag_reg = '1'  and key_exp_enable_i = '0' else
                            enc_out (127 downto 0) when for_key_exp_sel_i = '1' else
                            key_reg (127 downto 0);  
                                                                                                                 
round_counter_next <= (others => '0') when rst_i = '1' or (key_vld_i = '1' and key_ready_ke_o = '1') else
                 ( round_counter_reg + 1) when key_exp_enable_i = '1' and  for_key_exp_sel_i = '1'  else
                  round_counter_reg; 
                      
key_exp_o <=    key_reg (255 downto 128) when for_key_exp_sel_i = '0' else
                key_reg (127 downto 0);                  


------------------------------------------------------------------------------
--Key_Exp_Combinational
-------------------------------------------------------------------------------             
enc_in <= key_reg;

k_1 : s_box port map (sbox_in => enc_in  (31 downto 24), sbox_out => wi0_0 );
k_2 : s_box port map (sbox_in => enc_in (23 downto 16), sbox_out => wi0_1 );
k_3 : s_box port map (sbox_in => enc_in (15 downto 8), sbox_out => wi0_2 );
k_4 : s_box port map (sbox_in => enc_in (7 downto 0), sbox_out => wi0_3 );


wi7 <= enc_in (255 downto 224);
wi6 <= enc_in (223 downto 192);
wi5 <= enc_in (191 downto 160);
wi4 <= enc_in (159 downto 128);
wi3 <= enc_in (127 downto 96);
wi2 <= enc_in (95 downto 64);
wi1 <= enc_in (63 downto 32);
wi0 <= enc_in (31 downto 0);

wi_a <= wi0_1  & wi0_2  & wi0_3 & wi0_0 ;


a1 <= wi7 xor wi_a xor rcon(to_integer(unsigned(round_counter_next)));
a2 <= wi6 xor a1;
a3 <= wi5 xor a2;
a4 <= wi4 xor a3;


k2_1 : s_box port map (sbox_in =>  a4 (31 downto 24), sbox_out => a1_1);
k2_2 : s_box port map (sbox_in =>  a4 (23 downto 16), sbox_out => a1_2);
k2_3 : s_box port map (sbox_in =>  a4 (15 downto 8), sbox_out => a1_3);
k2_4 : s_box port map (sbox_in =>  a4 (7 downto 0), sbox_out => a1_4);


a5 <= wi3 xor (a1_1 & a1_2 & a1_3 & a1_4);
a6 <= wi2 xor a5;
a7 <= wi1 xor a6;
a8 <= wi0 xor a7;

enc_out <= a1 & a2 & a3 & a4 & a5 & a6 & a7 & a8;



end Behavioral;
