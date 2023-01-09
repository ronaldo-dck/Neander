library IEEE;
use IEEE.std_logic_1164.all;

entity mux2x8 is
    port (
        c0: in std_logic_vector(7 downto 0);
        c1: in std_logic_vector(7 downto 0);
        sel: in std_logic;
        z: out std_logic_vector(7 downto 0)
    );
end entity mux2x8;

architecture rtl of mux2x8 is
    
begin
    
    z <= c0 when sel='0' else c1;
    
end architecture rtl;