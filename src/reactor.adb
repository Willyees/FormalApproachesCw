package body Reactor is

  
procedure IncreaseTemperature(temp : in out ReactorLv) is
   begin
      temp := temp + increase_temp_per_meter;
   end IncreaseTemperature;
   
procedure FullDecreaseTemperature(temp : in out ReactorLv) is     
   begin
      temp := ReactorLv'First;
   end FullDecreaseTemperature;
   
end Reactor;
