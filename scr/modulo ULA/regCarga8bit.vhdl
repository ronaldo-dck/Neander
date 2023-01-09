library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity regCarga8bit is
    port (
        d: in std_logic_vector(7 downto 0);
        nrw: in std_logic;
        pr: in std_logic;
        cl: in std_logic;
        clk: in std_logic;
        s: out std_logic_vector(7 downto 0)
    );
end entity regCarga8bit;

architecture rtl of regCarga8bit is

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
    

    gen_regCarga8bit : for i in 0 to 7 generate

        u_reg: regCarga1bit port map(d(i), nrw, pr, cl, clk, s(i));

    end generate gen_regCarga8bit;
    
    
end architecture rtl;