library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_tb is
    Port ( 
           -- trigTb : in STD_LOGIC:='0';
           countOut : out STD_LOGIC_VECTOR (7 downto 0)
       --    reset: in std_Logic:='0'
           );
end counter_tb;

architecture Behavioral of counter_tb is

component counter is
   generic ( width : integer:=8);
    Port ( trig : in STD_LOGIC:='0';
           count : out STD_LOGIC_VECTOR (width-1 downto 0);
           rst : in STD_LOGIC:='0'
          );
end component;

--TB CLOCK
signal tbCLK : std_logic  := '0';
signal resettbCLK : std_logic  := '0';
constant hlf_P: time:=10 ns;
constant rehlf_P: time:=900 ns;

begin

tbCLK <= not tbCLK after hlf_P;
-- resettbCLK <= not resettbCLK after rehlf_P;

c1 : counter
    generic map (width =>8)
    port map
    (   
        trig=>tbCLK,
        count=>countOut,
        rst=>resettbCLK
    );

    
    
end Behavioral;
