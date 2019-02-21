 LIBRARY ieee; 
 USE ieee.std_logic_1164.all;  
 
 entity Ex_3 is  
   port( 
  X,Y : in std_logic_vector(7 downto 0);
  S0, S1, LDA, LDB, CLK : in std_logic;
  RB :out std_logic_vector(7 downto 0)
  );  
 end Ex_3;
 
 architecture behavioural of Ex_3 is
 signal mux1_out, mux2_out , RegA_out, RegB_out : std_logic_vector(7 downto 0);
 
 begin  
    RB <= RegB_out;
    with S1 select
    mux1_out <= RegB_out when '0',
               X when '1',
               "00000000" when others;
    
    with S0 select
    mux2_out <= Y when '0',
                RegA_out when '1',
                "00000000" when others;
    
 reg1: process(CLK)
    begin
        if(rising_edge(CLK)) then
            if (LDA = '1') then
                RegA_out <= mux1_out;    
            end if;
        end if;
    end process;
  reg2: process(CLK)
    begin
        if(rising_edge(CLK)) then
            if(LDB = '1') then
                RegB_out <= mux2_out;
            end if;
        end if;
    end process;
 end behavioural;  

 
 