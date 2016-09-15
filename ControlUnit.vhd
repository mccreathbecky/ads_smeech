----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlUnit is
    Port ( ManualControl : in  STD_LOGIC;
           SourceSelect : in  STD_LOGIC;
           SolarIn : in  STD_LOGIC_VECTOR (13 downto 0);
           Mains : in  STD_LOGIC_VECTOR (13 downto 0);
           SolarLED : out  STD_LOGIC;
           GridLED : out  STD_LOGIC;
           SSD_Display : out  STD_LOGIC_VECTOR (6 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is

begin


end Behavioral;

