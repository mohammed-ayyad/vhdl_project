library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Vhdl1 is
port (
 clk: in std_logic; 
 reset: in std_logic; 
 sequence_in: in std_logic;
 pattern: in std_logic_vector(3 downto 0); 
 output: out std_logic 
);
end Vhdl1;

architecture arch1 of Vhdl1 is
type fsm is (state_0,state_1, state_2, state_3, state_4);
signal current_state, next_state: fsm;


begin
	process(clk,reset)
	begin
		 if(reset='1') then
		  current_state <= state_0;
		 elsif(rising_edge(clk)) then
		  current_state <= next_state;
		 end if;
	end process;
	process(current_state,sequence_in,pattern)
	begin
		 case(current_state) is
		 when state_0 =>
		  if(sequence_in=pattern(3)) then
			next_state <= state_1;
		  else
			next_state <= state_0;
		  end if;
		 when state_1 =>
		  if(sequence_in=pattern(2)) then
			next_state <= state_2;
		  else
				if(sequence_in=pattern(3)) then
					next_state <= state_1;
				else
					next_state <= state_0;
				end if;	
		  end if;  
		 when state_2 => 
		  if(sequence_in=pattern(1)) then
			next_state <= state_3;
		  else
				if(sequence_in=pattern(3)) then
					next_state <= state_1;
				else
					next_state <= state_0;
				end if;
		  end if;  
		 when state_3 =>
		  if(sequence_in=pattern(0)) then
			next_state <= state_4;
		  else
				if(sequence_in=pattern(3)) then
					next_state <= state_1;
				else
					next_state <= state_0;
				end if;
		  end if; 
		 when state_4 =>
			if(sequence_in=pattern(3)) then
				next_state <= state_1;
			else
				next_state <= state_0;
			end if;
		 
		 end case;
	end process;
	process(current_state)
	begin 
		 case current_state is
		 when state_0 =>
		  output <= '0';
		 when state_1 =>
		  output <= '0'; 
		 when state_2 => 
		  output <= '0'; 
		 when state_3 =>
		  output <= '0'; 
		 when state_4 =>
		  output <= '1';
		 end case;
	end process;
end arch1;