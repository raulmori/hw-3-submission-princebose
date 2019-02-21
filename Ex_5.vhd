 LIBRARY ieee; 
USE ieee.std_logic_1164.all;  

entity Ex_5 is  
  port( 
 A,B,C : in std_logic_vector(7 downto 0);
 SL1, SL2, CLK : in std_logic;
 RBX,RAX :out std_logic_vector(7 downto 0)
 );  
end Ex_5;

architecture behavioural of Ex_5 is
signal mux_out : std_logic_vector(7 downto 0);
signal LDA, LDB : std_logic;
begin  
   with SL2 select
   mux_out <= C when '0',
              B when '1',    
              "00000000" when others;
              
decoder : process(SL1)
           begin
               if (SL1 = '0') then
                   LDB <= '1';
                   LDA <= '0';
               elsif (SL1 = '1') then
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
               RAX <= A;    
           end if;
       end if;
   end process;
   
 reg2: process(CLK)
   begin
       if(rising_edge(CLK)) then
           if(LDB = '1') then
               RBX <= mux_out;
           end if;
       end if;
   end process;
end behavioural;  