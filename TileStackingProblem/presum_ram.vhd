library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity presum_ram is
port(clk : in std_logic;
wr : in std_logic_vector(2 downto 0);
i, j, k : in std_logic_vector(3 downto 0);
dpij : in std_logic_vector(7 downto 0);
presum1, presum2 : out std_logic_vector(7 downto 0));
end presum_ram;
architecture rtl of presum_ram is
component adder8 is
    port (a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component minus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component op1 is
    port (j, k : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
type ram_type is array (0 to 15, 0 to 15) of
std_logic_vector(7 downto 0);
signal presum: ram_type := (others => (others => (others => '0')));
signal jminus1, iminus1, jkminus1 : std_logic_vector(3 downto 0);
signal dppluspresum, presum3 : std_logic_vector(7 downto 0);
begin
j_op : minus1 port map (j, jminus1);
i_op : minus1 port map (i, iminus1);
jk_op : op1 port map (j, k, jkminus1);
presum3 <= presum(conv_integer(unsigned(i)), conv_integer(unsigned(jminus1)));
pij_op : adder8 port map (dpij, presum3, dppluspresum);
process(clk)
begin
if (rising_edge(clk)) then
if (wr = "001") then
presum(0, conv_integer(unsigned(i))) <= "00000001";
elsif (wr = "010") then
presum(conv_integer(unsigned(i)), 0) <= "00000001";
elsif (wr = "100") then
presum(conv_integer(unsigned(i)), conv_integer(unsigned(j))) <= dppluspresum;
end if;
end if;
end process;
presum1 <= presum(conv_integer(unsigned(iminus1)), conv_integer(unsigned(j)));
presum2 <= presum(conv_integer(unsigned(iminus1)), conv_integer(unsigned(jkminus1)));
end rtl;