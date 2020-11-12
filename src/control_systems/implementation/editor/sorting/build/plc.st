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


PROGRAM sorting
  VAR
    S_AL1 : BOOL;
    S_BIN_1 : BOOL;
    S_AL1_BL : BOOL;
    RUNNING : BOOL;
    CS_AL1_W : INT;
    SB_AL1 : BOOL;
    PUWS_AL1_1_PLUS : BOOL;
    PUWS_AL1_1_RT : BOOL;
    PUWS_AL1_1_RT0 : BOOL;
    CS_AL1_PLUS : BOOL;
  END_VAR
  VAR
    STABLE : BOOL;
    P0 : BOOL;
    P1 : BOOL;
    P2 : BOOL;
    P3 : BOOL;
    P4 : BOOL;
    PB : BOOL;
    P5 : BOOL;
    P6 : BOOL;
    BIN1 : BOOL;
    BIN2 : BOOL;
    ASSEMBLY : BOOL;
    PRODUCTION : BOOL;
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
    ASSEMBLY:= 0;
    PRODUCTION:= 0;
  END_IF;

  (*============================================================*)
  (* TRANSITIONS *)
  (*============================================================*)
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

  (*T35*)
  IF P4 AND ( (CS_AL1_W > 200) AND (CS_AL1_W <= 300) ) AND NOT P5 THEN
    P4:= 0;
    P5:= 1;
    STABLE:= 0;
  END_IF;

  (*T36*)
  IF P4 AND ( (CS_AL1_W > 300) AND (CS_AL1_W <= 400) ) AND NOT P6 THEN
    P4:= 0;
    P6:= 1;
    STABLE:= 0;
  END_IF;

  (*T57*)
  IF P5 AND S_AL1_BL AND NOT ASSEMBLY AND NOT P1 THEN
    P5:= 0;
    ASSEMBLY:= 1;
    P1:= 1;
    STABLE:= 0;
  END_IF;

  (*T67*)
  IF P6 AND S_AL1_BL AND NOT ASSEMBLY AND NOT P1 THEN
    P6:= 0;
    ASSEMBLY:= 1;
    P1:= 1;
    STABLE:= 0;
  END_IF;

  (*TROPD*)
  IF ASSEMBLY AND NOT PRODUCTION THEN
    ASSEMBLY:= 0;
    PRODUCTION:= 1;
    STABLE:= 0;
  END_IF;

  (*T0*)
  IF PRODUCTION AND NOT P0 THEN
    PRODUCTION:= 0;
    P0:= 1;
    STABLE:= 0;
  END_IF;

  (*============================================================*)
  (* OUTPUTS *)
  (*============================================================*)
  (*SET SB_AL1*)
  IF P3 OR P4 OR P5 OR P6 AND STABLE THEN
    SB_AL1:= 1;
  END_IF;
  (*RESET SB_AL1*)
  IF P1 OR P5 AND STABLE THEN
    SB_AL1:= 0;
  END_IF;

  (*SET PUWS_AL1_1_PLUS*)
  IF P4 OR P5 OR P6 AND STABLE THEN
    PUWS_AL1_1_PLUS:= 1;
  END_IF;

  (*RESET PUWS_AL1_1_PLUS*)
  IF P1 OR P2 OR P3 AND STABLE THEN
    PUWS_AL1_1_PLUS:= 0;
  END_IF;

  (*SET PUWS_AL1_1_RT*)
  IF P5 OR P6 AND STABLE THEN
    PUWS_AL1_1_RT:= 1;
  END_IF;

  (*RESET PUWS_AL1_1_RT*)
  IF P1 OR P2 OR P3 OR P4 AND STABLE THEN
    PUWS_AL1_1_RT:= 0;
  END_IF;

  (*SET CS_AL1_PLUS*)
  IF P1 OR P2 OR P3 OR P5 OR P6 OR PB THEN
    CS_AL1_PLUS:= 1;
  END_IF;

  (*RESET CS_AL1_PLUS*)
  IF P4 THEN
    CS_AL1_PLUS:= 0;
  END_IF;



END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : sorting;
  END_RESOURCE
END_CONFIGURATION
