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
    Port ( current_source 	: in   STD_LOGIC_VECTOR (1 downto 0);
           grid_LED 	 		: out  STD_LOGIC;
           solar_LED 		: out  STD_LOGIC);
end LED_Display;

architecture Behavioral of LED_Display is

begin

	display_process: PROCESS(current_source)
	BEGIN	
		IF current_source = "10" THEN
			solar_LED <= '1';
			grid_LED <= '0';
		ELSIF current_source = "01" THEN
			grid_LED <= '1';
			solar_LED <= '0';
		ELSE
			solar_LED <= '0';
			grid_LED <= '0';
		END IF;		
	END PROCESS;
end Behavioral;

