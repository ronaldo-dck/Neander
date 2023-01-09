library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity detector is
    port (
        data_in: in std_logic_vector(7 downto 0);
        nz: out std_logic_vector(1 downto 0)
    );
end entity detector;

architecture rtl of detector is
    
begin
    
    nz(1) <= data_in(7);
    nz(0) <= not(data_in(7) or data_in(6) or data_in(5) or data_in(4) or data_in(3) or data_in(2) or data_in(1) or data_in(0));
    
end architecture rtl;