
PROGRAM program0



(*=====================================================================*)
(*DECLARATION*)
(*=====================================================================*)

VAR

    
(*INPUTS*)
S_AL1 AT %IX102.0 : BOOL;
CS_AL1_W AT %IW100 : WORD;
S_AL1_BL AT %IX102.2 : BOOL;
S_BIN_1 AT %IX102.1 : BOOL;
P_AL1_L_FT AT %IX101.1 : BOOL;
P_AL1_L_BK AT %IX101.2 : BOOL;
S_AL1_L AT %IX101.0 : BOOL;
P_AL1_B_FT AT %IX100.1 : BOOL;
P_AL1_B_BK AT %IX100.2 : BOOL;
S_AL1_B AT %IX100.0 : BOOL;
SB_AL1 AT %QX101.2 : BOOL;
PUWS_AL1_1_PLUS AT %QX101.3 : BOOL;
PUWS_AL1_1_RT AT %QX101.4 : BOOL;
CS_AL1_PLUS AT %QX101.5 : BOOL;
P_AL1_B AT %QX100.0 : BOOL;
P_AL1_L AT %QX100.5 : BOOL;

END_VAR


VAR

(*PLACES*)

P0 : BOOL := 1;
P1 : BOOL := 1;
P2 : BOOL := 0;
P3 : BOOL := 0;
P4 : BOOL := 0;
PB : BOOL := 0;
BIN1 : BOOL := 1;
BIN2 : BOOL := 0;
P5 : BOOL := 0;
P6 : BOOL := 0;
P_BASE : BOOL := 0;
PB1 : BOOL := 0;
PUSH_B : BOOL := 1;
PB2 : BOOL := 0;
PB23 : BOOL := 0;
PB3 : BOOL := 0;
P_LID : BOOL := 0;
PL1 : BOOL := 0;
PUSH_L : BOOL := 1;
PL2 : BOOL := 0;
PL23 : BOOL := 0;
PL3 : BOOL := 0;
STABLE : BOOL := 0;

END_VAR


VAR

(*INTERNAL VARIABLES*)

timer_1_TL1 : TON;
timer_1_TB1 : TON;
timer_1_P2 : TON;
timer_1_P3 : TON;
AL1_BASE : BOOL;
AL1_LID : BOOL;

END_VAR

timer_1_TL1(IN:= PL1, PT:= T#750ms);
timer_1_TB1(IN:= PB1, PT:= T#900ms);
timer_1_P2(IN:= P2, PT:= T#1000ms);
timer_1_P3(IN:= P3, PT:= T#1000ms);


(*=====================================================================*)
(*TRANSITIONS*)
(*=====================================================================*)

STABLE:=0;
WHILE STABLE=0 DO
   STABLE:=1;
   (*T0212*)
   IF (TRUE AND P1) AND ( (S_AL1) ) AND (NOT P2) THEN
       TRUE:=0;
       P1:=0;
       P2:=1;
       STABLE:=0;
   END_IF;
   (*T23*)
   IF (P2) AND ( (timer_1_P2.Q) ) AND (NOT P3) THEN
       P2:=0;
       P3:=1;
       STABLE:=0;
   END_IF;
   (*T34*)
   IF (P3) AND ( (timer_1_P3.Q) ) AND (NOT P4) THEN
       P3:=0;
       P4:=1;
       STABLE:=0;
   END_IF;
   (*T4B*)
   IF (P4) AND ( ((CS_AL1_W < 200) OR (CS_AL1_W > 400)) ) AND (NOT PB) THEN
       P4:=0;
       PB:=1;
       STABLE:=0;
   END_IF;
   (*T4B2*)
   IF (PB AND BIN1) AND ( (S_BIN_1) ) AND (NOT BIN2 AND NOT P1) THEN
       PB:=0;
       BIN1:=0;
       BIN2:=1;
       P1:=1;
       STABLE:=0;
   END_IF;
   (*TB21*)
   IF (BIN2) AND ( (NOT S_BIN_1) ) AND (NOT BIN1) THEN
       BIN2:=0;
       BIN1:=1;
       STABLE:=0;
   END_IF;
   (*T45*)
   IF (P4) AND ( ((CS_AL1_W > 200) AND (CS_AL1_W <= 300)) ) AND (NOT P5) THEN
       P4:=0;
       P5:=1;
       STABLE:=0;
   END_IF;
   (*T46*)
   IF (P4) AND ( ((CS_AL1_W > 300) AND (CS_AL1_W <= 400)) ) AND (NOT P6) THEN
       P4:=0;
       P6:=1;
       STABLE:=0;
   END_IF;
   (*T57*)
   IF (P5) AND ( (S_AL1_BL) ) AND (NOT P_LID AND NOT P1) THEN
       P5:=0;
       P_LID:=1;
       P1:=1;
       STABLE:=0;
   END_IF;
   (*T67*)
   IF (P6) AND ( (S_AL1_BL) ) AND (NOT P_BASE AND NOT P1) THEN
       P6:=0;
       P_BASE:=1;
       P1:=1;
       STABLE:=0;
   END_IF;
   (*TB0*)
   IF (P_BASE) AND ( (S_AL1_B) ) AND (NOT PB1) THEN
       P_BASE:=0;
       PB1:=1;
       STABLE:=0;
   END_IF;
   (*TB1*)
   IF (PB1 AND PUSH_B) AND ( (timer_1_TB1.Q) ) AND (NOT PB2) THEN
       PB1:=0;
       PUSH_B:=0;
       PB2:=1;
       STABLE:=0;
   END_IF;
   (*TB23*)
   IF (PB2) AND ( (P_AL1_B_FT) ) AND (NOT PB23) THEN
       PB2:=0;
       PB23:=1;
       STABLE:=0;
   END_IF;
   (*TB2*)
   IF (PB23) AND ( (P_AL1_B_FT) ) AND (NOT PB3) THEN
       PB23:=0;
       PB3:=1;
       STABLE:=0;
   END_IF;
   (*TB3*)
   IF (PB3) AND ( (P_AL1_B_BK) ) AND (NOT FALSE AND NOT PUSH_B) THEN
       PB3:=0;
       FALSE:=1;
       PUSH_B:=1;
       STABLE:=0;
   END_IF;
   (*TL0*)
   IF (P_LID) AND ( (S_AL1_L) ) AND (NOT PL1) THEN
       P_LID:=0;
       PL1:=1;
       STABLE:=0;
   END_IF;
   (*TL1*)
   IF (PL1 AND PUSH_L) AND ( (timer_1_TL1.Q) ) AND (NOT PL2) THEN
       PL1:=0;
       PUSH_L:=0;
       PL2:=1;
       STABLE:=0;
   END_IF;
   (*TL23*)
   IF (PL2) AND ( (P_AL1_L_FT) ) AND (NOT PL23) THEN
       PL2:=0;
       PL23:=1;
       STABLE:=0;
   END_IF;
   (*TL2*)
   IF (PL23) AND ( (P_AL1_L_FT) ) AND (NOT PL3) THEN
       PL23:=0;
       PL3:=1;
       STABLE:=0;
   END_IF;
   (*TL3*)
   IF (PL3) AND ( (P_AL1_L_BK) ) AND (NOT FALSE AND NOT PUSH_L) THEN
       PL3:=0;
       FALSE:=1;
       PUSH_L:=1;
       STABLE:=0;
   END_IF;
END_WHILE;


(*=====================================================================*)
(*OUTPUTS*)
(*=====================================================================*)

(*AL1_BASE*)
IF P6 THEN
   AL1_BASE:=1;
END_IF;
(*AL1_LID*)
IF P5 THEN
   AL1_LID:=1;
END_IF;
(*CS_AL1_PLUS*)
IF P1 OR P2 OR PB OR P5 OR P6 THEN
   CS_AL1_PLUS:=1;
END_IF;
(*PUWS_AL1_1_PLUS*)
IF PB OR P5 OR P6 THEN
   PUWS_AL1_1_PLUS:=1;
END_IF;
(*PUWS_AL1_1_RT*)
IF P5 OR P6 THEN
   PUWS_AL1_1_RT:=1;
END_IF;
(*P_AL1_B*)
IF PB2 OR PB23 THEN
   P_AL1_B:=1;
END_IF;
(*P_AL1_L*)
IF PL2 OR PL23 THEN
   P_AL1_L:=1;
END_IF;
(*SB_AL1*)
IF P3 OR P4 OR PB OR P5 OR P6 THEN
   SB_AL1:=1;
END_IF;
(*AL1_BASE*)
IF P1 OR P5 THEN
   AL1_BASE:=0;
END_IF;
(*AL1_LID*)
IF P1 OR P6 THEN
   AL1_LID:=0;
END_IF;
(*CS_AL1_PLUS*)
IF P3 OR P4 THEN
   CS_AL1_PLUS:=0;
END_IF;
(*PUWS_AL1_1_PLUS*)
IF P1 OR P2 OR P3 OR P4 THEN
   PUWS_AL1_1_PLUS:=0;
END_IF;
(*PUWS_AL1_1_RT*)
IF P1 OR P2 OR P3 OR P4 OR PB THEN
   PUWS_AL1_1_RT:=0;
END_IF;
(*P_AL1_B*)
IF P_BASE OR PB1 OR PB3 THEN
   P_AL1_B:=0;
END_IF;
(*P_AL1_L*)
IF P_LID OR PL1 OR PL3 THEN
   P_AL1_L:=0;
END_IF;
(*SB_AL1*)
IF P1 OR P2 THEN
   SB_AL1:=0;
END_IF;


END_PROGRAM



CONFIGURATION config0

    RESOURCE res0 ON PLC
        TASK task0(INTERVAL := T#20ms, PRIORITY := 0);
        PROGRAM instance0 WITH task0 : program0;
    END_RESOURCE

END_CONFIGURATION

