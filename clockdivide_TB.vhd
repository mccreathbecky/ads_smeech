--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:55:29 10/19/2016
-- Design Name:   
-- Module Name:   C:/Users/mccre/OneDrive/Documents/2016/Uni/ADS/Project/usb_smeech/clockdivide_TB.vhd
-- Project Name:  SMEECH2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clockdivide
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
 
ENTITY clockdivide_TB IS
END clockdivide_TB;
 
ARCHITECTURE behavior OF clockdivide_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clockdivide
    PORT(
         CLK : in  STD_LOGIC;
           CLK_div : out  STD_LOGIC;
           CLK_halfsec : out STD_LOGIC;
           CLK_SSD : out STD_LOGIC
         
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

 	--Outputs
   signal CLK_div : std_logic;
   signal CLK_halfsec : std_logic;
   signal CLK_ssd : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clockdivide PORT MAP (
          CLK => CLK,
          CLK_div => CLK_div,
          CLK_halfsec => CLK_halfsec,
          CLK_ssd => CLK_ssd
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
