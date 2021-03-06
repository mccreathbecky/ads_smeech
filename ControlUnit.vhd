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
--use IEEE.STD_LOGIC_ARITH.ALL;


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
           SolarIn : in  STD_LOGIC_VECTOR (12 downto 0);
--           SolarIn : in INTEGER;
           
           -- assume 5000Wh - 13 bit
           Mains : in  STD_LOGIC_VECTOR (12 downto 0);
--           Mains: in INTEGER;
           
           -- power consumption for house - assume no greater than 3kWh  = 12 bit
           Consumption : in STD_LOGIC_VECTOR (11 downto 0);
--           Consumption: in INTEGER; 
           
           -- '1'/on when solar is chosen input
           SolarLED : out  STD_LOGIC;
           
           -- '1'/on when grid is chosen input
           GridLED : out  STD_LOGIC;
           
           -- used to display battery level as a %age
           -- total power generated for day, solar level as a %age
           SSD_Display : out  STD_LOGIC_VECTOR (6 downto 0));

end ControlUnit;

architecture Behavioral of ControlUnit is
   TYPE source_type IS (none, grid, solar);
   
   -- sample rate [e.g. 2 mins]
   constant sample_rate : INTEGER := 2;
   
   -- signal representing the sum of solar generation for the day
   signal solar_sum : INTEGER := 0;
   
   -- signal representing the sum of energy consumption for the day
   signal consumption_sum : INTEGER := 0;
   
   -- ADD GENERATED SUM
   
   -- constant with the battery_max charge
   constant battery_max : INTEGER := 10000;
   -- signal representing the current energy stored in the battery
   -- max 10kWh = 14 bits
   -- initally set to 20% charge
   signal battery_sum : INTEGER := battery_max/5;
   
   
   -- signal representing the current battery energy source
   signal current_source : source_type;
   
   -- ? declare constants for SSD, switches
   
   
   -- figure out a better way to do this
   -- trigger flag for sum
   signal sum_flag : STD_LOGIC := '0';
   
   
begin

   -- process which is triggered by sample rate clock [which will be set elsewhere to have a 2 minute frequency]
   -- will need to add code here to account for ManualControl!!!
   monitoring : PROCESS (CLK_SampleRate)
   BEGIN
      -- check for sample rate interval
      IF CLK_SampleRate ' EVENT AND CLK_SampleRate = '1' THEN
         -- DO THE MONITORING
         
         -- check first if battery is almost full : if so, take no input
         -- http://www.bitweenie.com/listings/vhdl-type-conversion/ MAY HAVE TO CHANGE TYPES
         IF battery_sum >= (battery_max * 0.95) THEN
            current_source <= none;
         
         -- check if battery is below min threshold: if so, switch to grid
         ELSIF battery_sum <= (battery_max * 0.2) THEN
            current_source <= grid; 
         
         -- if there is solar energy, use it
         ELSIF SolarIn > 0 THEN
            current_source <= solar;
            
         -- finally, if no other choice due to lack of solar, use grid
         ELSE
            current_source <= grid;
         END IF;
         
         -- solar, battery, consumption now need to be summed- 
         -- but signals won't update until end of process
         sum_flag <= '1';
         
      END IF;
   END PROCESS;
   
   
   -- update solar, battery, consumption sums after monitoring [for the 2 min interval]
   -- assumes all inputs are in Wh [not kWh] and divides by 60 to find 1 min interval, then * sample_rate
   sum_monitoring : PROCESS (sum_flag)
   BEGIN
      -- wait for sum_flag to be set
      IF sum_flag ' EVENT AND sum_flag = '1' THEN
         
         -- consumption sum will be the same regardless of energy source
         consumption_sum <= consumption_sum + Consumption*sample_rate/60;
         
         CASE current_source IS
            WHEN none => 
               -- battery sum is just the battery - consumption for this period
               battery_sum <= battery_sum - Consumption*sample_rate/60;
               
               -- battery sum is the current sum, take away the consumption and adding in the mains power produced
            WHEN grid =>
               battery_sum <= battery_sum - Consumption*sample_rate/60 + Mains*sample_rate/60;
               
               -- battery sum is the current sum, take away the consumption and adding in solar power produced
               -- solar sum is also updated with the new input
            WHEN OTHERS =>
               battery_sum <= battery_sum - Consumption*sample_rate/60 + SolarIn*sample_rate/60;
               solar_sum <= solar_sum + SolarIn*sample_rate/60;
         END CASE;
      END IF;
      
      -- reset sum_flag to 0
      sum_flag <= '0';
   END PROCESS;
   
   -- process which is triggered by user manual override
   -- also needs a 1 hr timeout function
   override : PROCESS (ManualControl)
   BEGIN
      -- make sure manualControl is active
      IF ManualControl = '1' THEN
         IF SourceSelect = '0' THEN
            current_source <= grid;
         ELSE
            current_source <= solar;
         END IF;
      END IF;
   END PROCESS;
   
   
   -- THESE PROCESSES CHANGE THE DISPLAYS - can technically be implemented elsewhere but this is more efficient
   
   --change the LEDs to show which source is being used
   display_LEDs : PROCESS (current_source)
   BEGIN
      IF current_source = none THEN --none
         GridLED <= '0';
         SolarLED <= '0';
      ELSIF
         current_source = grid THEN --GRID
         GridLED <= '1';
         SolarLED <= '0';
      ELSE                          --solar
         GridLED <= '0';
         SolarLED <= '1';
      END IF;
   END PROCESS;
   
   -- change the SSD display
   -- will need to add fancy logic to connect to the multiple FPGA screens
   display_SSDs : PROCESS (solar_sum, consumption_sum, battery_sum)
   BEGIN
      -- output to the correct FPGA SSD
   END PROCESS;
   
   
end Behavioral;

