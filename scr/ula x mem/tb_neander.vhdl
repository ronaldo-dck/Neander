library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity tb_neander is
end entity tb_neander;

architecture neandro of tb_neander is
    constant clkperiod : time := 20 ns;
    

    component neander is
        port (
            cl, clk: in std_logic
        );
    end component neander;
    
    signal scl  : std_logic; 
    signal sclk : std_logic := '0';
begin
    sclk <= not(sclk) after clkperiod / 2;

    u_neander : neander port map(scl, sclk);

    u_tb : process 
    begin
        scl <= '0';
        wait for clkperiod;
        scl <= '1';



        
        wait;
    end process;
        
end architecture neandro;