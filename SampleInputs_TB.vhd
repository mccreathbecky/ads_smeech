--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:49:21 10/19/2016
-- Design Name:   
-- Module Name:   C:/Users/mccre/OneDrive/Documents/2016/Uni/ADS/Project/usb_smeech/SampleInputs_TB.vhd
-- Project Name:  SMEECH2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SampleInputs
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
 
ENTITY SampleInputs_TB IS
END SampleInputs_TB;
 
ARCHITECTURE behavior OF SampleInputs_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SampleInputs
    PORT(
         CLK : IN  std_logic;
         CLK_sampleRate : OUT  std_logic;
         solar_in : OUT  std_logic_vector(9 downto 0);
         consumption_in : OUT  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

 	--Outputs
   signal CLK_sampleRate : std_logic;
   signal solar_in : std_logic_vector(9 downto 0);
   signal consumption_in : std_logic_vector(10 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns; -- 100 000 000MHz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SampleInputs PORT MAP (
          CLK => CLK,
          CLK_sampleRate => CLK_sampleRate,
          solar_in => solar_in,
          consumption_in => consumption_in
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait;
   end process;

END;