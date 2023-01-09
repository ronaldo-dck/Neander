library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity UC is
    port (
        cl, clk: in std_logic;
        barrD: in std_logic_vector(7 downto 0);
        NZ : in std_logic_vector(1 downto 0);
        end_out: out std_logic_vector(7 downto 0);
        barrC: out std_logic_vector(10 downto 0)
    );
end entity UC;

architecture rtl of UC is
    
    
    component decodificador is
        port(
            inst_in  : in std_logic_vector(7 downto 0);
            inst_out : out std_logic_vector(10 downto 0)
        );
    end component;

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

    component CU is
        port (
            dec2uc: in std_logic_vector(10 downto 0);
            nz: in std_logic_vector(1 downto 0);
            cl, clk: in std_logic;
            barr: out std_logic_vector(10 downto 0)  
        );
    end component CU;

    component PC is
    port (
        cl, clk: in std_logic;
        nbarr_inc: in std_logic;
        pc_nrw: in std_logic;
        barr : in std_logic_vector( 7 downto 0);
        end_out : out std_logic_vector(7 downto 0)
    );
    end component PC;

    signal sRI_nrw, snbarr_inc, sPC_nrw: std_logic;
    signal sRI2dec : std_logic_vector(7 downto 0);
    signal sdec2uc, ctrl : std_logic_vector(10 downto 0);

begin
    
    u_RI : regCarga8bit port map (barrD, ctrl(10), '1', cl, clk, sRI2dec);
    u_decodificador : decodificador port map(sRI2dec, sdec2uc);
    u_CU : CU port map(sdec2uc, NZ, cl, clk, ctrl);
    u_PC : PC port map(cl, clk, ctrl(0), ctrl(5), barrD, end_out);
    
    barrC <= ctrl;
    
end architecture rtl;