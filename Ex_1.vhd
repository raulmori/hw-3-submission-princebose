 LIBRARY ieee; 
 USE ieee.std_logic_1164.all;  
 
 entity Ex_1 is  
   port( 
  A,B : in std_logic_vector(7 downto 0);  
  SEL,LDA,CLK : in std_logic;
  F :out std_logic_vector(7 downto 0)
  );  
 end Ex_1;
 
 architecture behavioural of Ex_1 is
 signal mux_out : std_logic_vector(7 downto 0);
   
 begin  
    with SEL select
    mux_out <= A when '1',
               B when '0',
               "00000000" when others;
    ra: process(CLK)
    begin
        if(rising_edge(CLK)) then
            if (LDA = '1') then
                F <= mux_out;
            end if;
        end if;
    end process;

 end behavioural;  

 
 