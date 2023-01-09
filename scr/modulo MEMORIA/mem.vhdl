library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mem is
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
end entity mem;

architecture rtl of mem is

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
    

    component as_ram is
        port(
            addr  : in    std_logic_vector(7 downto 0);
            data  : inout std_logic_vector(7 downto 0);
            notrw : in    std_logic;
            reset : in    std_logic;
            clk   : in    std_logic
        );
    end component as_ram;
    

    signal s_mux2rem, s_rem2mem, s_mem2rdm, s_rdm2barr : std_logic_vector(7 downto 0);

begin
    
    interface_barramento <= s_rdm2barr when MEM_nrw = '0' else (others => 'Z');
    s_mem2rdm <= interface_barramento when MEM_nrw = '1' else (others => 'Z');
    
    u_mux2x8 : mux2x8 port map(end_Barr, end_PC, nbarr_PC, s_mux2rem);

    u_rem : regCarga8bit port map(s_mux2rem, REM_nrw, '1', cl, clk, s_rem2mem);

    u_mem : as_ram port map(s_rem2mem, s_mem2rdm, MEM_nrw, cl, clk);

    u_rdm : regCarga8bit port map(s_mem2rdm, RDM_nrw, '1', cl, clk, s_rdm2barr);
    
    
end architecture rtl;