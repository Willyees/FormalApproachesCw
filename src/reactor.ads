package Reactor is

   type ReactorLv is range 0..100; 
   ReactorOverheat : ReactorLv := 80;
   increase_temp_per_meter : ReactorLv := 1;
   
   function ReactorInvariant(r : ReactorLv) return Boolean is
     (r < ReactorOverheat);
   
   procedure FullDecreaseTemperature(temp : in out ReactorLv) with
     Post => temp = ReactorLv'First;
   
   procedure IncreaseTemperature(temp : in out ReactorLv) with
     Post => temp < temp'Old and temp >= ReactorLv'First;
   
end Reactor;
