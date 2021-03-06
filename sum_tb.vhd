LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY sum_tb IS
END sum_tb;
 
ARCHITECTURE behavior OF sum_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sum_Monitoring
    PORT(
         sum_CLK           : IN  std_logic;
         current_source    : IN  std_logic_vector(1 downto 0);
         consumption_in    : IN  std_logic_vector(10 downto 0);
         solar_in          : IN  std_logic_vector(9 downto 0);
         
         percent_battery   : OUT  std_logic_vector(6 downto 0);			
         percent_solar     : OUT  std_logic_vector(6 downto 0);
         total_consumption : OUT  std_logic_vector(12 downto 0);
         total_generated   : OUT  std_logic_vector(12 downto 0));
    END COMPONENT;
    

   --Inputs
   signal sum_CLK : std_logic := '0';
   signal current_source : std_logic_vector(1 downto 0) := (others => '0');
   signal consumption_in : std_logic_vector(10 downto 0) := (others => '0');
   signal solar_in : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal percent_battery : std_logic_vector(6 downto 0);
   signal percent_solar : std_logic_vector(6 downto 0);
   signal total_consumption : std_logic_vector(12 downto 0);
   signal total_generated : std_logic_vector(12 downto 0);
   
   constant sumflag_period : time := 2ns;
   constant simchange_period : time := 10ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sum_Monitoring PORT MAP (
          sum_CLK => sum_CLK,
          current_source => current_source,
          consumption_in => consumption_in,
          solar_in => solar_in,
          percent_battery => percent_battery,
          percent_solar => percent_solar,
          total_consumption => total_consumption,
          total_generated => total_generated
        );

   -- Clock process definitions
   sumflag_process :process
   begin
		sum_CLK <= '0';
		wait for sumflag_period/2;
		sum_CLK <= '1';
		wait for sumflag_period/2;
   end process;
 

   -- Stimulus process
   sim1_none: process
   begin		
      current_source <= "10"; 
      consumption_in <= "00000110110";			
      solar_in <= "0100110010";					
		WAIT FOR simchange_period;
		
		consumption_in <= "01000110110";					
		current_source <= "01";
		WAIT FOR simchange_period;
		
		consumption_in <= "01010110011";					
		current_source <="00";
		WAIT FOR simchange_period;
		
   end process;
END;


