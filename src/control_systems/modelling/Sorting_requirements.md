## Sorting Requirements

For simplicity, it is assumed that all conveyors are turned ON.  

1. Transport item (lid/base) to conveyor scale via BC_AL1_1 and BC_AL1_2.​  
    - As long as an item is on the scale (CS_AL1_W > 1), raise the stop blade (SB_AL1=1).

1. Weight item at conveyor scale (CS_AL1_W).​  
    - If item weights less than 4kg (lid= 5kg) or more than 8kg (base- 7kg), pass it straight ahead (PUWS_AL1_PLUS) and dispose of it via BC_AL1_BIN1-BC_AL1_BIN10.  
    - Otherwise, set an internal controller variablew (AL1_LID=1, AL1_BASE=0) to tell if it's a lid (weights between 4kg and 6kg; AL1_TYPE= 1) or a base (weights between 6 - 8kg; AL1_LID=0, AL1_BASE=1) and pass it to the right (PUWS_AL1_RT) for assembly.​  