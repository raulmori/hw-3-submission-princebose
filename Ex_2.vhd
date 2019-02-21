 LIBRARY ieee; 
 USE ieee.std_logic_1164.all;  
 
 entity Ex_2 is  
   port( 
  X,Y,Z : in std_logic_vector(7 downto 0);
  MS : in std_logic_vector(1 downto 0);
  DS,CLK : in std_logic;
  RB,RA :out std_logic_vector(7 downto 0)
  );  
 end Ex_2;
 
 architecture behavioural of Ex_2 is
 signal mux_out, RegA_out, RegB_out : std_logic_vector(7 downto 0);
 signal LDA, LDB : std_logic;
 begin  
    with MS select
    mux_out <= RegB_out when "00",
               Z when "01",
               Y when "10",
               X when "11",    
               "00000000" when others;
               
    RB <= RegB_out;
    RA <= RegA_out;
    
 decoder : process(DS)
            begin
                if (DS = '0') then
                    LDA <= '1';
                    LDB <= '0';
                elsif (DS = '1') then
                    LDA <= '0';
                    LDB <= '1';
                else
                    LDA <= '0';
                    LDB <= '0';
                end if;
 end process; 
        
 reg1: process(CLK)
    begin
        if(falling_edge(CLK)) then
            if (LDA = '1') then
                RegA_out <= mux_out;    
            end if;
        end if;
    end process;
  reg2: process(CLK)
    begin
        if(falling_edge(CLK)) then
            if(LDB = '1') then
                RegB_out <= mux_out;
            end if;
        end if;
    end process;
 end behavioural;  

 
 