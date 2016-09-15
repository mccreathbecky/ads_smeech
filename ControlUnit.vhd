----------------------------------------------------------------------------------
-- Company: UTS
-- Engineer: Becky + Will
-- 
-- Create Date:    12:24:43 09/15/2016 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity ControlUnit is
    Port ( 
           -- clock triggers the control unit monitoring
           CLK_SampleRate : in STD_LOGIC;
           
           -- used by the user to switch on manual control
           ManualControl : in  STD_LOGIC;
           
           -- a switch that is only active once manualcontrol is on 
           -- '1' is solar, '0' is grid
           SourceSelect : in  STD_LOGIC;
           
           -- up to 5000Wh - 13 bit
--           SolarIn : in  STD_LOGIC_VECTOR (12 downto 0);
           SolarIn : in INTEGER;
           
           -- assume 5000Wh - 13 bit
--           Mains : in  STD_LOGIC_VECTOR (12 downto 0);
           Mains: in INTEGER;
           
           -- power consumption for house - assume no greater than 3kWh  = 12 bit
--           Consumption : in STD_LOGIC_VECTOR (11 downto 0);
           Consumption: in INTEGER; 
           
           -- '1'/on when solar is chosen input
           SolarLED : out  STD_LOGIC;
           
           -- '1'/on when grid is chosen input
           GridLED : out  STD_LOGIC;
           
           -- used to display battery level as a %age
           -- total power generated for day, solar level as a %age
           SSD_Display : out  STD_LOGIC_VECTOR (6 downto 0));

end ControlUnit;

architecture Behavioral of ControlUnit is
   -- signal representing the sum of solar generation for the day
   signal solar_sum : INTEGER := 0;
   
   -- signal representing the sum of energy consumption for the day
   signal consumption_sum : INTEGER := 0;
   
   -- signal representing the current energy stored in the battery
   -- max 10kWh = 14 bits
   -- initally set to 20% charge
   signal battery_energy : INTEGER := 2000;
   
   -- signal representing the current battery energy source
   signal current_source : STD_LOGIC;
   
   -- ? declare constants for SSD, switches
   
   
   
begin

   -- process which is triggered by sample rate clock [which will be set elsewhere to have a 2 minute frequency]
   monitoring : PROCESS (CLK_SampleRate)
   BEGIN
      -- check for sample rate interval
      IF CLK_SampleRate ' EVENT AND CLK_SampleRate = '1' THEN
         -- DO THE MONITORING
      END IF;
   END PROCESS;
   
   
   
   -- process which is triggered by user manual override
   override : PROCESS (ManualControl)
   BEGIN
      IF ManualControl = '1' THEN
         IF SourceSelect = '0' THEN
            current_source <= '0';
         ELSE
            current_source <= '1';
         END IF;
      END IF;
   END PROCESS;
   
   
   -- THESE PROCESSES CHANGE THE DISPLAYS - can technically be implemented elsewhere but this is more efficient
   display_LEDs : PROCESS (current_source)
   BEGIN
      IF current_source = '0' THEN --GRID
         GridLED <= '1';
         SolarLED <= '0';
      ELSE  
         GridLED <= '0';
         SolarLED <= '1';
      END IF;
   END PROCESS;
   
   -- change the SSD display
   -- will need to add fancy logic to connect to the multiple FPGA screens
   display_SSDs : PROCESS
   BEGIN
   
   END PROCESS;
   

end Behavioral;

