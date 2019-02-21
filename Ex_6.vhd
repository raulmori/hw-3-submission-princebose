LIBRARY ieee; 
USE ieee.std_logic_1164.all;  

entity Ex_6 is  
  port( 
 A,B,C : in std_logic_vector(7 downto 0);
 SEL1, SEL2, CLK : in std_logic;
 RBP,RAP :out std_logic_vector(7 downto 0)
 );  
end Ex_6;

architecture behavioural of Ex_6 is
signal mux_out : std_logic_vector(7 downto 0);
signal LDA, LDB : std_logic;
begin  
   with SEL1 select
   mux_out <= B when '0',
              A when '1',    
              "00000000" when others;
              
decoder : process(SEL2)
           begin
               if (SEL2 = '0') then
                   LDB <= '1';
                   LDA <= '0';
               elsif (SEL2 = '1') then
                   LDB <= '0';
                   LDA <= '1';
               else
                   LDA <= '0';
                   LDB <= '0';
               end if;
end process; 
       
reg1: process(CLK)
   begin
       if(rising_edge(CLK)) then
           if (LDA = '1') then
               RAP <= mux_out;    
           end if;
       end if;
   end process;
   
 reg2: process(CLK)
   begin
       if(rising_edge(CLK)) then
           if(LDB = '1') then
               RBP <= C;
           end if;
       end if;
   end process;
end behavioural;  