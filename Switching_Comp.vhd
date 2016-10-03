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
-- http://www.doulos.com/knowhow/vhdl_designers_guide/numeric_std/
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY Monitoring_Comp IS 
   PORT(
           -- clock triggers the control unit monitoring
           CLK_SampleRate : IN STD_LOGIC;

           -- up to 5000Wh - 13 bit
           solar_in : IN  STD_LOGIC_VECTOR (12 DOWNTO 0);
           
           -- user may have manually overriden control
           manual_control: IN STD_LOGIC;
           
           -- none/grid/solar
           current_source : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            
           -- up to 10000Wh - 14 bit
           battery_sum : INOUT STD_LOGIC_VECTOR(13 DOWNTO 0);

           -- a single bit, used to trigger the sum_monitoring block
           sum_flag : OUT STD_LOGIC);         
END Monitoring_Comp;

ARCHITECTURE Behavioral OF Monitoring_Comp IS

   -- likely not used since current_source is an input signal
   TYPE source_type IS (none, grid, solar);
   
   -- constant with the battery_max charge
   constant battery_max : UNSIGNED(13 DOWNTO 0) := "10011100010000";
   
   constant battery_low: UNSIGNED(13 DOWNTO 0) := battery_max/5;
   constant battery_high: UNSIGNED(13 DOWNTO 0) := battery_max*0.95;

BEGIN
 -- process which is triggered by sample rate clock [which will be set elsewhere to have a 2 minute frequency]
   -- will need to add code here to account for ManualControl!!!
   switching_process : PROCESS (CLK_SampleRate)
   BEGIN
      -- check for sample rate interval
      IF CLK_SampleRate ' EVENT AND CLK_SampleRate = '1' THEN
         IF Manual_Control = 0 THEN
            
            -- check first if battery is almost full : if so, take no input
            -- http://www.bitweenie.com/listings/vhdl-type-conversion/ MAY HAVE TO CHANGE TYPES
            IF unsigned(battery_sum) >= battery_high THEN
               current_source <= "00";
            
            -- check if battery is below min threshold: if so, switch to grid
            ELSIF unsigned(battery_sum) <= battery_low THEN
               current_source <= "01"; 
            
            -- if there is solar energy, use it
            ELSIF unsigned(solar_in) > 0 THEN
               current_source <= "10";
               
            -- finally, if no other choice due to lack of solar, use grid
            ELSE
               current_source <= "01";
            END IF;
            
            -- solar, battery, consumption now need to be summed- 
            -- but signals won't update until end of process
            -- [this summing is performed in another component]
            sum_flag <= '1';
         END IF;
      END IF;
   END PROCESS;
END Behavioral;

