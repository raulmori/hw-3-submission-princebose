 LIBRARY ieee; 
 USE ieee.std_logic_1164.all;  
 
 entity Ex_4 is  
   port( 
  X,Y : in std_logic_vector(7 downto 0);
  RD, S0, S1, LDA, LDB, CLK : in std_logic;
  RA, RB :out std_logic_vector(7 downto 0)
  );  
 end Ex_4;

 architecture behavioural of Ex_4 is
 signal mux1_out, mux2_out, RegB_out : std_logic_vector(7 downto 0);
 signal RA_Enable, RB_Enable : std_logic;
 
 begin  
    RB <= RegB_out;
    RA_Enable <= RD AND LDA;
    RB_Enable <= (NOT RD) AND LDB;
    
    with S1 select
    mux1_out <= Y when '0',
                X when '1',
                "00000000" when others;
    
    with S0 select
    mux2_out <= Y when '0',
                RegB_out when '1',
                "00000000" when others;
    
 reg1: process(CLK)
    begin
        if(falling_edge(CLK)) then
            if (RB_Enable = '1') then
                RegB_out <= mux1_out;    
            end if;
        end if;
    end process;
    
  reg2: process(CLK)
    begin
        if(falling_edge(CLK)) then
            if(RA_Enable = '1') then
                RA <= mux2_out;
            end if;
        end if;
    end process;
 end behavioural;  

 
 