LIbrary IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

Entity HEX_COUNTER is
	port
	(
		CLK_50M	:    in std_logic;	
		SW0		:    in std_logic;
		HEX0	:   out std_logic_vector(6 downto 0);-- A->0 || B->1 || .........
		HEX1	:   out std_logic_vector(6 downto 0);
		LED0	:   out std_logic;
		LED1	:   out std_logic

	);
end HEX_COUNTER;




architecture behav of HEX_COUNTER is

    signal Rst: STD_LOGIC;
	 signal Pause: STD_LOGIC;
	 
	 signal CLK0: STD_LOGIC:= '0';	
	 signal CLK1: STD_LOGIC:= '0';	
	
    signal temporal0: STD_LOGIC:= '0';
    signal counter0 : integer range 0 to 25000000 := 0;	
	 signal temporal1: STD_LOGIC:= '0';
    signal counter1 : integer range 0 to 4:= 0;	
	 

	 signal counter0_SHARE : std_logic_vector(3 downto 0);
	 signal counter1_SHARE : std_logic_vector(3 downto 0);



begin
Rst <= not (SW0); --pull up
--Pause <= not (SW1); --pull up
	
    frequency_divider0: process (Rst, CLK_50M) begin
        if (Rst = '1') then
            temporal0 <= '0';
            counter0 <= 0;
        elsif rising_edge(CLK_50M) then
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
	 
	 
    frequency_divider1: process (Rst, CLK0) begin
        if (Rst = '1') then
            temporal1 <= '0';
            counter1 <= 0;
        elsif rising_edge(CLK0) then
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
	  
	  
	  
	 COUNTER_0: process (CLK1,Rst) 
    begin
	 if Rst = '1' then   
		 counter0_SHARE <="0000";
	 elsif rising_edge(CLK1) then
  	    counter0_SHARE <= counter0_SHARE + "0001";
	   if counter0_SHARE="1001" then
  	    counter0_SHARE <= "0000";
		end if;
	 end if;	 
	 end process;
	 
	  COUNTER_1: process (CLK0,Rst) 
    begin
	 if Rst = '1' then   
		 counter1_SHARE <="0000";
	 elsif rising_edge(CLK0) then
  	    counter1_SHARE <= counter1_SHARE + "0001";
	   if counter1_SHARE="1001" then
  	    counter1_SHARE <= "0000";
		end if;
	 end if;	 
	 end process;
	 

	HEX0 <= "1000000" when counter0_SHARE = "0000" else
           "1111001" when counter0_SHARE = "0001" else 
			  "0100100" when counter0_SHARE = "0010" else 
			  "0110000" when counter0_SHARE = "0011" else 
			  "0011001" when counter0_SHARE = "0100" else 
			  "0010010" when counter0_SHARE = "0101" else 
			  "0000010" when counter0_SHARE = "0110" else 
			  "1111000" when counter0_SHARE = "0111" else 
			  "0000000" when counter0_SHARE = "1000" else 
			  "0010000" when counter0_SHARE = "1001" else 
           "1000000"; 
			  
	HEX1 <= "1000000" when counter1_SHARE = "0000" else
           "1111001" when counter1_SHARE = "0001" else 
			  "0100100" when counter1_SHARE = "0010" else 
			  "0110000" when counter1_SHARE = "0011" else 
			  "0011001" when counter1_SHARE = "0100" else 
			  "0010010" when counter1_SHARE = "0101" else 
			  "0000010" when counter1_SHARE = "0110" else 
			  "1111000" when counter1_SHARE = "0111" else 
			  "0000000" when counter1_SHARE = "1000" else 
			  "0010000" when counter1_SHARE = "1001" else 
           "1000000"; 		  
			  

end behav;