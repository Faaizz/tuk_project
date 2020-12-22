TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE

FUNCTION_BLOCK LOGGER
  VAR_INPUT
    TRIG : BOOL;
    MSG : STRING;
    LEVEL : LOGLEVEL := INFO;
  END_VAR
  VAR
    TRIG0 : BOOL;
  END_VAR

  IF TRIG AND NOT TRIG0 THEN
  {{
   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  }}
  END_IF;
  TRIG0:=TRIG;
END_FUNCTION_BLOCK



FUNCTION_BLOCK python_eval
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_poll
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_gear
  VAR_INPUT
    N : UINT;
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    py_eval : python_eval;
    COUNTER : UINT;
    ADD10_OUT : UINT;
    EQ13_OUT : BOOL;
    SEL15_OUT : UINT;
    AND7_OUT : BOOL;
  END_VAR

  ADD10_OUT := ADD(COUNTER, 1);
  EQ13_OUT := EQ(N, ADD10_OUT);
  SEL15_OUT := SEL(EQ13_OUT, ADD10_OUT, 0);
  COUNTER := SEL15_OUT;
  AND7_OUT := AND(EQ13_OUT, TRIG);
  py_eval(TRIG := AND7_OUT, CODE := CODE);
  ACK := py_eval.ACK;
  RESULT := py_eval.RESULT;
END_FUNCTION_BLOCK


PROGRAM buffer_stage
  VAR
    S_AL1_B : BOOL;
    P_AL1_B_FT : BOOL;
    P_AL1_B_BK : BOOL;
    S_AL1_B1 : BOOL;
    S_AL1_B2 : BOOL;
    S_AL1_B3 : BOOL;
    LP_AL1_CLAMPED : BOOL;
    S_AL1_LP : BOOL;
    S_AL1_L : BOOL;
    P_AL1_L_FT : BOOL;
    P_AL1_L_BK : BOOL;
    S_AL1_L1 : BOOL;
    S_AL1_L2 : BOOL;
    S_AL1_L3 : BOOL;
    RP_AL1_CLAMPED : BOOL;
    S_AL1_RP : BOOL;
    RUNNING : BOOL;
  END_VAR
  VAR
    timer_1_TB1 : TON;
    timer_1_TL1 : TON;
  END_VAR
  VAR
    P_AL1_B : BOOL;
    SB_AL1_B1 : BOOL;
    SB_AL1_B2 : BOOL;
    SB_AL1_B3 : BOOL;
    LP_AL1_CLAMP : BOOL;
    P_AL1_L : BOOL;
    SB_AL1_L1 : BOOL;
    SB_AL1_L2 : BOOL;
    SB_AL1_L3 : BOOL;
    RP_AL1_CLAMP : BOOL;
    P_BASE : BOOL;
    PB1 : BOOL;
    PUSH_B : BOOL;
    PB2 : BOOL;
    PB23 : BOOL;
    PB3 : BOOL;
    PB4 : BOOL;
    PB5 : BOOL;
    PB6 : BOOL;
    PB7 : BOOL;
    PB8 : BOOL;
    PB9 : BOOL;
    PBF1 : BOOL;
    PBF2 : BOOL;
    PBF3 : BOOL;
    PBF4 : BOOL;
    P_LID : BOOL;
    PL1 : BOOL;
    PL2 : BOOL;
    PUSH_L : BOOL;
    PL23 : BOOL;
    PL3 : BOOL;
    PL4 : BOOL;
    PL5 : BOOL;
    PL6 : BOOL;
    PL7 : BOOL;
    PL8 : BOOL;
    PL9 : BOOL;
    PLF1 : BOOL;
    PLF2 : BOOL;
    PLF3 : BOOL;
    PLF4 : BOOL;
    STABLE : BOOL;
  END_VAR

  (*Timer*)
  timer_1_TB1(IN:= PB1, PT:= T#900ms);
  timer_1_TL1(IN:= PL1, PT:= T#900ms);

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
    
    P_LID:= 1;
    PL1:= 0;
    PUSH_L:= 1;
    PL2:= 0;
    PL23:= 0;
    PL3:= 0;
    PL4:= 0;
    PL5:= 0;
    PL6:= 0;
    PL7:= 0;
    PL8:= 0;
    PL9:=0;
    PLF1:=1;
    PLF2:=1;
    PLF3:=1;
    PLF4:=1;
    
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
      STABLE:=0;
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



    (*TL0*)
    IF P_LID AND S_AL1_B AND NOT PL1 THEN
      P_LID:=0;
      PL1:=1;
      STABLE:=0;
    END_IF;
    
    (*TL1*)
    IF PL1 AND PUSH_L AND timer_1_TL1.Q AND NOT PL2 THEN
      PL1:=0;
      PUSH_L:=0;
      PL2:=1;
      STABLE:=0;
    END_IF;
    
    (*TL23*)
    IF PL2 AND P_AL1_L_FT AND NOT PL23 THEN
      PL2:=0;
      PL23:=1;
      STABLE:=0;
    END_IF;
    
    (*TL2*)
    IF PL23 AND P_AL1_L_FT AND NOT PL3 THEN
      PL23:=0;
      PL3:=1;
      STABLE:=0;
    END_IF;
    
    (*TL3*)
    IF PL3 AND P_AL1_L_BK AND NOT PL4 AND NOT PUSH_L AND NOT P_LID THEN
      PL3:=0;
      PL4:=1;
      PUSH_L:=1;
      P_LID:=1;
      STABLE:=0;
    END_IF;
    
    (*TL4*)
    IF PL4 AND PLF1 AND S_AL1_L1 AND NOT PL5 THEN 
      PL4:=0;
      PLF1:=0;
      PL5:=1;
      STABLE:=0;
    END_IF;
    
    (*TL5*)
    IF PL5 AND PLF2 AND S_AL1_L2 AND NOT PL6 AND NOT PLF1 THEN
      PL5:=0;
      PLF2:=0;
      PL6:=1;
      PLF1:=1;
      STABLE:=0;
    END_IF; 
    
    (*TL6*)
    IF PL6 AND PLF3 AND S_AL1_L3 AND  NOT PL7 AND NOT PLF2 THEN 
      PL6:=0;
      PLF3:=0;
      PL7:=1;
      PLF2:=1;
      STABLE:=0;
    END_IF;
    
    (*TL7*)
    IF PL7 AND PLF4 AND S_AL1_LP AND NOT PL8 THEN
      PL7:=0;
      PLF4:=0;
      PL8:=1;
      STABLE:=0;
    END_IF;
    
    (*TL8*)
    IF PL8 AND LP_AL1_CLAMPED AND NOT PL9 THEN
      PL8:=0;
      PL9:=1;
      STABLE:=0;
    END_IF;
    
    (*TL9*)
    IF PL9 AND NOT LP_AL1_CLAMPED AND NOT PLF3 AND NOT PLF4 THEN
      PL9:=0;
      PLF3:=1;
      PLF4:=1;
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
    

  (*P_AL1_L*)
  IF PL2 OR PL23 THEN 
    P_AL1_L:=1;
  END_IF;
  IF P_LID OR PL1 OR PL3 THEN
    P_AL1_L:=0;
  END_IF;

  (*SB_AL1_L1*)
  IF PL5 THEN
    SB_AL1_L1:=1;
  END_IF;
  IF PLF1 THEN
    SB_AL1_L1:=0;
  END_IF;

  (*SB_AL1_L2*)
  IF PL6 THEN
    SB_AL1_L2:=1;
  END_IF;
  IF PLF2 THEN 
    SB_AL1_L2:=0;
  END_IF;

  (*SB_AL1_L3*)
  IF PL7 THEN
    SB_AL1_L3:=1;
  END_IF;
  IF PLF3 THEN
    SB_AL1_L3:=0;
  END_IF;

  (*LP_AL1_CLAMP*)
  IF PL8 OR PL9 THEN
    LP_AL1_CLAMP:=1;
  END_IF;
  IF PLF4 THEN
    LP_AL1_CLAMP:=0;
  END_IF;
    
    
    
    
    
    
    
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : buffer_stage;
  END_RESOURCE
END_CONFIGURATION
