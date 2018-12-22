--Martin GRD 7dec. 2018
-- Inverse AES

--Include Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library AESLibrary;
use AESLibrary.state_definition_package.all;

library lib_sources;


--Declaration of entity
entity InvAES is
	port (	start_i : in std_logic;
					clock_i : in std_logic;
					resetb_i : in std_logic;	
					data_in : in bit128;
					aes_on_out : out std_logic;
					data_out ; out bit128 );
end InvAES;


--Description of architecture
architecture InvAES_arch of InvAES is



end architecture InvAES_arch;
