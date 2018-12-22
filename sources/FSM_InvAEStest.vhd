-- Martin GRD 27nov. 2018
-- FSM Moore inverse AES

--Include Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library AESLibrary;
use AESLibrary.state_definition_package.all;


--Declare entity
entity FSM_invAES is 
	port ( 	resetb_i : in std_logic;
		start_i : in std_logic;
		clock_i : in std_logic;
		round_i : in bit4;
		resetb_counter_o : out std_logic;
		enable_counter_o : out std_logic;
		enable_mixcolumn_o : out std_logic;
		get_ciphertext_o : out std_logic;
		enable_output_o : out std_logic;
		aes_on_o : out std_logic ) ;
end FSM_invAES;


--Description of architecture
architecture FSM_invAES_arch of FSM_invAES is
	type state is (etat1, etat2, etat3, etat4);
	signal etat_present : state;
	signal etat_futur : state;

begin --Moore Arch
	seq_0 : process (clock_i, resetb_i)
	begin -- process seq_0
		if resetb_i = '0' then
			etat_present <= etat1 ;
			resetb_counter_o <= '1';
			enable_counter_o <= '0';
			enable_mixcolumn_o <= '0';
			get_ciphertext_o <= '0';
			enable_output_o <= '0';
			aes_on_o <= '0';
		elsif clock_i'event and clock_i = '1' then
			etat_present <= etat_futur ;
		end if;
	end process seq_0 ;

	comb_0 : process (etat_present, start_i, round_i)
	begin --process comb0
	case etat_present is
		when etat1 =>
			if start_i = '1' then
				etat_futur <= etat2 ;
				resetb_counter_o <= '0';
				enable_counter_o <= '1';
				enable_mixcolumn_o <= '1';
				get_ciphertext_o <= '1';
				enable_output_o <= '0';
				aes_on_o <= '1';
			else
				etat_futur <= etat1 ;
			end if;
		when etat2 =>
			if round_i = std_logic_vector(to_unsigned(9,4)) then
				etat_futur <= etat3;
				enable_mixcolumn_o <= '0';
			else
				etat_futur <= etat2;
				get_ciphertext_o <= '0';
			end if;
		when etat3 =>
			etat_futur<= etat4;
		when etat4 =>
			etat_futur <= etat1;
			enable_output_o <= '1';
	end case;
	end process comb_0;
	
end FSM_invAES_arch;

