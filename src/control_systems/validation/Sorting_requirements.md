## Sorting Requirements

For simplicity, it is assumed that all conveyors are turned ON.  

1. Transport item (lid/base) to conveyor scale and stop scale for accurate measurement.​  
    - As long as an item is on the scale (CS_AL1_W > 1), raise the stop blade (SB_AL1=1).
    - Stop conveyor scale for at least 1 second to measure item weight accurately.

1. Weight item at conveyor scale (CS_AL1_W).​  
    - If item weights less than 4kg(2V) (lid= 5kg) or more than 8kg(4V) (base- 7kg), pass it straight ahead (PUWS_AL1_PLUS) and dispose of it via BC_AL1_BIN1-BC_AL1_BIN10.  
    - Pass it to the right (PUWS_AL1_RT) towards the buffer.​  