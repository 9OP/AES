-- Martin GRD 13 nov. 2018
-- InvShiftrows in vhdl

--Include Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library AESLibrary;
use AESLibrary.state_definition_package.all;


--Declaration of entity
entity invshiftrow is 
	port (data_i : in type_state ; data_o : out type_state);
end invshiftrow;


--Description of architecture
architecture invshiftrow_arch of invshiftrow is
begin 
	g1 : for ligne in 0 to 3 generate		
		g2 : for col in 0 to 3 generate
			data_o(col)(ligne)<=data_i((col+4-ligne)mod 4)(ligne); --subtilité ici, puisque les cases sont numérotés dans l'ordre des lignes et pas des colones. voir rapport
		end generate g2;
	end generate g1;
end invshiftrow_arch;

