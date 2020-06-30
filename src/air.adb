with Ada.Text_IO; use Ada.Text_IO;
package body Air is

   procedure FullChargeOxygen(oxygen : in out OxygenLv) is 
   begin 
      oxygen := OxygenLv'Last;
   end FullChargeOxygen;
   
   procedure ReduceOxygen(oxygen : in out OxygenLv) is
   begin
      oxygen := oxygen - oxygen_usage_per_meter; --debug: dont use a hard coded value
      if(oxygen <= OxygenLow) then --show when it hits the threshold
         ShowWarning(oxygen);
      end if;
      
   end ReduceOxygen;  
   
   procedure showWarning(o : in OxygenLv) is
   begin
      Put_Line("Low Oxygen's level in the submarine: " & o'Image & " %");
   end ShowWarning;
   
end Air;
