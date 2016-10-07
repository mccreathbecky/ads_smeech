----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:12:55 10/07/2016 
-- Design Name: 
-- Module Name:    Sum_Monitoring - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sum_Monitoring is
    Port ( sum_flag : inout  STD_LOGIC;
           battery_sum : inout  STD_LOGIC_VECTOR (10 downto 0);
           consumption_sum : inout  STD_LOGIC_VECTOR (10 downto 0);
           solar_sum : inout  STD_LOGIC_VECTOR (9 downto 0);
           current_source : in  STD_LOGIC_VECTOR (1 downto 0);
           consumption : in  STD_LOGIC_VECTOR (10 downto 0);
           solar_in : in  STD_LOGIC_VECTOR (9 downto 0));
end Sum_Monitoring;

architecture Behavioral of Sum_Monitoring is

BEGIN
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

END Behavioral;

