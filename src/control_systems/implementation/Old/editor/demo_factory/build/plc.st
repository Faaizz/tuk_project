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


PROGRAM demo_factory
  VAR
    ST_X : BOOL;
    ST_Z : BOOL;
    S_L : BOOL;
    SL_P : BOOL;
    SL_M : BOOL;
    SBC : BOOL;
    SB_P : BOOL;
    SB_M : BOOL;
    RESET : BOOL;
    AT_X : BOOL := 0;
    AT_Z : BOOL := 0;
    AT_G : BOOL := 0;
    AL_C : BOOL := 0;
    AL_M : BOOL := 0;
    RB_M : BOOL := 0;
    AB_C : BOOL := 0;
    AB_M : BOOL := 0;
  END_VAR
  VAR
    TM_1_ta1 : TON;
    TM_1_tc3 : TON;
    TM_1_tb1 : TON;
    TM_1_td3 : TON;
    TM_2_ta3 : TON;
    TM_2_tb3 : TON;
    stable : BOOL := 1;
    PA1 : BOOL := 1;
    PA2 : BOOL := 0;
    PA3 : BOOL := 0;
    PA4 : BOOL := 0;
    PB1 : BOOL := 1;
    PB2 : BOOL := 0;
    PB3 : BOOL := 0;
    PB4 : BOOL := 0;
    PC1 : BOOL := 0;
    PC2 : BOOL := 0;
    PC3 : BOOL := 0;
    PC4 : BOOL := 0;
    PC5 : BOOL := 0;
    PC6 : BOOL := 0;
    PC7 : BOOL := 0;
    PC8 : BOOL := 0;
    PD1 : BOOL := 0;
    PD2 : BOOL := 0;
    PD3 : BOOL := 0;
    PE1 : BOOL := 0;
    PE2 : BOOL := 0;
    PE3 : BOOL := 0;
    PE4 : BOOL := 0;
    PE5 : BOOL := 0;
    PE6 : BOOL := 0;
    PE7 : BOOL := 0;
    PF1 : BOOL := 0;
    PF2 : BOOL := 0;
    PF3 : BOOL := 0;
    PF4 : BOOL := 0;
    PF5 : BOOL := 1;
  END_VAR

  (*============================================================*)
  (* RESET *)
  (*============================================================*)
  IF NOT RESET THEN
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
  TM_1_ta1(IN:= PA1, PT:= T#1000ms);
  TM_1_tc3(IN:= PC3, PT:= T#1000ms);
  TM_1_tb1(IN:= PB1, PT:= T#1000ms);
  TM_1_td3(IN:= PD3, PT:= T#1000ms);
  TM_2_ta3(IN:= PA3, PT:= T#2000ms);
  TM_2_tb3(IN:= PB3, PT:= T#2000ms);


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
    IF PC6 AND NOT PC7 AND NOT ST_Z THEN
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
    IF PF2 AND NOT PF3 AND NOT ST_Z AND NOT S_L THEN
      PF2:= 0;
      PF3:= 1;
      stable:= 0;
    END_IF;
    IF PF3 AND NOT PF4 AND ST_Z THEN
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

  IF PA2 OR PA3 THEN
    AL_C:= 1;
  END_IF;
  IF PA4 THEN
    AL_C:= 0;
    AL_M:= 1;
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
  IF PC7 OR PC8 OR PF3 OR PF4 THEN
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
