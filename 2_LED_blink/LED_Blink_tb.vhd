--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

entity LED_BLINK_tb is
	Port ( 
				outputLED1 : out std_logic ;
				outputLED2 : out std_logic 
			);
end LED_BLINK_tb;

architecture Behavioral  of LED_BLINK_tb is

component LED_BLINK is
   port( 
		CLK_50M	:    in std_logic;	
		LED0	:   out std_logic;
		LED1	:   out std_logic
);
end component;

signal tbCLK : std_logic  := '0';
constant hlf_P: time:=10 ns;


begin

tbCLK <= not tbCLK after hlf_P;

dut1 : LED_BLINK 
	port map (
		CLK_50M=>tbCLK,
		LED0=>outputLED1,
		LED1=>outputLED2
	);


end Behavioral;
	