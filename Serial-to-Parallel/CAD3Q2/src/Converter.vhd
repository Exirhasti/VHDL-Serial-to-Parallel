library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SerialToParallel is
    Port (
        Reset   : in  std_logic;
        Clk     : in  std_logic;
        DataIn  : in  std_logic;
        Start   : in  std_logic;
        Pattern : in  std_logic_vector(7 downto 0);
        DataOut : out std_logic_vector(7 downto 0);
        Valid   : out std_logic;
        Found   : out std_logic
    );
end SerialToParallel;

architecture Arch of SerialToParallel is
    signal ShiftReg : std_logic_vector(7 downto 0) := (others => '0');
    signal BitCount : integer range 0 to 7 := 0;
    signal Active   : std_logic := '0';
begin
    process(Clk, Reset)
    begin
        if Reset = '1' then
            ShiftReg <= (others => '0');
            BitCount <= 0;
            Active <= '0';
            DataOut <= (others => '0');
            Valid <= '0';
            Found <= '0';
        elsif rising_edge(Clk) then
            if Start = '1' and Active = '0' then
                Active <= '1';
            end if;

            if Active = '1' then

                ShiftReg <= DataIn & ShiftReg(7 downto 1);
                if BitCount = 7 then
                    BitCount <= 0;
                    Active <= '0';
                    DataOut <= ShiftReg;
                    Valid <= '1';
                    if ShiftReg = Pattern then
                        Found <= '1';
                    else
                        Found <= '0';
                    end if;
                else
                    BitCount <= BitCount + 1;
                    Valid <= '0';
                end if;
            end if;
        end if;
    end process;
end Arch;
