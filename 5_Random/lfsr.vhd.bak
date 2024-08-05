---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.12.2019 18:53:34
-- Design Name: 
-- Module Name: lfsr - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lfsr is
    generic
    (
       seedVal :STD_LOGIC_VECTOR(31 downto 0):=x"a5232725"
    );
    Port ( 
				trig : in STD_LOGIC;
           outBit : out STD_LOGIC
		);
end lfsr;



architecture Behavioral of lfsr is

signal lfsrBkEnd : STD_LOGIC_VECTOR(31 downto 0):=seedVal; 
signal obit : STD_LOGIC:='0';

begin

obit<= not ((lfsrBkEnd(31) xor lfsrBkEnd(21)) xor ((lfsrBkEnd(2) xor lfsrBkEnd(0)))   );  
outBit<=obit;
lfsrproc : process(trig)
                begin
                if rising_edge(trig) then 
                    lfsrBkEnd<= lfsrBkEnd(30 downto 0)  & obit        ;
                end if;    
           end process;
end Behavioral;