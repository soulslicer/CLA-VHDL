--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:03:34 09/22/2014
-- Design Name:   
-- Module Name:   Z:/git/CG3207/ALU/CLA_ADD_SUB_TEST.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CLA_ADD_SUB
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CLA_ADD_SUB_TEST IS
generic (N : integer := 8);
END CLA_ADD_SUB_TEST;
 
ARCHITECTURE behavior OF CLA_ADD_SUB_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CLA_ADD_SUB
    PORT(
         A : IN  std_logic_vector(N-1 downto 0);
         B : IN  std_logic_vector(N-1 downto 0);
         Binv : IN  std_logic;
         C_in : IN  std_logic;
         S : OUT  std_logic_vector(N-1 downto 0);
         TEST : OUT  std_logic_vector(N-1 downto 0);
         C_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(N-1 downto 0) := (others => '0');
   signal B : std_logic_vector(N-1 downto 0) := (others => '0');
   signal Binv : std_logic := '0';
   signal C_in : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(N-1 downto 0);
   signal TEST : std_logic_vector(N-1 downto 0);
   signal C_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CLA_ADD_SUB PORT MAP (
          A => A,
          B => B,
          Binv => Binv,
          C_in => C_in,
          S => S,
          TEST => TEST,
          C_out => C_out
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	wait for 100 ns;
        a <= std_logic_vector(to_signed(1,a'length));
        b <= std_logic_vector(to_signed(0,b'length));
        wait for 100 ns;
        binv <= '1';
        wait for 100 ns;
        binv <= '0';
        a <= std_logic_vector(to_signed(30,a'length));
        b <= std_logic_vector(to_signed(-50,b'length));
        wait for 100 ns;
        binv <= '1';
        b <= std_logic_vector(to_signed(-50,b'length));
        wait for 600 ns;
        wait;
   end process;

END;
