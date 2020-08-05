----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.08.2020 12:28:09
-- Design Name: 
-- Module Name: Conversion_normalization_TB - Behavioral
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

entity Conversion_normalization_TB is
--  Port ( );
end Conversion_normalization_TB;

architecture Behavioral of Conversion_normalization_TB is
component Generic_normalization_LSB_unit is
    generic (N: integer:= 8);
    port (M: in std_logic_vector(N-1 downto 0);
          norma_M: out std_logic_vector(N-1 downto 0);
          shift_amt: out std_logic_vector(N-1 downto 0));
end component;

constant N: integer:= 5;
signal m, norma_m, shift_amt: std_logic_vector(N-1 downto 0);
begin

dut : Generic_normalization_LSB_unit generic map (N)
                                     port map (m, norma_m, shift_amt);
                                     
    process
    begin
        m <= "10101";
        wait for 10 ns;
        wait;
    end process;


end Behavioral;
