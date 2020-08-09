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

component Integer_to_floating_point_single_precision is
    port (int_in: in std_logic_vector(31 downto 0);
          s_u: in std_logic; --Specify if integer input have to be treated as unsigned or signed.
          fp_out: out std_logic_vector(31 downto 0));
end component;

component Floating_point_single_precision_to_double is
    port (fp_single: in std_logic_vector(31 downto 0);
          fp_double: out std_logic_vector(63 downto 0));
end component;

component Floating_point_double_precision_to_single is
    port (fp_double: in std_logic_vector(63 downto 0);
          fp_single: out std_logic_vector(31 downto 0));
end component;

component Floating_point_double_precision_to_integer is
    Port (FP_in : in std_logic_vector (63 downto 0);
          s_u: in std_logic;    --Specify if output format is signed or unsigned. 
          integer_out: out std_logic_vector (31 downto 0));
end component;

component Integer_to_floating_point_double_precision is
    port (int_in: in std_logic_vector(31 downto 0);
          s_u: in std_logic; --Specify if integer input have to be treated as unsigned or signed.
          fp_out: out std_logic_vector(63 downto 0));
end component;

component Floating_point_single_precision_to_integer is
    Port (FP_in : in std_logic_vector (31 downto 0);
          s_u: in std_logic;    --Specify if output format is signed or unsigned. 
          integer_out: out std_logic_vector (31 downto 0));
end component;
--Change the signal accordingly to component to test.
signal x: std_logic_vector (31 downto 0);
signal y: std_logic_vector (31 downto 0);
signal s_u: std_logic;

begin
--Decommet dut to test a component.
--dut: Integer_to_floating_point_single_precision port map (x, s_u, y);
--dut: Integer_to_floating_point_double_precision port map (x, s_u, y);
--dut: Floating_point_double_precision_to_integer port map (x, s_u , y);
--dut: Floating_point_double_precision_to_single port map (y, x);
--dut: Floating_point_single_precision_to_double port map (x, y);
--dut: Floating_point_single_precision_to_integer port map (x, s_u ,y);


--Decomment process suitable for the test.

--    process
--    begin
--        s_u <= '1';
--        x <= x"4040000000000000";
--        wait for 10 ns;
--        x <= x"4000000000000000";
--        wait for 10 ns;
--        x <= x"406ccccd00000000";
--        wait for 10 ns;
--        x <= x"400ccccd00000000";
--        wait for 10 ns;  
--        x <= x"408e147b00000000";
--        wait for 10 ns;
--        x <= x"3f99999a00000000";
--        wait for 10 ns;
--        x <= x"3f00000000000000";
--        wait for 10 ns;
--        x <= x"408e147b00000000";
--        wait for 10 ns;
--        x <= x"3f00000000000000";
--        wait for 10 ns;
--        x <= x"3f00000000000000";
--        wait for 10 ns;
--        x <= x"400eb85200000000";
--        wait for 10 ns;
--        x <= x"40eccccd00000000";
--        wait for 10 ns;
--        x <= x"c0b0000000000000";
--        wait for 10 ns;
--        x <= x"40eccccd00000000";
--        wait for 10 ns;
--        x <= x"c0b0000000000000";
--        wait for 10 ns;
--        x <= x"c056666600000000";
--        wait for 10 ns;
--        x <= x"c0b0000000000000";
--        wait for 10 ns;
--        x <= x"c056666600000000";
--        wait for 10 ns;
--        x <= x"c0b0000000000000";
--        wait for 10 ns;
--        x <= x"0000000000000000";
--        wait;
--    end process;

--    process
--    begin
--        x <= x"40400000";
--        wait for 10 ns;
--        x <= x"40000000";
--        wait for 10 ns;
--        x <= x"406ccccd";
--        wait for 10 ns;
--        x <= x"400ccccd";
--        wait for 10 ns;  
--        x <= x"408e147b";
--        wait for 10 ns;
--        x <= x"3f99999a";
--        wait for 10 ns;
--        x <= x"3f000000";
--        wait for 10 ns;
--        x <= x"408e147b";
--        wait for 10 ns;
--        x <= x"3f000000";
--        wait for 10 ns;
--        x <= x"3f000000";
--        wait for 10 ns;
--        x <= x"400eb852";
--        wait for 10 ns;
--        x <= x"40eccccd";
--        wait for 10 ns;
--        x <= x"c0b00000";
--        wait for 10 ns;
--        x <= x"40eccccd";
--        wait for 10 ns;
--        x <= x"c0b00000";
--        wait for 10 ns;
--        x <= x"c0566666";
--        wait for 10 ns;
--        x <= x"c0b00000";
--        wait for 10 ns;
--        x <= x"c0566666";
--        wait for 10 ns;
--        x <= x"c0b00000";
--        wait for 10 ns;
--        x <= x"00000000";
--        wait;
--    end process;

--    process
--    begin
--        --Unsigned.
--        s_u <= '0';
--        x <= std_logic_vector(to_unsigned(0, 32));
--        wait for 10 ns;
--        x <= std_logic_vector(to_unsigned(5, 32));
--        wait for 10 ns;
--        x <= std_logic_vector(to_unsigned(27, 32));
--        wait for 10 ns;
--        x <= std_logic_vector(to_unsigned(23, 32));
--        wait for 10 ns;
--        x <= std_logic_vector(to_unsigned(32, 32));
--        wait for 10 ns;
--        --Signed.
--        s_u <= '1';
--        x <= std_logic_vector(to_signed(-25, 32));
--        wait for 10 ns;
--        x <= std_logic_vector(to_signed(-7, 32));
--        wait for 10 ns;
--        x <= std_logic_vector(to_signed(27, 32));
--        wait for 10 ns;
--        x <= std_logic_vector(to_signed(-23, 32));
--        wait for 10 ns;
--        x <= std_logic_vector(to_signed(44, 32));
--        wait for 10 ns;
--        wait;
--    end process;
end Behavioral;
