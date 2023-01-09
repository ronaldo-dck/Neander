library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity regCarga1bit is
    port (
        d: in std_logic;
        nrw: in std_logic;
        pr: in std_logic;
        cl: in std_logic;
        clk: in std_logic;
        s: out std_logic
    );
end entity regCarga1bit;

architecture rtl of regCarga1bit is


    component ffd is
        port(
            d      : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
        );
    end component;
    
    component mux2x1 is
        port (
            c0: in std_logic;
            c1: in std_logic;
            sel: in std_logic;
            z: out std_logic
        );
    end component mux2x1;

    signal datain, dataout, snq: std_logic;

begin
    
    s<= dataout;

    u_mux2x1: mux2x1 port map(dataout, d, nrw, datain);
    u_ffd: ffd port map(datain, clk, pr, cl, dataout, snq);


    
    
end architecture rtl;