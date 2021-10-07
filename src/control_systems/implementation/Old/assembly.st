PROGRAM assembly
  VAR
    RP_AL1_CLAMPED AT %IX100.0 : BOOL;
    AL1_DETECTED AT %IX100.1 : BOOL;
    LP_AL1_CLAMPED AT %IX100.2 : BOOL;
    LP_AL1_LIMIT AT %IX100.3 : BOOL;
    RUNNING AT %IX100.4 : BOOL;
    AL1_X_POS AT %IW100 : WORD;
    AL1_Y_POS AT %IW101 : WORD;
    AL1_Z_POS AT %IW102 : WORD;
    AL1_GRAB AT %QX100.0 : BOOL;
    RP_AL1_CLAMP AT %QX100.1 : BOOL;
    LP_AL1_CLAMP AT %QX100.2 : BOOL;
    LP_AL1_RAISE AT %QX100.3 : BOOL;
    AL1_X_SET AT %QW100 : WORD;
    AL1_Y_SET AT %QW101 : WORD;
    AL1_Z_SET AT %QW102 : WORD;
    PLF3 AT %QX0.0 : BOOL;
    PLF4 AT %QX0.1 : BOOL;
    PBF3 AT %QX0.2 : BOOL;
    PBF4 AT %QX0.3 : BOOL;
    PL9 AT %QX0.4 : BOOL;
    PB9 AT %QX0.5 : BOOL;
    PA0 AT %QX0.6 : BOOL;
    PA1 AT %QX0.7 : BOOL;
    PA2 AT %QX1.0 : BOOL;
    PA3 AT %QX1.1 : BOOL;
    PA4 AT %QX1.2 : BOOL;
    PA5 AT %QX1.3 : BOOL;
    PA6 AT %QX1.4 : BOOL;
    PA7 AT %QX1.5 : BOOL;
    PA8 AT %QX1.6 : BOOL;
    PA9 AT %QX1.7 : BOOL;
    PA10 AT %QX2.0 : BOOL;
    PA11 AT %QX2.1 : BOOL;
    PA12 AT %QX2.2 : BOOL;
    PA13 AT %QX2.3 : BOOL;
    STABLE AT %QX2.4 : BOOL;
  END_VAR

  IF NOT RUNNING THEN
    
    PLF3:=0;
    PLF4:=0;
    PBF3:=0;
    PBF4:=0;
    PL9:=1;
    PB9:=1;
    PA0:=1;
    PA1:=0;
    PA2:=0;
    PA3:=0;
    PA4:=0;
    PA5:=0;
    PA6:=0;
    PA7:=0;
    PA8:=0;
    PA9:=0;
    PA10:=0;
    PA11:=0;
    PA12:=0;
    PA13:=0;
    
  END_IF;

  (*TRANSITIONS*)

  STABLE:=0;

  WHILE STABLE=0 DO
    
    STABLE:=1;
    
    (*TA0*)
    IF PL9 AND PA0 AND RP_AL1_CLAMPED AND NOT AL1_DETECTED AND NOT PA1 THEN
      PL9:=0;
      PA0:=0;
      PA1:=1;
      STABLE:=0;
    END_IF;
    
    (*TA1*)
    IF PA1 AND AL1_X_POS>798 AND AL1_X_POS<802 AND AL1_Y_POS>148 AND AL1_Y_POS<152 AND NOT PA2 THEN
      PA1:=0;
      PA2:=1;
      STABLE:=0;
    END_IF;
    
    (*TA2*)
    IF PA2 AND AL1_Z_POS>798 AND AL1_Z_POS<802 AND NOT PA3 THEN
      PA2:=0;
      PA3:=1;
      STABLE:=0;
    END_IF;
    
    (*TA3*)
    IF PA3 AND NOT RP_AL1_CLAMPED AND NOT PA4 THEN
      PA3:=0;
      PA4:=1;
      STABLE:=0;
    END_IF;
    
    (*TA4*)
    IF PA4 AND AL1_Z_POS>398 AND AL1_Z_POS<402 AND NOT PA5 AND NOT PLF3 AND NOT PLF4 THEN
      PA4:=0;
      PA5:=1;
      PLF3:=1;
      PLF4:=1;
      STABLE:=0;
    END_IF;
    
    (*TA5*)
    IF PA5 AND PB9 AND AL1_DETECTED AND LP_AL1_CLAMPED AND AL1_X_POS>208 AND AL1_X_POS<212 AND AL1_Y_POS>148 AND AL1_Y_POS<152 AND NOT PA6 THEN
      PA5:=0;
      PB9:=0;
      PA6:=1;
      STABLE:=0;
    END_IF;
    
    (*TA6*)
    IF PA6 AND AL1_Z_POS>810 AND AL1_Z_POS<820 AND NOT PA7 THEN
      PA6:=0;
      PA7:=1;
      STABLE:=0;
    END_IF;
    
    (*TA7*)
    IF PA7 AND AL1_Z_POS>398 AND AL1_Z_POS<402 AND NOT PA8 THEN
      PA7:=0;
      PA8:=1;
      STABLE:=0;
    END_IF;
    
    (*TA8*)
    IF PA8 AND NOT LP_AL1_CLAMPED AND NOT PA9 THEN
      PA8:=0;
      PA9:=1;
      STABLE:=0;
    END_IF;
    
    (*TA9*)
    IF PA9 AND NOT LP_AL1_LIMIT AND NOT PA10 THEN
      PA9:=0;
      PA10:=1;
      STABLE:=0;
    END_IF;
    
    (*TA10*)
    IF PA10 AND LP_AL1_LIMIT AND NOT PA11 THEN
      PA10:=0;
      PA11:=1;
      STABLE:=0;
    END_IF;
    
    (*TA11*)
    IF PA11 AND NOT LP_AL1_LIMIT AND NOT PA12 THEN
      PA11:=0;
      PA12:=1;
      STABLE:=0;
    END_IF;
    
    (*TA12*)
    IF PA12 AND LP_AL1_LIMIT AND NOT PA13 AND NOT PA0 AND NOT PBF3 AND NOT PBF4 THEN
      PA12:=0;
      PA13:=1;
      PA0:=1;
      PBF3:=1;
      PBF4:=1;
      STABLE:=0;
    END_IF;
    
  END_WHILE;

  (*OUTPUTS*)
  (*MOVE GRABBER TO LID POSITION*)
  IF PA1 THEN
    AL1_X_SET:=800;
    AL1_Y_SET:=150;
  END_IF;

  (*GRABBER DOWN TO PICK LID*)
  IF PA2 THEN
    AL1_Z_SET:= 800;
  END_IF;

  (*GRAB LID*)
  IF PA3 OR PA4 OR PA5 OR PA6 THEN
    AL1_GRAB:=1;
  END_IF;

  (*RAISE GRABBER A LITTLE*)
  IF PA0 OR PA4 OR PA7 THEN
    AL1_Z_SET:=400;
  END_IF;

  (*MOVE GRABBER TO BASE POSITION*)
  IF PA0 OR PA5 THEN
    AL1_X_SET:=210;
    AL1_Y_SET:=150;
  END_IF;

  (*LOWER LID TO FIT ON BASE*)
  IF PA6 THEN
    AL1_Z_SET:=818;
  END_IF;

  (*RELEASE LID*)
  IF PA0 OR PA1 OR PA2 OR PA7 OR PA8 OR PA9 OR PA10 OR PA11 OR PA12 THEN
    AL1_GRAB:=0;
  END_IF;

  (*LID CLAMP*)
  IF PA1 OR PA2 THEN
    RP_AL1_CLAMP:=1;
  END_IF;

  IF PA3 OR PA4 OR PLF4 THEN
    RP_AL1_CLAMP:=0;
  END_IF;

  (*BASE CLAMP*)
  IF PA8 OR PA9 OR PA10 OR PA11 OR PA12 THEN
    LP_AL1_CLAMP:=0;
  END_IF;

  IF PB9 OR PA6 OR PA7 THEN
    LP_AL1_CLAMP:=1;
  END_IF;

  (*RAISE BASE CLAMP*)
  IF PA0 OR PA1 OR PA2 OR PA3 OR PA4 OR PA5 OR PA6 OR PA7 OR PA8 OR PA11 OR PA12 THEN
    LP_AL1_RAISE:=0;
  END_IF;

  IF PA9 OR PA10 THEN
    LP_AL1_RAISE:=1;
  END_IF;







END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : assembly;
  END_RESOURCE
END_CONFIGURATION