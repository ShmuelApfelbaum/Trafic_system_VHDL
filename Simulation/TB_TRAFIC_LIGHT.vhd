library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;

entity TB_TRAFIC_LIGHT is
end TB_TRAFIC_LIGHT;

architecture TB_ARC of TB_TRAFIC_LIGHT is
	component TRAFIC_LIGHT
	port
		(
		  CLK:    in  std_logic;
		  RESET:  in  std_logic;
		  TEST_MODE: in std_logic;
		  T_CONTROL: out std_logic_vector(4 downto 0)
		);
	end component;
	
signal tb_C: std_logic:= '0';
signal tb_R: std_logic;
signal tb_T_CONTROL: std_logic_vector(4 downto 0);
signal tb_TEST_MODE: std_logic:= '1';

begin 
DUT: TRAFIC_LIGHT port map(tb_C, tb_R, tb_TEST_MODE, tb_T_CONTROL);
	
	tb_R <= '1',
			'0' after 13 ns;
	
	tb_C <= not(tb_C) after 5 ns;
end TB_ARC;