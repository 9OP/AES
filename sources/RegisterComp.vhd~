--Martin GRD 20dec. 2018 
--Register & multiplexeur pour InvAESRound

--Include Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library AESLibrary;
use AESLibrary.state_definition_package.all;


-- /// REGISTRE ///
--Declaration of entity
entity registre is 
  port (
    data_i  : in type_state;
    clk_i    : in  std_logic;
    resetn_i : in  std_logic;
    data_o   : out type_state);
end entity registre;


--Description of architecture
architecture registre_arch of registre is
begin
  registre_proc : process (clk_i, resetn_i) is
  begin 
    if resetn_i = '0' then  -- asynchronous reset (active low)
      data_o <= ((x"00",x"00", x"00", x"00"), (x"00",x"00", x"00", x"00"), (x"00",x"00", x"00", x"00"), (x"00",x"00", x"00", x"00"));
    elsif clk_i'event and clk_i = '1' then -- rising clock edge    
          data_o <= data_i;  
    end if;
  end process registre_proc;
end architecture registre_arch;

