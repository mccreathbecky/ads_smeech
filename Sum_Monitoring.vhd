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
--http://www.gstitt.ece.ufl.edu/vhdl/refs/vhdl_math_tricks_mapld_2003.pdf
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Sum_Monitoring is
    Port ( 
           sum_flag           : IN  STD_LOGIC;
           current_source     : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);            -- none/grid/solar/X
           consumption_in     : IN  STD_LOGIC_VECTOR (10 DOWNTO 0);           -- consumption < = battery_sum
           solar_in           : IN  STD_LOGIC_VECTOR (9 DOWNTO 0);            -- max solar input is 1000Wh       
           
           percent_battery    : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);            -- outputs the current battery level as a %age
           percent_solar      : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);            -- % solar of total power generated 
           total_consumption  : OUT STD_LOGIC_VECTOR (12 DOWNTO 0);           -- total consumption [set as a constant for v1]
           total_generated    : OUT STD_LOGIC_VECTOR (12 DOWNTO 0);           -- total power generated

           switching_flag     : OUT STD_LOGIC);                               -- flags to switching component that sum updates are finished                     
              
           
end Sum_Monitoring;

ARCHITECTURE Behavioral OF Sum_Monitoring IS

   CONSTANT battery_max    : UNSIGNED(10 DOWNTO 0)    := "10111011100";       -- 1500Wh
   CONSTANT sample_rate    : UNSIGNED(1 DOWNTO 0)     := "10";                -- 2 minutes
   CONSTANT mains          : UNSIGNED(10 DOWNTO 0)    := "01111101000";       -- 1000Wh
   
   SIGNAL battery_sum      : UNSIGNED(10 DOWNTO 0)    := battery_max/5;       -- battery sum less than 2047 [max 1500Wh] default to 20%
   SIGNAL solar_sum        : UNSIGNED(11 DOWNTO 0)    := "000000000000";      -- max solar sum for the day assumed less than 4095Wh
   SIGNAL daily_generated  : UNSIGNED (12 DOWNTO 0)   := "0000000000000";     -- max daily generation is less than 8191Wh
   SIGNAL consumption_sum  : UNSIGNED (12 DOWNTO 0)   := "0000000000000";     -- max consumption_sum assumed less than 8191Wh
   SIGNAL update_output    : STD_LOGIC                := '0';
   
BEGIN

   -- update solar, battery, consumption sums after monitoring [for the 2 min interval]
   -- assumes all inputs are IN Wh [not kWh] and divides by 60 to find min interval, then * sample_rate
   sum_monitoring : PROCESS (sum_flag)
   BEGIN
      IF sum_flag ' EVENT AND sum_flag = '1' THEN        -- wait for sum_flag to be set
         switching_flag <= '0';                          -- reset the switching_flag to zero until summed up
         
         -- consumption sum will be the same regardless of energy source
         consumption_sum <= consumption_sum + UNSIGNED(consumption_in)*sample_rate/60;
         
         CASE current_source IS
            WHEN "00" => 
               -- battery sum is just the battery - consumption for this period
					-- Result9 <= ('0' & A8) + ('0' & B8)
					-- 11 bit			11 bit				11 bit
               battery_sum <= battery_sum - UNSIGNED(consumption_in)*sample_rate/60;
               
               -- battery sum is the current sum, take away the consumption and adding in the mains power produced
            WHEN "01" =>
               battery_sum <= battery_sum - UNSIGNED(consumption_in)*sample_rate/60 + mains*sample_rate/60;
               daily_generated <= daily_generated + ("00" & mains*sample_rate/60);
               
               -- battery sum is the current sum, take away the consumption and adding in solar power produced
               -- solar sum is also updated with the new input
            WHEN OTHERS =>
               battery_sum <= battery_sum - UNSIGNED(consumption_in)*sample_rate/60 + UNSIGNED(solar_in)*sample_rate/60;
               solar_sum <= solar_sum + UNSIGNED(solar_in)*sample_rate/60;
               daily_generated <= daily_generated + ("000" & UNSIGNED(solar_in)*sample_rate/60); 
         END CASE;  
         
         update_output <= '1';
         
      END IF;
   END PROCESS;
   
   update_process : PROCESS(update_output)
   BEGIN
   
      -- check for 0 when dividing otherwise mathematically impossible
      IF daily_generated = 0 THEN
         percent_solar   <= "0000000000";
      ELSE        
        percent_solar    <= STD_LOGIC_VECTOR((solar_sum/daily_generated)*100);
      END IF;
      
      percent_battery    <= STD_LOGIC_VECTOR((battery_sum/battery_max)*100);
      total_consumption  <= STD_LOGIC_VECTOR(consumption_sum);
      total_generated    <= STD_LOGIC_VECTOR(daily_generated);

      update_output <= '0';
      switching_flag <= '1';
   END PROCESS;
   

END Behavioral;


