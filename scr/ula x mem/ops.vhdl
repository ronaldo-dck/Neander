library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ops is
    port (
        x: in std_logic_vector(7 downto 0);
        y: in std_logic_vector(7 downto 0);
        mnot: out std_logic_vector(7 downto 0);
        mand: out std_logic_vector(7 downto 0);
        mor: out std_logic_vector(7 downto 0);
        madd: out std_logic_vector(7 downto 0)
    );
end entity ops;

architecture rtl of ops is



component f_adder8bits is

    port(
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        Cin: in std_logic;
        Cout: out std_logic;
        R: out std_logic_vector(7 downto 0)
    );
    
    end component f_adder8bits;
    
    signal scout: std_logic;

begin

    u_add: f_adder8bits port map(x,y, '0', scout, madd);
    
    mnot <= not(x);

    mand <= x and y;

    mor <= x or y;



end architecture rtl;