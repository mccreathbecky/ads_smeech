--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:44:32 10/11/2016
-- Design Name:   
-- Module Name:   E:/ADS/SMEECH2/sum_tb2.vhd
-- Project Name:  SMEECH2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sum_Monitoring
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
 
ENTITY sum_tb2 IS
END sum_tb2;
 
ARCHITECTURE behavior OF sum_tb2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sum_Monitoring
    PORT(
         sum_flag : IN  std_logic;
         current_source : IN  std_logic_vector(1 downto 0);
         consumption_in : IN  std_logic_vector(10 downto 0);
         solar_in : IN  std_logic_vector(9 downto 0);
         percent_battery : OUT  std_logic_vector(9 downto 0);
         percent_solar : OUT  std_logic_vector(9 downto 0);
         total_consumption : OUT  std_logic_vector(12 downto 0);
         total_generated : OUT  std_logic_vector(12 downto 0);
         switching_flag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sum_flag : std_logic := '0';
   signal current_source : std_logic_vector(1 downto 0) := (others => '0');
   signal consumption_in : std_logic_vector(10 downto 0) := (others => '0');
   signal solar_in : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal percent_battery : std_logic_vector(9 downto 0);
   signal percent_solar : std_logic_vector(9 downto 0);
   signal total_consumption : std_logic_vector(12 downto 0);
   signal total_generated : std_logic_vector(12 downto 0);
   signal switching_flag : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sum_Monitoring PORT MAP (
          sum_flag => sum_flag,
          current_source => current_source,
          consumption_in => consumption_in,
          solar_in => solar_in,
          percent_battery => percent_battery,
          percent_solar => percent_solar,
          total_consumption => total_consumption,
          total_generated => total_generated,
          switching_flag => switching_flag
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
