library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


ENTITY TopLevel IS
    PORT ( CLK_sampleRate  : IN     STD_LOGIC;
           solar_in        : IN     STD_LOGIC_VECTOR (9 DOWNTO 0);
           consumption_in  : IN     STD_LOGIC_VECTOR (10 DOWNTO 0);
           grid_LED        : OUT    STD_LOGIC;
           solar_LED       : OUT    STD_LOGIC;
           SSD             : OUT    STD_LOGIC_VECTOR (6 DOWNTO 0));
END TopLevel;

USE WORK.Switching_Package.ALL;
USE WORK.Sum_Package.ALL;

ARCHITECTURE Behavioral OF TopLevel IS
   
   -- Switching Component
   SIGNAL toSwitch_battery  : STD_LOGIC_VECTOR(10 DOWNTO 0) := "00100101100";
   SIGNAL top_current_source : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
   SIGNAL toSum_clk : STD_LOGIC;
   
   -- Sum Component
   SIGNAL toSSD_percentBattery : STD_LOGIC_VECTOR (6 DOWNTO 0);
   SIGNAL toSSD_percentSolar : STD_LOGIC_VECTOR (6 DOWNTO 0);  
   SIGNAL toSSD_totalConsumption : STD_LOGIC_VECTOR (12 DOWNTO 0);
   SIGNAL toSSD_totalGenerated    : STD_LOGIC_VECTOR (12 DOWNTO 0); 
   
BEGIN
   switch0  : Monitoring_Comp PORT MAP(CLK_sampleRate, 
                                       solar_in, 
                                       toSwitch_battery, 
                                       top_current_source, 
                                       toSum_clk);
                                       
   sum0     : Sum_Monitoring  PORT MAP(toSum_clk, 
                                       top_current_source, 
                                       consumption_in, 
                                       solar_in, 
                                       toSwitch_battery, 
                                       toSSD_percentBattery, 
                                       toSSD_percentSolar,
                                       toSSD_totalConsumption,
                                       toSSD_totalGenerated);
                                       
END Behavioral;

