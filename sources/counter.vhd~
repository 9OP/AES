--Martin GRD 27 nov. 2018
--counter for AES FSM moore

--Include Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library AESLibrary;
use AESLibrary.state_definition_package.all;


--Declaratin of entity
entity counter is
	port (	resetb_i : in std_logic;
		enable_i : in std_logic;
		clock_i : in std_logic;
		count_o : out bit4 );
end counter;


--Description of architecture
architecture counter_arch of counter is
	signal count_s : integer range 0 to 10;
begin
	P0 : process (resetb_i, clock_i, enable_i)
	begin
		if resetb_i = '0' then -- reset prioritaire et asynchrone
			count_s <= 10;
		elsif clock_i'event and clock_i = '1' then
			if enable_i = '1' then
				if count_s = 0 then
					count_s <= 10;
				else 
					count_s <= count_s - 1;
				end if;
			end if;
		end if;
	end process;

	count_o <= std_logic_vector(to_unsigned(count_s,4));

end counter_arch;


