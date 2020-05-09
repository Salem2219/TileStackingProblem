library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb is
end tb ;

architecture behav of tb is
  constant clockperiod: time:= 0.1 ns;
  signal clk: std_logic:='0';
  signal rst,start: std_logic;
  signal n, m, k : std_logic_vector(3 downto 0);
  signal y : std_logic_vector (7 downto 0);
  component toplevel
     port (clk, rst, start : in std_logic;
    n, m, k : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
  end component ;
  begin
    clk <= not clk after clockperiod /2;
    rst <= '1' , '0' after 0.1 ns;
    start <= '0' , '1' after 0.1 ns, '0' after 0.5 ns;
    n <= "0011"; -- 3
    m <= "0011"; -- 3
    k <= "0010"; -- 2
    dut: toplevel port map(clk,rst,start, n, m, k, y);
  end behav;