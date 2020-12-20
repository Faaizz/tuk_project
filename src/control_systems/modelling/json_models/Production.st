
PROGRAM program0



(*=====================================================================*)
(*DECLARATION*)
(*=====================================================================*)

VAR


(*INPUTS*)
S_AL1_P_B1 AT %IX102.5 : BOOL;
S_AL1_P_B2 AT %IX102.6 : BOOL;
S_AL1_MCB AT %IX102.7 : BOOL;
MCB_BUSY AT %IX103.0 : BOOL;
MCB_ERROR AT %IX103.1 : BOOL;
S_AL1_MCBR AT %IX103.2 : BOOL;
MCBR_BUSY AT %IX103.3 : BOOL;
MCBR_ERROR AT %IX103.4 : BOOL;
S_AL1_P_B3 AT %IX103.5 : BOOL;
S_AL1_MCB2 AT %IX103.6 : BOOL;
S_AL1_MCBR2 AT %IX103.7 : BOOL;
E_AL1_B1 AT %QX102.0 : BOOL;
PUWS_AL1_B1_PLUS AT %QX102.1 : BOOL;
PUWS_AL1_B1_RIGHT AT %QX102.2 : BOOL;
PAS_AL1_PLUS AT %QX102.3 : BOOL;
PAS_AL1_TURN AT %QX102.4 : BOOL;

END_VAR


VAR

(*PLACES*)

PPAL1 : BOOL := 1;
PP0 : BOOL := 1;
PP1 : BOOL := 0;
PP2 : BOOL := 0;
PP3 : BOOL := 0;
PP4 : BOOL := 0;
MCB : BOOL := 1;
PP5 : BOOL := 0;
PP7 : BOOL := 0;
PPL3 : BOOL := 0;
PPL4 : BOOL := 0;
MCBR : BOOL := 1;
PPL5 : BOOL := 0;
PPL7 : BOOL := 0;
STABLE : BOOL := 0;

END_VAR


VAR

(*INTERNAL VARIABLES*)

MCB_CONTROL : BOOL;
timer_1_TL1 : TON;
timer_1_TB1 : TON;

END_VAR

timer_1_TL1(IN:= PL1, PT:= T#750ms);
timer_1_TB1(IN:= PB1, PT:= T#900ms);


(*=====================================================================*)
(*TRANSITIONS*)
(*=====================================================================*)

STABLE:=0;
WHILE STABLE=0 DO
   STABLE:=1;
   (*TP0*)
   IF (PP0) AND ( (NOT MCB_CONTROL) ) AND (NOT PP1) THEN
       PP0:=0;
       PP1:=1;
       STABLE:=0;
   END_IF;
   (*TP1*)
   IF (PP1) AND ( (S_AL1_P_B1) ) AND (NOT PP2) THEN
       PP1:=0;
       PP2:=1;
       STABLE:=0;
   END_IF;
   (*TP2*)
   IF (PP2) AND ( (S_AL1_P_B2 AND NOT MCB_CONTROL) ) AND (NOT PP3) THEN
       PP2:=0;
       PP3:=1;
       STABLE:=0;
   END_IF;
   (*TP3*)
   IF (PP3) AND ( (S_AL1_MCB) ) AND (NOT PP4 AND NOT PP1) THEN
       PP3:=0;
       PP4:=1;
       PP1:=1;
       STABLE:=0;
   END_IF;
   (*TP4*)
   IF (PP4 AND MCB) AND ( (MCB_BUSY) ) AND (NOT PP5) THEN
       PP4:=0;
       MCB:=0;
       PP5:=1;
       STABLE:=0;
   END_IF;
   (*TP6*)
   IF (PP5) AND ( (S_AL1_MCB2) ) AND (NOT PP7 AND NOT MCB) THEN
       PP5:=0;
       PP7:=1;
       MCB:=1;
       STABLE:=0;
   END_IF;
   (*TP7*)
   IF (PP7) AND ( (S_AL1_P_B3) ) AND (NOT FALSE) THEN
       PP7:=0;
       FALSE:=1;
       STABLE:=0;
   END_IF;
   (*TPL2*)
   IF (PP2) AND ( (S_AL1_P_B2 AND MCB_CONTROL) ) AND (NOT PPL3 AND NOT PP1) THEN
       PP2:=0;
       PPL3:=1;
       PP1:=1;
       STABLE:=0;
   END_IF;
   (*TPL3*)
   IF (PPL3) AND ( (S_AL1_MCBR) ) AND (NOT PPL4) THEN
       PPL3:=0;
       PPL4:=1;
       STABLE:=0;
   END_IF;
   (*TPL4*)
   IF (PPL4 AND MCBR) AND ( (MCBR_BUSY) ) AND (NOT PPL5) THEN
       PPL4:=0;
       MCBR:=0;
       PPL5:=1;
       STABLE:=0;
   END_IF;
   (*TPL6*)
   IF (PPL5) AND ( (S_AL1_MCBR2) ) AND (NOT PPL7 AND NOT MCBR) THEN
       PPL5:=0;
       PPL7:=1;
       MCBR:=1;
       STABLE:=0;
   END_IF;
   (*TPL7*)
   IF (PPL7) AND ( (S_AL1_P_B3) ) AND (NOT FALSE) THEN
       PPL7:=0;
       FALSE:=1;
       STABLE:=0;
   END_IF;
END_WHILE;


(*=====================================================================*)
(*OUTPUTS*)
(*=====================================================================*)

(*E_AL1_B1*)
IF PP0 OR PP1 THEN
   E_AL1_B1:=1;
END_IF;
(*MCB_CONTROL*)
IF PP3 THEN
   MCB_CONTROL:=1;
END_IF;
(*PAS_AL1_PLUS*)
IF PPL3 OR PPL4 THEN
   PAS_AL1_PLUS:=1;
END_IF;
(*PAS_AL1_TURN*)
IF PPL3 OR PPL4 THEN
   PAS_AL1_TURN:=1;
END_IF;
(*PUWS_AL1_B1_PLUS*)
IF PPAL1 OR PP2 THEN
   PUWS_AL1_B1_PLUS:=1;
END_IF;
(*E_AL1_B1*)
IF PP2 OR PP3 OR PPL3 THEN
   E_AL1_B1:=0;
END_IF;
(*MCB_CONTROL*)
IF PP0 OR PPL3 THEN
   MCB_CONTROL:=0;
END_IF;
(*PAS_AL1_PLUS*)
IF PP0 OR PP3 OR PP4 THEN
   PAS_AL1_PLUS:=0;
END_IF;
(*PAS_AL1_TURN*)
IF PP0 OR PP3 OR PP4 THEN
   PAS_AL1_TURN:=0;
END_IF;
(*PUWS_AL1_B1_RIGHT*)
IF PPAL1 OR PP2 THEN
   PUWS_AL1_B1_RIGHT:=0;
END_IF;


END_PROGRAM



CONFIGURATION config0

    RESOURCE res0 ON PLC
        TASK task0(INTERVAL := T#20ms, PRIORITY := 0);
        PROGRAM instance0 WITH task0 : program0;
    END_RESOURCE

END_CONFIGURATION

