library ieee;
use ieee.std_logic_1164.all;

entity decodificador is
  port(
    inst_in  : in std_logic_vector(7 downto 0);
    inst_out : out std_logic_vector(10 downto 0)
  );
end entity;

architecture behavior of decodificador is
begin
  inst_out <= "10000000000" when inst_in="00000000" else 
              "01000000000" when inst_in="00010000" else 
              "00100000000" when inst_in="00100000" else 
              "00010000000" when inst_in="00110000" else 
              "00001000000" when inst_in="01000000" else 
              "00000100000" when inst_in="01010000" else 
              "00000010000" when inst_in="01100000" else 
              "00000001000" when inst_in="10000000" else 
              "00000000100" when inst_in="10010000" else 
              "00000000010" when inst_in="10100000" else 
              "00000000001" when inst_in="11110000" else
                (others => 'Z'); 
end architecture;
