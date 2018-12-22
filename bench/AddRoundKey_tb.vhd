--Martin GRD 7dec. 2018
-- test bench add round key 

--Include Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library AESLibrary;
use AESLibrary.state_definition_package.all;

library lib_sources;


--Declaration of entity
entity addroundkey_tb is
end addroundkey_tb;

--Description of architecture
architecture addroundkey_tb_arch of addroundkey_tb is
	component addroundkey
		port (	data_in : in type_state ;  
						data_out : out type_state ;
						key_in : in bit128 );
	end component;

	signal data_in_s : type_state;
	signal data_out_s : type_state;
	signal key_in_s : bit128;

begin
	DUT : addroundkey
	port map(data_in => data_in_s , data_out => data_out_s , key_in => key_in_s);

	--Stimuli ... 
	key_in_s <= X"d014f9a8c9ee2589e13f0cc8b6630ca6";
	data_in_s <= ((x"d6", x"ef", x"a6", x"dc"), (x"4c", x"e8", x"ef", x"d2"), (x"47", x"6b", x"95", x"46"), (x"d7", x"6a", x"cd", x"f0"));

end architecture addroundkey_tb_arch;


--Configuration of architecture
configuration addroundkey_tb_conf of addroundkey_tb is
	for addroundkey_tb_arch
		for DUT : addroundkey
			use entity lib_sources . addroundkey ( addroundkey_arch );
		end for;
	end for;
end addroundkey_tb_conf;


