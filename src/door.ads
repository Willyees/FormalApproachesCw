package Door is

   type DoorPosition is (Open, Closed);
   type DoorLock is (Locked, Unlocked);
   type DoorIndex is range 0..1;
   
   type Door is 
      record
         
         position : DoorPosition := Open;
         lock : DoorLock := Locked;
      end record 
     with Dynamic_Predicate => (Door.position /= Open);
   
   type Doors is array (DoorIndex) of Door with Dynamic_Predicate => (for some I in DoorIndex => Doors(I).position = Closed);
   --when in surface, at least one door closed
   function OneDoorClosedInvariant(d : in Doors) return Boolean is
     (for some I in d'Range => d(I).position = Closed);
   --when in water, all doors closed and locked  
   function DoorsClosedLockedInvariant(d : in Doors) return Boolean is
     (for all I in d'Range => d(I).position = Closed and then d(I).lock = Locked);
   
   procedure CloseLockDoors(d : in out Doors) with
     Pre => OneDoorClosedInvariant(d), 
     Post => DoorsClosedLockedInvariant(d);
   
   procedure UnlockDoors(d : in out Doors) with --might not need, if unlock the specific door
     Pre => OneDoorClosedInvariant(d), 
     Post => (for all I in d'Range => d(I).lock = Unlocked);
   
--     procedure OpenAllDoorsExcept(d : in out Doors, index_closed : DoorIndex) with
--       Pre => d(index_closed).position = Closed,
--       Post => d(index_closed).position = Closed;
   
   procedure OpenSpecificDoor(d : in out Doors; index_open : DoorIndex) with
     Post => d(index_open).position = Open and OneDoorClosedInvariant(d);
   
--     function Create(door_n : Integer) return Doors;
--     --type Doors is array(Integer range <>) of Door;
end Door;
