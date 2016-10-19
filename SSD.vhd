library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL; 
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;      

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

   TYPE display_type IS (dp0dg0, dp0dg1, dp0dg2, dp0dg3, dp1dg0, dp1dg1, dp1dg2, dp1dg3,dp2dg0, dp2dg1, dp2dg2, dp2dg3,dp3dg0, dp3dg1, dp3dg2, dp3dg3); 
   SIGNAL display : display_type := dp0dg1;
   
   -- a constant used when cycling through the digits and displays
   CONSTANT wait_time : time := 0.001sec;

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
   
   VARIABLE temp_battery      : STD_LOGIC_VECTOR (15 DOWNTO 0) := "000000000" & percent_battery;
   VARIABLE temp_generated    : STD_LOGIC_VECTOR (15 DOWNTO 0) := "000" & total_generated;
   VARIABLE temp_solar        : STD_LOGIC_VECTOR (15 DOWNTO 0) := "000000000" & percent_solar;        
   VARIABLE temp_consumption  : STD_LOGIC_VECTOR (15 DOWNTO 0) := "000" & total_consumption;
	VARIABLE bcd 					: STD_LOGIC_VECTOR (15 DOWNTO 0) := (others => '0');
	

   
   BEGIN
      -- STEP 1: convert each to 16 bit BCD [WILL] 
     --**********************************************************************--
	bcd := temp_battery;
	
	 
	 for i in 0 to 15 loop
    
      if bcd(3 downto 0) > 4 then 
        bcd(3 downto 0) := bcd(3 downto 0) + 3;
      end if;
      
      if bcd(7 downto 4) > 4 then 
        bcd(7 downto 4) := bcd(7 downto 4) + 3;
      end if;
    
      if bcd(11 downto 8) > 4 then  
        bcd(11 downto 8) := bcd(11 downto 8) + 3;
      end if;
	
	  
	  bcd:= bcd(14 downto 0) & temp_battery(15);
	  temp_battery := temp_battery(14 downto 0) & '0';
	  
	  end loop;
	  
	--**********************************************************************--
	 bcd := temp_generated;
	
	 
	 for i in 0 to 15 loop
    
      if bcd(3 downto 0) > 4 then 
        bcd(3 downto 0) := bcd(3 downto 0) + 3;
      end if;
      
      if bcd(7 downto 4) > 4 then 
        bcd(7 downto 4) := bcd(7 downto 4) + 3;
      end if;
    
      if bcd(11 downto 8) > 4 then  
        bcd(11 downto 8) := bcd(11 downto 8) + 3;
      end if;
	
	  
	  bcd:= bcd(14 downto 0) & temp_generated(15);
	  temp_generated := temp_generated(14 downto 0) & '0';
	  
	  end loop;
	       
   --**********************************************************************--  
	 bcd := temp_solar;
	 
	 for i in 0 to 15 loop
    
      if bcd(3 downto 0) > 4 then 
        bcd(3 downto 0) := bcd(3 downto 0) + 3;
      end if;
      
      if bcd(7 downto 4) > 4 then 
        bcd(7 downto 4) := bcd(7 downto 4) + 3;
      end if;
    
      if bcd(11 downto 8) > 4 then  
        bcd(11 downto 8) := bcd(11 downto 8) + 3;
      end if;
	
	  
	  bcd:= bcd(14 downto 0) & temp_solar(15);
	  temp_solar := temp_solar(14 downto 0) & '0';
	  
	  end loop;  
     
   --**********************************************************************--
	 bcd := temp_consumption;
	 
	 for i in 0 to 15 loop
    
      if bcd(3 downto 0) > 4 then 
        bcd(3 downto 0) := bcd(3 downto 0) + 3;
      end if;
      
      if bcd(7 downto 4) > 4 then 
        bcd(7 downto 4) := bcd(7 downto 4) + 3;
      end if;
    
      if bcd(11 downto 8) > 4 then  
        bcd(11 downto 8) := bcd(11 downto 8) + 3;
      end if;
	
	  
	  bcd:= bcd(14 downto 0) & temp_consumption(15);
	  temp_consumption := temp_consumption(14 downto 0) & '0';
	  
	  end loop;
	       
   --**********************************************************************--
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
      -- EG for bcd_generated
      FOR i IN 3 DOWNTO 0 LOOP
         bcd := bcd_generated((4*(i+1)-1) DOWNTO (4*(i+1)-4));        -- eg 15 dt 12 , 11 dt 8...
         
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
       
          -- store the generated value in the position in the 36 bit vector
          generated_dig((9*(i+1)-1) DOWNTO (9*(i+1)-9)) <= segment7;    -- eg 35 dt 27, 26 dt 18...
          
       END LOOP;
      --**********************************************************************--
		
		--**********************************************************************--
      -- EG for bcd_battery
      FOR i IN 3 DOWNTO 0 LOOP
         bcd := bcd_battery((4*(i+1)-1) DOWNTO (4*(i+1)-4));        -- eg 15 dt 12 , 11 dt 8...
         
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
       
          -- store the battery value in the position in the 36 bit vector
          battery_dig((9*(i+1)-1) DOWNTO (9*(i+1)-9)) <= segment7;    -- eg 35 dt 27, 26 dt 18...
          
       END LOOP;
      --**********************************************************************--
      
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
       
       --**********************************************************************--
      -- EG for bcd_consumption
      FOR i IN 3 DOWNTO 0 LOOP
         bcd := bcd_consumption((4*(i+1)-1) DOWNTO (4*(i+1)-4));        -- eg 15 dt 12 , 11 dt 8...
         
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
       
          -- store the consumption value in the position in the 36 bit vector
          consumption_dig((9*(i+1)-1) DOWNTO (9*(i+1)-9)) <= segment7;    -- eg 35 dt 27, 26 dt 18...
          
       END LOOP;
		 
		 -- Will : replicate this for all 4 inputs
       
       
   END PROCESS;
   
   
   display_fsm : PROCESS (clk)
   BEGIN
      IF clk'EVENT AND clk = '1' THEN
         -- inverse logic - set all to 0/off
         SSEGD0 <= "1111"; 
         SSEGD1 <= "1111";
         SSEGD2 <= "1111";
         SSEGD3 <= "1111";
         SSEGCL <= "1111";    --[not used] - for colons
      
         CASE display IS
            WHEN dp0dg0 =>
               SSEGD0(0) <= '0'; -- eg turn on DIG0, DISPLAY0
               SSEGHex <= battery_dig(35 downto 27); 
               display <= dp0dg1;
            
            WHEN dp0dg1 =>
               SSEGD1(0) <= '0';    -- turn on DIG1, DISPLAY0
               SSEGHex <= battery_dig(26 downto 18);
               display <= dp0dg2;

            WHEN dp0dg2 => 
               SSEGD2(0) <= '0';    -- turn on DIG2, DISPLAY0
               SSEGHex <= battery_dig(17 downto 9);
               display <= dp0dg3;
            
            WHEN dp0dg3 =>
               SSEGD3(0) <= '0';    -- turn on DIG3, DISPLAY0
               SSEGHex <= battery_dig(8 downto 0);
               display <= dp1dg0;
      
      ------------------------------
            WHEN dp1dg0 =>
               SSEGD0(1) <= '0'; -- eg turn on DIG0, DISPLAY0
               SSEGHex <= generated_dig(35 downto 27); 
               display <= dp1dg1;
            
            WHEN dp1dg1 =>
               SSEGD1(1) <= '0';    -- turn on DIG1, DISPLAY0
               SSEGHex <= generated_dig(26 downto 18);
               display <= dp1dg2;

            WHEN dp1dg2 => 
               SSEGD2(1) <= '0';    -- turn on DIG2, DISPLAY0
               SSEGHex <= generated_dig(17 downto 9);
               display <= dp1dg3;
            
            WHEN dp1dg3 =>
               SSEGD3(1) <= '0';    -- turn on DIG3, DISPLAY0
               SSEGHex <= generated_dig(8 downto 0);
               display <= dp2dg0;
               
               
      ------------------------------
            WHEN dp2dg0 =>
               SSEGD0(2) <= '0'; -- eg turn on DIG0, DISPLAY0
               SSEGHex <= solar_dig(35 downto 27); 
               display <= dp2dg1;
            
            WHEN dp2dg1 =>
               SSEGD1(2) <= '0';    -- turn on DIG1, DISPLAY0
               SSEGHex <= solar_dig(26 downto 18);
               display <= dp2dg2;

            WHEN dp2dg2 => 
               SSEGD2(2) <= '0';    -- turn on DIG2, DISPLAY0
               SSEGHex <= solar_dig(17 downto 9);
               display <= dp2dg3;
            
            WHEN dp2dg3 =>
               SSEGD3(2) <= '0';    -- turn on DIG3, DISPLAY0
               SSEGHex <= solar_dig(8 downto 0);
               display <= dp3dg0;
               
               
               ------------------------------
            WHEN dp3dg0 =>
               SSEGD0(3) <= '0'; -- eg turn on DIG0, DISPLAY0
               SSEGHex <= consumption_dig(35 downto 27); 
               display <= dp3dg1;
            
            WHEN dp3dg1 =>
               SSEGD1(3) <= '0';    -- turn on DIG1, DISPLAY0
               SSEGHex <= consumption_dig(26 downto 18);
               display <= dp3dg2;

            WHEN dp3dg2 => 
               SSEGD2(3) <= '0';    -- turn on DIG2, DISPLAY0
               SSEGHex <= consumption_dig(17 downto 9);
               display <= dp3dg3;
            
            WHEN dp3dg3 =>
               SSEGD3(3) <= '0';    -- turn on DIG3, DISPLAY0
               SSEGHex <= consumption_dig(8 downto 0);
               display <= dp0dg0;
      END CASE;
      
   END IF;
      
   END PROCESS; 
 
END;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL; 
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL; 

PACKAGE SSD_Package IS

   COMPONENT BCD_to_SSD Port( 
              clk : IN std_logic; 
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
             
   END COMPONENT;
END SSD_Package;