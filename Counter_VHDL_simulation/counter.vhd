----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2019 18:14:39
-- Design Name: 
-- Module Name: counter - Behavioral
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
 use IEEE.std_logic_arith.all;
 use IEEE.numeric_std.all;
 use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    generic ( width : integer:=4);
    Port ( trig : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (width-1 downto 0);
           rst : in STD_LOGIC:='0'
          );
end counter;

architecture Behavioral of counter is

signal temp : std_logic_vector(31 downto 0):=x"00000000";


begin
count<=temp(width-1 downto 0);


process(trig,rst)
begin
        if rst='0' then
            if rising_edge (trig) then
                temp<=temp+"00000001";
            end if;
        else
            temp<=x"00000000";
        end if;
end process;

--process  (rst)
--begin 
--    if rst='1' then
--        temp<=x"00000000";
--end if;
--end process;

end Behavioral;