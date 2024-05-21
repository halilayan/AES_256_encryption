----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.04.2024 12:43:41
-- Design Name: 
-- Module Name: control_256 - Behavioral
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

entity control_256 is
port(
        key_vld_i           : in std_logic;
        plaintext_vld_i     : in std_logic := '0';
        cipher_text_ready_i : in std_logic;
        clk_i               : in std_logic;
        rst_i               : in std_logic;
        for_key_exp_sel_o   : out std_logic;
        for_mux_sel_o       : out std_logic_vector (1 downto 0);
        plaintext_ready_o   : out std_logic := '0';
        key_ready_c_o       : out std_logic;
        cipher_text_vld_o   : out std_logic;
        key_exp_enable_o    : out std_logic;
        reg_enable_o        : out std_logic;
        final_reg_enable    : out std_logic := '0' 
        
    );
end control_256;

architecture Behavioral of control_256 is


type state_type is
        (plaintext_wait, key_wait_1, key_wait_2, first_round, middle_round, final_round, done  ); --, done
signal control_reg_state, control_next_state : state_type ; 
signal round_reg, round_next : unsigned (3 downto 0) := "0000";

begin

control_256_fsm: process (clk_i)
begin
    if rising_edge(clk_i) then 
        control_reg_state <= control_next_state;        
    end if;       
end process;

round: process (clk_i)
begin
    if rising_edge (clk_i) then
    round_reg <= round_next;
    end if;

end process round;

-- 
com_atamalar: process(all)
begin

    case control_reg_state is
        
        when plaintext_wait =>
            if plaintext_vld_i = '1' then
					   	   control_next_state <= key_wait_1 ;
					   else control_next_state <= plaintext_wait;
					   end if;
					   
        when key_wait_1 =>
             if key_vld_i = '1' then
						  control_next_state <= key_wait_2 ;
				       else control_next_state <= key_wait_1;
					   end if;
          
        when key_wait_2 =>
            if key_vld_i = '1' then
				            control_next_state <= first_round;
				        else control_next_state <= key_wait_2;
				        end if;
				        
        when first_round =>
            control_next_state <= middle_round;
            
        when middle_round => 
            if round_next = "1111" then
				            control_next_state <= final_round;
				        else
				                control_next_state <= middle_round;                              
				    	end if;
				    	
				    	
--		when final_round =>
--                if cipher_text_ready_i = '1' then
--                    control_next_state <= plaintext_wait;
--                 else
--                    control_next_state <= final_round;
--                end if;
	    	
				    	
        when final_round => 
			control_next_state <= done;
				        	
		when done => 
		if cipher_text_ready_i = '1' then
			            control_next_state <= plaintext_wait;
				        else
				        control_next_state <= done;
				        end if;
    end case;    
end process com_atamalar;


com_islemler: process(all)
		begin
		plaintext_ready_o <= '0';
		key_ready_c_o <= '0';
		key_exp_enable_o <= '0';
		for_key_exp_sel_o <= '0';
		final_reg_enable <= '0';
		cipher_text_vld_o <= '0';
		reg_enable_o <= '1';
		
			case control_reg_state is
				when plaintext_wait =>
					plaintext_ready_o <= '1';
					for_mux_sel_o <= "00";
					reg_enable_o <= '1';
					round_next <= (others => '0');
					   					
				when key_wait_1 =>
					key_ready_c_o <= '1';
					
					  				
				when key_wait_2 =>
				    key_ready_c_o <= '1';

				    				        				        
				 when first_round => 
				    for_mux_sel_o <= "00" ;
				    reg_enable_o <= '1';
				    round_next <= round_reg + 1;
 				    key_exp_enable_o <= '1';
				   
				    
				 when middle_round =>
				    key_exp_enable_o <= '1';
				    round_next <= round_reg + 1;
				        if round_next = "1111" then
				            for_mux_sel_o <= "10"; 
				         else  for_mux_sel_o <= "01";
				         end if;       
				        if round_next (0) = '1' then
				            for_key_exp_sel_o <= '1';   
				        end if;   
				            
        				    	
				  when final_round =>
				    for_mux_sel_o <= "10";
				    for_key_exp_sel_o <= '0';
				    key_exp_enable_o <= '1';
				    final_reg_enable <= '1';
				    
--				    cipher_text_vld_o <= '1';

				   when done => 
				                key_exp_enable_o <= '1';     
				                cipher_text_vld_o <= '1';
				            
				        
				    				            				            				                 		
    end case;
end process com_islemler;
         
end Behavioral;
