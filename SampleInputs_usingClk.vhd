library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity SampleInputs_usingclk is
    Port ( CLK            : in  STD_LOGIC;
           solar_in       : out  STD_LOGIC_VECTOR (9 downto 0);
           consumption_in : out  STD_LOGIC_VECTOR (10 downto 0));
end SampleInputs_usingclk;

architecture Behavioral of SampleInputs_usingclk is
   TYPE lut_consumptiontype IS ARRAY (47 DOWNTO 0) OF STD_LOGIC_VECTOR(10 DOWNTO 0);
   TYPE lut_solartype IS ARRAY (47 DOWNTO 0) OF STD_LOGIC_VECTOR(9 DOWNTO 0);
   CONSTANT consumption_lut : lut_consumptiontype := 
                                     ( "00000011111",
                                       "00000111010",
                                       "00000100000",
                                       "00000101011",
                                       "00000100111",
                                       "00000110000",
                                       "00000101101",
                                       "00000011111",
                                       "00000101100",
                                       "00000101010",
                                       "00000111101",
                                       "00000011001",
                                       "00000101110",
                                       "00000011011",
                                       "00001001001",
                                       "00000011100",
                                       "00000100010",
                                       "00001110111",
                                       "00001100100",
                                       "00001110100",
                                       "00001011100",
                                       "00001111110",
                                       "00001100111",
                                       "00010000011",
                                       "00001011101",
                                       "00001100101",
                                       "00000100000",
                                       "00000101110",
                                       "00000101000",
                                       "00011100001",
                                       "00101010110",
                                       "01010101001",
                                       "01011100011",
                                       "01100001010",
                                       "00001011110",
                                       "00001010100",
                                       "00000101011",
                                       "00001100010",
                                       "00000110101",
                                       "00001101111",
                                       "00010011100",
                                       "00010110100",
                                       "00011010101",
                                       "00010001011",
                                       "00001010011",
                                       "00000011110",
                                       "00001000100",
                                       "00000011101"
                                       );
   CONSTANT max_counter_consumption: integer := 48;
   SIGNAL counter_consumption : integer := 0;
   
   CONSTANT solar_lut : lut_solartype := 
                                       ("0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000010011",
                                       "0000101100",
                                       "0001010001",
                                       "0110011101",
                                       "1000101100",
                                       "1011101110",
                                       "1011111011",
                                       "1100111111",
                                       "1110110000",
                                       "1110110111",
                                       "1110011101",
                                       "1001001100",
                                       "1010101001",
                                       "1010111100",
                                       "0011011011",
                                       "0111101110",
                                       "0100000000",
                                       "0000101100",
                                       "0000000110",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000",
                                       "0000000000"
                                       );
   CONSTANT max_counter_solar: integer := 48;
   SIGNAL counter_solar : integer := 0;
BEGIN

   consumption_process : PROCESS (CLK)
   BEGIN
      IF CLK'EVENT AND CLK = '1' THEN
         IF counter_consumption = max_counter_consumption THEN
            counter_consumption <= 0;
         ELSE
            counter_consumption <= counter_consumption + 1;
         END IF;
         
         consumption_in <= consumption_lut(counter_consumption);
      END IF;
   END PROCESS;
   
   solar_process : PROCESS (CLK)
   BEGIN
      IF CLK'EVENT AND CLK = '1' THEN
         IF counter_solar = max_counter_solar THEN
            counter_solar <= 0;
         ELSE
            counter_solar <= counter_solar + 1;
         END IF;
         
         solar_in <= solar_lut(counter_solar);
      END IF;
   END PROCESS;
 
end Behavioral;

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

PACKAGE SampleInputs_Package IS
   COMPONENT SampleInputs_usingclk 
       Port ( CLK            : in  STD_LOGIC;
              solar_in       : out  STD_LOGIC_VECTOR (9 downto 0);
              consumption_in : out  STD_LOGIC_VECTOR (10 downto 0));
   end COMPONENT;
END PACKAGE;