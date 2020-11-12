## Assembly Line 1 Requirements

For simplicity, it is assumed that all conveyors are turned ON.  

1. Transport item (lid/base) to conveyor scale via BC_AL1_1 and BC_AL1_2.​  
    - If an item is about to reach the conveyor scale (S_AL1=1) while an item is still on the scale (CS_AL1_W > 0.5), block the incoming item (push up SB_AL1=1).  

1. Weight item at conveyor scale (CS_AL1_W).​  
    - If item weights less than 4.5kg (lid= 5kg) or more than 7.5kg (base- 7kg), pass it straight ahead (PUWS_AL1_PLUS) and dispose of it via BC_AL1_BIN1-BC_AL1_BIN10.  
    - Otherwise, set an internal controller variable (AL1_TYPE) to tell if it's a lid (weights between 4.5 - 5.5kg; AL1_TYPE= 1) or a base (weights between 6.5 - 7.5kg; AL1_TYPE= 2) and pass it to the right (PUWS_AL1_RT) for assembly.​  

1. Push base/lid onto Pick & Place line buffer​.  
    - If item is a base (AL1_TYPE= 1), then push it onto the base line (activate P_AL1_B) when the item is detected (1 second after S_AL1_B= 1). After pushing (P_AL1_B_FT=1), restore the pusher to its rest position (P_AL1_B=0).​  
    - If item is a lid (AL1_TYPE= 0), then  push it onto the lid line (activate P_AL1_L) when the item is detected (1 second after S_AL1_L= 1). After pushing (P_AL1_L_FT=1), restore the pusher to its rest position (P_AL1_L=0).​   

1. When a lid gets onto the lid assembly line (S_AL1_L1=1), if buffer 2 is free (SB_AL1_L2=0) let lid proceed, otherwise raise stop blade 1 (SB_AL1_L1=1).  

1. When a lid gets to buffer 2 (S_AL1_L2=1), if buffer 3 is free (SB_AL1_L3=0) let lid proceed, otherwise raise stop blade 2 (SB_AL1_L2=1).  

1. When lid gets to buffer 3 (S_AL1_L3=1), if clamp is free (RP_AL1_CLAMPED=0) let lid proceed, otherwise raise stop blade 3 (SB_AL1_L3=1);

1. When a lid gets within clamping range (1 second after S_AL1_RP=1), clamp it (RP_AL1_CLAMP=1).  

1. Release lid from buffer if machine is free:​  
    - If buffer 3 is active (SB_AL1_L3=1) and assembly machine becomes free (RP_AL1_CLAMPED=0), release held item (SB_AL1_L3=0).​  
    - If buffer 2 is active (SB_AL1_L2=1) and buffer 3 is empty (SB_AL1_L3=0), then release held item (SB_AL1_L2=0).​  
    - If buffer 1 is active (SB_AL1_L1=1) and buffer 2 is empty (SB_AL1_L2=0), then release held item (SB_AL1_L1=0).​  

1. When a base gets onto the base assembly line (S_AL1_B1=1), if buffer 2 is free (SB_AL1_B2=0) let base proceed, otherwise raise stop blade 1 (SB_AL1_B1=1).  

1. When a base gets to buffer 2 (S_AL1_B2=1), if buffer 3 is free (SB_AL1_B3=0) let base proceed, otherwise raise stop blade 2 (SB_AL1_B2=1).  

1. When base gets to buffer 3 (S_AL1_B3=1), if clamp is free (LP_AL1_CLAMPED=0) let base proceed, otherwise raise stop blade 3 (SB_AL1_B3=1);

1. When a base gets within clamping range (1 second after S_AL1_LP=1), clamp it (LP_AL1_CLAMP=1).  

1. Release base from buffer if machine is free:​  
    - If buffer 3 is active (SB_AL1_B3=1) and assembly machine becomes free (LP_AL1_CLAMPED=0), release held item (SB_AL1_B3=0).​  
    - If buffer 2 is active (SB_AL1_B2=1) and buffer 3 is empty (SB_AL1_B3=0), then release held item (SB_AL1_B2=0).​  
    - If buffer 1 is active (SB_AL1_B1=1) and buffer 2 is empty (SB_AL1_B2=0), then release held item (SB_AL1_B1=0).​  

1. When there's a lid clamped (RP_AL1_CLAMPED=1) and a base clamped (LP_AL1_CLAMPED=1):
    - Move grabber to lid X & Y-coordinates (AL1_X_SET=8.0) (AL1_Y_SET=1.5)
    - When grabber is at lid X & Y-corrdinates (AL1_X_POS=8.0 & AL1_Y_POS=1.5), move grabber down to pick up lid (AL1_Z_SET= 8.0)
    - When grabber is down (AL1_Z_POS=8.5), pick up lid (AL1_GRAB=1)
    - Release lid clamp (RP_AL1_CLAMP=0)
    - Raise grabber up a little (AL1_Z_SET=4.0)
    - When grabber has been raised up, (AL1_Z_POS=4.0), move grabber to base X & Y coordinates (AL1_X_SET=2.0) (AL1_Y_SET=1.5)
    - When grabber gets to the base location, drop grabber down (AL1_Z_SET=8.5) to fit lid on 
    - Release lid (AL1_GRAB=0) and raise grabber back up  (AL1_Z_POS=4.0)
    - Release clamp (LP_AL1_CLAMP=0)
    - Raise clamp (LP_AL1_RAISE=1)
    - When it reaches upper limit (LP_AL1_LIMIT=1), pit it down again (LP_AL1_RAISE=0)

