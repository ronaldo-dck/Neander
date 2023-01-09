library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity neander is
    port (
        cl, clk: in std_logic
    );
end entity neander;

architecture rtl of neander is
    

    component ULA is
        port (
            mem_nrw, cl, clk, AC_nrw: in std_logic;
            ULA_op: in std_logic_vector(2 downto 0);
            barramento: inout std_logic_vector(7 downto 0);
            flags: out std_logic_vector(1 downto 0)
        );
    end component ULA;

    component mem is
        port (
            nbarr_PC: in std_logic;
            REM_nrw: in std_logic;
            MEM_nrw: in std_logic;
            RDM_nrw: in std_logic;
            cl, clk: in std_logic;
            end_PC: in std_logic_vector(7 downto 0);
            end_Barr: in std_logic_vector(7 downto 0);
            interface_barramento: inout std_logic_vector(7 downto 0)
        );
    end component mem;

    component UC is
        port (
            cl, clk: in std_logic;
            barrD: in std_logic_vector(7 downto 0);
            NZ : in std_logic_vector(1 downto 0);
            end_out: out std_logic_vector(7 downto 0);
            barrC: out std_logic_vector(10 downto 0)
        );
    end component UC;

    signal sNZ : std_logic_vector(1 downto 0);
    signal barramentoD, spc2mem : std_logic_vector(7 downto 0);
    signal ctrl : std_logic_vector(10 downto 0);
begin
    u_ULA : ULA port map(ctrl(7), cl, clk, ctrl(6), ctrl(4 downto 2), barramentoD, sNZ);
    u_MEM : mem port map(ctrl(1), ctrl(8), ctrl(7), ctrl(9), cl, clk, spc2mem, barramentoD, barramentoD);
    u_UC : UC port map(cl, clk, barramentoD, sNZ, spc2mem, ctrl);
    
    
end architecture rtl;