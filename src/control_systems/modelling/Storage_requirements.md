## Stoarge Requirements

For simplicity, it is assumed that all conveyors are turned ON.
Start target position counter from 10 (because we couldn't think of a unified way to determine when the stacker crane gets to the target position).  

1. Tranport box to storage entry
2. When box gets to loading conveyor (AL1_G_S1=0), stop the loading conveyor (RC_AL1_G7=0)​
3. Fork left (AL1_G_SC_LT=1) till it reaches the limit (AL1_G_SC_LL=1)
4. Lift box (AL1_G_SC_LIFT=1) till (AL1_G_SC_MZ=0 then AL1_G_SC_MZ=1 then AL1_G_SC_MZ=0)
5. Retrieve fork (AL1_G_SC_LT=0) till (AL1_G_ML=1)
6. Lift down (AL1_G_SC_LIFT=0) till (AL1_G_SC_MZ=0 then AL1_G_SC_MZ=1 then AL1_G_SC_MZ=0)
7. Set target position (AL1_G_SC_TG=10) and increment position
8. Lift box (AL1_G_SC_LIFT=1) till (AL1_G_SC_MZ=0 then AL1_G_SC_MZ=1 then AL1_G_SC_MZ=0)
9. Fork right (AL1_G_SC_RT=1) till it reaches the limit (AL1_G_SC_RL=1)
10. Lift down (AL1_G_SC_LIFT=0) till (AL1_G_SC_MZ=0 then AL1_G_SC_MZ=1 then AL1_G_SC_MZ=0)
11. Retrieve fork (AL1_G_SC_RT=0) till (AL1_G_ML=1)
12. Move stacker crane back to position zero (AL1_G_SC_TG=55)