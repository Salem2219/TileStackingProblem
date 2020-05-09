library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, i_ld, j_ld : std_logic;
    sel : in std_logic_vector(1 downto 0);
    wr : in std_logic_vector(3 downto 0);
    n, m, k : in std_logic_vector(3 downto 0);
    x : out std_logic_vector(2 downto 0);
    y : out std_logic_vector(7 downto 0));
end dp;

architecture rtl of dp is
component comp0 is
    port (
    i, n : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;
component dp_ram is
port(clk, x3: in std_logic;
wr : in std_logic_vector(2 downto 0);
i, j, k, m, n : in std_logic_vector(3 downto 0);
presum1, presum2 : in std_logic_vector(7 downto 0);
y, dpij : out std_logic_vector(7 downto 0));
end component;
component compgr is
    port (
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;
component reg4 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end component;
component mux4 is
    port (s : in std_logic;
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component plus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component presum_ram is
port(clk : in std_logic;
wr : in std_logic_vector(2 downto 0);
i, j, k : in std_logic_vector(3 downto 0);
dpij : in std_logic_vector(7 downto 0);
presum1, presum2 : out std_logic_vector(7 downto 0));
end component;
signal x3 : std_logic;
signal dp_wr : std_logic_vector(2 downto 0);
signal i, j, i_in, j_in, zeroorone, iplus1, jplus1 : std_logic_vector(3 downto 0);
signal presum1, presum2, dpij : std_logic_vector(7 downto 0);
begin
    dp_wr <= wr(3) & wr(1 downto 0);
    x0_comp : comp0 port map (i, n, x(0));
    x1_comp : comp0 port map (i, m, x(1));
    x2_comp : comp0 port map (j, n, x(2));
    dpRam : dp_ram port map (clk, x3, dp_wr, i, j, k, m, n, presum1, presum2, y, dpij);
    x3_comp : compgr port map (j, k, x3);
    i_reg : reg4 port map (clk, rst, i_ld, i_in, i);
    j_reg : reg4 port map (clk, rst, j_ld, j_in, j);
    i_mux : mux4 port map (sel(1), zeroorone, iplus1, i_in);
    j_mux : mux4 port map (sel(0), "0001", jplus1, j_in);
    zero_mux : mux4 port map (sel(0), "0001", "0000", zeroorone);
    i_op : plus1 port map (i, iplus1);
    j_op : plus1 port map (j, jplus1);
    presumRam : presum_ram port map (clk, wr(2 downto 0), i, j, k, dpij, presum1, presum2);
end rtl;