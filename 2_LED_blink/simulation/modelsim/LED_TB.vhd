LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_arith.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY LED_TB  IS 
END ; 
 
ARCHITECTURE LED_TB_arch OF LED_TB IS
  SIGNAL LED0   :  STD_LOGIC  ; 
  SIGNAL LED1   :  STD_LOGIC  ; 
  SIGNAL CLK_50M   :  STD_LOGIC  ; 
  COMPONENT max_10_board_top  
    PORT ( 
      LED0  : out STD_LOGIC ; 
      LED1  : out STD_LOGIC ; 
      CLK_50M  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : max_10_board_top  
    PORT MAP ( 
      LED0   => LED0  ,
      LED1   => LED1  ,
      CLK_50M   => CLK_50M   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ns, End Time = 1 us, Period = 20 ns
  Process
	Begin
	for Z in 1 to 50
	loop
	    clk_50m  <= '1'  ;
	   wait for 10 ns ;
	    clk_50m  <= '0'  ;
	   wait for 10 ns ;
-- 1 us, repeat pattern in loop.
	end  loop;
	wait;
 End Process;
END;
