library IEEE;
	use IEEE.std_logic_1164.all;

entity T_STATE is
port
 (
	CLK:   in std_logic;
	RESET: in std_logic;
	TC_C:  in std_logic;
	C_EN:   out std_logic;
	CONTROL:  out std_logic_vector(4 downto 0)
 );
 
end T_STATE;

architecture STATE_ARC of T_STATE is

type StateType is (STEP1, STEP2, STEP3, STEP4);
signal STATE: StateType;
begin

P0: process
begin
	wait until rising_edge(CLK);
		if (RESET = '1') then
			STATE <= STEP1;
			C_EN <= '0';
			CONTROL <= "10001";
		elsif (TC_C = '1') then
			case STATE is
				when STEP1 =>
						STATE <= STEP2;
						C_EN <= '1';
						CONTROL <= "11010";
				when STEP2 =>
						STATE <= STEP3;
						C_EN <= '0';
						CONTROL <= "00110";
				when STEP3 =>
						STATE <= STEP4;
						C_EN <= '1';
						CONTROL <= "01010";
				when STEP4 =>
						STATE <= STEP1;
						C_EN <= '0';
						CONTROL <= "10001";
			end case;
		end if;
	end process;
end STATE_ARC;
	
				
						
						
						
						
						
						
						
						
						
						
						
						
						