PROGRAM sorting
  VAR
    S_AL1 AT %IX100.0 : BOOL;
    S_BIN_1 AT %IX100.1 : BOOL;
    S_AL1_BL AT %IX100.2 : BOOL;
    RUNNING AT %IX100.7 : BOOL;
    CS_AL1_W AT %IW100 : INT;
    SB_AL1 AT %QX100.0 : BOOL;
    PUWS_AL1_1_PLUS AT %QX100.1 : BOOL;
    PUWS_AL1_1_RT AT %QX100.2 : BOOL;
    CS_AL1_PLUS AT %QX100.3 : BOOL;
  END_VAR
  VAR
    STABLE : BOOL;
  END_VAR
  VAR
    P0 AT %QX200.0 : BOOL;
    P1 AT %QX200.1 : BOOL;
    P2 AT %QX200.2 : BOOL;
    P3 AT %QX200.3 : BOOL;
    P4 AT %QX200.4 : BOOL;
    PB AT %QX200.5 : BOOL;
    P5 AT %QX200.6 : BOOL;
    P6 AT %QX200.7 : BOOL;
    BIN1 AT %QX201.0 : BOOL;
    BIN2 AT %QX201.1 : BOOL;
    P_LID AT %QX201.2 : BOOL;
    P_BASE AT %QX201.3 : BOOL;
    PRODUCTION AT %QX201.4 : BOOL;
  END_VAR
  VAR
    timer_1_P2 : TON;
    timer_1_P3 : TON;
  END_VAR


  (*Timers*)
  timer_1_P2(IN:= P2, PT:= T#1000ms);
  timer_1_P3(IN:= P3, PT:= T#1000ms);

  (*RUNNING*)
  IF NOT RUNNING THEN
    (*OUTPUT*)
    SB_AL1:= 0;
    PUWS_AL1_1_PLUS:= 0;
    PUWS_AL1_1_RT:= 0;
    
    (*PLACES*)
    P0:= 1;
    P1:= 1;
    P2:= 0;
    P3:= 0;
    P4:= 0;
    PB:= 0;
    BIN1:= 1;
    BIN2:= 0;
    P5:= 0;
    P6:= 0;
    P_LID:= 0;
    P_BASE:= 0;
    PRODUCTION:= 0;
  END_IF;

  (*============================================================*)
  (* TRANSITIONS *)
  (*============================================================*)
  STABLE:= 0;

  WHILE STABLE= 0 DO
    STABLE:= 1;
    (*T0112*)
    IF P0 AND P1 AND S_AL1 AND NOT P2 THEN
      P0:= 0;
      P1:= 0;
      P2:= 1;
      STABLE:= 0;
    END_IF;

    (*T23*)
    IF P2 AND timer_1_P2.Q AND NOT P3 THEN
      P2:= 0;
      P3:= 1;
      STABLE:= 0;
    END_IF;

    (*T34*)
    IF P3 AND timer_1_P3.Q AND NOT P4 THEN
      P3:= 0;
      P4:= 1;
    END_IF;

    (*T4B*)
    IF P4 AND ( (CS_AL1_W < 200) OR (CS_AL1_W > 400) ) AND NOT PB THEN
      P4:= 0;
      PB:= 1;
      STABLE:= 0;
    END_IF;

    (*T4B2*)
    IF PB AND BIN1 AND S_BIN_1 AND NOT BIN2 AND NOT P1 AND NOT PRODUCTION THEN
      PB:= 0;
      BIN1:= 0;
      BIN2:= 1;
      P1:= 1;
      PRODUCTION:= 1;
      STABLE:= 0;
    END_IF;

    (*TB21*)
    IF BIN2 AND NOT S_BIN_1 AND NOT BIN1 THEN
      BIN2:= 0;
      BIN1:= 1;
      STABLE:= 0;
    END_IF;

    (*T45*)
    IF P4 AND ( (CS_AL1_W > 200) AND (CS_AL1_W <= 300) ) AND NOT P5 THEN
      P4:= 0;
      P5:= 1;
      STABLE:= 0;
    END_IF;

    (*T46*)
    IF P4 AND ( (CS_AL1_W > 300) AND (CS_AL1_W <= 400) ) AND NOT P6 THEN
      P4:= 0;
      P6:= 1;
      STABLE:= 0;
    END_IF;

    (*T57*)
    IF P5 AND S_AL1_BL AND NOT P_LID AND NOT P1 THEN
      P5:= 0;
      P_LID:= 1;
      P1:= 1;
      STABLE:= 0;
    END_IF;

    (*T67*)
    IF P6 AND S_AL1_BL AND NOT P_BASE AND NOT P1 THEN
      P6:= 0;
      P_BASE:= 1;
      P1:= 1;
      STABLE:= 0;
    END_IF;

    (*TPROD1*)
    IF P_LID AND NOT PRODUCTION THEN
      P_LID:= 0;
      PRODUCTION:= 1;
      STABLE:= 0;
    END_IF;

    (*TPROD2*)
    IF P_BASE AND NOT PRODUCTION THEN
      P_BASE:= 0;
      PRODUCTION:= 1;
      STABLE:= 0;
    END_IF;


    (*T0*)
    IF PRODUCTION AND NOT P0 THEN
      PRODUCTION:= 0;
      P0:= 1;
      STABLE:= 0;
    END_IF;
    
  END_WHILE;

  (*============================================================*)
  (* OUTPUTS *)
  (*============================================================*)
  (*SET SB_AL1*)
  IF P3 OR P4 OR PB OR P5 OR P6 AND STABLE THEN
    SB_AL1:= 1;
  END_IF;
  (*RESET SB_AL1*)
  IF P1 OR P2 AND STABLE THEN
    SB_AL1:= 0;
  END_IF;

  (*SET PUWS_AL1_1_PLUS*)
  IF PB OR P5 OR P6 AND STABLE THEN
    PUWS_AL1_1_PLUS:= 1;
  END_IF;

  (*RESET PUWS_AL1_1_PLUS*)
  IF P1 OR P2 OR P3 OR P4 AND STABLE THEN
    PUWS_AL1_1_PLUS:= 0;
  END_IF;

  (*SET PUWS_AL1_1_RT*)
  IF P5 OR P6 AND STABLE THEN
    PUWS_AL1_1_RT:= 1;
  END_IF;

  (*RESET PUWS_AL1_1_RT*)
  IF P1 OR P2 OR P3 OR P4 OR PB AND STABLE THEN
    PUWS_AL1_1_RT:= 0;
  END_IF;

  (*SET CS_AL1_PLUS*)
  IF P1 OR P2 OR P5 OR P6 OR PB THEN
    CS_AL1_PLUS:= 1;
  END_IF;

  (*RESET CS_AL1_PLUS*)
  IF P3 OR P4 THEN
    CS_AL1_PLUS:= 0;
  END_IF;



END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : sorting;
  END_RESOURCE
END_CONFIGURATION
