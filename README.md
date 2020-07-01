# Aim
Design a control system for a submarine and utilize Ada-Spark to create body and specifications for the system.

It is needed to specify conditions for all the subsystems in the submarine as specified in the coursework specification.

# Implementation 
It has been used the SPARK language to ensure the correct functionality of the implemented submarine’s processes, conforming to the contracts set for each method created (preconditions-postconditions, predicates, etc). 

Gold level SPARK achieved where proof of key integrity obtained, absence of run-time errors and correct initialisation, data and information flow

# Features
Project split mainly in 4 sections: oxygen, door, reactor and submarine. (torpedo features have not been implemented)

- Submarine is not able to perform operations unless both doors are closed and locked
- Submarine must have at least one airlock door closed at all times.
- If oxygen runs out, submarine has to resurface
- If the reactor overheats, the submarine has to surface.
– If the oxygen runs low, a warning must be shown.
– Submarine cannot dive beneath a certain depth.

More details can be found on the [report](https://github.com/Willyees/FormalApproachesCw/blob/main/40212064.pdf).
