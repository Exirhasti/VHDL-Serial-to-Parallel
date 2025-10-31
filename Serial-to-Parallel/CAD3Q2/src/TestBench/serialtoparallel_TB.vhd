library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity serialtoparallel_tb is
end serialtoparallel_tb;

architecture TB_ARCHITECTURE of serialtoparallel_tb is
	-- Component declaration of the tested unit
	component serialtoparallel
	port(
		Reset : in STD_LOGIC;
		Clk : in STD_LOGIC;
		DataIn : in STD_LOGIC;
		Start : in STD_LOGIC;
		Pattern : in STD_LOGIC_VECTOR(7 downto 0);
		DataOut : out STD_LOGIC_VECTOR(7 downto 0);
		Valid : out STD_LOGIC;
		Found : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Reset : STD_LOGIC:='0';
	signal Clk : STD_LOGIC:='0';
	signal DataIn : STD_LOGIC:='0';
	signal Start : STD_LOGIC:='0';
	signal Pattern : STD_LOGIC_VECTOR(7 downto 0):="10101010";
	-- Observed signals - signals mapped to the output ports of tested entity
	signal DataOut : STD_LOGIC_VECTOR(7 downto 0);
	signal Valid : STD_LOGIC;
	signal Found : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : serialtoparallel
		port map (
			Reset => Reset,
			Clk => Clk,
			DataIn => DataIn,
			Start => Start,
			Pattern => Pattern,
			DataOut => DataOut,
			Valid => Valid,
			Found => Found
		);
		
				Clk <= not Clk after 10ns;
	
	process
    begin

        Reset <= '1';
        wait for 20 ns;
        Reset <= '0'; 
		wait until rising_edge(Clk);
		
		Start <= '1';
        wait until rising_edge(Clk);
        --Start <= '1';  
		
		DataIn <= '1'; wait until rising_edge(Clk);
        DataIn <= '0'; wait until rising_edge(Clk);
        DataIn <= '1'; wait until rising_edge(Clk);
        DataIn <= '0'; wait until rising_edge(Clk);
        DataIn <= '1'; wait until rising_edge(Clk);
        DataIn <= '0'; wait until rising_edge(Clk);
        DataIn <= '1'; wait until rising_edge(Clk);
        DataIn <= '0'; wait until rising_edge(Clk);	 
		
		wait;
    end process;

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_serialtoparallel of serialtoparallel_tb is
	for TB_ARCHITECTURE
		for UUT : serialtoparallel
			use entity work.serialtoparallel(arch);
		end for;
	end for;
end TESTBENCH_FOR_serialtoparallel;

