-- Author Prathamesh Ovalekar
-- 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity prob1 is

port(	clk_100mhz :in std_logic;
		an:out unsigned (7 downto 0);
		a_to_g: out unsigned(6 downto 0);
		
end entity;

------------------------------------------------------
-----------------------------------------------------
		
architecture behave of prob1 is


signal count : integer :=1;
signal count_num:unsigned(2 downto 0):="000";

signal shift : std_logic:='0';
signal direction :std_logic:='1';
signal shift_reg: unsigned (7 downto 0):="11111110";
signal temp :unsigned(0 downto 0);

begin

---------------------------------------------------
--Process for generating shift signal after 500msec

process(clk_100mhz) 
	begin
		if(clk_100mhz'event and clk_100mhz='1') then
			count <=count+1;
			if(count = 25000000) then
				shift <= not shift;
				count <=1;
			end if;
		end if;
end process;


------------------------------------------------
------- Process for generating direction -------
---------- using clk of 500msec ----------------

	process(shift)
	begin
		if (shift'event and shift='1') then
			count_num <= count_num + "001";
			if (count_num="110") then
				direction<= not direction;
				count_num<="000";
			end if;
		end if;
	end process;	
		
--------------------------------------------------------
--------------------------------------------------------
-------- Shift register of 8 bit for an(7 downto 0)-----


process(shift)
begin
	if (shift'event and shift='1') then
		if (direction = '1') then
		
			shift_reg<=shift_reg(6 downto 0)& shift_reg(7);
		
		elsif (direction = '0') then
		
			shift_reg<=shift_reg(0) & shift_reg(7 downto 1); 

		end if;
		
	end if;
end process;	

an<=shift_reg;
-----------------------------------------------------------
-----------------------------------------------------------
a_to_g<="1111110";---- to display "-" on the 7segment 

------------------------------------------------------------

end behave;
			
