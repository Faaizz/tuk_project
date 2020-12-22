
PROGRAM program0



(*=====================================================================*)
(*DECLARATION*)
(*=====================================================================*)

VAR


(*INPUTS*)
S_AL1_B AT %IX100.0 : BOOL;
P_AL1_B_FT AT %IX100.1 : BOOL;
P_AL1_B_BK AT %IX100.2 : BOOL;
S_AL1_B1 AT %IX100.3 : BOOL;
S_AL1_B2 AT %IX100.4 : BOOL;
S_AL1_B3 AT %IX100.5 : BOOL;
LP_AL1_CLAMPED AT %IX100.6 : BOOL;
S_AL1_LP AT %IX100.7 : BOOL;
S_AL1_L AT %IX101.0 : BOOL;
P_AL1_L_FT AT %IX101.1 : BOOL;
P_AL1_L_BK AT %IX101.2 : BOOL;
S_AL1_L1 AT %IX101.3 : BOOL;
S_AL1_L2 AT %IX101.4 : BOOL;
S_AL1_L3 AT %IX101.5 : BOOL;
RP_AL1_CLAMPED AT %IX101.6 : BOOL;
S_AL1_RP AT %IX101.7 : BOOL;
S_AL1 AT %IX102.0 : BOOL;
CS_AL1_W AT %IW100 : WORD;
S_BIN_1 AT %IX102.1 : BOOL;
S_AL1_BL AT %IX102.2 : BOOL;
AL1_DETECTED AT %IX102.3 : BOOL;
LP_AL1_LIMIT AT %IX102.4 : BOOL;
AL1_X_POS AT %IW101 : WORD;
AL1_Y_POS AT %IW102 : WORD;
AL1_Z_POS AT %IW103 : WORD;
ST_AL1_ST0 AT %IX105.3 : BOOL;
SB_AL1 AT %QX101.2 : BOOL;
PUWS_AL1_1_PLUS AT %QX101.3 : BOOL;
PUWS_AL1_1_RT AT %QX101.4 : BOOL;
CS_AL1_PLUS AT %QX101.5 : BOOL;
P_AL1_B AT %QX100.0 : BOOL;
SB_AL1_B1 AT %QX100.1 : BOOL;
SB_AL1_B2 AT %QX100.2 : BOOL;
SB_AL1_B3 AT %QX100.3 : BOOL;
LP_AL1_CLAMP AT %QX100.4 : BOOL;
P_AL1_L AT %QX100.5 : BOOL;
SB_AL1_L1 AT %QX100.6 : BOOL;
SB_AL1_L2 AT %QX100.7 : BOOL;
SB_AL1_L3 AT %QX101.0 : BOOL;
RP_AL1_CLAMP AT %QX101.1 : BOOL;
AL1_GRAB AT %QX101.6 : BOOL;
LP_AL1_RAISE AT %QX101.7 : BOOL;
AL1_X_SET AT %QW100 : WORD;
AL1_Y_SET AT %QW101 : WORD;
AL1_Z_SET AT %QW102 : WORD;
PAS_AL1_ST_TURN AT %QX103.5 : BOOL;

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
PB4 : BOOL := 0;
PBF1 : BOOL := 1;
PB5 : BOOL := 0;
PBF2 : BOOL := 1;
PB6 : BOOL := 0;
PBF3 : BOOL := 1;
PB7 : BOOL := 0;
PB78 : BOOL := 0;
P_LID : BOOL := 0;
PL1 : BOOL := 0;
PUSH_L : BOOL := 1;
PL2 : BOOL := 0;
PL23 : BOOL := 0;
PL3 : BOOL := 0;
PL4 : BOOL := 0;
PLF1 : BOOL := 1;
PL5 : BOOL := 0;
PLF2 : BOOL := 1;
PL6 : BOOL := 0;
PLF3 : BOOL := 1;
PL7 : BOOL := 0;
PL78 : BOOL := 0;

END_VAR

VAR

PA0 AT %QX105.0 : BOOL := 1;
PA1 AT %QX105.1 : BOOL := 0;
PA2 AT %QX105.2 : BOOL := 0;
PA3 AT %QX105.3 : BOOL := 0;
PA4 AT %QX105.4 : BOOL := 0;
PA5 AT %QX105.5 : BOOL := 0;
PA6 AT %QX105.6 : BOOL := 0;
PA7 AT %QX105.7 : BOOL := 0;
PA8 AT %QX106.0 : BOOL := 0;
PA9 AT %QX106.1 : BOOL := 0;
PA10 AT %QX106.2 : BOOL := 0;
PA11 AT %QX106.3 : BOOL := 0;
PA12 AT %QX106.4 : BOOL := 0;
PA13 AT %QX106.5 : BOOL := 0;
PBF4 AT %QX106.6 : BOOL := 1;
PB8 AT %QX106.7 : BOOL := 0;
PB9 AT %QX107.0 : BOOL := 0;
PLF4 AT %QX107.1 : BOOL := 1;
PL8 AT %QX107.2 : BOOL := 0;
PL9 AT %QX107.3 : BOOL := 0;
PSA0 AT %QX107.4 : BOOL := 1;
PSA1 AT %QX107.5 : BOOL := 0;
STABLE AT %QX107.6 : BOOL := 0;

END_VAR


VAR

(*INTERNAL VARIABLES*)

timer_1_TL1 : TON;
timer_1_TB1 : TON;
timer_1_P2 : TON;
timer_1_P3 : TON;
AL1_BASE : BOOL;
AL1_LID : BOOL;
timer_1_PL9 : TON;
timer_1_PL7 : TON;
timer_1_PB7 : TON;
timer_1_PSA1 : TON;

END_VAR

timer_1_TL1(IN:= PL1, PT:= T#750ms);
timer_1_TB1(IN:= PB1, PT:= T#900ms);
timer_1_P2(IN:= P2, PT:= T#1000ms);
timer_1_P3(IN:= P3, PT:= T#1000ms);
timer_1_PL9(IN:= PL9, PT:= T#300ms);
timer_1_PL7(IN:= PL78, PT:= T#1500ms);
timer_1_PB7(IN:= PB78, PT:= T#1500ms);
timer_1_PSA1(IN:= PSA1, PT:= T#5000ms);


(*=====================================================================*)
(*TRANSITIONS*)
(*=====================================================================*)

STABLE:=0;
WHILE STABLE=0 DO
   STABLE:=1;
   (*T0212*)
   IF (P1) AND ( (S_AL1) ) AND (NOT P2) THEN
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
   IF (PB3) AND ( (P_AL1_B_BK) ) AND (NOT PB4 AND NOT PUSH_B) THEN
       PB3:=0;
       PB4:=1;
       PUSH_B:=1;
       STABLE:=0;
   END_IF;
   (*TB4*)
   IF (PB4 AND PBF1) AND ( (S_AL1_B1) ) AND (NOT PB5) THEN
       PB4:=0;
       PBF1:=0;
       PB5:=1;
       STABLE:=0;
   END_IF;
   (*TB5*)
   IF (PB5 AND PBF2) AND ( (S_AL1_B2) ) AND (NOT PB6 AND NOT PBF1) THEN
       PB5:=0;
       PBF2:=0;
       PB6:=1;
       PBF1:=1;
       STABLE:=0;
   END_IF;
   (*TB6*)
   IF (PB6 AND PBF3) AND ( (S_AL1_B3) ) AND (NOT PB7 AND NOT PBF2) THEN
       PB6:=0;
       PBF3:=0;
       PB7:=1;
       PBF2:=1;
       STABLE:=0;
   END_IF;
   (*TB7*)
   IF (PB7 AND PBF4) AND ( (S_AL1_LP) ) AND (NOT PB78) THEN
       PB7:=0;
       PBF4:=0;
       PB78:=1;
       STABLE:=0;
   END_IF;
   (*TB78*)
   IF (PB78) AND ( (timer_1_PB7.Q) ) AND (NOT PB8) THEN
       PB78:=0;
       PB8:=1;
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
   IF (PL3) AND ( (P_AL1_L_BK) ) AND (NOT PL4 AND NOT PUSH_L) THEN
       PL3:=0;
       PL4:=1;
       PUSH_L:=1;
       STABLE:=0;
   END_IF;
   (*TL4*)
   IF (PL4 AND PLF1) AND ( (S_AL1_L1) ) AND (NOT PL5) THEN
       PL4:=0;
       PLF1:=0;
       PL5:=1;
       STABLE:=0;
   END_IF;
   (*TL5*)
   IF (PL5 AND PLF2) AND ( (S_AL1_L2) ) AND (NOT PL6 AND NOT PLF1) THEN
       PL5:=0;
       PLF2:=0;
       PL6:=1;
       PLF1:=1;
       STABLE:=0;
   END_IF;
   (*TL6*)
   IF (PL6 AND PLF3) AND ( (S_AL1_L3) ) AND (NOT PL7 AND NOT PLF2) THEN
       PL6:=0;
       PLF3:=0;
       PL7:=1;
       PLF2:=1;
       STABLE:=0;
   END_IF;
   (*TL7*)
   IF (PL7 AND PLF4) AND ( (S_AL1_RP) ) AND (NOT PL78) THEN
       PL7:=0;
       PLF4:=0;
       PL78:=1;
       STABLE:=0;
   END_IF;
   (*TL78*)
   IF (PL78) AND ( (timer_1_PL7.Q) ) AND (NOT PL8) THEN
       PL78:=0;
       PL8:=1;
       STABLE:=0;
   END_IF;
   (*TL8*)
   IF (PL8) AND ( (RP_AL1_CLAMPED) ) AND (NOT PL9) THEN
       PL8:=0;
       PL9:=1;
       STABLE:=0;
   END_IF;
   (*TB8*)
   IF (PB8) AND ( (LP_AL1_CLAMPED) ) AND (NOT PB9) THEN
       PB8:=0;
       PB9:=1;
       STABLE:=0;
   END_IF;
   (*TA0*)
   IF (PL9 AND PA0) AND ( (timer_1_PL9.Q AND RP_AL1_CLAMPED AND NOT AL1_DETECTED) ) AND (NOT PA1) THEN
       PL9:=0;
       PA0:=0;
       PA1:=1;
       STABLE:=0;
   END_IF;
   (*TA1*)
   IF (PA1) AND ( (AL1_X_POS>798 AND AL1_X_POS<802) ) AND (NOT PA2) THEN
       PA1:=0;
       PA2:=1;
       STABLE:=0;
   END_IF;
   (*TA2*)
   IF (PA2) AND ( (AL1_Z_POS>798 AND AL1_Z_POS<802) ) AND (NOT PA3) THEN
       PA2:=0;
       PA3:=1;
       STABLE:=0;
   END_IF;
   (*TA3*)
   IF (PA3) AND ( (NOT RP_AL1_CLAMPED) ) AND (NOT PA4) THEN
       PA3:=0;
       PA4:=1;
       STABLE:=0;
   END_IF;
   (*TA4*)
   IF (PA4) AND ( (AL1_Z_POS>398 AND AL1_Z_POS<402) ) AND (NOT PA5 AND NOT PLF3 AND NOT PLF4) THEN
       PA4:=0;
       PA5:=1;
       PLF3:=1;
       PLF4:=1;
       STABLE:=0;
   END_IF;
   (*TA5*)
   IF (PB9 AND PA5) AND ( (AL1_DETECTED AND LP_AL1_CLAMPED AND AL1_X_POS>208 AND AL1_X_POS<212) ) AND (NOT PA6) THEN
       PB9:=0;
       PA5:=0;
       PA6:=1;
       STABLE:=0;
   END_IF;
   (*TA6*)
   IF (PA6) AND ( (AL1_Z_POS>810 AND AL1_Z_POS<820) ) AND (NOT PA7) THEN
       PA6:=0;
       PA7:=1;
       STABLE:=0;
   END_IF;
   (*TA7*)
   IF (PA7) AND ( (AL1_Z_POS>398 AND AL1_Z_POS<402) ) AND (NOT PA8) THEN
       PA7:=0;
       PA8:=1;
       STABLE:=0;
   END_IF;
   (*TA8*)
   IF (PA8) AND ( (NOT LP_AL1_CLAMPED) ) AND (NOT PA9) THEN
       PA8:=0;
       PA9:=1;
       STABLE:=0;
   END_IF;
   (*TA9*)
   IF (PA9) AND ( (NOT LP_AL1_LIMIT) ) AND (NOT PA10) THEN
       PA9:=0;
       PA10:=1;
       STABLE:=0;
   END_IF;
   (*TA10*)
   IF (PA10) AND ( (LP_AL1_LIMIT) ) AND (NOT PA11) THEN
       PA10:=0;
       PA11:=1;
       STABLE:=0;
   END_IF;
   (*TA11*)
   IF (PA11) AND ( (NOT LP_AL1_LIMIT) ) AND (NOT PA12) THEN
       PA11:=0;
       PA12:=1;
       STABLE:=0;
   END_IF;
   (*TA12*)
   IF (PA12) AND ( (LP_AL1_LIMIT) ) AND (NOT PA13 AND NOT PA0 AND NOT PBF3 AND NOT PBF4) THEN
       PA12:=0;
       PA13:=1;
       PA0:=1;
       PBF3:=1;
       PBF4:=1;
       STABLE:=0;
   END_IF;
   (*TSA0*)
   IF (PA13 AND PSA0) AND ( (ST_AL1_ST0) ) AND (NOT PSA1) THEN
       PA13:=0;
       PSA0:=0;
       PSA1:=1;
       STABLE:=0;
   END_IF;
   (*TSA1*)
   IF (PSA1) AND ( (timer_1_PSA1.Q) ) AND (NOT PSA0) THEN
       PSA1:=0;
       PSA0:=1;
       STABLE:=0;
   END_IF;
   (*TS1*)
   IF (PA13) AND ( (TRUE) ) THEN
       PA13:=0;
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
(*AL1_GRAB*)
IF PA3 OR PA4 OR PA5 OR PA6 THEN
   AL1_GRAB:=1;
END_IF;
(*AL1_LID*)
IF P5 THEN
   AL1_LID:=1;
END_IF;
(*CS_AL1_PLUS*)
IF P1 OR P2 OR PB OR P5 OR P6 THEN
   CS_AL1_PLUS:=1;
END_IF;
(*LP_AL1_CLAMP*)
IF PA6 OR PA7 OR PB8 OR PB9 THEN
   LP_AL1_CLAMP:=1;
END_IF;
(*LP_AL1_RAISE*)
IF PA9 OR PA10 THEN
   LP_AL1_RAISE:=1;
END_IF;
(*PAS_AL1_ST_TURN*)
IF PSA1 THEN
   PAS_AL1_ST_TURN:=1;
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
(*RP_AL1_CLAMP*)
IF PL8 OR PL9 THEN
   RP_AL1_CLAMP:=1;
END_IF;
(*SB_AL1*)
IF P3 OR P4 OR PB OR P5 OR P6 THEN
   SB_AL1:=1;
END_IF;
(*SB_AL1_B1*)
IF PB5 THEN
   SB_AL1_B1:=1;
END_IF;
(*SB_AL1_B2*)
IF PB6 THEN
   SB_AL1_B2:=1;
END_IF;
(*SB_AL1_B3*)
IF PB7 OR PB78 THEN
   SB_AL1_B3:=1;
END_IF;
(*SB_AL1_L1*)
IF PL5 THEN
   SB_AL1_L1:=1;
END_IF;
(*SB_AL1_L2*)
IF PL6 THEN
   SB_AL1_L2:=1;
END_IF;
(*SB_AL1_L3*)
IF PL7 OR PL78 THEN
   SB_AL1_L3:=1;
END_IF;
(*AL1_BASE*)
IF P1 OR P5 THEN
   AL1_BASE:=0;
END_IF;
(*AL1_GRAB*)
IF PA0 OR PA1 OR PA2 OR PA7 OR PA8 THEN
   AL1_GRAB:=0;
END_IF;
(*AL1_LID*)
IF P1 OR P6 THEN
   AL1_LID:=0;
END_IF;
(*CS_AL1_PLUS*)
IF P3 OR P4 THEN
   CS_AL1_PLUS:=0;
END_IF;
(*LP_AL1_CLAMP*)
IF PA8 OR PA9 OR PA10 OR PA11 OR PA12 OR PBF4 THEN
   LP_AL1_CLAMP:=0;
END_IF;
(*LP_AL1_RAISE*)
IF PA0 OR PA1 OR PA2 OR PA3 OR PA4 OR PA5 OR PA6 OR PA7 OR PA8 OR PA11 OR PA12 THEN
   LP_AL1_RAISE:=0;
END_IF;
(*PAS_AL1_ST_TURN*)
IF PSA0 THEN
   PAS_AL1_ST_TURN:=0;
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
(*RP_AL1_CLAMP*)
IF PA3 OR PA4 OR PLF4 THEN
   RP_AL1_CLAMP:=0;
END_IF;
(*SB_AL1*)
IF P1 OR P2 THEN
   SB_AL1:=0;
END_IF;
(*SB_AL1_B1*)
IF PBF1 THEN
   SB_AL1_B1:=0;
END_IF;
(*SB_AL1_B2*)
IF PBF2 THEN
   SB_AL1_B2:=0;
END_IF;
(*SB_AL1_B3*)
IF PBF3 THEN
   SB_AL1_B3:=0;
END_IF;
(*SB_AL1_L1*)
IF PLF1 THEN
   SB_AL1_L1:=0;
END_IF;
(*SB_AL1_L2*)
IF PLF2 THEN
   SB_AL1_L2:=0;
END_IF;
(*SB_AL1_L3*)
IF PLF3 THEN
   SB_AL1_L3:=0;
END_IF;
(*AL1_X_SET*)
IF PA0 THEN
   AL1_X_SET:=210;
END_IF;
(*AL1_X_SET*)
IF PA1 THEN
   AL1_X_SET:=800;
END_IF;
(*AL1_Z_SET*)
IF PA2 THEN
   AL1_Z_SET:=800;
END_IF;
(*AL1_Z_SET*)
IF PA4 THEN
   AL1_Z_SET:=400;
END_IF;
(*AL1_X_SET*)
IF PA5 THEN
   AL1_X_SET:=210;
END_IF;
(*AL1_Z_SET*)
IF PA6 THEN
   AL1_Z_SET:=818;
END_IF;
(*AL1_Z_SET*)
IF PA7 THEN
   AL1_Z_SET:=400;
END_IF;


END_PROGRAM



CONFIGURATION config0

    RESOURCE res0 ON PLC
        TASK task0(INTERVAL := T#20ms, PRIORITY := 0);
        PROGRAM instance0 WITH task0 : program0;
    END_RESOURCE

END_CONFIGURATION

