library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity op1 is
    port (j, k : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end op1;

architecture rtl of op1 is
signal y_uns : unsigned(3 downto 0);
begin
y_uns <= unsigned(j) - unsigned(k) - 1;
y <= std_logic_vector(y_uns);
end rtl;
