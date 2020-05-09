library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity comp0 is
    port (
    i, n : in std_logic_vector(3 downto 0);
    y : out std_logic);
end comp0;

architecture rtl of comp0 is
signal nplus1 : unsigned(3 downto 0);
begin
    nplus1 <= unsigned(n) + 1;
    y <= '1' when unsigned(i) < nplus1 else '0';
end rtl;
