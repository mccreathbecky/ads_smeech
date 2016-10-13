--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:37:14 10/11/2016
-- Design Name:   
-- Module Name:   E:/ADS/SMEECH2/LED_Display_TB.vhd
-- Project Name:  SMEECH2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LED_Display
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY LED_Display_TB IS
END LED_Display_TB;
 
ARCHITECTURE behavior OF LED_Display_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LED_Display
    PORT(
         current_source : IN  std_logic_vector(1 downto 0);
         grid_LED : OUT  std_logic;
         solar_LED : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal current_source : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal grid_LED : std_logic;
   signal solar_LED : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LED_Display PORT MAP (
          current_source => current_source,
          grid_LED => grid_LED,
          solar_LED => solar_LED
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		current_source <= "00";
		wait for 2ns;
		
		current_source <= "10";
		wait for 2ns;
		
		current_source <= "01";
		wait for 2ns;
		
		current_source <= "00";
		wait for 2ns;

      wait;
   end process;

END;
