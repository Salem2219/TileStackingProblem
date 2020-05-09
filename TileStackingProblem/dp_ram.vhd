library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp_ram is
port(clk, x3: in std_logic;
wr : in std_logic_vector(2 downto 0);
i, j, k, m, n : in std_logic_vector(3 downto 0);
presum1, presum2 : in std_logic_vector(7 downto 0);
y, dpij : out std_logic_vector(7 downto 0));
end dp_ram;
architecture rtl of dp_ram is
component mux8 is
    port (s : in std_logic;
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component sub8 is
    port (a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
type ram_type is array (0 to 15, 0 to 15) of
std_logic_vector(7 downto 0);
signal dp: ram_type:= (others => (others => (others => '0')));
signal dp_in, p1minusp2 : std_logic_vector(7 downto 0);
begin
presum_sub : sub8 port map (presum1, presum2, p1minusp2);
dp_mux : mux8 port map (x3, presum1, p1minusp2, dp_in);
process(clk)
begin
if (rising_edge(clk)) then
if (wr = "001") then
dp(0, conv_integer(unsigned(i))) <= (others => '0');
elsif (wr = "010") then
dp(conv_integer(unsigned(i)), 0) <= "00000001";
elsif (wr = "100") then
dp(conv_integer(unsigned(i)), conv_integer(unsigned(j))) <= dp_in;
end if;
end if;
end process;
y <= dp(conv_integer(unsigned(m)), conv_integer(unsigned(n)));
dpij <= dp(conv_integer(unsigned(i)), conv_integer(unsigned(j)));
end rtl;