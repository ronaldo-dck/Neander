library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux2x8z is
    port (
        a: in std_logic_vector(7 downto 0);
        b: in std_logic_vector(7 downto 0);
        sel: in std_logic;
        z: out std_logic_vector(7 downto 0)
    );
end entity mux2x8z;

architecture rtl of mux2x8z is
    
begin
    
    z<=a when sel='0' else (others =>'Z');
    
end architecture rtl;