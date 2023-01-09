----- NOP -------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NOP is
    port (
        c: in std_logic_vector(2 downto 0);
        barr_inc: out std_logic;
        barr_PC: out std_logic;
        ULA_op: out std_logic_vector(2 downto 0);
        PC_nrw: out std_logic;
        AC_nrw: out std_logic;
        MEM_nrw: out std_logic;
        REM_nrw: out std_logic;
        RDM_nrw: out std_logic;
        RI_nrw: out std_logic
    );
end entity NOP;

architecture rtl of NOP is
    
begin
    
    barr_inc <= '1';
    barr_PC <= '1';
    ULA_op <= "000";
    PC_nrw <= not(c(2)) and not(c(1)) and c(0);
    AC_nrw <= '0';
    MEM_nrw <= '0';
    REM_nrw <= not(c(2)) and not(c(1)) and not(c(0));
    RDM_nrw <= not(c(2)) and not(c(1)) and c(0);
    RI_nrw <= not(c(2)) and c(1) and not(c(0));
    
    
end architecture rtl;


----- LDA -------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity LDA is
    port (
        c: in std_logic_vector(2 downto 0);
        barr_inc: out std_logic;
        barr_PC: out std_logic;
        ULA_op: out std_logic_vector(2 downto 0);
        PC_nrw: out std_logic;
        AC_nrw: out std_logic;
        MEM_nrw: out std_logic;
        REM_nrw: out std_logic;
        RDM_nrw: out std_logic;
        RI_nrw: out std_logic
    );
end entity LDA;

architecture rtl of LDA is
    
begin
    
    barr_inc <= '1';
    barr_PC <= not(c(2)) or c(1) or not(c(0));
    ULA_op <= "000";
    PC_nrw <= not(c(1)) and (c(2) xor c(0));
    AC_nrw <= c(2) and c(1) and c(0);
    MEM_nrw <= '0';
    REM_nrw <= (not(c(1)) and (c(2) xnor c(0))) or (not(c(2)) and c(1) and c(0));
    RDM_nrw <= (c(2) and not(c(0))) or (not(c(2)) and not(c(1)) and c(0));
    RI_nrw <= not(c(2)) and c(1) and not(c(0));
    
end architecture rtl;


----- ADD -------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ADD is
    port (
        c: in std_logic_vector(2 downto 0);
        barr_inc: out std_logic;
        barr_PC: out std_logic;
        ULA_op: out std_logic_vector(2 downto 0);
        PC_nrw: out std_logic;
        AC_nrw: out std_logic;
        MEM_nrw: out std_logic;
        REM_nrw: out std_logic;
        RDM_nrw: out std_logic;
        RI_nrw: out std_logic
    );
end entity ADD;

architecture rtl of ADD is
    
begin
    
    barr_inc <= '1';
    barr_PC <= not(c(2)) or c(1) or not(c(0));
    ULA_op <= "001";
    PC_nrw <= not(c(1)) and (c(2) xor c(0));
    AC_nrw <= c(2) and c(1) and c(0);
    MEM_nrw <= '0';
    REM_nrw <= (not(c(1)) and (c(2) xnor c(0))) or (not(c(2)) and c(1) and c(0));
    RDM_nrw <= (c(2) and not(c(0))) or (not(c(2)) and not(c(1)) and c(0));
    RI_nrw <= not(c(2)) and c(1) and not(c(0));
    
end architecture rtl;

----- op_OR -------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity op_OR is
    port (
        c: in std_logic_vector(2 downto 0);
        barr_inc: out std_logic;
        barr_PC: out std_logic;
        ULA_op: out std_logic_vector(2 downto 0);
        PC_nrw: out std_logic;
        AC_nrw: out std_logic;
        MEM_nrw: out std_logic;
        REM_nrw: out std_logic;
        RDM_nrw: out std_logic;
        RI_nrw: out std_logic
    );
end entity op_OR;

architecture rtl of op_OR is
    
begin
    
    barr_inc <= '1';
    barr_PC <= not(c(2)) or c(1) or not(c(0));
    ULA_op <= "010";
    PC_nrw <= not(c(1)) and (c(2) xor c(0));
    AC_nrw <= c(2) and c(1) and c(0);
    MEM_nrw <= '0';
    REM_nrw <= (not(c(1)) and (c(2) xnor c(0))) or (not(c(2)) and c(1) and c(0));
    RDM_nrw <= (c(2) and not(c(0))) or (not(c(2)) and not(c(1)) and c(0));
    RI_nrw <= not(c(2)) and c(1) and not(c(0));
    
end architecture rtl;

----- op_AND -------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity op_AND is
    port (
        c: in std_logic_vector(2 downto 0);
        barr_inc: out std_logic;
        barr_PC: out std_logic;
        ULA_op: out std_logic_vector(2 downto 0);
        PC_nrw: out std_logic;
        AC_nrw: out std_logic;
        MEM_nrw: out std_logic;
        REM_nrw: out std_logic;
        RDM_nrw: out std_logic;
        RI_nrw: out std_logic
    );
end entity op_AND;


architecture rtl of op_AND is
    
begin
    
    barr_inc <= '1';
    barr_PC <= not(c(2)) or c(1) or not(c(0));
    ULA_op <= "011";

    PC_nrw <= not(c(1)) and (c(2) xor c(0));
    AC_nrw <= c(2) and c(1) and c(0);
    MEM_nrw <= '0';
    REM_nrw <= (not(c(1)) and (c(2) xnor c(0))) or (not(c(2)) and c(1) and c(0));
    RDM_nrw <= (c(2) and not(c(0))) or (not(c(2)) and not(c(1)) and c(0));
    RI_nrw <= not(c(2)) and c(1) and not(c(0));
    
end architecture rtl;



----- HLT -------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity HLT is
    port (
        c: in std_logic_vector(2 downto 0);
        barr_inc: out std_logic;
        barr_PC: out std_logic;
        ULA_op: out std_logic_vector(2 downto 0);
        PC_nrw: out std_logic;
        AC_nrw: out std_logic;
        MEM_nrw: out std_logic;
        REM_nrw: out std_logic;
        RDM_nrw: out std_logic;
        RI_nrw: out std_logic
    );
end entity HLT;


architecture rtl of HLT is
    
begin
    
    barr_inc <= '0';
    barr_PC <= '0';
    ULA_op <= "000";
    PC_nrw <= '0';
    AC_nrw <= '0';
    MEM_nrw <= '0';
    REM_nrw <= '0';
    RDM_nrw <= '0';
    RI_nrw <= '0';
    
end architecture rtl;


----- STA -------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity STA is
    port (
        c: in std_logic_vector(2 downto 0);
        barr_inc: out std_logic;
        barr_PC: out std_logic;
        ULA_op: out std_logic_vector(2 downto 0);
        PC_nrw: out std_logic;
        AC_nrw: out std_logic;
        MEM_nrw: out std_logic;
        REM_nrw: out std_logic;
        RDM_nrw: out std_logic;
        RI_nrw: out std_logic
    );
end entity STA;

architecture rtl of STA is
    
begin
    
    barr_inc <= '1';
    barr_PC <= not(c(2)) or c(1) or not(c(0));
    ULA_op <= "000";
    PC_nrw <= not(c(1)) and (c(2) xor c(0));
    AC_nrw <= '0';
    MEM_nrw <= c(2) and c(1) and not(c(0));
    REM_nrw <= (not(c(1)) and (c(2) xnor c(0))) or (not(c(2)) and c(1) and c(0));
    RDM_nrw <= not(c(1)) and (c(2) xor c(0));
    RI_nrw <= not(c(2)) and c(1) and not(c(0));
    
end architecture rtl;

----- NOT -------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity op_NOT is
    port (
        c: in std_logic_vector(2 downto 0);
        barr_inc: out std_logic;
        barr_PC: out std_logic;
        ULA_op: out std_logic_vector(2 downto 0);
        PC_nrw: out std_logic;
        AC_nrw: out std_logic;
        MEM_nrw: out std_logic;
        REM_nrw: out std_logic;
        RDM_nrw: out std_logic;
        RI_nrw: out std_logic
    );
end entity op_NOT;

architecture rtl of op_NOT is
    
begin
    
    barr_inc <= '1';
    barr_PC <= '1';
    ULA_op <= "100";
    PC_nrw <= not(c(2)) and not(c(1)) and c(0);
    AC_nrw <= c(2) and c(1) and c(0);
    MEM_nrw <= '0';
    REM_nrw <= not(c(2)) and not(c(1)) and not(c(0));
    RDM_nrw <= not(c(2)) and not(c(1)) and c(0);
    RI_nrw <= not(c(2)) and c(1) and not(c(0));
    
end architecture rtl;

----- JMP -------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity JMP is
    port (
        c: in std_logic_vector(2 downto 0);
        barr_inc: out std_logic;
        barr_PC: out std_logic;
        ULA_op: out std_logic_vector(2 downto 0);
        PC_nrw: out std_logic;
        AC_nrw: out std_logic;
        MEM_nrw: out std_logic;
        REM_nrw: out std_logic;
        RDM_nrw: out std_logic;
        RI_nrw: out std_logic
    );
end entity JMP;

architecture rtl of JMP is
    
begin
    
    barr_inc <= not(c(2)) or c(1) or not(c(0));
    barr_PC <= '1';
    ULA_op <= "000";
    PC_nrw <= not(c(1)) and c(0);
    AC_nrw <= '0';
    MEM_nrw <= '0';
    REM_nrw <= not(c(2)) and (c(1) xnor c(0));
    RDM_nrw <= not(c(1)) and (c(2) xor c(0));
    RI_nrw <= not(c(2)) and c(1) and not(c(0));
    
end architecture rtl;

----- JMPCond -------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity JMPCond is
    port (
        c: in std_logic_vector(2 downto 0);
        sel: in std_logic;
        barr_inc: out std_logic;
        barr_PC: out std_logic;
        ULA_op: out std_logic_vector(2 downto 0);
        PC_nrw: out std_logic;
        AC_nrw: out std_logic;
        MEM_nrw: out std_logic;
        REM_nrw: out std_logic;
        RDM_nrw: out std_logic;
        RI_nrw: out std_logic
    );
end entity JMPCond;

architecture rtl of JMPCond is

    signal Tbarr_inc, Tbarr_PC, TPC_nrw, TAC_nrw, TMEM_nrw, TREM_nrw, TRDM_nrw, TRI_nrw : std_logic;
    signal TULA_op : std_logic_vector(2 downto 0);
begin
    
    barr_inc <= not(c(2)) or c(1) or not(c(0)) when sel='1' else '1';
    barr_PC <= '1';
    ULA_op <= "000";
    PC_nrw <= (not(c(1)) and c(0)) when sel='1' else (not(c(2)) and c(1) and c(0)) when sel='1' else (not(c(2)) and c(0));
    AC_nrw <= '0';
    MEM_nrw <= '0';
    REM_nrw <= not(c(2)) and (c(1) xnor c(0)) when sel='1' else (not(c(2)) and not(c(1)) and not(c(0)));
    RDM_nrw <= not(c(1)) and (c(2) xor c(0)) when sel='1' else (not(c(2)) and not(c(1)) and c(0));
    RI_nrw <= not(c(2)) and c(1) and not(c(0));
    
end architecture rtl;
