library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  
entity TWO_CNTR is
port
 (
	CLK:    in std_logic;
	RESET:    in std_logic;
    C_EN:   in std_logic;
	TC_S:   in std_logic;
	TC_C:   out std_logic
 );
 end TWO_CNTR;
 
architecture CNTR_ARC of TWO_CNTR is

signal Q1: std_logic_vector(3 downto 0);
signal Q2: std_logic_vector(1 downto 0);

begin

P_Q1: process
begin
	wait until rising_edge(CLK);
		if (RESET = '1') or (C_EN = '1') then
			Q1 <= (others => '0');
		else
			if (TC_S = '1') then
				if (Q1 < 10) then
					Q1 <= Q1 + 1;
				else
					Q1 <= (others => '0');
				end if;
			elsif (Q1 = "1010") then
				Q1 <= (others => '0');
			end if;
		end if;
end process;

P_Q2: process
begin
	wait until rising_edge(CLK);
		if (RESET = '1') or (C_EN = '0') then
			Q2 <= "00";
		else
			if (TC_S = '1') then
				if (Q2 < 2) then
					Q2 <= Q2 + 1;
				else
					Q2 <= "00";
				end if;
			elsif (Q2 = "10") then
				Q2 <= "00";
			end if;
		end if;
end process;

TC_C <= '1' when ((Q1 = "1010") or (Q2 = "10")) else '0';

end CNTR_ARC;

