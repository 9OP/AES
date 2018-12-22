-- Martin GRD 13nov. 2018
-- invshiftrows.vhd testbench
-- SBOX_tb.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library AESLibrary;
use AESLibrary.state_definition_package.all;

library lib_sources;


--Declaration of entity
entity invshiftrow_tb is
end entity invshiftrow_tb;


--Description of architecture
architecture invshiftrow_tb_arch of invshiftrow_tb is
	component invshiftrow
		port (data_i : in type_state ; data_o : out type_state);
	end component;

	signal data_is : type_state;
	signal data_os : type_state;

begin
	DUT : invshiftrow
	port map (data_i => data_is , data_o => data_os);
	--Stimuli  ...
	data_is <=  ((X"06", X"fb", X"5f", X"74"), (X"85", X"06", X"ca", X"5b"), (X"a6", X"54", X"99", X"8e"), (X"61", X"09", X"c1", X"56"));

end architecture invshiftrow_tb_arch;


--Configuration of architectecture
configuration invshiftrow_tb_conf of invshiftrow_tb is
	for invshiftrow_tb_arch
		for DUT : invshiftrow
			use entity lib_sources . invshiftrow ( invshiftrow_arch );
		end for;
	end for;
end invshiftrow_tb_conf;

