library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PC is
    port (
        cl, clk: in std_logic;
        nbarr_inc: in std_logic;
        pc_nrw: in std_logic;
        barr : in std_logic_vector( 7 downto 0);
        end_out : out std_logic_vector(7 downto 0)
    );
end entity PC;

architecture rtl of PC is
    


    component f_adder8bits is
        port(
            A : in std_logic_vector(7 downto 0);
            B : in std_logic_vector(7 downto 0);
            Cin: in std_logic;
            Cout: out std_logic;
            R: out std_logic_vector(7 downto 0)
        );
    end component f_adder8bits;


component mux2x8 is
    port (
        c0: in std_logic_vector(7 downto 0);
        c1: in std_logic_vector(7 downto 0);
        sel: in std_logic;
        z: out std_logic_vector(7 downto 0)
    );
end component mux2x8;

component regCarga8bit is
    port (
        d: in std_logic_vector(7 downto 0);
        nrw: in std_logic;
        pr: in std_logic;
        cl: in std_logic;
        clk: in std_logic;
        s: out std_logic_vector(7 downto 0)
    );
end component regCarga8bit;


signal sadd, s_mux2pc, s_pcatual: std_logic_vector(7 downto 0);
signal scout: std_logic;
begin
    
    u_mux2x8: mux2x8 port map(barr, sadd, nbarr_inc, s_mux2pc);
    u_reg_pc: regCarga8bit port map(s_mux2pc, pc_nrw, '1', cl, clk, s_pcatual);
    u_f_adder8bits: f_adder8bits port map("00000001", s_pcatual, '0', scout,sadd);
    
        end_out <= s_pcatual;

end architecture rtl;


