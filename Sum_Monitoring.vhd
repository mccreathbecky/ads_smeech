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
			  sum_CLK				: IN	STD_LOGIC; 
           current_source     : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);            -- none/grid/solar/X
           consumption_in     : IN  STD_LOGIC_VECTOR (10 DOWNTO 0);           -- consumption < = battery_sum
           solar_in           : IN  STD_LOGIC_VECTOR (9 DOWNTO 0);            -- max solar input is 1000Wh       

			  
           battery_out        : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);           -- outputs the current battery level to the Switching Component
           percent_battery    : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);            -- outputs the current battery level as a %age [max is 100% ~ 7 bits]
           percent_solar      : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);            -- % solar of total power generated 
           total_consumption  : OUT STD_LOGIC_VECTOR (12 DOWNTO 0);           -- total consumption [set as a constant for v1]
           total_generated    : OUT STD_LOGIC_VECTOR (12 DOWNTO 0));           -- total power generated
        
end Sum_Monitoring;

ARCHITECTURE Behavioral OF Sum_Monitoring IS

   CONSTANT battery_max    : UNSIGNED(10 DOWNTO 0)    := "10111011100";       -- 1500Wh
   CONSTANT mains          : UNSIGNED(10 DOWNTO 0)    := "01111101000";       -- 1000Wh
   CONSTANT sample_rate    : UNSIGNED(1 DOWNTO 0)     := "10";                -- 2 minutes
   CONSTANT sample_per_day : UNSIGNED(9 DOWNTO 0)     := "1011010000";        -- 720 = amount of sample periods per day

   SIGNAL total_samples    : UNSIGNED(9 DOWNTO 0)     := "0000000000";        -- how many samples have occurred so far
   SIGNAL daily_reset      : STD_LOGIC                := '0';                 -- used to trigger the daily reset
   
   SIGNAL battery_sum      : UNSIGNED(10 DOWNTO 0)    := battery_max/5;       -- battery sum less than 2047 [max 1500Wh] default to 20%
   SIGNAL solar_sum        : UNSIGNED(11 DOWNTO 0)    := "000000000000";      -- max solar sum for the day assumed less than 4095Wh
   SIGNAL daily_generated  : UNSIGNED (12 DOWNTO 0)   := "0000000000000";     -- max daily generation is less than 8191Wh
   SIGNAL consumption_sum  : UNSIGNED (12 DOWNTO 0)   := "0000000000000";     -- max consumption_sum assumed less than 8191Wh
	
   
BEGIN
	

   -- update solar, battery, consumption sums after monitoring [for the 2 min interval]
   -- assumes all inputs are IN Wh [not kWh] and divides by 60 to find min interval, then * sample_rate
   sum_monitoring : PROCESS (sum_CLK)
   BEGIN
      IF sum_CLK ' EVENT AND sum_CLK = '1' THEN        -- wait for sum_flag to be set
      
         -- consumption sum will be the same regardless of energy source
         consumption_sum <= consumption_sum + (UNSIGNED(consumption_in)*sample_rate)/60;
         
         CASE current_source IS
            WHEN "00" => 
               -- battery sum is just the battery - consumption for this period
               battery_sum <= battery_sum - RESIZE(UNSIGNED(consumption_in)*sample_rate/60,11);
               
               
            WHEN "01" =>
					-- battery sum is the current sum, take away the consumption and adding in the mains power produced
               battery_sum <= battery_sum - RESIZE((UNSIGNED(consumption_in)*sample_rate)/60, 11) + RESIZE((mains*sample_rate)/60, 11);
               daily_generated <= daily_generated + RESIZE(mains*sample_rate/60, 13);
               
               
            WHEN OTHERS =>
					-- battery sum is the current sum, take away the consumption and adding in solar power produced
               battery_sum <= battery_sum - RESIZE((UNSIGNED(consumption_in)*sample_rate)/60, 11) + RESIZE((UNSIGNED(solar_in)*sample_rate)/60, 11);
					solar_sum <= solar_sum + RESIZE((UNSIGNED(solar_in)*sample_rate)/60, 12);
					daily_generated <= daily_generated + RESIZE((UNSIGNED(solar_in)*sample_rate)/60, 13); 		
			END CASE;          
      END IF;
   END PROCESS;
   
   update_process : PROCESS(consumption_sum, battery_sum, daily_generated, solar_sum)
		VARIABLE solar_p 			: UNSIGNED (6 DOWNTO 0)		:= "0000000";
		VARIABLE battery_p		: UNSIGNED (6 DOWNTO 0)		:= "0000000";
   BEGIN
      -- check for 0 when dividing otherwise mathematically impossible
      IF daily_generated = 0 THEN
         percent_solar   <= "0000000";
      ELSE        
		  solar_p := RESIZE((solar_sum * 100) / daily_generated, 7);
        percent_solar    <= STD_LOGIC_VECTOR(solar_p);
      END IF;
      
		battery_p := RESIZE((battery_sum * 100) / battery_max, 7);
      percent_battery    <= STD_LOGIC_VECTOR(battery_p);
      battery_out        <= STD_LOGIC_VECTOR(battery_sum);
		
      total_consumption  <= STD_LOGIC_VECTOR(consumption_sum);
      total_generated    <= STD_LOGIC_VECTOR(daily_generated);
      
      
      -- update the total_samples counter
      IF total_samples = sample_per_day THEN
         total_samples <= "0000000000";
         daily_reset <= '1';
      ELSE
         total_samples <= total_samples + 1;
      END IF;
      
   END PROCESS;

	-- at the end of the day resets all the sums
   reset_daily : PROCESS(daily_reset)
   BEGIN
      IF daily_reset = '1' THEN
         solar_sum        <= "000000000000";     
--         daily_generated  <= "0000000000000";     
--         consumption_sum  <= "0000000000000"; 
         daily_reset <= '0';
      END IF;   
   END PROCESS;

END Behavioral;


