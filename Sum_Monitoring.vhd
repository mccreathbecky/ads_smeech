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
--https://www.altera.com/support/support-resources/design-examples/design-software/vhdl/v_bidir.tablet.highResolutionDisplay.html
--http://www.bitweenie.com/listings/vhdl-type-conversion/
--http://www.thecodingforums.com/threads/bidirectional-port-usage-in-vhdl.22628/
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Sum_Monitoring is
    Port ( 
           battery_sum : INOUT  STD_LOGIC_VECTOR (10 DOWNTO 0);         -- battery sum less than 2047 [max 1500Wh]
           consumption_sum : INOUT  STD_LOGIC_VECTOR (12 DOWNTO 0);     -- consumption_sum assumed less than 8191Wh
           solar_sum : INOUT  STD_LOGIC_VECTOR (11 DOWNTO 0);           -- max solar sum for the day assumed less than 4095Wh
           -- % battery level
           -- total consumption [set as a constant for v1]
           
           -- total power generated
           -- % solar of total power generated !!!

           
           sum_flag : IN  STD_LOGIC;
           CLK : IN STD_LOGIC;
           current_source : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);       
           consumption : IN  STD_LOGIC_VECTOR (10 DOWNTO 0);            -- consumption <= battery_sum
           solar_in : IN  STD_LOGIC_VECTOR (9 DOWNTO 0));               -- max solar input is 1000Wh 
end Sum_MonitorINg;

ARCHITECTURE Behavioral OF Sum_Monitoring IS
   
   CONSTANT sample_rate : UNSIGNED(1 DOWNTO 0) := "10";        -- 2 minute interval
   CONSTANT mains : UNSIGNED(9 DOWNTO 0) := "1111101000";      -- 1000Wh constant
   
   SIGNAL new_batterysum : UNSIGNED(10 DOWNTO 0) := UNSIGNED(battery_sum);
   SIGNAL new_consumptionsum : UNSIGNED (12 DOWNTO 0) := UNSIGNED(consumption_sum);
   SIGNAL new_solarsum : UNSIGNED(11 DOWNTO 0) := UNSIGNED(solar_sum);
   
   SIGNAL update_sum : STD_LOGIC := '0';

BEGIN
   -- TRYING TO FOLLOW THE FORM
   --  Z: inout
   -- signal A, OE
   --Z <= A when OE = '1' else (others => 'Z');


   -- update solar, battery, consumption sums after monitorINg [for the 2 mIN INterval]
   -- assumes all INputs are IN Wh [not kWh] and divides by 60 to fINd 1 mIN INterval, then * sample_rate
   sum_monitoring : PROCESS (CLK, sum_flag)
   BEGIN
      -- wait for sum_flag to be set
      IF sum_flag ' EVENT AND sum_flag = '1' THEN
         
         -- consumption sum will be the same regardless of energy source
         new_consumptionsum <= UNSIGNED(consumption_sum) + UNSIGNED(consumption)*sample_rate/60;
         
         CASE current_source IS
            WHEN "00" => 
               -- battery sum is just the battery - consumption for this period
               new_batterysum <= UNSIGNED(battery_sum) - UNSIGNED(consumption)*sample_rate/60;
               
               -- battery sum is the current sum, take away the consumption and addINg IN the maINs power produced
            WHEN "01" =>
               new_batterysum <= UNSIGNED(battery_sum) - UNSIGNED(consumption)*sample_rate/60 + mains*sample_rate/60;
               
               -- battery sum is the current sum, take away the consumption and addINg IN solar power produced
               -- solar sum is also updated with the new INput
            WHEN OTHERS =>
               new_batterysum <= UNSIGNED(battery_sum) - UNSIGNED(consumption)*sample_rate/60 + UNSIGNED(solar_in)*sample_rate/60;
               new_solarsum <= UNSIGNED(solar_sum) + UNSIGNED(solar_in)*sample_rate/60;
         END CASE;
         
         update_sum <= '1';
         
      ELSE     
         battery_sum <= (others => 'Z');          
         consumption_sum <= (others => 'Z');
         solar_sum <= (others => 'Z');
      END IF;
   END PROCESS;
   
   update_process : PROCESS(update_sum)
   BEGIN
      IF update_sum ' EVENT AND update_sum = '1' THEN
         battery_sum <= STD_LOGIC_VECTOR(new_batterysum);
         consumption_sum <= STD_LOGIC_VECTOR(new_consumptionsum);
         solar_sum <= STD_LOGIC_VECTOR(new_solarsum);
         
         update_sum <= '0';
      END IF;
   END PROCESS;
   

END Behavioral;


