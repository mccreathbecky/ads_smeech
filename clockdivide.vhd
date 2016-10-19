----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:54:46 10/19/2016 
-- Design Name: 
-- Module Name:    clockdivide - Behavioral 
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity clockdivide is
    Port ( CLK : in  STD_LOGIC;
           CLK_div : out  STD_LOGIC;
           CLK_halfsec : out STD_LOGIC;
           CLK_SSD : out STD_LOGIC
           );
end clockdivide;

architecture Behavioral of clockdivide is
   --want to take a 100MHz clock and make it a 2Hz clock
   SIGNAL div : STD_LOGIC_VECTOR (26 DOWNTO 0) := (OTHERS => '0');
   SIGNAL half_sec : STD_LOGIC_VECTOR (26 DOWNTO 0) := (OTHERS => '0');
   SIGNAL div_ssd : STD_LOGIC_VECTOR (26 DOWNTO 0) := (OTHERS => '0');
   
   --creates a period of 1s [0.5sec low, 0.5 sec high]
begin
   div_1sec : PROCESS(CLK)
   BEGIN
      IF CLK'EVENT AND CLK='1' THEN
         IF div = "101111101011110000100000000" THEN     --100 000 000
            div <= (OTHERS => '0');
            CLK_div <= '0';
         ELSIF div >= "010111110101111000010000000" THEN   --50 000 000
            CLK_div <= '1';
            div <= div + 1;
         ELSE
            CLK_div <= '0';
            div <= div + 1;
         END IF;
      END IF;
   END PROCESS;
   
   
   div_halfsec : PROCESS(CLK)
   BEGIN
      IF CLK'EVENT AND CLK='1' THEN
         IF half_sec = "010111110101111000010000000" THEN     --50 000 000
            half_sec <= (OTHERS => '0');
            CLK_halfsec <= '0';
         ELSIF half_sec >=  "001011111010111100001000000" THEN      --25 000 000
            CLK_halfsec <= '1';
            half_sec <= half_sec + 1;
         ELSE
            CLK_halfsec <= '0';
            half_sec <= half_sec + 1;
         END IF;
      END IF;
   END PROCESS;
   
   div_SSD_process : PROCESS (CLK)
      BEGIN
      IF CLK'EVENT AND CLK='1' THEN
         IF div_ssd = "000000000011000011010100000" THEN     --00 100 000
            CLK_ssd <= '0';
            div_ssd <= (OTHERS => '0');
         ELSIF div_ssd >= "000000000001100001101010000" THEN     --00 050 000
            CLK_ssd <= '1';
            div_ssd <= div_ssd + 1;
         ELSE
            CLK_ssd <= '0';
            div_ssd <= div_ssd + 1;
         END IF;
      END IF;
   END PROCESS;

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

PACKAGE clockdivide_package IS
   
   COMPONENT clockdivide 
       Port ( CLK : in  STD_LOGIC;
              CLK_div : out  STD_LOGIC;
              CLK_halfsec : out STD_LOGIC;
              CLK_SSD : out STD_LOGIC);
   end COMPONENT;
END PACKAGE;