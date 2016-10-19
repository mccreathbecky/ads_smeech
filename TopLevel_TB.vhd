
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TopLevel_TB IS
END TopLevel_TB;
 
ARCHITECTURE behavior OF TopLevel_TB IS 
 
 
 COMPONENT TopLevel IS
    PORT (-- CLK_sampleRate  : IN     STD_LOGIC;
          -- solar_in        : IN     STD_LOGIC_VECTOR (9 DOWNTO 0);
--           consumption_in  : IN     STD_LOGIC_VECTOR (10 DOWNTO 0);
           CLK             : IN     STD_LOGIC;
           GreenLed        : OUT    STD_LOGIC;
           RedLed	         : OUT    STD_LOGIC;
			  SSEGHex 			: OUT STD_LOGIC_VECTOR(8 DOWNTO 0);   
           SSEGD0 			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);    
           SSEGD1 			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           SSEGD2 			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           SSEGD3 			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           SSEGCL 			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;
    

   --Inputs
   signal CLK            : std_logic := '0';
--   signal CLK_sampleRate : std_logic := '0';
--   signal solar_in : std_logic_vector(9 downto 0) := (others => '0');
--   signal consumption_in : std_logic_vector(10 downto 0) := (others => '0');

 	--Outputs
   SIGNAL GreenLed      : STD_LOGIC;
   SIGNAL RedLed	      : STD_LOGIC;
	SIGNAL SSEGHex 		: STD_LOGIC_VECTOR(8 DOWNTO 0);   
   SIGNAL SSEGD0 			: STD_LOGIC_VECTOR (3 DOWNTO 0);    
   SIGNAL SSEGD1 			: STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL SSEGD2 			: STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL SSEGD3 			: STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL SSEGCL 			: STD_LOGIC_VECTOR (3 DOWNTO 0);

   -- Clock period definitions
   constant CLK_period : time := 10ns;
--   constant CLK_sampleRate_period : time := 0.05sec;
--   constant consumption_period : time := 1.5sec;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopLevel PORT MAP (
--          CLK_sampleRate => CLK_sampleRate,
--          solar_in => solar_in,
--          consumption_in => consumption_in,
          CLK => CLK,
          GreenLed => GreenLed,
          RedLed => RedLed,
          SSEGHex => SSEGHex,
          SSEGD0 => SSEGD0,
          SSEGD1 => SSEGD1,
          SSEGD2 => SSEGD2,
          SSEGD3 => SSEGD3,
          SSEGCL => SSEGCL
          
        );

   CLK_Process: PROCESS
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;

END;
