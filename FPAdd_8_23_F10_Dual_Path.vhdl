--------------------------------------------------------------------------------
--                           IntDualSub_26_F10_uid4
-- VHDL generated for Kintex7 @ 10MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2017)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 100
-- Target frequency (MHz): 10
-- Input signals: X Y
-- Output signals: XmY YmX

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntDualSub_26_F10_uid4 is
    port (clk : in std_logic;
          X : in  std_logic_vector(25 downto 0);
          Y : in  std_logic_vector(25 downto 0);
          XmY : out  std_logic_vector(25 downto 0);
          YmX : out  std_logic_vector(25 downto 0)   );
end entity;

architecture arch of IntDualSub_26_F10_uid4 is
signal tempRxMy :  std_logic_vector(25 downto 0);
signal tempRYmX :  std_logic_vector(25 downto 0);
begin
   tempRxMy <= X + (not Y) + '1';
   tempRYmX <= Y + (not X) + '1';
   XmY <= tempRxMy;
   YmX <= tempRYmX;
end architecture;

--------------------------------------------------------------------------------
--                       Normalizer_Z_25_25_25_F10_uid6
-- VHDL generated for Kintex7 @ 10MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, (2007-2020)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 100
-- Target frequency (MHz): 10
-- Input signals: X
-- Output signals: Count R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Normalizer_Z_25_25_25_F10_uid6 is
    port (clk : in std_logic;
          X : in  std_logic_vector(24 downto 0);
          Count : out  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(24 downto 0)   );
end entity;

architecture arch of Normalizer_Z_25_25_25_F10_uid6 is
signal level5 :  std_logic_vector(24 downto 0);
signal count4 :  std_logic;
signal level4 :  std_logic_vector(24 downto 0);
signal count3 :  std_logic;
signal level3 :  std_logic_vector(24 downto 0);
signal count2 :  std_logic;
signal level2 :  std_logic_vector(24 downto 0);
signal count1 :  std_logic;
signal level1 :  std_logic_vector(24 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(24 downto 0);
signal sCount :  std_logic_vector(4 downto 0);
begin
   level5 <= X ;
   count4<= '1' when level5(24 downto 9) = (24 downto 9=>'0') else '0';
   level4<= level5(24 downto 0) when count4='0' else level5(8 downto 0) & (15 downto 0 => '0');

   count3<= '1' when level4(24 downto 17) = (24 downto 17=>'0') else '0';
   level3<= level4(24 downto 0) when count3='0' else level4(16 downto 0) & (7 downto 0 => '0');

   count2<= '1' when level3(24 downto 21) = (24 downto 21=>'0') else '0';
   level2<= level3(24 downto 0) when count2='0' else level3(20 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(24 downto 23) = (24 downto 23=>'0') else '0';
   level1<= level2(24 downto 0) when count1='0' else level2(22 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(24 downto 24) = (24 downto 24=>'0') else '0';
   level0<= level1(24 downto 0) when count0='0' else level1(23 downto 0) & (0 downto 0 => '0');

   R <= level0;
   sCount <= count4 & count3 & count2 & count1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                  RightShifterSticky24_by_max_26_F10_uid8
-- VHDL generated for Kintex7 @ 10MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2008-2011), Florent de Dinechin (2008-2019)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 100
-- Target frequency (MHz): 10
-- Input signals: X S
-- Output signals: R Sticky

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifterSticky24_by_max_26_F10_uid8 is
    port (clk : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          S : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(25 downto 0);
          Sticky : out  std_logic   );
end entity;

architecture arch of RightShifterSticky24_by_max_26_F10_uid8 is
signal ps :  std_logic_vector(4 downto 0);
signal Xpadded :  std_logic_vector(25 downto 0);
signal level5 :  std_logic_vector(25 downto 0);
signal stk4 :  std_logic;
signal level4 :  std_logic_vector(25 downto 0);
signal stk3 :  std_logic;
signal level3 :  std_logic_vector(25 downto 0);
signal stk2 :  std_logic;
signal level2 :  std_logic_vector(25 downto 0);
signal stk1 :  std_logic;
signal level1 :  std_logic_vector(25 downto 0);
signal stk0 :  std_logic;
signal level0 :  std_logic_vector(25 downto 0);
begin
   ps<= S;
   Xpadded <= X&(1 downto 0 => '0');
   level5<= Xpadded;
   stk4 <= '1' when (level5(15 downto 0)/="0000000000000000" and ps(4)='1')   else '0';
   level4 <=  level5 when  ps(4)='0'    else (15 downto 0 => '0') & level5(25 downto 16);
   stk3 <= '1' when (level4(7 downto 0)/="00000000" and ps(3)='1') or stk4 ='1'   else '0';
   level3 <=  level4 when  ps(3)='0'    else (7 downto 0 => '0') & level4(25 downto 8);
   stk2 <= '1' when (level3(3 downto 0)/="0000" and ps(2)='1') or stk3 ='1'   else '0';
   level2 <=  level3 when  ps(2)='0'    else (3 downto 0 => '0') & level3(25 downto 4);
   stk1 <= '1' when (level2(1 downto 0)/="00" and ps(1)='1') or stk2 ='1'   else '0';
   level1 <=  level2 when  ps(1)='0'    else (1 downto 0 => '0') & level2(25 downto 2);
   stk0 <= '1' when (level1(0 downto 0)/="0" and ps(0)='1') or stk1 ='1'   else '0';
   level0 <=  level1 when  ps(0)='0'    else (0 downto 0 => '0') & level1(25 downto 1);
   R <= level0;
   Sticky <= stk0;
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_27_F10_uid10
-- VHDL generated for Kintex7 @ 10MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 100
-- Target frequency (MHz): 10
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_27_F10_uid10 is
    port (clk : in std_logic;
          X : in  std_logic_vector(26 downto 0);
          Y : in  std_logic_vector(26 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(26 downto 0)   );
end entity;

architecture arch of IntAdder_27_F10_uid10 is
signal Rtmp :  std_logic_vector(26 downto 0);
begin
   Rtmp <= X + Y + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_33_F10_uid12
-- VHDL generated for Kintex7 @ 10MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 100
-- Target frequency (MHz): 10
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_33_F10_uid12 is
    port (clk : in std_logic;
          X : in  std_logic_vector(32 downto 0);
          Y : in  std_logic_vector(32 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(32 downto 0)   );
end entity;

architecture arch of IntAdder_33_F10_uid12 is
signal Rtmp :  std_logic_vector(32 downto 0);
begin
   Rtmp <= X + Y + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                            FPAdd_8_23_F10_uid2
-- VHDL generated for Kintex7 @ 10MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Jérémie Detrey, Bogdan Pasca, Florent de Dinechin (2008-2017)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 100
-- Target frequency (MHz): 10
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FPAdd_8_23_F10_uid2 is
    port (clk : in std_logic;
          X : in  std_logic_vector(8+23+2 downto 0);
          Y : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FPAdd_8_23_F10_uid2 is
   component IntDualSub_26_F10_uid4 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(25 downto 0);
             Y : in  std_logic_vector(25 downto 0);
             XmY : out  std_logic_vector(25 downto 0);
             YmX : out  std_logic_vector(25 downto 0)   );
   end component;

   component Normalizer_Z_25_25_25_F10_uid6 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(24 downto 0);
             Count : out  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(24 downto 0)   );
   end component;

   component RightShifterSticky24_by_max_26_F10_uid8 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             S : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(25 downto 0);
             Sticky : out  std_logic   );
   end component;

   component IntAdder_27_F10_uid10 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(26 downto 0);
             Y : in  std_logic_vector(26 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(26 downto 0)   );
   end component;

   component IntAdder_33_F10_uid12 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(32 downto 0);
             Y : in  std_logic_vector(32 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(32 downto 0)   );
   end component;

signal inX :  std_logic_vector(33 downto 0);
signal inY :  std_logic_vector(33 downto 0);
signal exceptionXSuperiorY :  std_logic;
signal exceptionXEqualY :  std_logic;
signal signedExponentX :  std_logic_vector(8 downto 0);
signal signedExponentY :  std_logic_vector(8 downto 0);
signal exponentDifferenceXY :  std_logic_vector(8 downto 0);
signal exponentDifferenceYX :  std_logic_vector(7 downto 0);
signal swap :  std_logic;
signal newX :  std_logic_vector(33 downto 0);
signal newY :  std_logic_vector(33 downto 0);
signal exponentDifference :  std_logic_vector(7 downto 0);
signal shiftedOut :  std_logic;
signal shiftVal :  std_logic_vector(4 downto 0);
signal EffSub :  std_logic;
signal selectClosePath :  std_logic;
signal sdExnXY :  std_logic_vector(3 downto 0);
signal pipeSignY :  std_logic;
signal fracXClose1 :  std_logic_vector(25 downto 0);
signal fracYClose1 :  std_logic_vector(25 downto 0);
signal fracRClosexMy :  std_logic_vector(25 downto 0);
signal fracRCloseyMx :  std_logic_vector(25 downto 0);
signal fracSignClose :  std_logic;
signal fracRClose1 :  std_logic_vector(24 downto 0);
signal resSign :  std_logic;
signal nZerosNew :  std_logic_vector(4 downto 0);
signal shiftedFrac :  std_logic_vector(24 downto 0);
signal roundClose0 :  std_logic;
signal resultCloseIsZero0 :  std_logic;
signal exponentResultClose :  std_logic_vector(9 downto 0);
signal resultBeforeRoundClose :  std_logic_vector(32 downto 0);
signal roundClose :  std_logic;
signal resultCloseIsZero :  std_logic;
signal fracNewY :  std_logic_vector(23 downto 0);
signal shiftedFracY :  std_logic_vector(25 downto 0);
signal sticky :  std_logic;
signal fracYfar :  std_logic_vector(26 downto 0);
signal EffSubVector :  std_logic_vector(26 downto 0);
signal fracYfarXorOp :  std_logic_vector(26 downto 0);
signal fracXfar :  std_logic_vector(26 downto 0);
signal cInAddFar :  std_logic;
signal fracResultfar0 :  std_logic_vector(26 downto 0);
signal fracResultFarNormStage :  std_logic_vector(26 downto 0);
signal fracLeadingBits :  std_logic_vector(1 downto 0);
signal fracResultFar1 :  std_logic_vector(22 downto 0);
signal fracResultRoundBit :  std_logic;
signal fracResultStickyBit :  std_logic;
signal roundFar1 :  std_logic;
signal expOperationSel :  std_logic_vector(1 downto 0);
signal exponentUpdate :  std_logic_vector(9 downto 0);
signal exponentResultfar0 :  std_logic_vector(9 downto 0);
signal exponentResultFar1 :  std_logic_vector(9 downto 0);
signal resultBeforeRoundFar :  std_logic_vector(32 downto 0);
signal roundFar :  std_logic;
signal resultBeforeRound :  std_logic_vector(32 downto 0);
signal round :  std_logic;
signal zeroFromClose :  std_logic;
signal zeroInput :  std_logic_vector(32 downto 0);
signal resultRounded :  std_logic_vector(32 downto 0);
signal syncEffSub :  std_logic;
signal syncX :  std_logic_vector(33 downto 0);
signal syncSignY :  std_logic;
signal syncResSign :  std_logic;
signal UnderflowOverflow :  std_logic_vector(1 downto 0);
signal resultNoExn :  std_logic_vector(33 downto 0);
signal syncExnXY :  std_logic_vector(3 downto 0);
signal exnR :  std_logic_vector(1 downto 0);
signal sgnR :  std_logic;
signal expsigR :  std_logic_vector(30 downto 0);
begin
-- Exponent difference and swap  --
   inX <= X;
   inY <= Y;
   exceptionXSuperiorY <= '1' when inX(33 downto 32) >= inY(33 downto 32) else '0';
   exceptionXEqualY <= '1' when inX(33 downto 32) = inY(33 downto 32) else '0';
   signedExponentX <= "0" & inX(30 downto 23);
   signedExponentY <= "0" & inY(30 downto 23);
   exponentDifferenceXY <= signedExponentX - signedExponentY ;
   exponentDifferenceYX <= signedExponentY(7 downto 0) - signedExponentX(7 downto 0);
   swap <= (exceptionXEqualY and exponentDifferenceXY(8)) or (not(exceptionXSuperiorY));
   newX <= inY when swap = '1' else inX;
   newY <= inX when swap = '1' else inY;
   exponentDifference <= exponentDifferenceYX when swap = '1' else exponentDifferenceXY(7 downto 0);
   shiftedOut <= exponentDifference(7) or exponentDifference(6) or exponentDifference(5);
   shiftVal <= exponentDifference(4 downto 0) when shiftedOut='0'
          else CONV_STD_LOGIC_VECTOR(26,5) ;
   EffSub <= newX(31) xor newY(31);
   selectClosePath <= EffSub when exponentDifference(7 downto 1) = (7 downto 1 => '0') else '0';
   sdExnXY <= newX(33 downto 32) & newY(33 downto 32);
   pipeSignY <= newY(31);

-- Close Path --
   fracXClose1 <= "01" & newX(22 downto 0) & '0';
   with exponentDifference(0)  select 
   fracYClose1 <=  "01" & newY(22 downto 0) & '0' when '0',
                  "001" & newY(22 downto 0)       when others;
   FPAdd_8_23_F10_uid2_DualSubClose: IntDualSub_26_F10_uid4
      port map ( clk  => clk,
                 X => fracXClose1,
                 Y => fracYClose1,
                 XmY => fracRClosexMy,
                 YmX => fracRCloseyMx);
   fracSignClose <= fracRClosexMy(25);
   fracRClose1 <= fracRClosexMy(24 downto 0) when fracSignClose='0' else fracRCloseyMx(24 downto 0);
   resSign <= '0' when selectClosePath='1' and fracRClose1 = (24 downto 0 => '0') else
             newX(31) xor (selectClosePath and fracSignClose);
   norm: Normalizer_Z_25_25_25_F10_uid6
      port map ( clk  => clk,
                 X => fracRClose1,
                 Count => nZerosNew,
                 R => shiftedFrac);
   roundClose0 <= shiftedFrac(0) and shiftedFrac(1);
   resultCloseIsZero0 <= '1' when nZerosNew = CONV_STD_LOGIC_VECTOR(31, 5) else '0';
   exponentResultClose <= ("00" & newX(30 downto 23)) - (CONV_STD_LOGIC_VECTOR(0,5) & nZerosNew);
   resultBeforeRoundClose <= exponentResultClose(9 downto 0) & shiftedFrac(23 downto 1);
   roundClose <= roundClose0;
   resultCloseIsZero <= resultCloseIsZero0;

-- Far Path --
   fracNewY <= '1' & newY(22 downto 0);
   RightShifterComponent: RightShifterSticky24_by_max_26_F10_uid8
      port map ( clk  => clk,
                 S => shiftVal,
                 X => fracNewY,
                 R => shiftedFracY,
                 Sticky => sticky);
   fracYfar <= "0" & shiftedFracY;
   EffSubVector <= (26 downto 0 => EffSub);
   fracYfarXorOp <= fracYfar xor EffSubVector;
   fracXfar <= "01" & (newX(22 downto 0)) & "00";
   cInAddFar <= EffSub and not sticky;
   FPAdd_8_23_F10_uid2_fracAddFar: IntAdder_27_F10_uid10
      port map ( clk  => clk,
                 Cin => cInAddFar,
                 X => fracXfar,
                 Y => fracYfarXorOp,
                 R => fracResultfar0);
   -- 2-bit normalisation
   fracResultFarNormStage <= fracResultfar0;
   fracLeadingBits <= fracResultFarNormStage(26 downto 25) ;
   fracResultFar1 <=
           fracResultFarNormStage(23 downto 1)  when fracLeadingBits = "00" 
      else fracResultFarNormStage(24 downto 2)  when fracLeadingBits = "01" 
      else fracResultFarNormStage(25 downto 3);
   fracResultRoundBit <=
           fracResultFarNormStage(0) 	 when fracLeadingBits = "00" 
      else fracResultFarNormStage(1)    when fracLeadingBits = "01" 
      else fracResultFarNormStage(2) ;
   fracResultStickyBit <=
           sticky 	 when fracLeadingBits = "00" 
      else fracResultFarNormStage(0) or  sticky   when fracLeadingBits = "01" 
      else fracResultFarNormStage(1) or fracResultFarNormStage(0) or sticky;
   roundFar1 <= fracResultRoundBit and (fracResultStickyBit or fracResultFar1(0));
   expOperationSel <= "11" when fracLeadingBits = "00" -- add -1 to exponent
               else   "00" when fracLeadingBits = "01" -- add 0 
               else   "01";                              -- add 1
   exponentUpdate <= (9 downto 1 => expOperationSel(1)) & expOperationSel(0);
   exponentResultfar0<="00" & (newX(30 downto 23));
   exponentResultFar1 <= exponentResultfar0 + exponentUpdate;
   resultBeforeRoundFar <= exponentResultFar1 & fracResultFar1;
   roundFar <= roundFar1;

-- Synchronization of both paths --
   with selectClosePath  select 
   resultBeforeRound <= resultBeforeRoundClose when '1',
                        resultBeforeRoundFar   when others;
   with selectClosePath  select 
   round <= roundClose when '1',
            roundFar   when others;
   zeroFromClose <= selectClosePath and resultCloseIsZero;

-- Rounding --
   zeroInput <= "000000000000000000000000000000000";
   FPAdd_8_23_F10_uid2_finalRoundAdd: IntAdder_33_F10_uid12
      port map ( clk  => clk,
                 Cin => round,
                 X => resultBeforeRound,
                 Y => zeroInput,
                 R => resultRounded);
   syncEffSub <= EffSub;
   syncX <= newX;
   syncSignY <= pipeSignY;
   syncResSign <= resSign;
   UnderflowOverflow <= resultRounded(32 downto 31);
   with UnderflowOverflow  select 
   resultNoExn(33 downto 32) <=   (not zeroFromClose) & "0" when "01", -- overflow
                                 "00" when "10" | "11",  -- underflow
                                 "0" &  not zeroFromClose  when others; -- normal 
   resultNoExn(31 downto 0) <= syncResSign & resultRounded(30 downto 0);
   syncExnXY <= sdExnXY;
   -- Exception bits of the result
   with syncExnXY  select  -- remember that ExnX > ExnY 
      exnR <= resultNoExn(33 downto 32) when "0101",
              "1" & syncEffSub          when "1010",
              "11"                      when "1110",
              syncExnXY(3 downto 2)     when others;
   -- Sign bit of the result
   with syncExnXY  select 
      sgnR <= resultNoExn(31)         when "0101",
              syncX(31) and syncSignY when "0000",
              syncX(31)               when others;
   -- Exponent and significand of the result
   with syncExnXY  select   
      expsigR <= resultNoExn(30 downto 0)   when "0101" ,
                 syncX(30 downto  0)        when others; -- 0100, or at least one NaN or one infty 
   R <= exnR & sgnR & expsigR;
end architecture;

