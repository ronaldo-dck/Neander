library ieee;
use ieee.std_logic_1164.all;



entity f_adder8bits is

port(
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    Cin: in std_logic;
    Cout: out std_logic;
    R: out std_logic_vector(7 downto 0)
);

end entity f_adder8bits;



architecture comportamento of f_adder8bits is 


component f_adder is

    port(
        A_bit: in std_logic;
        B_bit: in std_logic;
        Cin: in std_logic;
        Cout: out std_logic;
        R_bit: out std_logic
    );

end component f_adder;
signal sA, sB, sR: std_logic_vector(7 downto 0);
signal sCout_0, sCout_1, sCout_2, sCout_3, sCout_4, sCout_5, sCout_6: std_logic;

begin

U_f_adder0: f_adder port map(A(0), B(0), Cin, sCout_0, R(0));
U_f_adder1: f_adder port map(A(1), B(1), sCout_0, sCout_1, R(1));
U_f_adder2: f_adder port map(A(2), B(2), sCout_1, sCout_2, R(2));
U_f_adder3: f_adder port map(A(3), B(3), sCout_2, sCout_3, R(3));
U_f_adder4: f_adder port map(A(4), B(4), sCout_3, sCout_4, R(4));
U_f_adder5: f_adder port map(A(5), B(5), sCout_4, sCout_5, R(5));
U_f_adder6: f_adder port map(A(6), B(6), sCout_5, sCout_6, R(6));
U_f_adder7: f_adder port map(A(7), B(7), sCout_6, Cout, R(7));



    end architecture comportamento;