# Master Project
Project work carried out at the [Institute of Automation Technology, Technical University of Kaiserslautern](https://www.eit.uni-kl.de/atplus/home/).

The purpose of this repo is to document my learnings and keep track of my progress.

-------------------------------------------------------------------------------------------------------------------------------------------
## Project description:
The goal of the project is the design, implementation, and control of a virtual factory capable of being used for teaching and research. 
Based on the factory simulation, different algorithms such as fault-tolerant control, 
reconfiguration and cyber-security approaches can be tested. 
To allow a wide range of applications, different communication frameworks are to be implemented 
(e.g. communication to soft PLC, programming languages, OPC UA, etc.). 

-------------------------------------------------------------------------------------------------------------------------------------------
## Task description:
<!-- 
Markdown Tips: 
- Nested lists obtained by using 4 spaces before each bullet point. 
-->
- Design and implementation of industrial processes using [Factory I/O](https://factoryio.com/):
    - Process should include redundancies/flexibilities
    - Combination processes should be included
    - Modularization: Design of different scenes that can be easily combined to allow easy scaling of the size of the simulated system
- Specify control requirements for the modelled processes
- Model and design logic control systems to fulfil specified control requirements
- Verify and validate designed logic controllers
- Implement control with a soft PLC:
  - Implement the controllers using structured text on a Soft PLC
- Write programs that automatically inject faults into the plants using Factory I/O SDK (for fault detection, fault-tolerant control)
- Connect the plant with the soft PLC-based controller and run simulation
- Modelling of plant behavior:
    - Normal plant behavior
    - Faulty plant behavior
    - Modularized approach to allow the combination of different system parts
- Communication via Modbus TCP/IP (read/write signals):
    - Communication with Python
    - Communication with Matlab

-------------------------------------------------------------------------------------------------------------------------------------------
## Weeks 1&2: 10.07.2020-23.07.2020
### Goals
- Explore Facotry I/O and build a demo factory to get a hang of the software environment
### Deliverables
- Simple virtual factory with basic controls implemented
### Results
- Demo factory was created and basic controls implemented. 
However, after a couple of operation cycles, the control goes berserk
#### Source Files
- /src/virtual_factories/demo-factory
- /src/control_systems/modelling/demo_factory.pdf
- /src/control_systems/implementation/demo_factory.st
- /src/control_systems/validation/demo_factory.smv

-------------------------------------------------------------------------------------------------------------------------------------------
## Weeks 2&3: 24.07.2020-06.08.2020
### Goals
- Troubleshoot and fix demo factory control
### Deliverables
- Virtual factory with working basic controls
### Results
- PLC logic fixed to sustain control over multiple operation cycles
#### Source Files
- /src/virtual_factories/demo_factory
- /src/control_systems/implementation/demo_factory.st
-------------------------------------------------------------------------------------------------------------------------------------------
## Weeks 5-11: 06.08.2020-23.09.2020
Exam Preparation.

-------------------------------------------------------------------------------------------------------------------------------------------

## Weeks 2&3: 23.07.2020-06.10.2020

#### Source Files
- /src/virtual_factories/demo_factory_extended
-------------------------------------------------------------------------------------------------------------------------------------------