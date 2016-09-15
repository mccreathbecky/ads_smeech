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
           -- used by the user to switch on manual control
           ManualControl : in  STD_LOGIC;
           
           -- a switch that is only active once manualcontrol is on 
           -- '1' is solar, '0' is grid
           SourceSelect : in  STD_LOGIC;
           
           -- up to 5000Wh - 13 bit
           SolarIn : in  STD_LOGIC_VECTOR (12 downto 0);
           
           -- assume 5000Wh - 13 bit
           Mains : in  STD_LOGIC_VECTOR (12 downto 0);
           
           -- power consumption for house - assume no greater than 3kWh  = 12 bit
           Consumption : in STD_LOGIC_VECTOR (11 downto 0);
           
           -- '1'/on when solar is chosen input
           SolarLED : out  STD_LOGIC;
           
           -- '1'/on when grid is chosen input
           GridLED : out  STD_LOGIC;
           
           -- used to display battery level as a %age
           -- total power generated for day, solar level as a %age
           SSD_Display : out  STD_LOGIC_VECTOR (6 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is

   -- 

begin


end Behavioral;

