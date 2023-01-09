library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ULA is
    port (
        mem_nrw, cl, clk, AC_nrw: in std_logic;
        ULA_op: in std_logic_vector(2 downto 0);
        barramento: inout std_logic_vector(7 downto 0);
        flags: out std_logic_vector(1 downto 0)
    );
end entity ULA;

architecture rtl of ULA is

    component ULA_ALU is
        port (
            x: in std_logic_vector(7 downto 0);
            y: in std_logic_vector(7 downto 0);
            op: in std_logic_vector(2 downto 0);
            s: out std_logic_vector(7 downto 0);
            nz: out std_logic_vector(1 downto 0)
        );
    end component ULA_ALU;

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

    component regCarga2bit is
        port (
            d: in std_logic_vector(1 downto 0);
            nrw: in std_logic;
            pr: in std_logic;
            cl: in std_logic;
            clk: in std_logic;
            s: out std_logic_vector(1 downto 0)
        );
    end component regCarga2bit;
    
    signal s_ac2ula, s_ula2ac, s_mux2ula : std_logic_vector(7 downto 0);
    signal s_ac2flag : std_logic_vector(1 downto 0);

begin
    

    barramento<= s_ac2ula when mem_nrw='1' else (others =>'Z');
    
    u_ula_alu : ULA_ALU port map(s_ac2ula, barramento, ULA_op, s_ula2ac, s_ac2flag);
 
    u_ac : regCarga8bit port map(s_ula2ac, AC_nrw, '1', cl, clk, s_ac2ula);

    u_flags : regCarga2bit port map(s_ac2flag, AC_nrw, '1', cl, clk, flags);


end architecture rtl;