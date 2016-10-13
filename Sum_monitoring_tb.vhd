--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:02:15 10/07/2016
-- Design Name:   
-- Module Name:   C:/Users/mccre/OneDrive/Documents/2016/Uni/ADS/Project/SMEECH2/Sum_monitoring_tb.vhd
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
USE ieee.numeric_std.ALL;
 
ENTITY Sum_monitoring_tb IS
END Sum_monitoring_tb;
 
ARCHITECTURE behavior OF Sum_monitoring_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sum_Monitoring
    PORT(
         sum_flag : IN  std_logic;
         battery_sum : INOUT  std_logic_vector(10 downto 0);
         consumption_sum : INOUT  std_logic_vector(12 downto 0);
         solar_sum : INOUT  std_logic_vector(11 downto 0);
         CLK : IN  std_logic;
         current_source : IN  std_logic_vector(1 downto 0);
         consumption : IN  std_logic_vector(10 downto 0);
         solar_in : IN  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal current_source : std_logic_vector(1 downto 0) := (others => '0');
   signal consumption : std_logic_vector(10 downto 0) := (others => '0');
   signal solar_in : std_logic_vector(9 downto 0) := (others => '0');
   signal sum_flag : std_logic := '0';

	--BiDirs

   signal battery_sum : std_logic_vector(10 downto 0);
   signal consumption_sum : std_logic_vector(12 downto 0);
   signal solar_sum : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sum_Monitoring PORT MAP (
          sum_flag => sum_flag,
          battery_sum => battery_sum,
          consumption_sum => consumption_sum,
          solar_sum => solar_sum,
          CLK => CLK,
          current_source => current_source,
          consumption => consumption,
          solar_in => solar_in
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
   stim_proc: PROCESS
   BEGIN		
      sum_flag <= '0';
      current_source <= "10" ;               --solar
      consumption <= "00000111010" ;    
      solar_in <= "1101010010";
   
      battery_sum <= "01111101000";          --1000Wh
      consumption_sum <= "0000011111010";
      solar_sum <= "001101010010";
      
      wait for 5ns;
      sum_flag <= '1';
      

      WAIT;
   END PROCESS;

END;
