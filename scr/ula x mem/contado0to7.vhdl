library ieee;
use ieee.std_logic_1164.all;

entity contador0to7 is
    port (
        pr, rst, clk : in std_logic;
        s : out std_logic_vector(2 downto 0)
    );
end entity contador0to7;

architecture conta of contador0to7 is

    component ffjk is
        port(
            j, k   : in  std_logic;
            clk  : in  std_logic;
            pr, cl : in  std_logic;
            q, nq  : out std_logic
        );
    end component ffjk;

    signal sj, sk, sq, snq : std_logic_vector(2 downto 0);
begin

    s <= sq;

    u_ffjk2 : ffjk port map(sj(2), sk(2), clk, pr, rst, sq(2), snq(2));
    u_ffjk1 : ffjk port map(sj(1), sk(1), clk, pr, rst, sq(1), snq(1));
    u_ffjk0 : ffjk port map(sj(0), sk(0), clk, pr, rst, sq(0), snq(0));

    sj(2) <= sq(1) and sq(0);
    sk(2) <= sq(1) and sq(0);

    sj(1) <= sq(0);
    sk(1) <= sq(0);
    
    sj(0) <= '1';
    sk(0) <= '1';
    
end architecture conta;