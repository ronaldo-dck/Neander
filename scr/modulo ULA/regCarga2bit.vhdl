library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity regCarga2bit is
    port (
        d: in std_logic_vector(1 downto 0);
        nrw: in std_logic;
        pr: in std_logic;
        cl: in std_logic;
        clk: in std_logic;
        s: out std_logic_vector(1 downto 0)
    );
end entity regCarga2bit;

architecture rtl of regCarga2bit is

    component regCarga1bit is
        port (
            d: in std_logic;
            nrw: in std_logic;
            pr: in std_logic;
            cl: in std_logic;
            clk: in std_logic;
            s: out std_logic
        );
    end component regCarga1bit;



begin
    


    u_regz: regCarga1bit port map(d(0), nrw, cl, pr, clk, s(0));
    u_regn: regCarga1bit port map(d(1), nrw, pr, cl, clk, s(1));
    
    
end architecture rtl;