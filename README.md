# Master Project
Project work carried out at the [Institute of Automation Technology, Technical University of Kaiserslautern](https://www.eit.uni-kl.de/atplus/home/).

The purpose of this repo is to document our learnings and keep track of our progress.

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
- Demo factory created and basic controls implemented,but control goes berserk after a couple of operation cycles.
#### Source Files
- /src/virtual_factories/demo_factory.factoryio
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
#### Visualization
- [Simple 2 Axis Pick and Place](https://youtu.be/4csPRa-M_I4)
#### Source Files
- /src/virtual_factories/demo_factory
- /src/control_systems/implementation/demo_factory.st
-------------------------------------------------------------------------------------------------------------------------------------------
## Weeks 5-11: 06.08.2020-23.09.2020
Exam Preparation.

-------------------------------------------------------------------------------------------------------------------------------------------

## Weeks 12: 24.09.2020-30.09.2020
### Goals
- Formulate an understanding of the nature and scope of the virtual factory
- Lay down design goals
### Deliverables
- Draft of virtual factory schematics
### Results
- Sketch of virtual factory schematics with parts labelled
#### Source Files
- /src/img/schematics_sketch_v1_1.jpg
- /src/img/schematics_sketch_v1_2.jpg
-------------------------------------------------------------------------------------------------------------------------------------------

## Weeks 13: 01.10.2020-07.10.2020
### Goals
- Divide the virtual factory into sections
- Refine design goals for Section A and implement in Factory I/O
### Deliverables
- Implementation of Section A
### Results
- Advanced schematics of Section A
- Implementation of Section A
#### Source Files
- /src/img/sec_A_sketch_v1.jpg
- /src/virtual_factories/sec_A.factoryio
-------------------------------------------------------------------------------------------------------------------------------------------

## Weeks 14: 08.10.2020-14.10.2020
### Goals
- Refine design goals for Section B & Section C and implement in Factory I/O

### Deliverables
- Implementation of Section B & Section C

### Results
- Advanced schematics of Section B
- Implementation of Section A, B & C
- Advanced schematics of Section B & C
- Sensor+Pusher Control for redundant paths

#### Source Files
- /src/img/sec_B_sketch_v1.jpg
- /src/virtual_factories/Section.factoryio
- /src/control_systems/implementation/editor/Sensor+PusherTest
- /src/control_systems/implementation/Sensor_Pusher_Test.st
-------------------------------------------------------------------------------------------------------------------------------------------
