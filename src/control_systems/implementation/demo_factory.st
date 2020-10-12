PROGRAM demo_factory
  VAR
    ST_X AT %IX100.0 : BOOL;
    ST_Z AT %IX100.1 : BOOL;
    S_L AT %IX100.2 : BOOL;
    SL_P AT %IX100.3 : BOOL;
    SL_M AT %IX100.4 : BOOL;
    SBC AT %IX100.5 : BOOL;
    SB_P AT %IX100.6 : BOOL;
    SB_M AT %IX100.7 : BOOL;
    RESET AT %IX101.0 : BOOL;
    AT_X AT %QX100.0 : BOOL := 0;
    AT_Z AT %QX100.1 : BOOL := 0;
    AT_G AT %QX100.2 : BOOL := 0;
    AL_C AT %QX100.3 : BOOL := 0;
    AL_M AT %QX100.4 : BOOL := 0;
    RB_M AT %QX100.5 : BOOL := 0;
    AB_C AT %QX100.6 : BOOL := 0;
    AB_M AT %QX100.7 : BOOL := 0;
    (* PLACES ARE SET AS OUTPUTS FOR DEBUGGING *)
    (* PLACES *)                  (* MODBUS ADDERSS *)
    PA1 AT %QX000.0 : BOOL := 1;  (* 0 *)
    PA2 AT %QX000.1 : BOOL := 0;  (* 1 *)
    PA3 AT %QX000.2 : BOOL := 0;  (* 2 *)
    PA4 AT %QX000.3 : BOOL := 0;  (* 3 *)
    PB1 AT %QX000.4 : BOOL := 1;  (* 4 *)
    PB2 AT %QX000.5 : BOOL := 0;  (* 5 *)
    PB3 AT %QX000.6 : BOOL := 0;  (* 6 *)
    PB4 AT %QX000.7 : BOOL := 0;  (* 7 *)
    PC1 AT %QX001.0 : BOOL := 0;  (* 8 *)
    PC2 AT %QX001.1 : BOOL := 0;  (* 9 *)
    PC3 AT %QX001.2 : BOOL := 0;  (* 10 *)
    PC4 AT %QX001.3 : BOOL := 0;  (* 11 *)
    PC5 AT %QX001.4 : BOOL := 0;  (* 12 *)
    PC6 AT %QX001.5 : BOOL := 0;  (* 13 *)
    PC7 AT %QX001.6 : BOOL := 0;  (* 14 *)
    PC8 AT %QX001.7 : BOOL := 0;  (* 15 *)
    PD1 AT %QX002.0 : BOOL := 0;  (* 16 *)
    PD2 AT %QX002.1 : BOOL := 0;  (* 17 *)
    PD3 AT %QX002.2 : BOOL := 0;  (* 18 *)
    PE1 AT %QX002.3 : BOOL := 0;  (* 19 *)
    PE2 AT %QX002.4 : BOOL := 0;  (* 20 *)
    PE3 AT %QX002.5 : BOOL := 0;  (* 21 *)
    PE4 AT %QX002.6 : BOOL := 0;  (* 22 *)
    PE5 AT %QX002.7 : BOOL := 0;  (* 23 *)
    PE6 AT %QX003.0 : BOOL := 0;  (* 24 *)
    PE7 AT %QX003.1 : BOOL := 0;  (* 25 *)
    PF1 AT %QX003.2 : BOOL := 0;  (* 26 *)
    PF2 AT %QX003.3 : BOOL := 0;  (* 27 *)
    PF3 AT %QX003.4 : BOOL := 0;  (* 28 *)
    PF4 AT %QX003.5 : BOOL := 0;  (* 29 *)
    PF5 AT %QX003.6 : BOOL := 1;  (* 30 *)
  END_VAR
  VAR
    TM_1_ta1 : TON;
    TM_1_tc3 : TON;
    TM_1_tb1 : TON;
    TM_1_td3 : TON;
    TM_2_ta3 : TON;
    TM_2_tb3 : TON;
    TM_2_tc5 : TON;
    TM_2_tc6 : TON;
    TM_2_tf1 : TON;
    TM_2_tf2 : TON;
    stable : BOOL := 1;
  END_VAR

  (*============================================================*)
  (* RESET *)
  (*============================================================*)
  IF NOT RESET THEN
      (*OUTPUTS*)
      AT_X:= 0;
      AT_Z:= 0;
      AT_G:= 0;
      AL_C:= 0;
      AL_M:= 0;
      RB_M:= 0;
      AB_C:= 0;
      AB_M:= 0;
      RB_M:= 0;
      (*PLACES*)
      PA1:= 1;
      PA2:= 0;
      PA3:= 0;
      PA4:= 0;
      PB1:= 1;
      PB2:= 0;
      PB3:= 0;
      PB4:= 0;
      PC1:= 0;
      PC2:= 0;
      PC3:= 0;
      PC4:= 0;
      PC5:= 0;
      PC6:= 0;
      PC7:= 0;
      PC8:= 0;
      PD1:= 0;
      PD2:= 0;
      PD3:= 0;
      PE1:= 0;
      PE2:= 0;
      PE3:= 0;
      PE4:= 0;
      PE5:= 0;
      PE6:= 0;
      PE7:= 0;
      PF1:= 0;
      PF2:= 0;
      PF3:= 0;
      PF4:= 0;
      PF5:= 1;
  END_IF;

  (*============================================================*)
  (* TIMERS *)
  (*============================================================*)
  TM_1_ta1(IN:= PA1, PT:= T#2000ms);
  TM_1_tc3(IN:= PC3, PT:= T#2000ms);
  TM_1_tb1(IN:= PB1, PT:= T#2000ms);
  TM_1_td3(IN:= PD3, PT:= T#1000ms);
  TM_2_ta3(IN:= PA3, PT:= T#1000ms);
  TM_2_tb3(IN:= PB3, PT:= T#1000ms);
  TM_2_tc5(IN:= PC5, PT:= T#2000ms);
  TM_2_tc6(IN:= PC6, PT:= T#2000ms);
  TM_2_tf1(IN:= PF1, PT:= T#2000ms);
  TM_2_tf2(IN:= PF2, PT:= T#2000ms);


    stable:= 1;
    (*============================================================*)
    (* TRANSITIONS *)
    (*============================================================*)
    (* Line A *)
    IF PA1 AND NOT PA2 AND TM_1_ta1.Q THEN
      PA1:= 0;
      PA2:= 1;
      stable:= 0;
    END_IF;
    IF PA2 AND NOT PA3 AND SL_P THEN
      PA2:= 0;
      PA3:= 1;
      stable:= 0;
    END_IF;
    IF PA3 AND NOT PA4 AND TM_2_ta3.Q THEN
      PA3:= 0;
      PA4:= 1;
      stable:= 0;
    END_IF;

    (* Line B*)
    IF PB1 AND NOT PB2 AND TM_1_tb1.Q THEN
      PB1:= 0;
      PB2:= 1;
      stable:= 0;
    END_IF;
    IF PB2 AND NOT PB3 AND SB_P THEN
      PB2:= 0;
      PB3:= 1;
      stable:= 0;
    END_IF;
    IF PB3 AND NOT PB4 AND TM_2_tb3.Q THEN
      PB3:= 0;
      PB4:= 1;
      stable:= 0;
    END_IF;
    (* Line C *)
    IF PC1 AND NOT PC2 AND ST_Z THEN
      PC1:= 0;
      PC2:= 1;
      stable:= 0;
    END_IF;
    IF PC2 AND NOT PC3 AND NOT ST_Z THEN
      PC2:= 0;
      PC3:= 1;
      stable:= 0;
    END_IF;
    IF PC3 AND NOT PC4 AND TM_1_tc3.Q THEN
      PC3:= 0;
      PC4:= 1;
      stable:= 0;
    END_IF;
    IF PC4 AND NOT PC5 AND NOT SL_M THEN
      PC4:= 0;
      PC5:= 1;
      stable:= 0;
    END_IF;
    IF PC5 AND NOT PC6 AND ST_Z THEN
      PC5:= 0;
      PC6:= 1;
      stable:= 0;
    END_IF;
    (*HARD FIX *)
    IF TM_2_tc5.Q THEN
      PC5:= 0;
      PC7:= 1;
      stable:= 0;
    END_IF;
    IF PC6 AND NOT PC7 AND (NOT ST_Z OR TM_2_tc6.Q) THEN
      PC6:= 0;
      PC7:= 1;
      stable:= 0;
    END_IF;
    IF PC7 AND NOT PC8 AND ST_X THEN
      PC7:= 0;
      PC8:= 1;
      stable:= 0;
    END_IF;

    (* Line D *)
    IF PD1 AND NOT PD2 AND ST_Z THEN
      PD1:= 0;
      PD2:= 1;
      stable:= 0;
    END_IF;
    IF PD2 AND NOT PD3 AND NOT ST_Z THEN
      PD2:= 0;
      PD3:= 1;
      stable:= 0;
    END_IF;

    (* Line E *)
    IF PE1 AND NOT PE2 AND NOT SB_M THEN
      PE1:= 0;
      PE2:= 1;
      stable:= 0;
    END_IF;
    IF PE2 AND NOT PE3 AND NOT SBC THEN
      PE2:= 0;
      PE3:= 1;
      stable:= 0;
    END_IF;
    IF PE3 AND NOT PE4 AND SBC THEN
      PE3:= 0;
      PE4:= 1;
      stable:= 0;
    END_IF;
    IF PE4 AND NOT PE5 AND S_L THEN
      PE4:= 0;
      PE5:= 1;
      stable:= 0;
    END_IF;
    IF PE5 AND NOT PE6 AND NOT S_L THEN
      PE5:= 0;
      PE6:= 1;
      stable:= 0;
    END_IF;
    IF PE6 AND NOT PE7 AND NOT SBC THEN
      PE6:= 0;
      PE7:= 1;
      stable:= 0;
    END_IF;

    (* Line F *)
    IF PF1 AND NOT PF2 AND ST_Z THEN
      PF1:= 0;
      PF2:= 1;
      stable:= 0;
    END_IF;
    (*HARD FIX *)
    IF TM_2_tf1.Q THEN
      PF1:= 0;
      PF3:= 1;
      stable:= 0;
    END_IF;
    IF PF2 AND NOT PF3 AND (NOT ST_Z OR TM_2_tf2.Q) THEN
      PF2:= 0;
      PF3:= 1;
      stable:= 0;
    END_IF;
    IF PF3 AND NOT PF4 AND ST_X THEN
      PF3:= 0;
      PF4:= 1;
      stable:= 0;
    END_IF;
    IF PF4 AND NOT PF5 AND NOT ST_X THEN
      PF4:= 0;
      PF5:= 1;
      stable:= 0;
    END_IF;

    (* Across Lines *)
    IF PA4 AND PF5 AND NOT PC1 AND SL_M THEN
      PA4:= 0;
      PF5:= 0;
      PC1:= 1;
      stable:= 0;
    END_IF;
    IF PB4 AND PC8 AND NOT PD1 AND NOT ST_X AND SB_M THEN
      PB4:= 0;
      PC8:= 0;
      PD1:= 1;
      stable:= 0;
    END_IF;
    IF PD3 AND NOT PF1 AND NOT PE1 AND TM_1_td3.Q THEN
      PD3:= 0;
      PF1:= 1;
      PE1:= 1;
      stable:= 0;
    END_IF;
    IF PE7 AND NOT PA1 AND NOT PB1 AND SBC THEN
      PE7:= 0;
      PA1:= 1;
      PB1:= 1;
      stable:= 0;
    END_IF;


  (*============================================================*)
  (* OUTPUTS *)
  (*============================================================*)
  IF PA1 THEN
    AL_C:= 0;
  END_IF;
  IF PA2 OR PA3 THEN
    AL_C:= 1;
  END_IF;
  IF PA4 THEN
    AL_C:= 0;
    AL_M:= 1;
  END_IF;
  IF PB1 THEN
    AB_C:= 0;
  END_IF;
  IF PB2 OR PB3 THEN
    AB_C:= 1;
  END_IF;
  IF PB4 THEN
    AB_C:= 0;
    AB_M:= 1;
  END_IF;
  IF PC1 OR PC2 OR PD1 OR PD2 THEN
    AT_Z:= 1;
  END_IF;
  IF PC3 THEN
    AT_G:= 1;
  END_IF;
  IF PC4 THEN
    AL_M:= 0;
  END_IF;
  IF PC5 OR PC6 OR PF1 OR PF2 THEN
    AT_Z:= 0;
  END_IF;
  IF PC7 OR PC8 THEN
    AT_X:= 1;
  END_IF;
  IF PD3 THEN
    AT_G:= 0;
  END_IF;
  IF PE1 THEN
    AB_M:= 0;
  END_IF;
  IF PE2 OR PE3 THEN
    RB_M:= 1;
  END_IF;
  IF PE4 THEN
    AB_C:= 1;
  END_IF;
  IF PE5 THEN
    RB_M:= 1;
    AB_C:= 1;
  END_IF;
  IF PE6 OR PE7 THEN
    RB_M:= 0;
  END_IF;
  IF PF3 OR PF4 THEN
    AT_X:= 0;
  END_IF;
  IF PF5 THEN
    AT_X:= 0;
  END_IF;
    









END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : demo_factory;
  END_RESOURCE
END_CONFIGURATION
