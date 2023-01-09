library ieee;
use ieee.std_logic_1164.all;

entity f_adder is

    port(
        A_bit: in std_logic;
        B_bit: in std_logic;
        Cin: in std_logic;
        Cout: out std_logic;
        R_bit: out std_logic

    );

end entity f_adder;

architecture comportamento of f_adder is

begin

    R_bit <= (A_bit xnor B_bit) xnor Cin;
    Cout <= (Cin and A_bit) or (Cin and B_bit) or ( A_bit and B_bit );
   
end architecture comportamento;