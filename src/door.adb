package body Door is

   
   procedure UnlockDoors(d : in out Doors) is
   begin
      for i in d'Range loop
         d(i).lock := UnLocked;
      end loop;
   end UnlockDoors;
   
   procedure CloseLockDoors(d : in out Doors) is --no need to check for order close then lock
   begin 
      for i in d'Range loop
         d(i).position := Closed;
         d(i).lock := Locked;
      end loop;
   end CloseLockDoors;
   
--     procedure OpenAllDoorsExcept(d : in out Doors, index_closed : DoorIndex) is
--     begin 
--        for i in d'Range loop
--           d(i).lock := Unlocked; --can unlock all, the only constraint is on one being closed
--           if(i /= index_closed) then
--              d(i).position = Open;
--           end if;
   procedure OpenSpecificDoor(d : in out Doors; index_open : DoorIndex) is
   begin
      d(index_open).lock := Unlocked;
      d(index_open).position := Open;
   end OpenSpecificDoor;
   
--       function Create(door_n : Integer) return Doors is
--        a : Doors (0..door_n);
--     begin
--        return a;
--        end Create;
end Door;
