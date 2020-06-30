with Reactor; use Reactor;
with Air; use Air;
with Door; use Door;
package submarine with SPARK_Mode is

   type Depth is range 0..1000;
   type SubStatus is (Submerged, InWater);

   
   type Submarine is
      record
         status : SubStatus := Submerged;
         doors_status : Doors := (0=> (Open, Unlocked), 1=> (Open, Unlocked));
         --doors_status : Doors := (0=> (Open, Unlocked), 1=> (Open, Unlocked));
         oxygen : OxygenLv;
         reactor : ReactorLv := ReactorLv'First;
         actual_depth : Depth := Depth'First;
         actual_horizontal_position : Integer := 0;
         
      end record;
   
   

   procedure Dive(sub : in out Submarine; to_depth : in Depth) with
     Pre => DoorsClosedLockedInvariant(sub.doors_status) and OxygenInvariant(sub.oxygen) and ReactorInvariant(sub.reactor),
     Post => 
       (case sub.status is 
          when Submerged => OneDoorClosedInvariant(sub.doors_status) and sub.actual_depth = Depth'First,
              when InWater => DoorsClosedLockedInvariant(sub.doors_status)) 
       and (sub.actual_depth > sub.actual_depth'Old and sub.actual_depth <= Depth'Last) and OxygenInvariant(sub.oxygen) and ReactorInvariant(sub.reactor);
     
   
     --modify to pass the submarine obj
     
   procedure Resurface(sub : in out Submarine) with
     Pre => DoorsClosedLockedInvariant(sub.doors_status),
     Post => sub.actual_depth = Depth'First and OxygenInvariant(sub.oxygen) and ReactorInvariant(sub.reactor);
     
   procedure Ascend(sub: in out Submarine; to_depth : in Depth) with
     Pre => DoorsClosedLockedInvariant(sub.doors_status) and sub.actual_depth > to_depth, 
     Post => sub.actual_depth = to_depth and 
   (case sub.status is 
          when Submerged => OneDoorClosedInvariant(sub.doors_status),
        when InWater => DoorsClosedLockedInvariant(sub.doors_status)) 
     and OxygenInvariant(sub.oxygen) and ReactorInvariant(sub.reactor);
   
   
   

   
   procedure MoveHorizontal(sub : in out Submarine; distance : Integer) with
     Pre => DoorsClosedLockedInvariant(sub.doors_status) and OxygenInvariant(sub.oxygen) and ReactorInvariant(sub.reactor),
     Post => sub.actual_horizontal_position = sub.actual_horizontal_position'Old + distance and
       (case sub.status is 
          when Submerged => OneDoorClosedInvariant(sub.doors_status),
            when InWater => DoorsClosedLockedInvariant(sub.doors_status))
   and OxygenInvariant(sub.oxygen) and ReactorInvariant(sub.reactor);
     
   

   
   
end submarine;
