library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;

entity S_GEN is
port
(
	CLK:    	 in  std_logic;
	RESET:  	 in  std_logic;
	TEST_MODE:   in std_logic;
	TC_S:        out std_logic
);
end S_GEN;

architecture S_ARC of S_GEN is

signal Q: std_logic_vector(26 downto 0);
signal CONST: std_logic_vector(26 downto 0);

begin

  CONST <= "101111101011110000011111111" when (TEST_MODE = '0') else "000000000000000000000001001";

--Time base generator
P1: process
begin
    wait until rising_edge(CLK);
    if (RESET = '1') then
      Q <= (others => '0');
    else
		if (Q < CONST) then
			Q <= Q + 1;
		else
			Q <= (others => '0');
		end if;
    end if;
end process;

TC_S <= '1' when (Q = 0) else '0';


end S_ARC;


