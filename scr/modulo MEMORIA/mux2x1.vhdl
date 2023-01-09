library IEEE;
use IEEE.std_logic_1164.all;

entity mux2x1 is
    port (
        c0: in std_logic;
        c1: in std_logic;
        sel: in std_logic;
        z: out std_logic
    );
end entity mux2x1;

architecture rtl of mux2x1 is
    
begin
    
    z <= c0 when sel='0' else c1;
    
end architecture rtl;