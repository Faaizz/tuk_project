PROGRAM buffer_stage
  VAR
    S_AL1_B AT %IX100.0 : BOOL;
    P_AL1_B_FT AT %IX100.1 : BOOL;
    P_AL1_B_BK AT %IX100.2 : BOOL;
    S_AL1_B1 AT %IX100.3 : BOOL;
    S_AL1_B2 AT %IX100.4 : BOOL;
    S_AL1_B3 AT %IX100.5 : BOOL;
    LP_AL1_CLAMPED AT %IX100.6 : BOOL;
    S_AL1_LP AT %IX100.7 : BOOL;
    RUNNING AT %IX101.0 : BOOL;
  END_VAR
  VAR
    timer_1_TB1 : TON;
  END_VAR
  VAR
    P_AL1_B AT %QX100.0 : BOOL;
    SB_AL1_B1 AT %QX100.1 : BOOL;
    SB_AL1_B2 AT %QX100.2 : BOOL;
    SB_AL1_B3 AT %QX100.3 : BOOL;
    LP_AL1_CLAMP AT %QX100.4 : BOOL;
    P_BASE AT %QX200.0 : BOOL;
    PB1 AT %QX200.1 : BOOL;
    PUSH_B AT %QX200.2 : BOOL;
    PB2 AT %QX200.3 : BOOL;
    PB23 AT %QX200.4 : BOOL;
    PB3 AT %QX200.5 : BOOL;
    PB4 AT %QX200.6 : BOOL;
    PB5 AT %QX200.7 : BOOL;
    PB6 AT %QX201.0 : BOOL;
    PB7 AT %QX201.1 : BOOL;
    PB8 AT %QX201.2 : BOOL;
    PB9 AT %QX201.3 : BOOL;
    PBF1 AT %QX201.7 : BOOL;
    PBF2 AT %QX201.4 : BOOL;
    PBF3 AT %QX201.5 : BOOL;
    PBF4 AT %QX201.6 : BOOL;
    STABLE AT %QX202.0 : BOOL;
  END_VAR

  (*Timer*)
  timer_1_TB1(IN:= PB1, PT:= T#900ms);

  (*If plant is stopped*)
  IF NOT RUNNING THEN
    P_BASE:= 1;
    PB1:= 0;
    PUSH_B:= 1;
    PB2:= 0;
    PB23:= 0;
    PB3:= 0;
    PB4:= 0;
    PB5:= 0;
    PB6:= 0;
    PB7:= 0;
    PB8:= 0;
    PB9:=0;
    PBF1:=1;
    PBF2:=1;
    PBF3:=1;
    PBF4:=1;
    
  END_IF;

  (*============================================================*)
  (* TRANSITIONS *)
  (*============================================================*)
  STABLE:= 0;

  WHILE STABLE= 0 DO
    STABLE:= 1;
    
    (*TB0*)
    IF P_BASE AND S_AL1_B AND NOT PB1 THEN
      P_BASE:=0;
      PB1:=1;
      STABLE:=0;
    END_IF;
    
    (*TB1*)
    IF PB1 AND PUSH_B AND timer_1_TB1.Q AND NOT PB2 THEN
      PB1:=0;
      PUSH_B:=0;
      PB2:=1;
    END_IF;
    
    (*TB23*)
    IF PB2 AND P_AL1_B_FT AND NOT PB23 THEN
      PB2:=0;
      PB23:=1;
      STABLE:=0;
    END_IF;
    
    (*TB2*)
    IF PB23 AND P_AL1_B_FT AND NOT PB3 THEN
      PB23:=0;
      PB3:=1;
      STABLE:=0;
    END_IF;
    
    (*TB3*)
    IF PB3 AND P_AL1_B_BK AND NOT PB4 AND NOT PUSH_B AND NOT P_BASE THEN
      PB3:=0;
      PB4:=1;
      PUSH_B:=1;
      P_BASE:=1;
      STABLE:=0;
    END_IF;
    
    (*TB4*)
    IF PB4 AND PBF1 AND S_AL1_B1 AND NOT PB5 THEN 
      PB4:=0;
      PBF1:=0;
      PB5:=1;
      STABLE:=0;
    END_IF;
    
    (*TB5*)
    IF PB5 AND PBF2 AND S_AL1_B2 AND NOT PB6 AND NOT PBF1 THEN
      PB5:=0;
      PBF2:=0;
      PB6:=1;
      PBF1:=1;
      STABLE:=0;
    END_IF; 
    
    (*TB6*)
    IF PB6 AND PBF3 AND S_AL1_B3 AND  NOT PB7 AND NOT PBF2 THEN 
      PB6:=0;
      PBF3:=0;
      PB7:=1;
      PBF2:=1;
      STABLE:=0;
    END_IF;
    
    (*TB7*)
    IF PB7 AND PBF4 AND S_AL1_LP AND NOT PB8 THEN
      PB7:=0;
      PBF4:=0;
      PB8:=1;
      STABLE:=0;
    END_IF;
    
    (*TB8*)
    IF PB8 AND LP_AL1_CLAMPED AND NOT PB9 THEN
      PB8:=0;
      PB9:=1;
      STABLE:=0;
    END_IF;
    
    (*TB9*)
    IF PB9 AND NOT LP_AL1_CLAMPED AND NOT PBF3 AND NOT PBF4 THEN
      PB9:=0;
      PBF3:=1;
      PBF4:=1;
      STABLE:=0;
    END_IF;

      
  END_WHILE;
    

  (*============================================================*)
  (* OUTPUTS *)
  (*============================================================*)
  (*P_AL1_B*)
  IF PB2 OR PB23 THEN 
    P_AL1_B:=1;
  END_IF;
  IF P_BASE OR PB1 OR PB3 THEN
    P_AL1_B:=0;
  END_IF;

  (*SB_AL1_B1*)
  IF PB5 THEN
    SB_AL1_B1:=1;
  END_IF;
  IF PBF1 THEN
    SB_AL1_B1:=0;
  END_IF;

  (*SB_AL1_B2*)
  IF PB6 THEN
    SB_AL1_B2:=1;
  END_IF;
  IF PBF2 THEN 
    SB_AL1_B2:=0;
  END_IF;

  (*SB_AL1_B3*)
  IF PB7 THEN
    SB_AL1_B3:=1;
  END_IF;
  IF PBF3 THEN
    SB_AL1_B3:=0;
  END_IF;

  (*LP_AL1_CLAMP*)
  IF PB8 OR PB9 THEN
    LP_AL1_CLAMP:=1;
  END_IF;
  IF PBF4 THEN
    LP_AL1_CLAMP:=0;
  END_IF;
    
    
    
    
    
    
    
    
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : buffer_stage;
  END_RESOURCE
END_CONFIGURATION
