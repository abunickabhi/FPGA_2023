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

Entity randomNumber is
	port
	(
		CLK_50M	:    in std_logic;	
		SW0		:    in std_logic;
		HEX0	:   out std_logic_vector(6 downto 0);
		HEX1	:   out std_logic_vector(6 downto 0);
		LED0	:   out std_logic
	);
end randomNumber;

architecture Behavioral of randomNumber is

component lfsr is
    Generic
    (
       seedVal : STD_LOGIC_VECTOR(31 downto 0) := x"a1232724"
    ) ;
    port ( trig : in STD_LOGIC;
           outBit : out STD_LOGIC
			  ) ;	
end component;


    signal Rst: STD_LOGIC;
	 
	 signal CLK0: STD_LOGIC:= '0';	
	 signal CLK1: STD_LOGIC:= '0';	
	
    signal temporal0: STD_LOGIC:= '0';
    signal counter0 : integer range 0 to 25000000 := 0;
	 
	 signal counter0_SHARE : std_logic_vector(3 downto 0):="0000";
	 signal counter1_SHARE : std_logic_vector(3 downto 0):="0000";

	 
	signal s_a0   :  std_logic;
	signal s_a1   :  std_logic;	
	signal s_a2   :  std_logic;
	signal s_b0   :  std_logic;
	signal s_b1   :  std_logic;	
	signal s_b2   :  std_logic;	

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
			outBit =>s_a0
		);
	 randGenA1 : lfsr 
	 generic map
    (
       seedVal => x"a2316850"
    )
	   port map (
			trig=> CLK0,
			outBit =>s_a1
		);
	 randGenA2 : lfsr 
	 generic map
    (
       seedVal => x"a2666992"
    )
	   port map (
			trig=> CLK0,
			outBit =>s_a2
		);
		
	 randGenB0 : lfsr 
	 generic map
    (
       seedVal => x"a6430992"
    )
	   port map (
			trig=> CLK0,
			outBit =>s_b0
		);
	 randGenB1 : lfsr 
	 generic map
    (
       seedVal => x"b2188892"
    )
	   port map (
			trig=> CLK0,
			outBit =>s_b1
		);
	 randGenB2 : lfsr 
	 generic map
    (
       seedVal => x"a5173888"
    )
	   port map (
			trig=> CLK0,
			outBit =>s_b2
		);
		
		counter0_SHARE(0)<=s_a0;
		counter0_SHARE(1)<=s_a1;
		counter0_SHARE(2)<=s_a2;
		
		counter1_SHARE(0)<=s_b0;
		counter1_SHARE(1)<=s_b1;
		counter1_SHARE(2)<=s_b2;
		
		
	  HEX0 <=  "1000000" when counter0_SHARE = "0000" else
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
	  HEX1 <=  "1000000" when counter1_SHARE = "0000" else
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
	
	 
end Behavioral;