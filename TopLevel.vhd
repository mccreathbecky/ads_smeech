library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


ENTITY TopLevel IS
    PORT ( CLK_sampleRate  : IN     STD_LOGIC;
           solar_in        : IN     STD_LOGIC_VECTOR (9 DOWNTO 0);
           consumption_in  : IN     STD_LOGIC_VECTOR (10 DOWNTO 0);
           GreenLed        : OUT    STD_LOGIC;
           RedLed	         : OUT    STD_LOGIC;
           SSD             : OUT    STD_LOGIC_VECTOR (6 DOWNTO 0);
			  SSEGHex 			: OUT STD_LOGIC_VECTOR(8 DOWNTO 0);   
           SSEGD0 			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);    
           SSEGD1 			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           SSEGD2 			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           SSEGD3 			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           SSEGCL 			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
			  
END TopLevel;

USE WORK.Switching_Package.ALL;
USE WORK.Sum_Package.ALL;
USE WORK.SSD_Package.ALL;
USE WORK.LED_Package.ALL;

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
   
   -- SSD Component
   
   
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
   
   ssd0     : BCD_to_SSD        PORT MAP(toSum_clk, 
                                       toSSD_percentBattery,
                                       toSSD_totalGenerated,
                                       toSSD_percentSolar,
                                       toSSD_totalConsumption,
                                       SSEGHex,
                                       SSEGD0,
                                       SSEGD1,
                                       SSEGD2,
                                       SSEGD3,
                                       SSEGCL);
   led0     : LED_Display     PORT MAP(top_current_source,
                                       GreenLed,
                                       RedLed);
                                       
                                       
END Behavioral;

