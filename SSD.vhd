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
	VARIABLE i 						: INTEGER :=0;

   
   BEGIN
      -- STEP 1: convert each to 16 bit BCD [WILL] 
     --**********************************************************************--
	  
	  -- http://vhdlguru.blogspot.com.au/2010/04/8-bit-binary-to-bcd-converter-double.html
	  -- http://electronics.stackexchange.com/questions/70412/vhdl-convert-from-binary-integer-to-bcd-and-display-it-on-the-7-segment-displa
	  
	  -- Convert Binary to BCD (Double Dabble algorithm) for temp_battery
            for i in 0 to 15 loop
                bcd(15 downto 1) := bcd(14 downto 0);  --shifting the bits.
                bcd(0) := temp_battery(15);
                temp_battery(15 downto 1) := temp_battery(14 downto 0);
                temp_battery(0) :='0';

                if(i < 15 and bcd(3 downto 0) > "0100") then --add 3 if BCD digit is greater than 4.
                bcd(3 downto 0) := bcd(3 downto 0) + "0011";
                end if;
                if(i < 15 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
                bcd(7 downto 4) := bcd(7 downto 4) + "0011";
                end if;
                if(i < 15 and bcd(11 downto 8) > "0100") then  --add 3 if BCD digit is greater than 4.
                bcd(11 downto 8) := bcd(11 downto 8) + "0011";
                end if; 
                if(i < 15 and bcd(15 downto 12) > "0100") then  --add 3 if BCD digit is greater than 4.
                bcd(15 downto 12) := bcd(15 downto 12) + "0011";
                end if;
            end loop; 	  
	  
	  --**********************************************************************--
	  
	  -- Convert Binary to BCD (Double Dabble algorithm) for temp_generated
            for i in 0 to 15 loop
                bcd(15 downto 1) := bcd(14 downto 0);  --shifting the bits.
                bcd(0) := temp_generated(15);
                temp_generated(15 downto 1) := temp_generated(14 downto 0);
                temp_generated(0) :='0';

                if(i < 15 and bcd(3 downto 0) > "0100") then --add 3 if BCD digit is greater than 4.
                bcd(3 downto 0) := bcd(3 downto 0) + "0011";
                end if;
                if(i < 15 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
                bcd(7 downto 4) := bcd(7 downto 4) + "0011";
                end if;
                if(i < 15 and bcd(11 downto 8) > "0100") then  --add 3 if BCD digit is greater than 4.
                bcd(11 downto 8) := bcd(11 downto 8) + "0011";
                end if; 
                if(i < 15 and bcd(15 downto 12) > "0100") then  --add 3 if BCD digit is greater than 4.
                bcd(15 downto 12) := bcd(15 downto 12) + "0011";
                end if;
            end loop; 
	 
	 --**********************************************************************--
	  
	  -- Convert Binary to BCD (Double Dabble algorithm) for temp_solar
            for i in 0 to 15 loop
                bcd(15 downto 1) := bcd(14 downto 0);  --shifting the bits.
                bcd(0) := temp_solar(15);
                temp_solar(15 downto 1) := temp_solar(14 downto 0);
                temp_solar(0) :='0';

                if(i < 15 and bcd(3 downto 0) > "0100") then --add 3 if BCD digit is greater than 4.
                bcd(3 downto 0) := bcd(3 downto 0) + "0011";
                end if;
                if(i < 15 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
                bcd(7 downto 4) := bcd(7 downto 4) + "0011";
                end if;
                if(i < 15 and bcd(11 downto 8) > "0100") then  --add 3 if BCD digit is greater than 4.
                bcd(11 downto 8) := bcd(11 downto 8) + "0011";
                end if; 
                if(i < 15 and bcd(15 downto 12) > "0100") then  --add 3 if BCD digit is greater than 4.
                bcd(15 downto 12) := bcd(15 downto 12) + "0011";
                end if;
            end loop; 
   --**********************************************************************--
	  
	  -- Convert Binary to BCD (Double Dabble algorithm) for temp_consumption
            for i in 0 to 15 loop
                bcd(15 downto 1) := bcd(14 downto 0);  --shifting the bits.
                bcd(0) := temp_consumption(15);
                temp_consumption(15 downto 1) := temp_consumption(14 downto 0);
                temp_consumption(0) :='0';

                if(i < 15 and bcd(3 downto 0) > "0100") then --add 3 if BCD digit is greater than 4.
                bcd(3 downto 0) := bcd(3 downto 0) + "0011";
                end if;
                if(i < 15 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
                bcd(7 downto 4) := bcd(7 downto 4) + "0011";
                end if;
                if(i < 15 and bcd(11 downto 8) > "0100") then  --add 3 if BCD digit is greater than 4.
                bcd(11 downto 8) := bcd(11 downto 8) + "0011";
                end if; 
                if(i < 15 and bcd(15 downto 12) > "0100") then  --add 3 if BCD digit is greater than 4.
                bcd(15 downto 12) := bcd(15 downto 12) + "0011";
                end if;
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
		
		
		---**********************************************************************--
		SSEGD0(1) <= '0'; -- eg turn on DIG0, DISPLAY1
      SSEGHex <= generated_dig(35 downto 27);          
      wait for wait_time;
      
      SSEGD0(1) <= '1';    -- turn off previous display
      SSEGD1(1) <= '0';    -- turn on DIG1, DISPLAY1
      SSEGHex <= generated_dig(26 downto 18);
      wait for wait_time;
      
      SSEGD1(1) <= '1';    -- turn off previous display
      SSEGD2(1) <= '0';    -- turn on DIG2, DISPLAY1
      SSEGHex <= generated_dig(17 downto 9);
      wait for wait_time;
      
      SSEGD2(1) <= '1';    -- turn off previous display
      SSEGD3(1) <= '0';    -- turn on DIG3, DISPLAY1
      SSEGHex <= generated_dig(8 downto 0);
      wait for wait_time;
      
      SSEGD3(1) <= '1';     --turn off previous display
		
		---**********************************************************************--
		SSEGD0(2) <= '0'; -- eg turn on DIG0, DISPLAY2
      SSEGHex <= solar_dig(35 downto 27);          
      wait for wait_time;
      
      SSEGD0(2) <= '1';    -- turn off previous display
      SSEGD1(2) <= '0';    -- turn on DIG1, DISPLAY2
      SSEGHex <= solar_dig(26 downto 18);
      wait for wait_time;
      
      SSEGD1(2) <= '1';    -- turn off previous display
      SSEGD2(2) <= '0';    -- turn on DIG2, DISPLAY2
      SSEGHex <= solar_dig(17 downto 9);
      wait for wait_time;
      
      SSEGD2(2) <= '1';    -- turn off previous display
      SSEGD3(2) <= '0';    -- turn on DIG3, DISPLAY2
      SSEGHex <= solar_dig(8 downto 0);
      wait for wait_time;
      
      SSEGD3(2) <= '1';     --turn off previous display
		
		---**********************************************************************--
		
		SSEGD0(3) <= '0'; -- eg turn on DIG0, DISPLAY3
      SSEGHex <= consumption_dig(35 downto 27);          
      wait for wait_time;
      
      SSEGD0(3) <= '1';    -- turn off previous display
      SSEGD1(3) <= '0';    -- turn on DIG1, DISPLAY3
      SSEGHex <= consumption_dig(26 downto 18);
      wait for wait_time;
      
      SSEGD1(3) <= '1';    -- turn off previous display
      SSEGD2(3) <= '0';    -- turn on DIG2, DISPLAY3
      SSEGHex <= consumption_dig(17 downto 9);
      wait for wait_time;
      
      SSEGD2(3) <= '1';    -- turn off previous display
      SSEGD3(3) <= '0';    -- turn on DIG3, DISPLAY3
      SSEGHex <= consumption_dig(8 downto 0);
      wait for wait_time;
      
      SSEGD3(3) <= '1';     --turn off previous display
      wait for wait_time;
      --**********************************************************************--
      
      
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