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
-- http://www.bitweenie.com/listings/vhdl-type-conversion/ 
--https://www.altera.com/support/support-resources/design-examples/design-software/vhdl/v_bidir.tablet.highResolutionDisplay.html
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY Monitoring_Comp IS 
   PORT(
            CLK_SampleRate : IN STD_LOGIC;                                 -- clock triggers the control unit monitoring
            solar_in : IN  STD_LOGIC_VECTOR (9 DOWNTO 0);                 -- up to 1000Wh - 10 bit
            manual_control: IN STD_LOGIC;                                  -- user may have manually overriden control      
            battery_sum : IN STD_LOGIC_VECTOR(10 DOWNTO 0);                -- up to 1500Wh - 14 bit
            current_source : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);             -- none/grid/solar
            sum_flag : OUT STD_LOGIC);                                     -- a single bit, used to trigger the sum_monitoring block        
END Monitoring_Comp;

ARCHITECTURE Behavioral OF Monitoring_Comp IS   
   CONSTANT battery_max : UNSIGNED(10 DOWNTO 0) := "10111011100";                      -- 1500Wh
   CONSTANT battery_low: UNSIGNED(10 DOWNTO 0) := battery_max/5;                       -- 20%
   CONSTANT battery_high: UNSIGNED(10 DOWNTO 0) := RESIZE((battery_max/100)*95, 11);   -- 95%

BEGIN 
   -- process which is triggered by sample rate clock [which will be set elsewhere to have a 2 minute frequency]
   switching_process : PROCESS (CLK_SampleRate)
   BEGIN
      -- check for sample rate interval
      IF CLK_SampleRate ' EVENT AND CLK_SampleRate = '1' THEN
         IF Manual_Control = '0' THEN
            
            -- check first if battery is almost full : if so, take no input
            IF UNSIGNED(battery_sum) >= battery_high THEN
               current_source <= "00";
            
            -- check if battery is below min threshold: if so, switch to grid
            ELSIF UNSIGNED(battery_sum) <= battery_low THEN
               current_source <= "01"; 
            
            -- if there is solar energy, use it
            ELSIF UNSIGNED(solar_in) > 0 THEN
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

