## Buffer Requirements 

1. When an item is incoming from the sorting stage, push it onto the buffer:
    - If item is a base (P_BASE=1), activate the base pusher (P_AL1_B) when the item gets within range (0.9 second after S_AL1_B=1).
    - If item is a lid (P_LID=1), activate lid pusher (P_AL1_L) when the item gets within range (0.9 second after S_AL1_L=1).

1. Retract the pusher:
    - Retract base pusher (set P_AL1_B=0 and wait till P_AL1_B_BK=1) after full extension (P_AL1_B_FT=1).
    - Retract base pusher (set P_AL1_L=0 and wait till P_AL1_L_BK=1) after full extension (P_AL1_L_FT=1).

1. When item reaches buffer 1 (S_AL1_B1=1/S_AL1_L1=1):
    - Activate buffer 1 (SB_AL1_B1=1/SB_AL1_L1=1) if buffer 2 is full (S_AL1_B2=1/S_AL1_L2=1).
    - Pass it to buffer 2 (SB_AL1_B1=0/SB_AL1_L1=0) if buffer 2 is free (S_AL1_B2=0/S_AL1_L2=0).

1. When item reaches buffer 2 (S_AL1_B2=1/S_AL1_L2=1):
    - Activate buffer 2 (SB_AL1_B2=1/SB_AL1_L2=1) if buffer 3 is full (S_AL1_B3=1/S_AL1_L3=1).
    - Pass it to buffer 3 (SB_AL1_B2=0/SB_AL1_L2=0) if buffer 3 is free (S_AL1_B3=0/S_AL1_L3=0).

1. When item reaches buffer 3 (S_AL1_B3=1/S_AL1_L3=1):
    - Activate buffer 3 (SB_AL1_B3=1/SB_AL1_L3=1) if clamp is busy (RP_AL1_CLAMPED=1/LP_AL1_CLAMPED=1)
    - Pass it to clamp (SB_AL1_B3=0/SB_AL1_L3=0) if clamp is free (RP_AL1_CLAMPED=0/LP_AL1_CLAMPED=0).

1. When item reached clamp (S_AL1_RP=1/S_AL1_LP=1), clamp item (RP_AL1_CLAMP=1/LP_AL1_CLAMP=1).