-- Martin GRD 27 nov. 2018
-- Inverse SubByte for AES implementation

--Include Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library AESLibrary;
use AESLibrary.state_definition_package.all;

library lib_sources;


--Declare InvSubByte identity
entity invsubbyte is 
	port( data_i : in type_state; 
				data_o : out type_state );
end invsubbyte;

--Architecture description
architecture invsubbyte_arch of invsubbyte is
	component sbox
		port (sbox_i : in bit8 ; sbox_o : out bit8);
	end component;

begin
	--ce n'est pas très propre : améliorer avec 2 générate for 0 to 3
	sbox_1 : sbox
	port map (sbox_i => data_i(0)(0) , sbox_o => data_o(0)(0));

	sbox_2 : sbox
	port map (sbox_i => data_i(0)(1) , sbox_o => data_o(0)(1));

	sbox_3 : sbox
	port map (sbox_i => data_i(0)(2) , sbox_o => data_o(0)(2));

	sbox_4 : sbox
	port map (sbox_i => data_i(0)(3) , sbox_o => data_o(0)(3));

	sbox_5 : sbox
	port map (sbox_i => data_i(1)(0) , sbox_o => data_o(1)(0));

	sbox_6 : sbox
	port map (sbox_i => data_i(1)(1) , sbox_o => data_o(1)(1));

	sbox_7 : sbox
	port map (sbox_i => data_i(1)(2) , sbox_o => data_o(1)(2));

	sbox_8 : sbox
	port map (sbox_i => data_i(1)(3) , sbox_o => data_o(1)(3));

	sbox_9 : sbox
	port map (sbox_i => data_i(2)(0) , sbox_o => data_o(2)(0));

	sbox_10 : sbox
	port map (sbox_i => data_i(2)(1) , sbox_o => data_o(2)(1));

	sbox_11 : sbox
	port map (sbox_i => data_i(2)(2) , sbox_o => data_o(2)(2));

	sbox_12 : sbox
	port map (sbox_i => data_i(2)(3) , sbox_o => data_o(2)(3));

	sbox_13 : sbox
	port map (sbox_i => data_i(3)(0) , sbox_o => data_o(3)(0));

	sbox_14 : sbox
	port map (sbox_i => data_i(3)(1) , sbox_o => data_o(3)(1));

	sbox_15 : sbox
	port map (sbox_i => data_i(3)(2) , sbox_o => data_o(3)(2));

	sbox_16 : sbox
	port map (sbox_i => data_i(3)(3) , sbox_o => data_o(3)(3));
	
end invsubbyte_arch;
	

--Configuration of architecture
configuration invsubbyte_conf of invsubbyte is
	for invsubbyte_arch
		for all : sbox 
			use entity lib_sources . sbox ( sbox_arch );
		end for;
	end for;
end invsubbyte_conf;


