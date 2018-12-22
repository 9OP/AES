-- Martin GRD 20nov. 2018
-- Elementary element for InvMixColumn

-- 2 solutions : tables allocation
-- multiplication. mutliplication par 2 dans GF(2^8)
-- cas1) 0x02 . 0000 00011 = 0 0000 0110 <- décalage à gauche : signal byte_s : bit8; -> std_logic_vector (7 down to 0); byte_s(7)->bit de poids forts
-- cas2) 0x02 . 1101 0100 = 1 1010 1000   et   1 1010 1000 mod 1 0001 1011 (l'application de modulo est un XOR) = 1011 0011 résultat final ok

-- méthode générale : décale à gauche puis XOR
-- décalage à gauche : decal_s <= byte_s(6 down to 0)&'0'
-- XOR avec cette valeure dans tous les cas 0001 1011 : "000"&byte_s(7)&byte_s(7)&'0'&byte_s(7)&byte_s(7)
-- byte2_s <= decal_s XOR "000"&byte_s(7)&byte_s(7)&'0'&byte_s(7)&byte_s(7)

-- en 1 ligne : byte2_s <= byte_s(6 down to 0)&'0' XOR "000"&byte_s(7)&byte_s(7)&'0'&byte_s(7)&byte_s(7) : c'est une multiplication par 2
-- multiplication par 9 : 8 + 1, par 11 : 8 + 2 + 1, par 14 : 8 + 4 + 2

--Include Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library AESLibrary;
use AESLibrary.state_definition_package.all;


--declaration of entity
entity invmixcolumnelementary is
	port (data_i : in column_state; data_o : out column_state);
end invmixcolumnelementary;


--description of architecture
architecture invmixcolumnelementary_arch of invmixcolumnelementary is
	signal byte2_s, byte4_s, byte8_s : column_state; --temporary
	signal matrix : type_state; --matrice contenant les précalculs
	
begin
	g1 : for elem in 0 to 3 generate
		byte2_s(elem) <= data_i(elem)(6 downto 0)&'0' XOR "000"&data_i(elem)(7)&data_i(elem)(7)&'0'&data_i(elem)(7)&data_i(elem)(7);
		byte4_s(elem) <= byte2_s(elem)(6 downto 0)&'0' XOR "000"&byte2_s(elem)(7)&byte2_s(elem)(7)&'0'&byte2_s(elem)(7)&byte2_s(elem)(7);
		byte8_s(elem) <= byte4_s(elem)(6 downto 0)&'0' XOR "000"&byte4_s(elem)(7)&byte4_s(elem)(7)&'0'&byte4_s(elem)(7)&byte4_s(elem)(7);

		matrix((0+elem) mod 4)(elem) <= byte8_s(elem) XOR byte4_s(elem) XOR byte2_s(elem);
		matrix((1+elem) mod 4)(elem) <= byte8_s(elem) XOR data_i(elem);
		matrix((2+elem) mod 4)(elem) <= byte8_s(elem) XOR byte4_s(elem) XOR data_i(elem);
		matrix((3+elem) mod 4)(elem) <= byte8_s(elem) XOR byte2_s(elem) XOR data_i(elem);
	end generate g1;

	
	g2 : for elem in 0 to 3 generate
		data_o(elem) <= matrix(elem)(0) XOR matrix(elem)(1) XOR matrix(elem)(2) XOR matrix(elem)(3);
	end generate g2;

end architecture invmixcolumnelementary_arch;



