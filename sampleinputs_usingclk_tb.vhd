--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:15:39 10/19/2016
-- Design Name:   
-- Module Name:   C:/Users/mccre/OneDrive/Documents/2016/Uni/ADS/Project/usb_smeech/sampleinputs_usingclk_tb.vhd
-- Project Name:  SMEECH2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SampleInputs_usingclk
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
 
ENTITY sampleinputs_usingclk_tb IS
END sampleinputs_usingclk_tb;
 
ARCHITECTURE behavior OF sampleinputs_usingclk_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SampleInputs_usingclk
    PORT(
         CLK : IN  std_logic;
         solar_in : OUT  std_logic_vector(9 downto 0);
         consumption_in : OUT  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

 	--Outputs
   signal solar_in : std_logic_vector(9 downto 0);
   signal consumption_in : std_logic_vector(10 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SampleInputs_usingclk PORT MAP (
          CLK => CLK,
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
 

END;
