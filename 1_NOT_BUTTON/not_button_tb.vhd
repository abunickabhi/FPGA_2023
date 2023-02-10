--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

entity not_button_tb is
	Port ( output : out std_logic :='0');
end not_button_tb;

architecture Behavioral  of not_button_tb is

component not_button is
   port( inPort  : in std_logic :='0';
         outPort : out std_logic :='1');
end component;

signal tbCLK : std_logic  := '0';
constant hlf_P: time:=10 ns;


begin

tbCLK <= not tbCLK after hlf_P;

b1 : not_button 
	port map (
		inPort=>tbCLK,
		outPort=>output
	);


end Behavioral;
	
