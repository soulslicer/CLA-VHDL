----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:27:57 09/23/2014 
-- Design Name: 
-- Module Name:    FULL_ADD_SUB - Behavioral 
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

entity FULL_ADD_SUB is
generic (N : integer := 32);
    Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
	     C_in: in  STD_LOGIC;
	     MUX: in STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (N-1 downto 0);
	     TEST : out  STD_LOGIC_VECTOR (N-1 downto 0);
           C_out : out  STD_LOGIC;
	     GREATER : out  STD_LOGIC;
	     EQUAL : out  STD_LOGIC;
	     LESSER : out  STD_LOGIC;
	     OVF : out  STD_LOGIC
           );
end FULL_ADD_SUB;

architecture FULL_ADD_SUB_ARCH of FULL_ADD_SUB is

signal ADDER_0_A: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_0_B: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_0_SUM: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_0_AND_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_0_OR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_0_XOR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_0_NOR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_0_CARRY_IN: std_logic := '0';
signal ADDER_0_CARRY_OUT: std_logic := '0';
signal ADDER_0_TEST: std_logic_vector (7 downto 0) := (others=>'0');

signal ADDER_1_A: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_1_B: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_1_SUM: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_1_AND_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_1_OR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_1_XOR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_1_NOR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_1_CARRY_IN: std_logic := '0';
signal ADDER_1_CARRY_OUT: std_logic := '0';
signal ADDER_1_TEST: std_logic_vector (7 downto 0) := (others=>'0');

signal ADDER_2_A: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_2_B: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_2_SUM: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_2_AND_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_2_OR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_2_XOR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_2_NOR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_2_CARRY_IN: std_logic := '0';
signal ADDER_2_CARRY_OUT: std_logic := '0';
signal ADDER_2_TEST: std_logic_vector (7 downto 0) := (others=>'0');

signal ADDER_3_A: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_3_B: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_3_SUM: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_3_AND_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_3_OR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_3_XOR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_3_NOR_OUT: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_3_CARRY_IN: std_logic := '0';
signal ADDER_3_CARRY_OUT: std_logic := '0';
signal ADDER_3_TEST: std_logic_vector (7 downto 0) := (others=>'0');

--signal TOADD_A : std_logic_vector (31 downto 0) := std_logic_vector(to_signed(2000000000,32));
--signal TOADD_B : std_logic_vector (31 downto 0) := std_logic_vector(to_signed(50,32));
--signal TOADD_CARRY_IN : std_logic := '0';
signal Binv : std_logic := '0';
signal Bitwise_nor : std_logic := '0';

signal ONE : std_logic := '0';
signal TWO : std_logic := '0';
signal THREE : std_logic := '0';

signal A1 : std_logic := '0';
signal A2 : std_logic := '0';
signal A3 : std_logic := '0';

begin

u_ADDER_0: entity work.CLA_ADD_SUB(CLA_ADD_SUB_ARCH)
    port map(
           A => ADDER_0_A,
           B => ADDER_0_B,
	     Binv => Binv,
	     C_in => ADDER_0_CARRY_IN,
           S => ADDER_0_SUM,
	     AND_out => ADDER_0_AND_OUT,
	     OR_out => ADDER_0_OR_OUT,
	     XOR_out => ADDER_0_XOR_OUT,
	     NOR_out => ADDER_0_NOR_OUT,
           C_out => ADDER_0_CARRY_OUT
    );
    
u_ADDER_1: entity work.CLA_ADD_SUB(CLA_ADD_SUB_ARCH)
    port map(
           A => ADDER_1_A,
           B => ADDER_1_B,
	     Binv => Binv,
	     C_in => ONE,
           S => ADDER_1_SUM,
	     AND_out => ADDER_1_AND_OUT,
	     OR_out => ADDER_1_OR_OUT,
	     XOR_out => ADDER_1_XOR_OUT,
	     NOR_out => ADDER_1_NOR_OUT,
           C_out => ADDER_1_CARRY_OUT
    );
    
u_ADDER_2: entity work.CLA_ADD_SUB(CLA_ADD_SUB_ARCH)
    port map(
           A => ADDER_2_A,
           B => ADDER_2_B,
	     Binv => Binv,
	     C_in => TWO,
           S => ADDER_2_SUM,
	     AND_out => ADDER_2_AND_OUT,
	     OR_out => ADDER_2_OR_OUT,
	     XOR_out => ADDER_2_XOR_OUT,
	     NOR_out => ADDER_2_NOR_OUT,
           C_out => ADDER_2_CARRY_OUT
    );
    
u_ADDER_3: entity work.CLA_ADD_SUB(CLA_ADD_SUB_ARCH)
    port map(
           A => ADDER_3_A,
           B => ADDER_3_B,
	     Binv => Binv,
	     C_in => THREE,
           S => ADDER_3_SUM,
	     AND_out => ADDER_3_AND_OUT,
	     OR_out => ADDER_3_OR_OUT,
	     XOR_out => ADDER_3_XOR_OUT,
	     NOR_out => ADDER_3_NOR_OUT,
           C_out => ADDER_3_CARRY_OUT
    );

ADDER_0_A <= A(7 downto 0);
ADDER_0_B <= B(7 downto 0);
ADDER_0_CARRY_IN <= C_in;

ADDER_1_A <= A(15 downto 8);
ADDER_1_B <= B(15 downto 8);

ADDER_2_A <= A(23 downto 16);
ADDER_2_B <= B(23 downto 16);

ADDER_3_A <= A(31 downto 24);
ADDER_3_B <= B(31 downto 24);

ONE <= Binv xor ADDER_0_CARRY_OUT;
TWO <= Binv xor ADDER_1_CARRY_OUT;
THREE <= Binv xor ADDER_2_CARRY_OUT;

-- Set to subtract
Binv <= MUX(2);

-- Comparator
Bitwise_nor <= ADDER_3_SUM(7) OR
ADDER_3_SUM(6) OR
ADDER_3_SUM(5) OR
ADDER_3_SUM(4) OR
ADDER_3_SUM(3) OR
ADDER_3_SUM(2) OR
ADDER_3_SUM(1) OR
ADDER_3_SUM(0) OR
ADDER_2_SUM(7) OR
ADDER_2_SUM(6) OR
ADDER_2_SUM(5) OR
ADDER_2_SUM(4) OR
ADDER_2_SUM(3) OR
ADDER_2_SUM(2) OR
ADDER_2_SUM(1) OR
ADDER_2_SUM(0) OR
ADDER_1_SUM(7) OR
ADDER_1_SUM(6) OR
ADDER_1_SUM(5) OR
ADDER_1_SUM(4) OR
ADDER_1_SUM(3) OR
ADDER_1_SUM(2) OR
ADDER_1_SUM(1) OR
ADDER_1_SUM(0) OR
ADDER_0_SUM(7) OR
ADDER_0_SUM(6) OR
ADDER_0_SUM(5) OR
ADDER_0_SUM(4) OR
ADDER_0_SUM(3) OR
ADDER_0_SUM(2) OR
ADDER_0_SUM(1) OR
ADDER_0_SUM(0);

EQUAL <= NOT Bitwise_nor;

WITH MUX(0) SELECT
GREATER <= Bitwise_nor AND (NOT ADDER_3_SUM(7)) WHEN '1',
				(A(31) XOR B(31)) XOR (Bitwise_nor AND (NOT ADDER_3_SUM(7)))  WHEN OTHERS;

WITH MUX(0) SELECT
LESSER <= ADDER_3_SUM(7) WHEN '1',
			   (A(31) XOR B(31)) XOR (ADDER_3_SUM(7) )  WHEN OTHERS;

--GREATER <= Bitwise_nor AND (NOT ADDER_3_SUM(7));
--EQUAL <= NOT Bitwise_nor;
--LESSER <= ADDER_3_SUM(7);

--PROBLEM FOR IF UNSIGNED THEN IF NUMBER IS LARGE - LAST BIT 1
WITH MUX  SELECT
S <= ADDER_3_SUM & ADDER_2_SUM & ADDER_1_SUM & ADDER_0_SUM WHEN "0010" | "0110" | "0111" | "1110",
	ADDER_3_AND_OUT & ADDER_2_AND_OUT & ADDER_1_AND_OUT & ADDER_0_AND_OUT WHEN "0000",
	ADDER_3_OR_OUT & ADDER_2_OR_OUT & ADDER_1_OR_OUT & ADDER_0_OR_OUT WHEN "0001",
	ADDER_3_XOR_OUT & ADDER_2_XOR_OUT & ADDER_1_XOR_OUT & ADDER_0_XOR_OUT WHEN "0100",
	ADDER_3_NOR_OUT & ADDER_2_NOR_OUT & ADDER_1_NOR_OUT & ADDER_0_NOR_OUT WHEN "1100",
	A WHEN OTHERS;
	
C_out <= ADDER_3_CARRY_OUT;

A1 <= ( ADDER_3_SUM(7) XOR A(31) ) ;
A2 <= MUX(2) OR ( A(31) XOR B(31) );
A3 <= (not MUX(2)) OR (( A(31) XOR B(31) ));
OVF <= A1 OR (A2 AND A3);

--OVF <= ( S(31) XOR A(31) ) OR ( MUX(2) OR ( A(31) XOR B(31) ) AND ((not MUX(2)) OR (not A(31))) )

end FULL_ADD_SUB_ARCH;

