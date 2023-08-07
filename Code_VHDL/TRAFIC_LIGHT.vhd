library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  
entity TRAFIC_LIGHT is
port
 (
	CLK:   in std_logic;
	RESET: in std_logic;
	TEST_MODE: in std_logic;
	T_CONTROL: out std_logic_vector(4 downto 0)
 );
end TRAFIC_LIGHT;
 
architecture TRAFIC_ARC of TRAFIC_LIGHT is

component S_GEN 
port
(
	CLK:    	 in  std_logic;
	RESET:  	 in  std_logic;
	TEST_MODE:   in std_logic;
	TC_S:        out std_logic
);
end component;

component TWO_CNTR
port
 (
	CLK:      in std_logic;
	RESET:    in std_logic;
    C_EN:     in std_logic;
	TC_S:     in std_logic;
	TC_C:     out std_logic
 );
end component;

component T_STATE
port
 (
	CLK:   in std_logic;
	RESET: in std_logic;
	TC_C:  in std_logic;
	C_EN:   out std_logic;
	CONTROL:  out std_logic_vector(4 downto 0)
 );
end component;

signal TC_S_IN: std_logic;
signal TC_C_IN: std_logic;
signal C_EN_IN: std_logic;

begin


S_GEN_MAP: S_GEN port map (CLK, RESET, TEST_MODE, TC_S_IN);

TWO_CNTR_MAP: TWO_CNTR port map (CLK, RESET, C_EN_IN, TC_S_IN, TC_C_IN);

T_STATE_MAP: T_STATE port map (CLK, RESET, TC_C_IN, C_EN_IN, T_CONTROL);

end TRAFIC_ARC;

















