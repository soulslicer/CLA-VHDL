--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:38:28 09/23/2014
-- Design Name:   
-- Module Name:   Z:/git/CG3207/ALU/FULL_ADD_SUB_TEST.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FULL_ADD_SUB
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
 
ENTITY FULL_ADD_SUB_TEST IS
END FULL_ADD_SUB_TEST;
 
ARCHITECTURE behavior OF FULL_ADD_SUB_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FULL_ADD_SUB
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         C_in : IN  std_logic;
	   MUX: in STD_LOGIC_VECTOR (3 downto 0);
         S : OUT  std_logic_vector(31 downto 0);
         TEST : OUT  std_logic_vector(31 downto 0);
         C_out : OUT  std_logic;
	   GREATER : out  STD_LOGIC;
	   EQUAL : out  STD_LOGIC;
	   LESSER : out  STD_LOGIC;
	   OVF : out  STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal C_in : std_logic := '0';
   signal MUX : std_logic_vector(3 downto 0) := (others => '0');
   signal GREATER : std_logic := '0';
   signal EQUAL : std_logic := '0';
   signal LESSER : std_logic := '0';
   signal OVF : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(31 downto 0);
   signal TEST : std_logic_vector(31 downto 0);
   signal C_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FULL_ADD_SUB PORT MAP (
          A => A,
          B => B,
          C_in => C_in,
	    MUX => MUX,
          S => S,
          TEST => TEST,
          C_out => C_out,
	    GREATER => GREATER,
	    EQUAL => EQUAL,
	    LESSER => LESSER,
	    OVF => OVF
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
	
	MUX <= "0110";
	
	--a <= std_logic_vector(to_signed(200000000,a'length));
	--b <= std_logic_vector(to_signed(50,b'length));
	
	--wait for 100ns;
	
	a <= "10000000000000000000000000000000";
	b <= "10000000000000000000000000000000";
	
	wait for 100ns;
	
	--MUX <= "1110";
	
--	  MUX <= "0111";
--        a <= std_logic_vector(to_signed(200000000,a'length));
--        b <= std_logic_vector(to_signed(50,b'length));
--        wait for 100 ns;
--        MUX <= "0111";
--        wait for 100 ns;
--        MUX <= "0111";
--        a <= std_logic_vector(to_signed(-30,a'length));
--        b <= std_logic_vector(to_signed(-50,b'length));
--        wait for 100 ns;
--        MUX <= "0111";
--        b <= std_logic_vector(to_signed(50,b'length));
--	  wait for 100 ns;
--	  MUX <= "1111";
	  
        wait for 600 ns;
        wait;
   end process;

END;
