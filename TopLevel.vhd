library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


ENTITY TopLevel IS
    PORT (-- CLK_sampleRate  : IN     STD_LOGIC;
          -- solar_in        : IN     STD_LOGIC_VECTOR (9 DOWNTO 0);
          -- consumption_in  : IN     STD_LOGIC_VECTOR (10 DOWNTO 0);
           clk             : IN     STD_LOGIC;
           GreenLed        : OUT    STD_LOGIC;
           RedLed	         : OUT    STD_LOGIC;
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
USE WORK.SampleInputs_UsingClock_Package.ALL;
USE WORK.clockdivide_Package.ALL;

ARCHITECTURE Behavioral OF TopLevel IS
   
   --  Sample Inputs [provided by a component for the sake of demonstration on FPGA]
   SIGNAL solar_in        : STD_LOGIC_VECTOR (9 DOWNTO 0);
   SIGNAL consumption_in  : STD_LOGIC_VECTOR (10 DOWNTO 0);
   
   
   -- Switching Component
   SIGNAL toSwitch_battery  : STD_LOGIC_VECTOR(10 DOWNTO 0) := "00100101100";
   SIGNAL top_current_source : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
   SIGNAL toSum_clk : STD_LOGIC;
   
   -- Sum Component
   SIGNAL toSSD_percentBattery : STD_LOGIC_VECTOR (6 DOWNTO 0);
   SIGNAL toSSD_percentSolar : STD_LOGIC_VECTOR (6 DOWNTO 0);  
   SIGNAL toSSD_totalConsumption : STD_LOGIC_VECTOR (12 DOWNTO 0);
   SIGNAL toSSD_totalGenerated    : STD_LOGIC_VECTOR (12 DOWNTO 0); 
   
   -- CLOCKS
   SIGNAL onesec_clock : STD_LOGIC;
   SIGNAL halfsec_clock : STD_LOGIC;
   SIGNAL SSD_clock : STD_LOGIC;

     
BEGIN

   clock0   : clockdivide        PORT MAP(clk,
                                          onesec_clock,
                                          halfsec_clock, 
                                          SSD_clock);
                                          
   sampleInputs0 : SampleInputs_usingclk  PORT MAP(halfsec_clock,
                                          solar_in,
                                          consumption_in);
   

                                          
   switch0  : Monitoring_Comp    PORT MAP(halfsec_clock, 
                                          solar_in, 
                                          toSwitch_battery, 
                                          top_current_source, 
                                          toSum_clk);
                                       
   sum0     : Sum_Monitoring     PORT MAP(toSum_clk, 
                                          top_current_source, 
                                          consumption_in, 
                                          solar_in, 
                                          toSwitch_battery, 
                                          toSSD_percentBattery, 
                                          toSSD_percentSolar,
                                          toSSD_totalConsumption,
                                          toSSD_totalGenerated);
   
   ssd0     : BCD_to_SSD         PORT MAP(SSD_clock,
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
                                          
   led0     : LED_Display        PORT MAP(top_current_source,
                                          GreenLed,
                                          RedLed);
   

                       
END Behavioral;

