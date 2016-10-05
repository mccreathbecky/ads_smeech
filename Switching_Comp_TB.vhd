--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:04:17 10/05/2016
-- Design Name:   
-- Module Name:   C:/Users/mccre/OneDrive/Documents/2016/Uni/ADS/Project/SMEECH2/Switching_Comp_TB.vhd
-- Project Name:  SMEECH2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Monitoring_Comp
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
USE ieee.numeric_std.ALL;
 
ENTITY Switching_Comp_TB IS
END Switching_Comp_TB;
 
ARCHITECTURE behavior OF Switching_Comp_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Monitoring_Comp
    PORT(
         CLK_SampleRate : IN  std_logic;
         solar_in : IN  std_logic_vector(12 downto 0);
         manual_control : IN  std_logic;
         current_source : INOUT  std_logic_vector(1 downto 0);
         battery_sum : INOUT  std_logic_vector(13 downto 0);
         sum_flag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_SampleRate : std_logic := '0';
   signal solar_in : std_logic_vector(12 downto 0) := (others => '0');
   signal manual_control : std_logic := '0';

	--BiDirs
   signal current_source : std_logic_vector(1 downto 0);
   signal battery_sum : std_logic_vector(13 downto 0);

 	--Outputs
   signal sum_flag : std_logic;

   -- Clock period definitions
   constant CLK_SampleRate_period : time := 2 min;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Monitoring_Comp PORT MAP (
          CLK_SampleRate => CLK_SampleRate,
          solar_in => solar_in,
          manual_control => manual_control,
          current_source => current_source,
          battery_sum => battery_sum,
          sum_flag => sum_flag
        );

   -- Clock process definitions
   CLK_SampleRate_process :process
   begin
		CLK_SampleRate <= '0';
		wait for CLK_SampleRate_period/2;
		CLK_SampleRate <= '1';
		wait for CLK_SampleRate_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
      manual_control <= '0';                       -- manual control OFF
      solar_in <= "0101110111000";                 -- 3000Wh
      current_source <= "00";                      -- none
      battery_sum <= "00011111010000";             -- 20%

      wait;
   end process;

END;
