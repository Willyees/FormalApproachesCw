with Reactor; use Reactor;
with Air; use Air;
with Door; use Door;
with Ada.Text_IO; use Ada.Text_IO;
package body submarine with SPARK_Mode is
   
   procedure Resurface(sub : in out Submarine) is --will replenish o2 and lower temperature
   begin
      if(DoorsClosedLockedInvariant(sub.doors_status)) then
         --Put_Line("Resurfacing");
         Ascend(sub, Depth'First);
         UnlockDoors(sub.doors_status);
         OpenSpecificDoor(sub.doors_status, DoorIndex'First);
         FullChargeOxygen(sub.oxygen);
         FullDecreaseTemperature(sub.reactor);
      
      --else
         --Put_Line("cannot operate without closing and locking the doors!"); 
         end if;
   end Resurface;
   
         
   procedure Ascend(sub: in out Submarine; to_depth : in Depth) is --not replenish o2 and reactor temperature
   begin 
      --sub.status := InWater;
      if(DoorsClosedLockedInvariant(sub.doors_status)) then
         while (sub.actual_depth > to_depth) loop
            sub.actual_depth := sub.actual_depth - 1;
         --increase oxygen?
         end loop;
         if(sub.actual_depth = Depth'First) then
            sub.status := Submerged;
         end if;
      --else
         --Put_Line("cannot operate without closing and locking the doors!");
      end if;
   end Ascend;
   
      
   procedure Dive(sub : in out Submarine; to_depth : in Depth) is
      --current_depth := sub.actual_depth;
   begin
      if(DoorsClosedLockedInvariant(sub.doors_status)) then
         sub.status := InWater;
         while (sub.actual_depth < to_depth and sub.actual_depth < Depth'Last) loop
            sub.actual_depth := sub.actual_depth + 1;
            ReduceOxygen(sub.oxygen);
            if not(OxygenInvariant(sub.oxygen)) then
               --Put_Line("Oxygen run out");
               --Put_Line("Reached depth: " & sub.actual_depth'Image);
               Resurface(sub);
               exit;
            end if;
       
         end loop;
         --Put_Line("Reached depth: " & sub.actual_depth'Image);
      --else
         --Put_Line("cannot operate without closing and locking the doors!");
      end if;
   end Dive;
   
   
   
   procedure MoveHorizontal(sub : in out Submarine; distance : Integer) is --assumption. can only move underwater
   begin 
      if(DoorsClosedLockedInvariant(sub.doors_status)) then
         for i in 0..distance loop
            sub.actual_horizontal_position := sub.actual_horizontal_position + 1;
            IncreaseTemperature(sub.reactor); 
            if not(ReactorInvariant(sub.reactor)) then --if using floats need to use > (could skip the = check)
               --Put_Line("Overheat reactor");
               Resurface(sub);
               exit;
            end if;
         
         end loop;
         --Put_Line("Moved of " & distance'Image & " m");
      --else
         --Put_Line("cannot operate without closing and locking the doors!");
      end if;
   end MoveHorizontal;
   
   
   
     
end submarine;
