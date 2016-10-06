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
--http://stackoverflow.com/questions/1510633/vhdl-how-to-set-a-value-on-an-inout-port
--http://www.textfixer.com/tools/remove-white-spaces.php
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
         solar_in : IN  std_logic_vector(9 downto 0);
         manual_control : IN  std_logic;
         battery_sum : IN  std_logic_vector(13 downto 0);
         current_source : OUT  std_logic_vector(1 downto 0);
         sum_flag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_SampleRate : std_logic := '0';
   signal solar_in : std_logic_vector(9 downto 0) := (others => '0');
   signal manual_control : std_logic := '0';
   signal battery_sum : std_logic_vector(13 downto 0) := "00011111010000";

 	--Outputs
   signal current_source : std_logic_vector(1 downto 0);
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
      battery_sum <= "00011111010000";             

      wait;
   end process;
   
   solar_sim : PROCESS
   BEGIN
      solar_in <="0000101100";
      wait for CLK_SampleRate_period;
      solar_in <="0000101110";
      wait for CLK_SampleRate_period;
      solar_in <="0000110000";
      wait for CLK_SampleRate_period;
      solar_in <="0000110011";
      wait for CLK_SampleRate_period;
      solar_in <="0000110101";
      wait for CLK_SampleRate_period;
      solar_in <="0000111000";
      wait for CLK_SampleRate_period;
      solar_in <="0000111010";
      wait for CLK_SampleRate_period;
      solar_in <="0000111101";
      wait for CLK_SampleRate_period;
      solar_in <="0000111111";
      wait for CLK_SampleRate_period;
      solar_in <="0001000010";
      wait for CLK_SampleRate_period;
      solar_in <="0001000100";
      wait for CLK_SampleRate_period;
      solar_in <="0001000111";
      wait for CLK_SampleRate_period;
      solar_in <="0001001001";
      wait for CLK_SampleRate_period;
      solar_in <="0001001100";
      wait for CLK_SampleRate_period;
      solar_in <="0001001110";
      wait for CLK_SampleRate_period;
      solar_in <="0001010001";
      wait for CLK_SampleRate_period;
      solar_in <="0001100111";
      wait for CLK_SampleRate_period;
      solar_in <="0001111101";
      wait for CLK_SampleRate_period;
      solar_in <="0010010011";
      wait for CLK_SampleRate_period;
      solar_in <="0010101001";
      wait for CLK_SampleRate_period;
      solar_in <="0010111111";
      wait for CLK_SampleRate_period;
      solar_in <="0011010101";
      wait for CLK_SampleRate_period;
      solar_in <="0011101011";
      wait for CLK_SampleRate_period;
      solar_in <="0100000010";
      wait for CLK_SampleRate_period;
      solar_in <="0100011000";
      wait for CLK_SampleRate_period;
      solar_in <="0100101110";
      wait for CLK_SampleRate_period;
      solar_in <="0101000100";
      wait for CLK_SampleRate_period;
      solar_in <="0101011010";
      wait for CLK_SampleRate_period;
      solar_in <="0101110000";
      wait for CLK_SampleRate_period;
      solar_in <="0110000110";
      wait for CLK_SampleRate_period;
      solar_in <="0110011100";
      wait for CLK_SampleRate_period;
      solar_in <="0110100110";
      wait for CLK_SampleRate_period;
      solar_in <="0110110000";
      wait for CLK_SampleRate_period;
      solar_in <="0110111001";
      wait for CLK_SampleRate_period;
      solar_in <="0111000011";
      wait for CLK_SampleRate_period;
      solar_in <="0111001100";
      wait for CLK_SampleRate_period;
      solar_in <="0111010110";
      wait for CLK_SampleRate_period;
      solar_in <="0111011111";
      wait for CLK_SampleRate_period;
      solar_in <="0111101001";
      wait for CLK_SampleRate_period;
      solar_in <="0111110010";
      wait for CLK_SampleRate_period;
      solar_in <="0111111100";
      wait for CLK_SampleRate_period;
      solar_in <="1000000101";
      wait for CLK_SampleRate_period;
      solar_in <="1000001111";
      wait for CLK_SampleRate_period;
      solar_in <="1000011000";
      wait for CLK_SampleRate_period;
      solar_in <="1000100010";
      wait for CLK_SampleRate_period;
      solar_in <="1000101100";
      wait for CLK_SampleRate_period;
      solar_in <="1000111000";
      wait for CLK_SampleRate_period;
      solar_in <="1001000101";
      wait for CLK_SampleRate_period;
      solar_in <="1001010010";
      wait for CLK_SampleRate_period;
      solar_in <="1001011111";
      wait for CLK_SampleRate_period;
      solar_in <="1001101100";
      wait for CLK_SampleRate_period;
      solar_in <="1001111001";
      wait for CLK_SampleRate_period;
      solar_in <="1010000110";
      wait for CLK_SampleRate_period;
      solar_in <="1010010011";
      wait for CLK_SampleRate_period;
      solar_in <="1010100000";
      wait for CLK_SampleRate_period;
      solar_in <="1010101101";
      wait for CLK_SampleRate_period;
      solar_in <="1010111010";
      wait for CLK_SampleRate_period;
      solar_in <="1011000111";
      wait for CLK_SampleRate_period;
      solar_in <="1011010100";
      wait for CLK_SampleRate_period;
      solar_in <="1011100001";
      wait for CLK_SampleRate_period;
      solar_in <="1011101101";
      wait for CLK_SampleRate_period;
      solar_in <="1011101110";
      wait for CLK_SampleRate_period;
      solar_in <="1011101111";
      wait for CLK_SampleRate_period;
      solar_in <="1011110000";
      wait for CLK_SampleRate_period;
      solar_in <="1011110001";
      wait for CLK_SampleRate_period;
      solar_in <="1011110010";
      wait for CLK_SampleRate_period;
      solar_in <="1011110011";
      wait for CLK_SampleRate_period;
      solar_in <="1011110100";
      wait for CLK_SampleRate_period;
      solar_in <="1011110100";
      wait for CLK_SampleRate_period;
      solar_in <="1011110101";
      wait for CLK_SampleRate_period;
      solar_in <="1011110110";
      wait for CLK_SampleRate_period;
      solar_in <="1011110111";
      wait for CLK_SampleRate_period;
      solar_in <="1011111000";
      wait for CLK_SampleRate_period;
      solar_in <="1011111001";
      wait for CLK_SampleRate_period;
      solar_in <="1011111010";
      wait for CLK_SampleRate_period;
      solar_in <="1011111010";
      wait for CLK_SampleRate_period;
      solar_in <="1011111111";
      wait for CLK_SampleRate_period;
      solar_in <="1100000100";
      wait for CLK_SampleRate_period;
      solar_in <="1100001000";
      wait for CLK_SampleRate_period;
      solar_in <="1100001101";
      wait for CLK_SampleRate_period;
      solar_in <="1100010001";
      wait for CLK_SampleRate_period;
      solar_in <="1100010110";
      wait for CLK_SampleRate_period;
      solar_in <="1100011010";
      wait for CLK_SampleRate_period;
      solar_in <="1100011111";
      wait for CLK_SampleRate_period;
      solar_in <="1100100011";
      wait for CLK_SampleRate_period;
      solar_in <="1100101000";
      wait for CLK_SampleRate_period;
      solar_in <="1100101100";
      wait for CLK_SampleRate_period;
      solar_in <="1100110001";
      wait for CLK_SampleRate_period;
      solar_in <="1100110101";
      wait for CLK_SampleRate_period;
      solar_in <="1100111010";
      wait for CLK_SampleRate_period;
      solar_in <="1100111110";
      wait for CLK_SampleRate_period;
      solar_in <="1101000110";
      wait for CLK_SampleRate_period;
      solar_in <="1101001110";
      wait for CLK_SampleRate_period;
      solar_in <="1101010101";
      wait for CLK_SampleRate_period;
      solar_in <="1101011101";
      wait for CLK_SampleRate_period;
      solar_in <="1101100100";
      wait for CLK_SampleRate_period;
      solar_in <="1101101100";
      wait for CLK_SampleRate_period;
      solar_in <="1101110011";
      wait for CLK_SampleRate_period;
      solar_in <="1101111011";
      wait for CLK_SampleRate_period;
      solar_in <="1110000010";
      wait for CLK_SampleRate_period;
      solar_in <="1110001010";
      wait for CLK_SampleRate_period;
      solar_in <="1110010001";
      wait for CLK_SampleRate_period;
      solar_in <="1110011001";
      wait for CLK_SampleRate_period;
      solar_in <="1110100000";
      wait for CLK_SampleRate_period;
      solar_in <="1110101000";
      wait for CLK_SampleRate_period;
      solar_in <="1110101111";
      wait for CLK_SampleRate_period;
      solar_in <="1110110011";
      wait for CLK_SampleRate_period;
      solar_in <="1110110111";
      wait for CLK_SampleRate_period;
      solar_in <="1110111011";
      wait for CLK_SampleRate_period;
      solar_in <="1110111110";
      wait for CLK_SampleRate_period;
      solar_in <="1111000010";
      wait for CLK_SampleRate_period;
      solar_in <="1111000110";
      wait for CLK_SampleRate_period;
      solar_in <="1111001010";
      wait for CLK_SampleRate_period;
      solar_in <="1111001101";
      wait for CLK_SampleRate_period;
      solar_in <="1111010001";
      wait for CLK_SampleRate_period;
      solar_in <="1111010101";
      wait for CLK_SampleRate_period;
      solar_in <="1111011001";
      wait for CLK_SampleRate_period;
      solar_in <="1111011100";
      wait for CLK_SampleRate_period;
      solar_in <="1111100000";
      wait for CLK_SampleRate_period;
      solar_in <="1111100100";
      wait for CLK_SampleRate_period;
      solar_in <="1111100111";
      wait for CLK_SampleRate_period;
      solar_in <="1111100010";
      wait for CLK_SampleRate_period;
      solar_in <="1111011101";
      wait for CLK_SampleRate_period;
      solar_in <="1111011000";
      wait for CLK_SampleRate_period;
      solar_in <="1111010011";
      wait for CLK_SampleRate_period;
      solar_in <="1111001110";
      wait for CLK_SampleRate_period;
      solar_in <="1111001001";
      wait for CLK_SampleRate_period;
      solar_in <="1111000100";
      wait for CLK_SampleRate_period;
      solar_in <="1110111111";
      wait for CLK_SampleRate_period;
      solar_in <="1110111010";
      wait for CLK_SampleRate_period;
      solar_in <="1110110101";
      wait for CLK_SampleRate_period;
      solar_in <="1110110000";
      wait for CLK_SampleRate_period;
      solar_in <="1110101011";
      wait for CLK_SampleRate_period;
      solar_in <="1110100110";
      wait for CLK_SampleRate_period;
      solar_in <="1110100001";
      wait for CLK_SampleRate_period;
      solar_in <="1110011100";
      wait for CLK_SampleRate_period;
      solar_in <="1110000110";
      wait for CLK_SampleRate_period;
      solar_in <="1101110000";
      wait for CLK_SampleRate_period;
      solar_in <="1101011001";
      wait for CLK_SampleRate_period;
      solar_in <="1101000011";
      wait for CLK_SampleRate_period;
      solar_in <="1100101100";
      wait for CLK_SampleRate_period;
      solar_in <="1100010110";
      wait for CLK_SampleRate_period;
      solar_in <="1011111111";
      wait for CLK_SampleRate_period;
      solar_in <="1011101001";
      wait for CLK_SampleRate_period;
      solar_in <="1011010010";
      wait for CLK_SampleRate_period;
      solar_in <="1010111100";
      wait for CLK_SampleRate_period;
      solar_in <="1010100101";
      wait for CLK_SampleRate_period;
      solar_in <="1010001111";
      wait for CLK_SampleRate_period;
      solar_in <="1001111000";
      wait for CLK_SampleRate_period;
      solar_in <="1001100010";
      wait for CLK_SampleRate_period;
      solar_in <="1001001011";
      wait for CLK_SampleRate_period;
      solar_in <="1001010010";
      wait for CLK_SampleRate_period;
      solar_in <="1001011000";
      wait for CLK_SampleRate_period;
      solar_in <="1001011110";
      wait for CLK_SampleRate_period;
      solar_in <="1001100100";
      wait for CLK_SampleRate_period;
      solar_in <="1001101010";
      wait for CLK_SampleRate_period;
      solar_in <="1001110001";
      wait for CLK_SampleRate_period;
      solar_in <="1001110111";
      wait for CLK_SampleRate_period;
      solar_in <="1001111101";
      wait for CLK_SampleRate_period;
      solar_in <="1010000011";
      wait for CLK_SampleRate_period;
      solar_in <="1010001001";
      wait for CLK_SampleRate_period;
      solar_in <="1010010000";
      wait for CLK_SampleRate_period;
      solar_in <="1010010110";
      wait for CLK_SampleRate_period;
      solar_in <="1010011100";
      wait for CLK_SampleRate_period;
      solar_in <="1010100010";
      wait for CLK_SampleRate_period;
      solar_in <="1010101000";
      wait for CLK_SampleRate_period;
      solar_in <="1010101010";
      wait for CLK_SampleRate_period;
      solar_in <="1010101011";
      wait for CLK_SampleRate_period;
      solar_in <="1010101100";
      wait for CLK_SampleRate_period;
      solar_in <="1010101110";
      wait for CLK_SampleRate_period;
      solar_in <="1010101111";
      wait for CLK_SampleRate_period;
      solar_in <="1010110000";
      wait for CLK_SampleRate_period;
      solar_in <="1010110001";
      wait for CLK_SampleRate_period;
      solar_in <="1010110011";
      wait for CLK_SampleRate_period;
      solar_in <="1010110100";
      wait for CLK_SampleRate_period;
      solar_in <="1010110101";
      wait for CLK_SampleRate_period;
      solar_in <="1010110110";
      wait for CLK_SampleRate_period;
      solar_in <="1010111000";
      wait for CLK_SampleRate_period;
      solar_in <="1010111001";
      wait for CLK_SampleRate_period;
      solar_in <="1010111010";
      wait for CLK_SampleRate_period;
      solar_in <="1010111011";
      wait for CLK_SampleRate_period;
      solar_in <="1010011011";
      wait for CLK_SampleRate_period;
      solar_in <="1001111011";
      wait for CLK_SampleRate_period;
      solar_in <="1001011011";
      wait for CLK_SampleRate_period;
      solar_in <="1000111011";
      wait for CLK_SampleRate_period;
      solar_in <="1000011011";
      wait for CLK_SampleRate_period;
      solar_in <="0111111011";
      wait for CLK_SampleRate_period;
      solar_in <="0111011011";
      wait for CLK_SampleRate_period;
      solar_in <="0110111011";
      wait for CLK_SampleRate_period;
      solar_in <="0110011011";
      wait for CLK_SampleRate_period;
      solar_in <="0101111011";
      wait for CLK_SampleRate_period;
      solar_in <="0101011011";
      wait for CLK_SampleRate_period;
      solar_in <="0100111011";
      wait for CLK_SampleRate_period;
      solar_in <="0100011011";
      wait for CLK_SampleRate_period;
      solar_in <="0011111011";
      wait for CLK_SampleRate_period;
      solar_in <="0011011010";
      wait for CLK_SampleRate_period;
      solar_in <="0011101101";
      wait for CLK_SampleRate_period;
      solar_in <="0011111111";
      wait for CLK_SampleRate_period;
      solar_in <="0100010001";
      wait for CLK_SampleRate_period;
      solar_in <="0100100100";
      wait for CLK_SampleRate_period;
      solar_in <="0100110110";
      wait for CLK_SampleRate_period;
      solar_in <="0101001000";
      wait for CLK_SampleRate_period;
      solar_in <="0101011011";
      wait for CLK_SampleRate_period;
      solar_in <="0101101101";
      wait for CLK_SampleRate_period;
      solar_in <="0101111111";
      wait for CLK_SampleRate_period;
      solar_in <="0110010010";
      wait for CLK_SampleRate_period;
      solar_in <="0110100100";
      wait for CLK_SampleRate_period;
      solar_in <="0110110110";
      wait for CLK_SampleRate_period;
      solar_in <="0111001001";
      wait for CLK_SampleRate_period;
      solar_in <="0111011011";
      wait for CLK_SampleRate_period;
      solar_in <="0111101101";
      wait for CLK_SampleRate_period;
      solar_in <="0111011110";
      wait for CLK_SampleRate_period;
      solar_in <="0111001110";
      wait for CLK_SampleRate_period;
      solar_in <="0110111110";
      wait for CLK_SampleRate_period;
      solar_in <="0110101110";
      wait for CLK_SampleRate_period;
      solar_in <="0110011110";
      wait for CLK_SampleRate_period;
      solar_in <="0110001110";
      wait for CLK_SampleRate_period;
      solar_in <="0101111110";
      wait for CLK_SampleRate_period;
      solar_in <="0101101111";
      wait for CLK_SampleRate_period;
      solar_in <="0101011111";
      wait for CLK_SampleRate_period;
      solar_in <="0101001111";
      wait for CLK_SampleRate_period;
      solar_in <="0100111111";
      wait for CLK_SampleRate_period;
      solar_in <="0100101111";
      wait for CLK_SampleRate_period;
      solar_in <="0100011111";
      wait for CLK_SampleRate_period;
      solar_in <="0100001111";
      wait for CLK_SampleRate_period;
      solar_in <="0011111111";
      wait for CLK_SampleRate_period;
      solar_in <="0011110001";
      wait for CLK_SampleRate_period;
      solar_in <="0011100011";
      wait for CLK_SampleRate_period;
      solar_in <="0011010101";
      wait for CLK_SampleRate_period;
      solar_in <="0011000111";
      wait for CLK_SampleRate_period;
      solar_in <="0010111001";
      wait for CLK_SampleRate_period;
      solar_in <="0010101011";
      wait for CLK_SampleRate_period;
      solar_in <="0010011101";
      wait for CLK_SampleRate_period;
      solar_in <="0010001110";
      wait for CLK_SampleRate_period;
      solar_in <="0010000000";
      wait for CLK_SampleRate_period;
      solar_in <="0001110010";
      wait for CLK_SampleRate_period;
      solar_in <="0001100100";
      wait for CLK_SampleRate_period;
      solar_in <="0001010110";
      wait for CLK_SampleRate_period;
      solar_in <="0001001000";
      wait for CLK_SampleRate_period;
      solar_in <="0000111010";
      wait for CLK_SampleRate_period;
      solar_in <="0000101011";
      wait for CLK_SampleRate_period;
      solar_in <="0000101001";
      wait for CLK_SampleRate_period;
      solar_in <="0000100110";
      wait for CLK_SampleRate_period;
      solar_in <="0000100011";
      wait for CLK_SampleRate_period;
      solar_in <="0000100000";
      wait for CLK_SampleRate_period;
      solar_in <="0000011101";
      wait for CLK_SampleRate_period;
      solar_in <="0000011010";
      wait for CLK_SampleRate_period;
      solar_in <="0000010111";
      wait for CLK_SampleRate_period;
      solar_in <="0000010100";
      wait for CLK_SampleRate_period;
      solar_in <="0000010001";
      wait for CLK_SampleRate_period;
      solar_in <="0000001110";
      wait for CLK_SampleRate_period;
      solar_in <="0000001011";
      wait for CLK_SampleRate_period;
      solar_in <="0000001000";
      wait for CLK_SampleRate_period;
      solar_in <="0000000101";
      wait for CLK_SampleRate_period;
      solar_in <="0000000010";
      wait for CLK_SampleRate_period;
      solar_in <="0000000000";
      wait for CLK_SampleRate_period;


   
   END PROCESS;

END;
