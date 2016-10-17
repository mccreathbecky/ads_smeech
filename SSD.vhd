library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;       

entity BCD_to_SSD is
    Port ( clk : IN std_logic;
            
           percent_battery : IN STD_LOGIC_VECTOR (6 downto 0);          -- 0 to 100
           total_generated : IN  STD_LOGIC_VECTOR (12 downto 0);        -- 0 to 8191
           percent_solar : IN  STD_LOGIC_VECTOR (6 downto 0);           -- 0 to 100
           total_consumption : IN  STD_LOGIC_VECTOR (12 downto 0);      -- 0 to 8191

			  SSEGHex : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);   -- outputs for SSD [abcdefg, DP, col]
           SSEGD0 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);   -- 
           SSEGD1 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           SSEGD2 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           SSEGD3 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           SSEGCL : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
           );
			 
end BCD_to_SSD;

architecture Behavioral of BCD_to_SSD is
   -- a constant used when cycling through the digits and displays
   CONSTANT wait_time : time := 2ns;

   -- the inputs, translated into BCD
   SIGNAL bcd_battery : STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL bcd_generated: STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL bcd_solar : STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL bcd_consumption : STD_LOGIC_VECTOR (15 DOWNTO 0);

  
   -- contain each integer of the above signal, translated into a 9 bit SSD value
   SIGNAL battery_dig : STD_LOGIC_VECTOR (35 DOWNTO 0);
   SIGNAL generated_dig : STD_LOGIC_VECTOR (35 DOWNTO 0);
   SIGNAL solar_dig : STD_LOGIC_VECTOR (35 DOWNTO 0);
   SIGNAL consumption_dig : STD_LOGIC_VECTOR (35 DOWNTO 0);


BEGIN

   -- this should take each input [eg percent_battery] and turn it into BCD
   stdlogic_to_bcd : PROCESS (percent_battery, percent_solar, total_generated, total_consumption)
   
   VARIABLE temp_battery      : STD_LOGIC_VECTOR (15 DOWNTO 0) := "00000000" & percent_battery;
   VARIABLE temp_generated    : STD_LOGIC_VECTOR (15 DOWNTO 0) := "000" & total_generated;
   VARIABLE temp_solar        : STD_LOGIC_VECTOR (15 DOWNTO 0) := "00000000" & percent_solar;        
   VARIABLE temp_consumption  : STD_LOGIC_VECTOR (15 DOWNTO 0) := "000" & total_consumption;

   
   BEGIN
      -- STEP 1: convert each to 16 bit BCD [WILL] 
     
     
   
      -- STEP 2: fill the corresponding temporary variables with the BCD digits 
      bcd_battery <= temp_battery;
      bcd_generated <= temp_generated;
      bcd_solar <= temp_solar;
      bcd_consumption <= temp_consumption;  
   END PROCESS;

   -- this should take the array of 4 BCD numbers for each input and convert it into a 9 bit SSD number
   bcd_to_SSD : PROCESS (bcd_generated, bcd_battery, bcd_solar, bcd_consumption)  
   VARIABLE segment7 : STD_LOGIC_VECTOR (8 DOWNTO 0);
   VARIABLE bcd : STD_LOGIC_VECTOR (3 DOWNTO 0);
   BEGIN
      
      --**********************************************************************--
      -- EG for bcd_solar
      FOR i IN 3 DOWNTO 0 LOOP
         bcd := bcd_solar((4*(i+1)-1) DOWNTO (4*(i+1)-4));        -- eg 15 dt 12 , 11 dt 8...
         
         CASE bcd IS
            when "0000" => 
               segment7 := "111111000";  -- '0'
            when "0001" => 
               segment7 := "011000000";  -- '1'
            when "0010" => 
               segment7 := "110110100";  -- '2'
            when "0011" => 
               segment7 := "111100100";  -- '3'
            when "0100" => 
               segment7 := "011001100";  -- '4'
            when "0101" => 
               segment7 := "101101100";  -- '5'
            when "0110" => 
               segment7 := "101111100";  -- '6'
            when "0111" => 
               segment7 := "111000000";  -- '7'
            when "1000" => 
               segment7 := "111111100";  -- '8'
            when "1001" => 
               segment7 := "111101100";  -- '9'
            when others =>
               segment7 := "000000000";  -- blank
          END CASE;  
       
          -- store the solar value in the position in the 36 bit vector
          solar_dig((9*(i+1)-1) DOWNTO (9*(i+1)-9)) <= segment7;    -- eg 35 dt 27, 26 dt 18...
          
       END LOOP;
      --**********************************************************************--       
       
       -- Will : replicate this for all 4 inputs
       
       
   END PROCESS;
   
   
 
   -- should loop through the four digits of battery_dig and output them
   display_four_digits_hardcoded : PROCESS
   BEGIN
      -- inverse logic - set all to 0/off
      SSEGD0 <= "1111"; 
      SSEGD1 <= "1111";
      SSEGD2 <= "1111";
      SSEGD3 <= "1111";
      SSEGCL <= "1111";    --[not used] - for colons
   
      --**********************************************************************--
   
      SSEGD0(0) <= '0'; -- eg turn on DIG0, DISPLAY0
      SSEGHex <= battery_dig(35 downto 27);          
      wait for wait_time;
      
      SSEGD0(0) <= '1';    -- turn off previous display
      SSEGD1(0) <= '0';    -- turn on DIG1, DISPLAY0
      SSEGHex <= battery_dig(26 downto 18);
      wait for wait_time;
      
      SSEGD1(0) <= '1';    -- turn off previous display
      SSEGD2(0) <= '0';    -- turn on DIG2, DISPLAY0
      SSEGHex <= battery_dig(17 downto 9);
      wait for wait_time;
      
      SSEGD2(0) <= '1';    -- turn off previous display
      SSEGD3(0) <= '0';    -- turn on DIG3, DISPLAY0
      SSEGHex <= battery_dig(8 downto 0);
      wait for wait_time;
      
      SSEGD3(0) <= '1';     --turn off previous display
      
      --**********************************************************************--
      
      -- WILL : update this so it goes through all 4 displays, not just the first one
      
   END PROCESS; 
 
END;

