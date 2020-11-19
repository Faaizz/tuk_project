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
- Sensors implementation 
- Introduced buffers into the production line
- Added Control requirement specifications
- Updated schematics

#### Source Files
- /src/img/sec_B_sketch_v1.jpg
- /src/img/sec_A_sketch_v1.jpg
- /src/img/sec_C_sketch_v1.jpg
- /src/virtual_factories/Section.factoryio
- /src/control_systems/implementation/editor/Sensor+PusherTest
- /src/control_systems/implementation/Sensor_Pusher_Test.st
-------------------------------------------------------------------------------------------------------------------------------------------

## Weeks 15 & 16: 15.10.2020-28.10.2020
### Results
- Redundancy reroute (Changed pusher to pivot arm).
- Removed buffer before machning center.
- Implemented collision prevention mechanism from output of the main route and redundant route of the machining centers.

#### Source Files
- /src/img/sec_B_sketch_v1.jpg
- /src/img/sec_A_sketch_v1.jpg
- SIPN.jpg
-------------------------------------------------------------------------------------------------------------------------------------------

## Weeks 17 29.10.2020-04.11.2020
### Results
- Plant redesign to implement 2 seperate assembly stages.

#### Source Files
- /src/control_systems/virtual_factories/Section.factoryio
-------------------------------------------------------------------------------------------------------------------------------------------

## Weeks 18 05.10.2020-11.11.2020
### Results
- Implementation of control for sorting stage
- Implementation of control for sorting stage

#### Source Files
- /src/control_systems/virtual_factories/sorting.factoryio
- /src/control_systems/virtual_factories/buffer.factoryio
- /src/control_systems/modelling/Sorting_requirements.md
- /src/control_systems/modelling/Buffer_requirements.md
- /src/control_systems/validation/split_section_models/sorting_model.json
- /src/control_systems/validation/split_section_models/lid_buffer_model.json
- /src/control_systems/validation/split_section_models/base_buffer_model.json
- /src/control_systems/implementation/sorting.st
-------------------------------------------------------------------------------------------------------------------------------------------

## Weeks 19 12.11.2020-18.11.2020
### Results
- Implementation of control for a combination of sorting and buffer stages
- Implementation of control for assembly stage
- Implementation of control for a combination of sorting, buffer, and assembly stages

#### Problems
- Setting an output from  2 different function blocks results in some unexplainable error 

#### Source Files
- /src/control_systems/virtual_factories/sorting_buffer.factoryio
- /src/control_systems/virtual_factories/sorting_buffer_assembly.factoryio
- /src/control_systems/modelling/Assembly_requirements.md
- /src/control_systems/validation/sorting_model.json
- /src/control_systems/validation/lid_buffer_model.json
- /src/control_systems/validation/base_buffer_model.json
- /src/control_systems/validation/assembly_model.json
- /src/control_systems/implementation/sorting_buffer.st
- /src/control_systems/implementation/sorting_buffer_assembly.st
-------------------------------------------------------------------------------------------------------------------------------------------