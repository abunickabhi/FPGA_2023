LIbrary IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

Entity LED_BLINK is
	port
	(
		CLK_50M	:    in std_logic;	
		LED0	:   out std_logic;
		LED1	:   out std_logic

	);
end LED_BLINK;




architecture behav of LED_BLINK is

  
	 signal CLK0: STD_LOGIC:= '0';
	 signal CLK1: STD_LOGIC:= '0';	
	 	
	
    signal temporal0: STD_LOGIC:= '0';
    signal counter0 : integer range 0 to 4 := 0;	
	 signal temporal1: STD_LOGIC:= '0';
    signal counter1 : integer range 0 to 4:= 0;	
	 
	 


begin
	
    frequency_divider0: process (CLK_50M) begin
      
        if rising_edge(CLK_50M) then
            if (counter0 = 25000000) then
                temporal0 <= NOT(temporal0);
                counter0 <= 0;
            else
                counter0 <= counter0 + 1;
            end if;
        end if;
    end process;
	 
	     
    CLK0 <= temporal0;
    LED0 <= CLK0;
	 
	 
    frequency_divider1: process (CLK0) begin
     
        if rising_edge(CLK0) then
            if (counter1 = 4) then
                temporal1 <= NOT(temporal1);
                counter1 <= 0;
            else
                counter1 <= counter1 + 1;
            end if;
        end if;
    end process;
	 
	 CLK1 <= not temporal1;
    LED1 <= CLK1;
	  
	  
	 
	
end behav;