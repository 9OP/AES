-- Martin GRD 20nov. 2018
-- AES InvMixColumn

--Include library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library AESLibrary;
use AESLibrary.state_definition_package.all;

library lib_sources;


--Declaration of entity
entity invmixcolumn is
	port (data_in : in type_state ; data_out : out type_state);
end invmixcolumn;


--Description of architecture
architecture invmixcolumn_arch of invmixcolumn is
	component invmixcolumnelementary
		port (data_i : in column_state; data_o : out column_state);
	end component;

	signal column0_in, column1_in, column2_in, column3_in : column_state;
	signal column0_out, column1_out, column2_out, column3_out : column_state;

begin
	column0_in(0) <= data_in(0)(0);
	column0_in(1) <= data_in(0)(1);
	column0_in(2) <= data_in(0)(2);
	column0_in(3) <= data_in(0)(3); 

	column1_in(0) <= data_in(1)(0);
	column1_in(1) <= data_in(1)(1);
	column1_in(2) <= data_in(1)(2);
	column1_in(3) <= data_in(1)(3);

	column2_in(0) <= data_in(2)(0);
	column2_in(1) <= data_in(2)(1);
	column2_in(2) <= data_in(2)(2);
	column2_in(3) <= data_in(2)(3);

	column3_in(0) <= data_in(3)(0);
	column3_in(1) <= data_in(3)(1);
	column3_in(2) <= data_in(3)(2);
	column3_in(3) <= data_in(3)(3);

	invmixcolumnelementary_1 : invmixcolumnelementary
	port map (data_i => column0_in , data_o => column0_out);
	
	invmixcolumnelementary_2 : invmixcolumnelementary
	port map (data_i => column1_in , data_o => column1_out);

	invmixcolumnelementary_3 : invmixcolumnelementary
	port map (data_i => column2_in , data_o => column2_out);

	invmixcolumnelementary_4 : invmixcolumnelementary
	port map (data_i => column3_in , data_o => column3_out);

	data_out(0)(0) <= column0_out(0);
	data_out(0)(1) <= column0_out(1);
	data_out(0)(2) <= column0_out(2);
	data_out(0)(3) <= column0_out(3);

	data_out(1)(0) <= column1_out(0);
	data_out(1)(1) <= column1_out(1);
	data_out(1)(2) <= column1_out(2);
	data_out(1)(3) <= column1_out(3);

	data_out(2)(0) <= column2_out(0);
	data_out(2)(1) <= column2_out(1);
	data_out(2)(2) <= column2_out(2);
	data_out(2)(3) <= column2_out(3);
	
	data_out(3)(0) <= column3_out(0);
	data_out(3)(1) <= column3_out(1);
	data_out(3)(2) <= column3_out(2);
	data_out(3)(3) <= column3_out(3);

end invmixcolumn_arch;


--Configuration of architectecture
configuration invmixcolumn_conf of invmixcolumn is
	for invmixcolumn_arch
		for all : invmixcolumnelementary
			use entity lib_sources . invmixcolumnelementary ( invmixcolumnelementary_arch );
		end for;
	end for;
end invmixcolumn_conf;

