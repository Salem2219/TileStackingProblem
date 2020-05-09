library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity sub8 is
    port (a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end sub8;

architecture rtl of sub8 is
signal y_uns : unsigned(7 downto 0);
begin
y_uns <= unsigned(a) - unsigned(b);
y <= std_logic_vector(y_uns);
end rtl;
