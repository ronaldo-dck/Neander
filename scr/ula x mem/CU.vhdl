library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CU is
    port (
        dec2uc: in std_logic_vector(10 downto 0);
        nz: in std_logic_vector(1 downto 0);
        cl, clk: in std_logic;
        barr: out std_logic_vector(10 downto 0)  
    );
end entity CU;


architecture rtl of CU is


    component contador0to7 is
        port (
            pr, rst, clk : in std_logic;
            s : out std_logic_vector(2 downto 0)
        );
    end component contador0to7;

    component NOP is
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
    end component NOP;

    component LDA is
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
    end component LDA;

    component ADD is
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
    end component ADD;

    component op_OR is
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
    end component op_OR;

    component op_AND is
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
    end component op_AND;

    component HLT is
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
    end component HLT;

    component STA is
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
    end component STA;

    component op_NOT is
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
    end component op_NOT;

    component JMP is
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
    end component JMP;

    component JMPCond is
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
    end component JMPCond;
    
    signal ss: std_logic_vector(2 downto 0);
    signal nop2mux, sta2mux, lda2mux, add2mux, and2mux, or2mux, not2mux, jmp2mux, jn2mux, jz2mux, hlt2mux : std_logic_vector(10 downto 0);

    signal instrucaoAtiva : string(1 to 3);
begin
    
    u_contador0to7: contador0to7 port map('1',cl, clk, ss);

    u_nop : NOP port map(ss, nop2mux(0), nop2mux(1), nop2mux(4 downto 2), nop2mux(5), nop2mux(6), nop2mux(7), nop2mux(8), nop2mux(9), nop2mux(10));
    
    u_lda : LDA port map(ss, lda2mux(0), lda2mux(1), lda2mux(4 downto 2), lda2mux(5), lda2mux(6), lda2mux(7), lda2mux(8), lda2mux(9), lda2mux(10));
    
    u_add : ADD port map(ss, add2mux(0), add2mux(1), add2mux(4 downto 2), add2mux(5), add2mux(6), add2mux(7), add2mux(8), add2mux(9), add2mux(10));
    
    u_or : op_OR port map(ss, or2mux(0), or2mux(1), or2mux(4 downto 2), or2mux(5), or2mux(6), or2mux(7), or2mux(8), or2mux(9), or2mux(10));
    
    u_and : op_AND port map(ss, and2mux(0), and2mux(1), and2mux(4 downto 2), and2mux(5), and2mux(6), and2mux(7), and2mux(8), and2mux(9), and2mux(10));
    
    u_hlt : HLT port map(ss, hlt2mux(0), hlt2mux(1), hlt2mux(4 downto 2), hlt2mux(5), hlt2mux(6), hlt2mux(7), hlt2mux(8), hlt2mux(9), hlt2mux(10));
    
    u_sta : STA port map(ss, sta2mux(0), sta2mux(1), sta2mux(4 downto 2), sta2mux(5), sta2mux(6), sta2mux(7), sta2mux(8), sta2mux(9), sta2mux(10));
    
    u_not : op_NOT port map(ss, not2mux(0), not2mux(1), not2mux(4 downto 2), not2mux(5), not2mux(6), not2mux(7), not2mux(8), not2mux(9), not2mux(10));
    
    u_jmp : JMP port map(ss, jmp2mux(0), jmp2mux(1), jmp2mux(4 downto 2), jmp2mux(5), jmp2mux(6), jmp2mux(7), jmp2mux(8), jmp2mux(9), jmp2mux(10));
    
    u_jn : JMPCond port map(ss, nz(1), jn2mux(0), jn2mux(1), jn2mux(4 downto 2), jn2mux(5), jn2mux(6), jn2mux(7), jn2mux(8), jn2mux(9), jn2mux(10));
    
    u_jz : JMPCond port map(ss, nz(0), jz2mux(0), jz2mux(1), jz2mux(4 downto 2), jz2mux(5), jz2mux(6), jz2mux(7), jz2mux(8), jz2mux(9), jz2mux(10));

    barr <= nop2mux when dec2uc = "10000000000" else
            sta2mux when dec2uc = "01000000000" else
            lda2mux when dec2uc = "00100000000" else
            add2mux when dec2uc = "00010000000" else
            and2mux when dec2uc = "00001000000" else
            or2mux  when dec2uc = "00000100000" else
            not2mux when dec2uc = "00000010000" else
            jmp2mux when dec2uc = "00000001000" else
            jn2mux  when dec2uc = "00000000100" else
            jz2mux  when dec2uc = "00000000010" else
            hlt2mux when dec2uc = "00000000001" else
            (others => 'Z');

    instrucaoAtiva <= "NOP" when dec2uc = "10000000000" else
                    "STA" when dec2uc = "01000000000" else
                    "LDA" when dec2uc = "00100000000" else
                    "ADD" when dec2uc = "00010000000" else
                    "OR " when dec2uc = "00001000000" else
                    "AND" when dec2uc = "00000100000" else
                    "NOT" when dec2uc = "00000010000" else
                    "JMP" when dec2uc = "00000001000" else
                    "JN " when dec2uc = "00000000100" else
                    "JZ " when dec2uc = "00000000010" else
                    "HLT" when dec2uc = "00000000001" else 
                    "ERR";
    
end architecture rtl;