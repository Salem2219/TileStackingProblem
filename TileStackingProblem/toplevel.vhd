library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, start : in std_logic;
    n, m, k : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
end toplevel;

architecture rtl of toplevel is
component dp is
    port (clk, rst, i_ld, j_ld : std_logic;
    sel : in std_logic_vector(1 downto 0);
    wr : in std_logic_vector(3 downto 0);
    n, m, k : in std_logic_vector(3 downto 0);
    x : out std_logic_vector(2 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component ctrl is
  port(clk,rst, start: in std_logic;
      x : in std_logic_vector(2 downto 0);
       i_ld, j_ld : out std_logic;
       sel : out std_logic_vector(1 downto 0);
       wr : out std_logic_vector(3 downto 0));
end component;
signal i_ld, j_ld : std_logic;
signal sel : std_logic_vector(1 downto 0);
signal x : std_logic_vector(2 downto 0);
signal wr : std_logic_vector(3 downto 0);
begin
    datapath : dp port map (clk, rst, i_ld, j_ld, sel, wr, n, m, k, x, y);
    control : ctrl port map (clk, rst, start, x, i_ld, j_ld, sel, wr);
end rtl;