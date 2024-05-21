----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2024 15:35:44
-- Design Name: 
-- Module Name: AES_256 - Behavioral
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

entity AES_256 is

        
port (
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
end AES_256;

architecture behavioral of AES_256 is

signal subbytes_out     : std_logic_vector (127 downto 0);
signal addr_out         : std_logic_vector (127 downto 0);
signal shiftrows_out    : std_logic_vector (127 downto 0);
signal for_key_exp_sel_s: std_logic;
signal data_1_s         : std_logic_vector (127 downto 0);
signal for_mux_sel_o_s  : std_logic_vector (1 downto 0);
signal reg_enable       : std_logic;
signal key_ready_o_s    : std_logic; 
signal key_exp_enable_s : std_logic;
signal final_reg_enable : std_logic;
signal plaintext_ready_o_s : std_logic;
signal mix_finish_out   : std_logic_vector (127 downto 0);
signal register_reg, register_next : std_logic_vector (127 downto 0);
signal final_reg, final_next       : std_logic_vector (127 downto 0);
signal cipher_text_vld_o_s         : std_logic;



component add_round_key is
port(
       data_2       : in std_logic_vector (127 downto 0);
       data_1       : in std_logic_vector (127 downto 0);
       data_out     : out std_logic_vector (127 downto 0)   
    );    
end component;

component sub_shift is
port(
       sub_in      : in std_logic_vector (127 downto 0);
       sub_out     : out std_logic_vector (127 downto 0)  
);
end component;

component shift_rows is
port (
         shift_in    : in std_logic_vector (127 downto 0);
         shift_out   : out std_logic_vector (127 downto 0)
);
end component;

component mix_columns is
port(
        mix_in  : in std_logic_vector (127 downto 0);
        mix_out : out std_logic_vector (127 downto 0)       
    );
end component;
    
component key_expansion is
port (
        key_i             : in std_logic_vector (127 downto 0);
        key_vld_i         : in std_logic;
        clk_i             : in std_logic;
        rst_i             : in std_logic;
        key_ready_ke_o    : in std_logic;
        key_exp_enable_i  : in std_logic;
        for_key_exp_sel_i : in std_logic;
        key_exp_o         : out std_logic_vector (127 downto 0)
);
end component;

component control_256 is
port(
        key_vld_i           : in std_logic;
        plaintext_vld_i     : in std_logic;
        cipher_text_ready_i : in std_logic;
        clk_i               : in std_logic;
        rst_i               : in std_logic;
        for_key_exp_sel_o   : out std_logic;
        for_mux_sel_o       : out std_logic_vector (1 downto 0);
        plaintext_ready_o   : out std_logic;
        key_ready_c_o       : out std_logic;
        cipher_text_vld_o   : out std_logic;
        key_exp_enable_o    : out std_logic;
        final_reg_enable    : out std_logic;
        reg_enable_o        : out std_logic
);
end component;

begin

add_ins : add_round_key 
port map (
           data_1     => data_1_s,
           data_2     => register_reg,
           data_out   => addr_out
);

sub: sub_shift
port map (
            sub_in  => addr_out,
            sub_out => subbytes_out
          );
                
shift: shift_rows
port map(
            shift_in  => subbytes_out,
            shift_out => shiftrows_out
        );            
            
mix: mix_columns
port map (
           mix_in  => shiftrows_out,
           mix_out => mix_finish_out
          
        );
        
 key: key_expansion
 port map (
            key_i             => key_i,
            key_vld_i         => key_vld_i,
            clk_i             => clk_i,
            rst_i             => rst_i,
            key_ready_ke_o    => key_ready_o_s,
            key_exp_enable_i  => key_exp_enable_s,
            for_key_exp_sel_i => for_key_exp_sel_s,              
            key_exp_o         => data_1_s 
 ); 
 
 control: control_256
 port map (
             key_vld_i           => key_vld_i,
             plaintext_vld_i     => plaintext_vld_i,
             cipher_text_ready_i => cipher_text_ready_i,
             clk_i               => clk_i,
             rst_i               => rst_i,
             for_key_exp_sel_o   => for_key_exp_sel_s,
             for_mux_sel_o       => for_mux_sel_o_s,
             plaintext_ready_o   => plaintext_ready_o_s,
             key_ready_c_o       => key_ready_o_s,             
             cipher_text_vld_o   => cipher_text_vld_o_s,
             key_exp_enable_o    => key_exp_enable_s,
             final_reg_enable    => final_reg_enable,
             reg_enable_o        => reg_enable 
 );  
 
 key_ready_o <= key_ready_o_s;
 
seq: process(clk_i)
begin
    if rising_edge(clk_i) then
    register_reg <= register_next;
    final_reg <= final_next;
    end if;
end process seq;  


register_next <= (others => '0') when rst_i = '1' else 
                  plaintext_i when for_mux_sel_o_s = "00" and plaintext_vld_i = '1' and plaintext_ready_o_s = '1' else                                    
                  mix_finish_out when for_mux_sel_o_s = "01" else
                  shiftrows_out when for_mux_sel_o_s = "10" and for_mux_sel_o_s /= "01" else
                  register_reg; 
                  

final_next <= (others => '0') when rst_i = '1' else
            addr_out when final_reg_enable = '1' else
            final_reg;
          
cipher_text_vld_o <= cipher_text_vld_o_s ;  
plaintext_ready_o <= plaintext_ready_o_s;
            
cipher_text_o <= final_reg when cipher_text_ready_i = '1' and cipher_text_vld_o_s = '1' ;
end behavioral;
