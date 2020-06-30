package Air is

   type OxygenLv is range 0..100;
   OxygenLow : OxygenLv := 20;
   oxygen_usage_per_meter : OxygenLv := 1;--using costant amount of oxygen per each meter of diving
   -- subtype OxygenLv is Float range 0.0..100.0;
                                          
   function OxygenInvariant(o : OxygenLv) return Boolean is --never lower than the thresholds set
     (o > OxygenLv'First);
   
   procedure FullChargeOxygen(oxygen : in out OxygenLv) with 
     Post => oxygen = OxygenLv'Last;
   
   procedure ReduceOxygen(oxygen : in out OxygenLv) with
     Post => oxygen < oxygen'Old and oxygen >= OxygenLv'First;
   
   procedure ShowWarning(o : in OxygenLv) ;
   
end Air;
