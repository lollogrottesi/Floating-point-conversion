----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.08.2020 16:05:03
-- Design Name: 
-- Module Name: Floating_point_to_integer - Behavioral
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

entity Floating_point_to_integer is
    Port (FP_in : in std_logic_vector (31 downto 0);
          integer_out: out std_logic_vector (31 downto 0));
end Floating_point_to_integer;

architecture Behavioral of Floating_point_to_integer is
signal signed_mantissa: std_logic_vector(24 downto 0);
signal mantissa: std_logic_vector(24 downto 0);
signal unbiased_E, shift_amt, exponent: std_logic_vector(7 downto 0);
signal fixed_point, extended_mantissa: std_logic_vector(63 downto 0);

begin
--Attach hidden bit and sign.
mantissa <= FP_in(31)&'0'&FP_in(22 downto 0) when FP_in(30 downto 23) = "00000000" else
            FP_in(31)&'1'&FP_in(22 downto 0);
            
--Convert mantissa from sign-module to 2's complement.            
signed_mantissa(23 downto 0) <= std_logic_vector(unsigned(not mantissa(23 downto 0)) + 1) when FP_in(31) = '1' else
                   mantissa(23 downto 0);
signed_mantissa(24) <= mantissa(24);
--Extend mantissa to 64 bits (extending the sign).                   
extended_mantissa(63 downto 25) <= (others=>signed_mantissa(24));
extended_mantissa(24 downto 0) <= signed_mantissa;

exponent <=FP_in(30 downto 23);  

--Compute the unbiased exponent.
unbiased_E <= std_logic_vector(unsigned(exponent) - 127);

--Compute shift amount.
shift_amt <= std_logic_vector(unsigned(not unbiased_E) + 1) when unbiased_E(7) = '1' else
             unbiased_E;

--Apply the shift.
fixed_point <= std_logic_vector(shift_right(signed(extended_mantissa), to_integer(unsigned(shift_amt)))) when unbiased_E(7) = '1' else
               std_logic_vector(shift_left(signed(extended_mantissa), to_integer(unsigned(shift_amt))))  when unbiased_E(7) = '0' ;
              
integer_out <= fixed_point(54 downto 23);

 
end Behavioral;
