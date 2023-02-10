LIbrary IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity randomBit is
	port
	(
		CLK_50M	:    in std_logic;	
		SW0		:    in std_logic;
		LED0	:   out std_logic ;
		LED1	:   out std_logic

	);
end randomBit;

architecture Behavioral of randomBit is

component lfsr is
    Generic
    (
       seedVal : STD_LOGIC_VECTOR(31 downto 0) := x"a5232725"
    ) ;
    port ( trig : in STD_LOGIC;
           outBit : out STD_LOGIC
			  ) ;	
end component;


    signal Rst: STD_LOGIC;
	 
	 signal CLK0: STD_LOGIC:= '0';	
	
    signal temporal0: STD_LOGIC:= '0';
    signal counter0 : integer range 0 to 25000000 := 0;	
	 
	 signal counter0_SHARE : std_logic_vector(3 downto 0):="0000";


	begin
	 Rst <= not (SW0); 

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

	 randGenA0 : lfsr 
	 generic map
    (
       seedVal => x"a5232725"
    )
	   port map (
			trig=> CLK0,
			outBit =>LED1
		);
	 
end Behavioral;