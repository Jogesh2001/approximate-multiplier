----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2020 07:27:14 AM
-- Design Name: 
-- Module Name: appr - Behavioral
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

entity appr is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           C : out STD_LOGIC_VECTOR (5 downto 0));
end appr;

architecture Behavioral of appr is

begin
C(0)<=(B(0)and A(0));
C(1)<=(B(0)and A(1))or(B(1)and A(0));
C(2)<=(B(1)and A(1))or(B(0)and A(2));
C(3)<=(B(0)and A(3))or(B(1)and A(2));
C(4)<=(B(1)and A(2));
C(5)<=(B(0)and B(1))and A(3);


end Behavioral;
