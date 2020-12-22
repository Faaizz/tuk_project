## Stoarge Requirements

For simplicity, it is assumed that all conveyors are turned ON.
Start target position counter from 10 (because we couldn't think of a unified way to determine when the stacker crane gets to the target position).  

1. Transport product to stacker via (ST_AL1_ST1 & ST_AL1_ST2)
2. Pick and place product into Stackable box
3. When 3 products have been placed in the stackable box, transport the box to storage entry and transport a new empty box to stacker entry
4. When box gets to loading conveyor (AL1_G_S1=0), stop the loading conveyor (RC_AL1_G7=0)​
5. Fork left (AL1_G_SC_LT=1) till it reaches the limit (AL1_G_SC_LL=1)
6. Lift box (AL1_G_SC_LIFT=1) till (AL1_G_SC_MZ=0 then AL1_G_SC_MZ=1 then AL1_G_SC_MZ=0)
7. Retrieve fork (AL1_G_SC_LT=0) till (AL1_G_ML=1)
8. Lift down (AL1_G_SC_LIFT=0) till (AL1_G_SC_MZ=0 then AL1_G_SC_MZ=1 then AL1_G_SC_MZ=0)
9. Set target position (AL1_G_SC_TG=10) and increment position
10. Lift box (AL1_G_SC_LIFT=1) till (AL1_G_SC_MZ=0 then AL1_G_SC_MZ=1 then AL1_G_SC_MZ=0)
11. Fork right (AL1_G_SC_RT=1) till it reaches the limit (AL1_G_SC_RL=1)
12. Lift down (AL1_G_SC_LIFT=0) till (AL1_G_SC_MZ=0 then AL1_G_SC_MZ=1 then AL1_G_SC_MZ=0)
13. Retrieve fork (AL1_G_SC_RT=0) till (AL1_G_ML=1)
14. Move stacker crane back to position zero (AL1_G_SC_TG=55)