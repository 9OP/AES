-- Martin GRD 20dec. 2018
-- Inv AES Round testbench 

--Include Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library AESLibrary;
use AESLibrary.state_definition_package.all;

library lib_sources;

--Declaration of entity
entity InvAESRound_tb is
end entity InvAESRound_tb;


--Description of architecture
architecture InvAESRound_tb_arch of InvAESRound_tb is
	component InvAESRound
		port (clock_i : in std_logic;
					currentkey_i : in bit128;
					currenttext_i : in bit128;
					getCipherText_i : in std_logic;
					enableInvMixColumn_i : in std_logic;
					enableOutput_i : in std_logic;
					resetb_i : in std_logic;
					data_o : out bit128 );
	end component;

	signal clock_i_s : std_logic := '0';
	signal resetb_i_s, enableInvMixColumn_i_s, enableOutput_i_s, getCipherText_i_s : std_logic;	
	signal currentkey_i_s, currenttext_i_s, data_o_s : bit128;

begin
	DUT : InvAESRound
	port map (
		clock_i => clock_i_s,
		resetb_i => resetb_i_s,
		enableInvMixColumn_i => enableInvMixColumn_i_s,
		enableOutput_i => enableOutput_i_s,
		getCipherText_i => getCipherText_i_s,
		currentkey_i => currentkey_i_s, 
		currenttext_i => currenttext_i_s, 
		data_o => data_o_s );

	--Stimuli ...
	--clock_i_s <= not(clock_i_s) after 25 ns;
	clock_i_s <= '1' after 25 ns, '0' after 50 ns, '1' after 75 ns;
	resetb_i_s <= '1', '0' after 500 ns;
	enableOutput_i_s <= '1';
	enableInvMixColumn_i_s <= '0', '1' after 30 ns;
	getCipherText_i_s <= '1', '0' after 26 ns;

	--currenttext_i_s <= x"362baab27ee343ff292dea22bfea0fc0";
	--currentkey_i_s <= x"ead27321b58dbad2312bf5607f8d292f";
	currentkey_i_s <= x"d014f9a8c9ee2589e13f0cc8b6630ca6", x"ac7766f319fadc2128d12941575c006e" after 60 ns;
	currenttext_i_s <= x"d6efa6dc4ce8efd2476b9546d76acdf0";
end architecture InvAESRound_tb_arch;


--Configuration of architecture
configuration InvAESRound_tb_conf of InvAESRound_tb is
	for InvAESRound_tb_arch
		for DUT : InvAESRound
			use entity lib_sources . InvAESRound ( InvAESRound_arch );
		end for;
	end for;
end InvAESRound_tb_conf;


