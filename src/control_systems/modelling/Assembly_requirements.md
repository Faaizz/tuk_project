## Assembly Requirements

1. When a lid is clamped (RP_AL1_CLAMPED=1) and the grabber is free (AL1_DETECTED=0):
    - Move grabber to lid X & Y-coordinates (AL1_X_SET=8.0) (AL1_Y_SET=1.5)
    - When grabber is at lid X & Y-corrdinates (AL1_X_POS=8.0 & AL1_Y_POS=1.5), move grabber down to pick up lid (AL1_Z_SET= 8.0)
    - When grabber is down (AL1_Z_POS=8.0), pick up lid (AL1_GRAB=1)
    - Release lid clamp (RP_AL1_CLAMP=0) 
    - When clamp is released (RP_AL1_CLAMPED=0), raise grabber up a little (AL1_Z_SET=4.0)
    - When grabber has been raised up, (AL1_Z_POS=4.0), move grabber to base X & Y coordinates (AL1_X_SET=2.1) (AL1_Y_SET=1.5)

1. When the grabber holds a lid (AL1_DETECTED=1) (AL1_GRAB=1) and is at base position (AL1_X_SET=2.1) (AL1_Y_SET=1.5), if a base has also been clamped (LP_AL1_CLAMPED=1): 
    - Drop grabber down (AL1_Z_SET=8.18) to fit lid on base 
    - Release lid (AL1_GRAB=0) and raise grabber back up (AL1_Z_POS=4.0) 
    - Release clamp (LP_AL1_CLAMP=0) 
    - When clamp is released (LP_AL1_CLAMPED=0), raise clamp (LP_AL1_RAISE=1) 
    - When it reaches upper limit (LP_AL1_LIMIT=1), put it down again (LP_AL1_RAISE=0) 


