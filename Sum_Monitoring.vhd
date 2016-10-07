----------------------------------------------------------------------------------
-- Company: 
-- EngINeer: 
-- 
-- Create Date:    18:12:55 10/07/2016 
-- Design Name: 
-- Module Name:    Sum_MonitorINg - Behavioral 
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


entity Sum_Monitoring is
    Port ( 
           sum_flag : INOUT  STD_LOGIC;
           battery_sum : INOUT  STD_LOGIC_VECTOR (10 DOWNTO 0);         -- battery sum less than 2047 [max 1500Wh]
           consumption_sum : INOUT  STD_LOGIC_VECTOR (12 DOWNTO 0);     -- consumption_sum assumed less than 8191Wh
           solar_sum : INOUT  STD_LOGIC_VECTOR (11 DOWNTO 0);           -- max solar sum for the day assumed less than 4095Wh
           
           current_source : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);       
           consumption : IN  STD_LOGIC_VECTOR (10 DOWNTO 0);            -- consumption <= battery_sum
           solar_in : IN  STD_LOGIC_VECTOR (9 DOWNTO 0));               -- max solar input is 1000Wh 
end Sum_MonitorINg;

ARCHITECTURE Behavioral OF Sum_Monitoring IS
   
   CONSTANT sample_rate : STD_LOGIC_VECTOR(1 DOWNTO 0) := "10";        -- 2 minute interval
   
   SIGNAL new_batterysum : STD_LOGIC_VECTOR(10 DOWNTO 0);
   SIGNAL new_consumptionsum : STD_LOGIC_VECTOR (12 DOWNTO 0);
   SIGNAL new_solarsum : STD_LOGIC_VECTOR(11 DOWNTO 0);
   


BEGIN
   -- update solar, battery, consumption sums after monitorINg [for the 2 mIN INterval]
   -- assumes all INputs are IN Wh [not kWh] and divides by 60 to fINd 1 mIN INterval, then * sample_rate
   sum_monitoring : PROCESS (sum_flag)
   BEGIN
      -- wait for sum_flag to be set
      IF sum_flag ' EVENT AND sum_flag = '1' THEN
         
         -- consumption sum will be the same regardless of energy source
         consumption_sum <= consumption_sum + consumption*sample_rate/60;
         
         CASE current_source IS
            WHEN "00" => 
               -- battery sum is just the battery - consumption for this period
               battery_sum <= battery_sum - consumption*sample_rate/60;
               
               -- battery sum is the current sum, take away the consumption and addINg IN the maINs power produced
            WHEN "01" =>
               battery_sum <= battery_sum - consumption*sample_rate/60 + MaINs*sample_rate/60;
               
               -- battery sum is the current sum, take away the consumption and addINg IN solar power produced
               -- solar sum is also updated with the new INput
            WHEN OTHERS =>
               battery_sum <= battery_sum - consumption*sample_rate/60 + solar_in*sample_rate/60;
               solar_sum <= solar_sum + solar_in*sample_rate/60;
         END CASE;
      END IF;
      
      -- reset sum_flag to 0
      sum_flag <= '0';
   END PROCESS;

END Behavioral;

