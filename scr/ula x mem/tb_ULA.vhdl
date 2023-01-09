library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_ULA is
end entity tb_ULA;

architecture teste of tb_ULA is
    constant clk_period : time := 20 ns;

    component ULA is
        port (
            mem_nrw, cl, clk, AC_nrw : in std_logic;
            ULA_op : in std_logic_vector(2 downto 0);
            barramento : inout std_logic_vector(7 downto 0);
            flags : out std_logic_vector(1 downto 0)
        );
    end component ULA;

    signal scl, sclk : std_logic := '0';
    signal smemnrw, sacnrw : std_logic;
    signal sula_op : std_logic_vector(2 downto 0);
    signal sbarramento : std_logic_vector(7 downto 0);
    signal sflags : std_logic_vector(1 downto 0);
begin

    sclk <= not(sclk) after clk_period/2;

    u_ula : ula port map(smemnrw, scl, sclk, sacnrw, sula_op, sbarramento, sflags);

    u_tb : process
    begin --clear

        --TESTE NOT
        wait for clk_period; ------entra dados com LDA na ula, AC escrevendo
        scl <= '1';

        smemnrw <= '0';
        sacnrw <= '1';
        sula_op <= "000";
        sbarramento <= "00001000";

        wait for clk_period; -- AC envia pra ula em NOT
        sacnrw <= '0';
        sula_op <= "100";
        
        wait for clk_period; --ac registra resultado do NOT da ula
        sacnrw <= '1';
        
        wait for clk_period; --reseta barramento e ac envia os dados para a memória
        sbarramento <= (others => 'Z');
        sacnrw <= '0';
        smemnrw <= '1';


        --TESTE AND
        wait for clk_period; --entra dados com LDA na ula, AC escrevendo    
        smemnrw <= '0';
        sacnrw <= '1';
        sula_op <= "000";
        sbarramento <= "11111111";

        wait for clk_period; --carrega barramento e AC envia pra ula em AND
        sbarramento <= "00010010";
        sacnrw <= '0';
        sula_op <= "011";

        wait for clk_period; --ac registra resultado do AND da ula
        sacnrw <= '1';

        wait for clk_period; --reseta barramento e ac envia os dados para a memória
        sbarramento <= (others => 'Z');
        sacnrw <= '0';
        smemnrw <= '1';


        --TESTE OR
        wait for clk_period; --entra dados com LDA na ula, AC escrevendo    
        smemnrw <= '0';
        sacnrw <= '1';
        sula_op <= "000";
        sbarramento <= "11111111";

        wait for clk_period; --carrega barramento e AC envia pra ula em AND
        sbarramento <= "00010010";
        sacnrw <= '0';
        sula_op <= "010";

        wait for clk_period; --ac registra resultado do AND da ula
        sacnrw <= '1';

        wait for clk_period; --reseta barramento e ac envia os dados para a memória
        sbarramento <= (others => 'Z');
        sacnrw <= '0';
        smemnrw <= '1';

        --TESTE ADD
        wait for clk_period; --entra dados com LDA na ula, AC escrevendo    
        smemnrw <= '0';
        sacnrw <= '1';
        sula_op <= "000";
        sbarramento <= "11111111";

        wait for clk_period; --carrega barramento e AC envia pra ula em AND
        sbarramento <= "00010010";
        sacnrw <= '0';
        sula_op <= "001";

        wait for clk_period; --ac registra resultado do AND da ula
        sacnrw <= '1';

        wait for clk_period; --reseta barramento e ac envia os dados para a memória
        sbarramento <= (others => 'Z');
        sacnrw <= '0';
        smemnrw <= '1';

        wait;
    end process;

end architecture teste;