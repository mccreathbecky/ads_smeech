----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:03:36 10/03/2016 
-- Design Name: 
-- Module Name:    Switching_Comp - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity Monitoring_Comp is 
   PORT(
 -- clock triggers the control unit monitoring
           CLK_SampleRate : OUT STD_LOGIC;

           -- up to 5000Wh - 13 bit
           solar_in : IN  STD_LOGIC_VECTOR (12 downto 0);
           
           -- a single bit, used to trigger the sum_monitoring block
           sum_flag : OUT STD_LOGIC;
           
           -- none/grid/solar
           current_source : INOUT STD_LOGIC_VECTOR(1 downto 0);
            
           -- up to 10000Wh - 14 bit
           battery_sum : INOUT STD_LOGIC_VECTOR(13 downto 0));
end Monitoring_Comp;

architecture Behavioral of Monitoring_Comp is

   


begin
 -- process which is triggered by sample rate clock [which will be set elsewhere to have a 2 minute frequency]
   -- will need to add code here to account for ManualControl!!!
   switching_process : PROCESS (CLK_SampleRate)
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
end Behavioral;

