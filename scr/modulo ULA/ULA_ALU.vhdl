library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ULA_ALU is
    port (
        x: in std_logic_vector(7 downto 0);
        y: in std_logic_vector(7 downto 0);
        op: in std_logic_vector(2 downto 0);
        s: out std_logic_vector(7 downto 0);
        nz: out std_logic_vector(1 downto 0)
    );
end entity ULA_ALU;

architecture rtl of ULA_ALU is

    component mux5x8 is
        port (
            c0: in std_logic_vector(7 downto 0);
            c1: in std_logic_vector(7 downto 0);
            c2: in std_logic_vector(7 downto 0);
            c3: in std_logic_vector(7 downto 0);
            c4: in std_logic_vector(7 downto 0);
    
            sel: in std_logic_vector(2 downto 0);
            z: out std_logic_vector(7 downto 0)
        );
    end component mux5x8;

    component ops is
        port (
            x: in std_logic_vector(7 downto 0);
            y: in std_logic_vector(7 downto 0);
            mnot: out std_logic_vector(7 downto 0);
            mand: out std_logic_vector(7 downto 0);
            mor: out std_logic_vector(7 downto 0);
            madd: out std_logic_vector(7 downto 0)
        );
    end component ops;

    component detector is
        port (
            data_in: in std_logic_vector(7 downto 0);
            nz: out std_logic_vector(1 downto 0)
        );
    end component detector;
    
    signal snot, sand, sor, sadd, s_resultado: std_logic_vector(7 downto 0);

begin
   
    u_ops: ops port map(x,y, snot, sand, sor, sadd);
    u_mux5x8: mux5x8 port map(y, sadd, sor, sand, snot, op, s_resultado);
    u_detector: detector port map(s_resultado, nz);

    s <= s_resultado;
    
    
end architecture rtl;