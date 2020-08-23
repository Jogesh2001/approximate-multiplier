----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2020 07:52:50 AM
-- Design Name: 
-- Module Name: testbench - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench is
end testbench;

architecture Behavioral of testbench is
component appr is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           C : out STD_LOGIC_VECTOR (5 downto 0));
end component;
file file_VECTORS : text;
 file file_RESULTS : text;
signal W_A  : std_logic_vector(3 downto 0);
signal W_B  : std_logic_vector(1 downto 0);
signal W_C  : std_logic_vector(5 downto 0);
begin
DUT: appr
port map (A =>W_A,
         B=>W_B,
         C=>W_C);
process
             variable v_ILINE     : line;
             variable v_OLINE     : line;
             variable v_ADD_TERM1 : std_logic_vector(3 downto 0);
             variable v_ADD_TERM2 : std_logic_vector(1 downto 0);
             variable v_SPACE     : character;
              
           begin
          
             file_open(file_VECTORS, "C:\Users\jogesh\OneDrive\Desktop\project gopal sir\project_3\project_3.srcs\sim_1\new\input_vectors.txt",  read_mode);
             file_open(file_RESULTS, "C:\Users\jogesh\OneDrive\Desktop\project gopal sir\project_3\project_3.srcs\sim_1\new\output_results.txt", write_mode);
          
             while not endfile(file_VECTORS) loop
               readline(file_VECTORS, v_ILINE);
               read(v_ILINE, v_ADD_TERM1);
               read(v_ILINE, v_SPACE);           -- read in the space character
               read(v_ILINE, v_ADD_TERM2);
          
               -- Pass the variable to a signal to allow the ripple-carry to use it
               W_A <= v_ADD_TERM1;
               W_B <= v_ADD_TERM2;
          
               wait for 60 ns;
          
               write(v_OLINE, w_C, right, 5);
               writeline(file_RESULTS, v_OLINE);
             end loop;
          
             file_close(file_VECTORS);
             file_close(file_RESULTS);
              
             wait;
           end process;
end Behavioral;





