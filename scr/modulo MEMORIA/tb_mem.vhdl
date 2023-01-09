library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_mem is
end entity tb_mem;

architecture testa of tb_mem is
    constant clk_period : time := 20 ns;
    
    component mem is
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
    end component mem;

    signal snbarr_PC, sREM_nrw, sMEM_nrw, sRDM_nrw : std_logic;
    signal scl: std_logic := '1';
    signal sclk: std_logic := '0';
    signal send_PC, send_Barr, sinterface_barramento : std_logic_vector(7 downto 0);

begin
    
    sclk <= not(sclk) after clk_period/2;

    u_mem : mem port map(snbarr_PC, sREM_nrw, sMEM_nrw, sRDM_nrw, scl, sclk, send_PC, send_Barr, sinterface_barramento);

    u_tb : process 
    begin
        scl <= '0';
        wait for clk_period;

        scl <= '1';
        snbarr_PC <= '0';
        send_Barr <= "00000000";
        sREM_nrw <= '1';
        wait for clk_period;

        sREM_nrw <= '0';
        sMEM_nrw <= '0';
        sRDM_nrw <= '1';
        wait for clk_period;

        sRDM_nrw <= '0';
        sinterface_barramento <= (others => 'Z');
        wait for clk_period;


        send_Barr <= "10000000";
        sREM_nrw <= '1';
        wait for clk_period;
        
        sREM_nrw <= '0';
        sMEM_nrw <= '1';
        sinterface_barramento <= "01010101";
        wait for clk_period;
     
         sinterface_barramento <= (others => 'Z');
        sMEM_nrw <= '0';
        sRDM_nrw <= '1';
        wait for clk_period;

        sRDM_nrw <= '0';
       
        wait for clk_period;


    wait;
    end process;
    
end architecture testa;