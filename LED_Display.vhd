----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:04 10/11/2016 
-- Design Name: 
-- Module Name:    LED_Display - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED_Display is
    Port (
			  current_source 	: in   STD_LOGIC_VECTOR (1 downto 0);
           GreenLed 	 		: out  STD_LOGIC;			-- Grid LED
           RedLed	    		: out  STD_LOGIC);			-- Solar LED
			  --EppAstb, EppDstb, EppWr : in std_logic;
			  --EppWait : out std_logic;
			  --EppDB : in std_logic_vector (7 downto 0));
			  
end LED_Display;

architecture Behavioral of LED_Display is

begin


PROCESS (current_source)
BEGIN
	case current_source is
		WHEN "01" =>
			GreenLed <= '1';
			RedLed <= '0';
		WHEN "10" =>
			RedLed <= '1';
			GreenLed <= '0';
		WHEN OTHERS =>
			RedLed <= '0';
			GreenLed <= '0';
	END CASE;
END PROCESS;

end Behavioral;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

PACKAGE LED_Package IS
   COMPONENT LED_Display 
       Port (
              current_source 	: in   STD_LOGIC_VECTOR (1 downto 0);
              GreenLed 	 		: out  STD_LOGIC;			-- Grid LED
              RedLed	    		: out  STD_LOGIC);			-- Solar LED
              --EppAstb, EppDstb, EppWr : in std_logic;
              --EppWait : out std_logic;
              --EppDB : in std_logic_vector (7 downto 0));
              
   end COMPONENT;
END LED_PACKAGE;









--	
---- Wait Signal
--
--EppWait <= '1' when EppAstb = '0' or EppDstb = '0' else '0';
--
---- EPP Address Recieve
--
--process (EppAstb)
--begin
--	if rising_edge(EppAstb) then
--		if EppWr = '0' then
--			regEppAdr <= EppDB;
--		end if;
--	end if;
--end process;
--
---- EPP Data Recieve
--
--process (EppDstb)
--begin
--if rising_edge(EppDstb) then
--	if EppWr = '0' then
--		if regEppAdr = X"00" then
--			reg0 <= EppDB;
--		end if;
--	end if;
--end if;
--
--end process;

--with reg0 select 
--	GreenLed <= '1' when "00000001";
--	GreenLed <=	'0' when others;
--
--with reg0 select
--	RedLed <= '1' when "00000010";
--	RedLed <= '0' when others;

	--display_process: PROCESS(current_source)
	--BEGIN
		--IF current_source(1) = '1' THEN
			--GreenLed <= '0';
			--RedLed <= '1';
		--ELSIF current_source(0) = '1' THEN
			--GreenLed <= '1';
			--RedLed <= '0';
		--ELSE
			--RedLed <= '0';
			--GreenLed <= '0';
		--END IF;		
	--END PROCESS;
