----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.08.2020 16:38:03
-- Design Name: 
-- Module Name: Converter_Tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Converter_Tb is
--  Port ( );
end Converter_Tb;

architecture Behavioral of Converter_Tb is
component Floating_point_to_integer is
    Port (FP_in : in std_logic_vector (31 downto 0);
          integer_out: out std_logic_vector (31 downto 0));
end component;

component Integer_to_floating_point is
    port (int_in: in std_logic_vector(31 downto 0);
          s_u: in std_logic; --Specify if integer input have to be treated as unsigned or signed.
          fp_out: out std_logic_vector(31 downto 0));
end component;

signal x, y: std_logic_vector (31 downto 0);
signal s_u: std_logic;
begin
dut: Integer_to_floating_point port map (x, s_u, y);
--dut: Floating_point_to_integer port map (x, y);
    process
    begin
        --Unsigned.
        s_u <= '0';
        x <= std_logic_vector(to_unsigned(50, 32));
        wait for 10 ns;
        x <= std_logic_vector(to_unsigned(5, 32));
        wait for 10 ns;
        x <= std_logic_vector(to_unsigned(27, 32));
        wait for 10 ns;
        x <= std_logic_vector(to_unsigned(23, 32));
        wait for 10 ns;
        x <= std_logic_vector(to_unsigned(32, 32));
        wait for 10 ns;
        --Signed.
        s_u <= '1';
        x <= std_logic_vector(to_signed(-25, 32));
        wait for 10 ns;
        x <= std_logic_vector(to_signed(-7, 32));
        wait for 10 ns;
        x <= std_logic_vector(to_signed(27, 32));
        wait for 10 ns;
        x <= std_logic_vector(to_signed(-23, 32));
        wait for 10 ns;
        x <= std_logic_vector(to_signed(44, 32));
        wait for 10 ns;
        wait;
--        x <= x"400ccccd";
--        wait for 10 ns;
--        x <= x"c0a9999a";
--        wait for 10 ns;
--        x <= x"41400000";
--        wait for 10 ns;
--        x <= x"42fb3333";
--        wait for 10 ns;
--        x <= x"c10e6666";
--        wait for 10 ns;
        
        wait;
    end process;
end Behavioral;
