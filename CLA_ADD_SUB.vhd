----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:57:00 09/22/2014 
-- Design Name: 
-- Module Name:    CLA_ADD_SUB - CLA_ADD_SUB_ARCH 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity CLA_ADD_SUB is
generic (N : integer := 8);
    Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
	     C_in: in  STD_LOGIC;
	     Binv: in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (N-1 downto 0);
	     AND_out : out STD_LOGIC_VECTOR (N-1 downto 0);
	     OR_out : out  STD_LOGIC_VECTOR (N-1 downto 0);	     
	     XOR_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
	     NOR_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           C_out : out  STD_LOGIC
           );
end CLA_ADD_SUB;

architecture CLA_ADD_SUB_ARCH of CLA_ADD_SUB is

SIGNAL    h_sum              :    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL    carry_generate     :    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL    carry_propagate    :    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL    carry_in_internal  :    STD_LOGIC_VECTOR(N-1 DOWNTO 1);
SIGNAL    nor_val  :    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL    xor_val  :    STD_LOGIC_VECTOR(N-1 DOWNTO 0);

SIGNAL	B_mod : STD_LOGIC_VECTOR(N-1 DOWNTO 0) := B;
SIGNAL	C_in_mod: STD_LOGIC := C_in;

signal S_wider : std_logic_vector(N downto 0);

begin

	WITH Binv  SELECT
	B_mod <= B WHEN '0',
			not B WHEN '1',
			B WHEN OTHERS;
			
	WITH Binv  SELECT
	C_in_mod <= C_in WHEN '0',
			not C_in WHEN '1',
			C_in WHEN OTHERS;
			
	-- Sum, P and G
	h_sum <= A XOR B_mod;
	carry_generate <= A AND B_mod;
	carry_propagate <= A OR B_mod;
	nor_val <= A NOR B;
	xor_val <= A XOR B;
		
	PROCESS (carry_generate,carry_propagate,carry_in_internal,C_in_mod)
	BEGIN
		carry_in_internal(1) <= carry_generate(0) OR (carry_propagate(0) AND C_in_mod);
		inst: FOR i IN 1 TO (N-2) LOOP
			carry_in_internal(i+1) <= carry_generate(i) OR (carry_propagate(i) AND carry_in_internal(i));
		END LOOP;
		C_out <= carry_generate(N-1) OR (carry_propagate(N-1) AND carry_in_internal(N-1));
	END PROCESS;

	S(N-1 DOWNTO 0) <= (h_sum(N-1 DOWNTO 1) XOR carry_in_internal(N-1 DOWNTO 1)) & (h_sum(0) XOR C_in_mod);
	AND_out(N-1 DOWNTO 0) <= carry_generate;
	OR_out(N-1 DOWNTO 0) <= carry_propagate;
	XOR_out(N-1 DOWNTO 0) <= xor_val;
	NOR_out(N-1 DOWNTO 0) <= nor_val;

--	S(0) <= h_sum(0) XOR C_in_mod;
--	S(N-1 DOWNTO 1) <= h_sum(N-1 DOWNTO 1) XOR carry_in_internal(N-1 DOWNTO 1);

end CLA_ADD_SUB_ARCH;

