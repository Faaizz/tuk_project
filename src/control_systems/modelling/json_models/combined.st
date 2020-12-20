
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
ST_AL1_ST1 AT %IX104.0 : BOOL;
ST_AL1_ST2 AT %IX104.1 : BOOL;
ST_AL1_ST3 AT %IX104.2 : BOOL;
RP_AL1_ST_CLAMPED AT %IX104.3 : BOOL;
AL1_ST_DETECTED AT %IX104.4 : BOOL;
AL1_ST_X_POS AT %IW104 : WORD;
AL1_ST_Y_POS AT %IW105 : WORD;
AL1_ST_Z_POS AT %IW106 : WORD;
AL1_G_S1 AT %IX104.5 : BOOL;
AL1_G_SC_LL AT %IX104.6 : BOOL;
AL1_G_SC_MZ AT %IX104.7 : BOOL;
AL1_G_SC_ML AT %IX105.0 : BOOL;
AL1_G_SC_MX AT %IX105.1 : BOOL;
AL1_G_SC_RL AT %IX105.2 : BOOL;
E_AL1_B1 AT %QX102.0 : BOOL;
PUWS_AL1_B1_PLUS AT %QX102.1 : BOOL;
PUWS_AL1_B1_RIGHT AT %QX102.2 : BOOL;
PAS_AL1_PLUS AT %QX102.3 : BOOL;
PAS_AL1_TURN AT %QX102.4 : BOOL;
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
AL1_ST_X_SET AT %QW103 : WORD;
AL1_ST_Y_SET AT %QW104 : WORD;
AL1_ST_Z_SET AT %QW105 : WORD;
RP_AL1_ST_CLAMP AT %QX102.5 : BOOL;
AL1_ST_GRAB AT %QX102.6 : BOOL;
AL1_EMIT AT %QX102.7 : BOOL;
RC_AL1_ST AT %QX103.0 : BOOL;
RC_AL1_G7 AT %QX103.1 : BOOL;
AL1_G_SC_LT AT %QX103.2 : BOOL;
AL1_G_SC_LIFT AT %QX103.3 : BOOL;
AL1_G_SC_RT AT %QX103.4 : BOOL;
AL1_G_SC_TG AT %QW106 : INT;

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
PA0 : BOOL := 1;
PA1 : BOOL := 0;
PA2 : BOOL := 0;
PA3 : BOOL := 0;
PA4 : BOOL := 0;
PA5 : BOOL := 0;
PA6 : BOOL := 0;
PA7 : BOOL := 0;
PA8 : BOOL := 0;
PA9 : BOOL := 0;
PA10 : BOOL := 0;
PA11 : BOOL := 0;
PA12 : BOOL := 0;
PA13 : BOOL := 0;
PBF4 : BOOL := 1;
PB8 : BOOL := 0;
PB9 : BOOL := 0;
PLF4 : BOOL := 1;
PL8 : BOOL := 0;
PL9 : BOOL := 0;
PSA0 : BOOL := 1;
PSA1 : BOOL := 0;
PS0 : BOOL := 1;
PSC : BOOL := 1;
PS1 : BOOL := 0;
PS23 : BOOL := 0;
PS2 : BOOL := 0;
PS3 : BOOL := 0;
PS4 : BOOL := 0;
PS5 : BOOL := 0;
PS6 : BOOL := 0;
PS7 : BOOL := 0;
PS8 : BOOL := 0;
PS9 : BOOL := 0;
PS10 : BOOL := 0;
PS11 : BOOL := 0;
PS12 : BOOL := 0;
PSE1 : BOOL := 0;
PSE2 : BOOL := 0;
PSE0 : BOOL := 1;
PG0 : BOOL := 0;
PG : BOOL := 1;
PG1 : BOOL := 0;
PG2 : BOOL := 0;
PG3 : BOOL := 0;
PG4 : BOOL := 0;
PG5 : BOOL := 0;
PG6 : BOOL := 0;
PG7 : BOOL := 0;
PG8 : BOOL := 0;
PG9 : BOOL := 0;
PG10 : BOOL := 0;
PG11 : BOOL := 0;
PG12 : BOOL := 0;
PG13 : BOOL := 0;
PG14 : BOOL := 0;
PG15 : BOOL := 0;
PG16 : BOOL := 0;
PG17 : BOOL := 0;
PG18 : BOOL := 0;
PG19 : BOOL := 0;
PG20 : BOOL := 0;
PG21 : BOOL := 0;
PG22 : BOOL := 0;
PG23 : BOOL := 0;
PG24 : BOOL := 0;
PG25 : BOOL := 0;
PG26 : BOOL := 0;
STABLE : BOOL := 0;

END_VAR


VAR

(*INTERNAL VARIABLES*)

MCB_CONTROL : BOOL;
timer_1_TL1 : TON;
timer_1_TB1 : TON;
timer_1_P2 : TON;
timer_1_P3 : TON;
AL1_BASE : BOOL;
AL1_LID : BOOL;
timer_1_PL9 : TON;
timer_1_PL7 : TON;
timer_1_PB7 : TON;
timer_1_PS23 : TON;
timer_1_PSA1 : TON;
TG_POS : INT;
placeCtr : CTU;

END_VAR

timer_1_TL1(IN:= PL1, PT:= T#750ms);
timer_1_TB1(IN:= PB1, PT:= T#900ms);
timer_1_P2(IN:= P2, PT:= T#1000ms);
timer_1_P3(IN:= P3, PT:= T#1000ms);
timer_1_PL9(IN:= PL9, PT:= T#300ms);
timer_1_PL7(IN:= PL78, PT:= T#1500ms);
timer_1_PB7(IN:= PB78, PT:= T#1500ms);
timer_1_PS23(IN:= PS23, PT:= T#1500ms);
timer_1_PSA1(IN:= PSA1, PT:= T#5000ms);
TG_POS:=placeCtr.CV+10;
placeCtr(CU:= PG, R:= 0, PV:= 54);


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
   IF (PP7) AND ( (S_AL1_P_B3) ) AND (NOT P0) THEN
       PP7:=0;
       P0:=1;
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
   IF (PPL7) AND ( (S_AL1_P_B3) ) AND (NOT P0) THEN
       PPL7:=0;
       P0:=1;
       STABLE:=0;
   END_IF;
   (*T0212*)
   IF (P0 AND P1) AND ( (S_AL1) ) AND (NOT P2) THEN
       P0:=0;
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
   IF (PA13) AND ( (ST_AL1_ST1) ) AND (NOT PS1) THEN
       PA13:=0;
       PS1:=1;
       STABLE:=0;
   END_IF;
   (*TS2*)
   IF (PS0 AND PSC AND PS1) AND ( (ST_AL1_ST2) ) AND (NOT PS23) THEN
       PS0:=0;
       PSC:=0;
       PS1:=0;
       PS23:=1;
       STABLE:=0;
   END_IF;
   (*TS23*)
   IF (PS23) AND ( (timer_1_PS23.Q) ) AND (NOT PS2) THEN
       PS23:=0;
       PS2:=1;
       STABLE:=0;
   END_IF;
   (*TS3*)
   IF (PS2) AND ( (RP_AL1_ST_CLAMPED) ) AND (NOT PS3) THEN
       PS2:=0;
       PS3:=1;
       STABLE:=0;
   END_IF;
   (*TS4*)
   IF (PS3) AND ( ((AL1_ST_Y_POS>540) AND (AL1_ST_Y_POS<580)) ) AND (NOT PS4) THEN
       PS3:=0;
       PS4:=1;
       STABLE:=0;
   END_IF;
   (*TS5*)
   IF (PS4) AND ( ((AL1_ST_Z_POS>780) AND (AL1_ST_Z_POS<820)) ) AND (NOT PSC AND NOT PS5) THEN
       PS4:=0;
       PSC:=1;
       PS5:=1;
       STABLE:=0;
   END_IF;
   (*TS6*)
   IF (PS5) AND ( (AL1_ST_DETECTED) ) AND (NOT PS6) THEN
       PS5:=0;
       PS6:=1;
       STABLE:=0;
   END_IF;
   (*TS7*)
   IF (PS6) AND ( ((AL1_ST_Z_POS>390) AND (AL1_ST_Z_POS<430)) ) AND (NOT PS7) THEN
       PS6:=0;
       PS7:=1;
       STABLE:=0;
   END_IF;
   (*TS8*)
   IF (PS7) AND ( ((AL1_ST_X_POS>750) AND (AL1_ST_X_POS<790)) ) AND (NOT PS8) THEN
       PS7:=0;
       PS8:=1;
       STABLE:=0;
   END_IF;
   (*TS9*)
   IF (PS8 AND PSE0) AND ( ((AL1_ST_Z_POS>580) AND (AL1_ST_Z_POS<620)) ) AND (NOT PS9) THEN
       PS8:=0;
       PSE0:=0;
       PS9:=1;
       STABLE:=0;
   END_IF;
   (*TS10*)
   IF (PS9) AND ( (NOT AL1_ST_DETECTED) ) AND (NOT PS0 AND NOT PS10 AND NOT PSE0) THEN
       PS9:=0;
       PS0:=1;
       PS10:=1;
       PSE0:=1;
       STABLE:=0;
   END_IF;
   (*TS11*)
   IF (PS9) AND ( (NOT AL1_ST_DETECTED) ) AND (NOT PS0 AND NOT PS11 AND NOT PSE0) THEN
       PS9:=0;
       PS0:=1;
       PS11:=1;
       PSE0:=1;
       STABLE:=0;
   END_IF;
   (*TS12*)
   IF (PS9) AND ( (NOT AL1_ST_DETECTED) ) AND (NOT PS0 AND NOT PS12 AND NOT PSE0) THEN
       PS9:=0;
       PS0:=1;
       PS12:=1;
       PSE0:=1;
       STABLE:=0;
   END_IF;
   (*TS13*)
   IF (PS10 AND PS11 AND PS12 AND PSE0) AND ( (TRUE) ) AND (NOT PSE1) THEN
       PS10:=0;
       PS11:=0;
       PS12:=0;
       PSE0:=0;
       PSE1:=1;
       STABLE:=0;
   END_IF;
   (*TSE1*)
   IF (PSE1) AND ( (NOT ST_AL1_ST3) ) AND (NOT PSE2 AND NOT PG0) THEN
       PSE1:=0;
       PSE2:=1;
       PG0:=1;
       STABLE:=0;
   END_IF;
   (*TSE2*)
   IF (PSE2) AND ( (ST_AL1_ST3) ) AND (NOT PSE0) THEN
       PSE2:=0;
       PSE0:=1;
       STABLE:=0;
   END_IF;
   (*TG1*)
   IF (PG AND PG0) AND ( (AL1_G_S1) ) AND (NOT PG1) THEN
       PG:=0;
       PG0:=0;
       PG1:=1;
       STABLE:=0;
   END_IF;
   (*TG2*)
   IF (PG1) AND ( (AL1_G_SC_LL) ) AND (NOT PG2) THEN
       PG1:=0;
       PG2:=1;
       STABLE:=0;
   END_IF;
   (*TG3*)
   IF (PG2) AND ( (AL1_G_SC_MZ) ) AND (NOT PG3) THEN
       PG2:=0;
       PG3:=1;
       STABLE:=0;
   END_IF;
   (*TG4*)
   IF (PG3) AND ( (NOT AL1_G_SC_MZ) ) AND (NOT PG4) THEN
       PG3:=0;
       PG4:=1;
       STABLE:=0;
   END_IF;
   (*TG5*)
   IF (PG4) AND ( (AL1_G_SC_ML) ) AND (NOT PG5) THEN
       PG4:=0;
       PG5:=1;
       STABLE:=0;
   END_IF;
   (*TG6*)
   IF (PG5) AND ( (AL1_G_SC_MZ) ) AND (NOT PG6) THEN
       PG5:=0;
       PG6:=1;
       STABLE:=0;
   END_IF;
   (*TG7*)
   IF (PG6) AND ( (NOT AL1_G_SC_MZ) ) AND (NOT PG7) THEN
       PG6:=0;
       PG7:=1;
       STABLE:=0;
   END_IF;
   (*TG8*)
   IF (PG7) AND ( (TRUE) ) AND (NOT PG8 AND NOT PG11) THEN
       PG7:=0;
       PG8:=1;
       PG11:=1;
       STABLE:=0;
   END_IF;
   (*TG9*)
   IF (PG8) AND ( (AL1_G_SC_MX) ) AND (NOT PG9) THEN
       PG8:=0;
       PG9:=1;
       STABLE:=0;
   END_IF;
   (*TG10*)
   IF (PG9) AND ( (NOT AL1_G_SC_MX) ) AND (NOT PG10) THEN
       PG9:=0;
       PG10:=1;
       STABLE:=0;
   END_IF;
   (*TG12*)
   IF (PG11) AND ( (AL1_G_SC_MZ) ) AND (NOT PG12) THEN
       PG11:=0;
       PG12:=1;
       STABLE:=0;
   END_IF;
   (*TG13*)
   IF (PG12) AND ( (NOT AL1_G_SC_MZ) ) AND (NOT PG13) THEN
       PG12:=0;
       PG13:=1;
       STABLE:=0;
   END_IF;
   (*TG14*)
   IF (PG10 AND PG13) AND ( (TRUE) ) AND (NOT PG14) THEN
       PG10:=0;
       PG13:=0;
       PG14:=1;
       STABLE:=0;
   END_IF;
   (*TG15*)
   IF (PG14) AND ( (AL1_G_SC_MZ) ) AND (NOT PG15) THEN
       PG14:=0;
       PG15:=1;
       STABLE:=0;
   END_IF;
   (*TG16*)
   IF (PG15) AND ( (NOT AL1_G_SC_MZ) ) AND (NOT PG16) THEN
       PG15:=0;
       PG16:=1;
       STABLE:=0;
   END_IF;
   (*TG17*)
   IF (PG16) AND ( (AL1_G_SC_RL) ) AND (NOT PG17) THEN
       PG16:=0;
       PG17:=1;
       STABLE:=0;
   END_IF;
   (*TG18*)
   IF (PG17) AND ( (AL1_G_SC_MZ) ) AND (NOT PG18) THEN
       PG17:=0;
       PG18:=1;
       STABLE:=0;
   END_IF;
   (*TG19*)
   IF (PG18) AND ( (NOT AL1_G_SC_MZ) ) AND (NOT PG19) THEN
       PG18:=0;
       PG19:=1;
       STABLE:=0;
   END_IF;
   (*TG20*)
   IF (PG19) AND ( (AL1_G_SC_ML) ) AND (NOT PG20) THEN
       PG19:=0;
       PG20:=1;
       STABLE:=0;
   END_IF;
   (*TG21*)
   IF (PG20) AND ( (TRUE) ) AND (NOT PG21 AND NOT PG24) THEN
       PG20:=0;
       PG21:=1;
       PG24:=1;
       STABLE:=0;
   END_IF;
   (*TG22*)
   IF (PG21) AND ( (AL1_G_SC_MX) ) AND (NOT PG22) THEN
       PG21:=0;
       PG22:=1;
       STABLE:=0;
   END_IF;
   (*TG23*)
   IF (PG22) AND ( (NOT AL1_G_SC_MX) ) AND (NOT PG23) THEN
       PG22:=0;
       PG23:=1;
       STABLE:=0;
   END_IF;
   (*TG25*)
   IF (PG24) AND ( (AL1_G_SC_MZ) ) AND (NOT PG25) THEN
       PG24:=0;
       PG25:=1;
       STABLE:=0;
   END_IF;
   (*TG26*)
   IF (PG25) AND ( (NOT AL1_G_SC_MZ) ) AND (NOT PG26) THEN
       PG25:=0;
       PG26:=1;
       STABLE:=0;
   END_IF;
   (*TG27*)
   IF (PG23 AND PG26) AND ( (TRUE) ) AND (NOT PG) THEN
       PG23:=0;
       PG26:=0;
       PG:=1;
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
(*AL1_EMIT*)
IF PSE1 THEN
   AL1_EMIT:=1;
END_IF;
(*AL1_GRAB*)
IF PA3 OR PA4 OR PA5 OR PA6 THEN
   AL1_GRAB:=1;
END_IF;
(*AL1_G_SC_LIFT*)
IF PG2 OR PG3 OR PG4 OR PG14 OR PG15 OR PG16 THEN
   AL1_G_SC_LIFT:=1;
END_IF;
(*AL1_G_SC_LT*)
IF PG1 OR PG2 OR PG3 THEN
   AL1_G_SC_LT:=1;
END_IF;
(*AL1_G_SC_RT*)
IF PG16 OR PG17 OR PG18 THEN
   AL1_G_SC_RT:=1;
END_IF;
(*AL1_LID*)
IF P5 THEN
   AL1_LID:=1;
END_IF;
(*AL1_ST_GRAB*)
IF PS5 OR PS6 OR PS7 OR PS8 THEN
   AL1_ST_GRAB:=1;
END_IF;
(*CS_AL1_PLUS*)
IF P1 OR P2 OR PB OR P5 OR P6 THEN
   CS_AL1_PLUS:=1;
END_IF;
(*E_AL1_B1*)
IF PP0 OR PP1 THEN
   E_AL1_B1:=1;
END_IF;
(*LP_AL1_CLAMP*)
IF PA6 OR PA7 OR PB8 OR PB9 THEN
   LP_AL1_CLAMP:=1;
END_IF;
(*LP_AL1_RAISE*)
IF PA9 OR PA10 THEN
   LP_AL1_RAISE:=1;
END_IF;
(*MCB_CONTROL*)
IF PP3 THEN
   MCB_CONTROL:=1;
END_IF;
(*PAS_AL1_PLUS*)
IF PPL3 OR PPL4 THEN
   PAS_AL1_PLUS:=1;
END_IF;
(*PAS_AL1_ST_TURN*)
IF PSA1 THEN
   PAS_AL1_ST_TURN:=1;
END_IF;
(*PAS_AL1_TURN*)
IF PPL3 OR PPL4 THEN
   PAS_AL1_TURN:=1;
END_IF;
(*PUWS_AL1_1_PLUS*)
IF PB OR P5 OR P6 THEN
   PUWS_AL1_1_PLUS:=1;
END_IF;
(*PUWS_AL1_1_RT*)
IF P5 OR P6 THEN
   PUWS_AL1_1_RT:=1;
END_IF;
(*PUWS_AL1_B1_PLUS*)
IF PPAL1 OR PP2 THEN
   PUWS_AL1_B1_PLUS:=1;
END_IF;
(*P_AL1_B*)
IF PB2 OR PB23 THEN
   P_AL1_B:=1;
END_IF;
(*P_AL1_L*)
IF PL2 OR PL23 THEN
   P_AL1_L:=1;
END_IF;
(*RC_AL1_G7*)
IF PG THEN
   RC_AL1_G7:=1;
END_IF;
(*RC_AL1_ST*)
IF PSE1 OR PSE2 THEN
   RC_AL1_ST:=1;
END_IF;
(*RP_AL1_CLAMP*)
IF PL8 OR PL9 THEN
   RP_AL1_CLAMP:=1;
END_IF;
(*RP_AL1_ST_CLAMP*)
IF PS2 OR PS3 OR PS4 THEN
   RP_AL1_ST_CLAMP:=1;
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
(*AL1_EMIT*)
IF PSE2 OR PSE0 THEN
   AL1_EMIT:=0;
END_IF;
(*AL1_GRAB*)
IF PA0 OR PA1 OR PA2 OR PA7 OR PA8 THEN
   AL1_GRAB:=0;
END_IF;
(*AL1_G_SC_LIFT*)
IF PG OR PG1 OR PG5 OR PG6 OR PG7 OR PG8 OR PG9 OR PG10 OR PG11 OR PG12 OR PG13 OR PG17 OR PG18 OR PG19 OR PG20 OR PG21 OR PG22 OR PG23 OR PG24 OR PG25 OR PG26 THEN
   AL1_G_SC_LIFT:=0;
END_IF;
(*AL1_G_SC_LT*)
IF PG OR PG4 OR PG5 OR PG6 OR PG7 OR PG8 OR PG9 OR PG10 OR PG11 OR PG12 OR PG13 OR PG14 OR PG15 OR PG16 OR PG17 OR PG18 OR PG19 OR PG20 OR PG21 OR PG22 OR PG23 OR PG24 OR PG25 OR PG26 THEN
   AL1_G_SC_LT:=0;
END_IF;
(*AL1_G_SC_RT*)
IF PG OR PG1 OR PG2 OR PG3 OR PG4 OR PG5 OR PG6 OR PG7 OR PG8 OR PG9 OR PG10 OR PG11 OR PG12 OR PG13 OR PG14 OR PG15 OR PG19 OR PG20 OR PG21 OR PG22 OR PG23 OR PG24 OR PG25 OR PG26 THEN
   AL1_G_SC_RT:=0;
END_IF;
(*AL1_LID*)
IF P1 OR P6 THEN
   AL1_LID:=0;
END_IF;
(*AL1_ST_GRAB*)
IF PS23 OR PS2 OR PS3 OR PS4 OR PS9 THEN
   AL1_ST_GRAB:=0;
END_IF;
(*CS_AL1_PLUS*)
IF P3 OR P4 THEN
   CS_AL1_PLUS:=0;
END_IF;
(*E_AL1_B1*)
IF PP2 OR PP3 OR PPL3 THEN
   E_AL1_B1:=0;
END_IF;
(*LP_AL1_CLAMP*)
IF PA8 OR PA9 OR PA10 OR PA11 OR PA12 OR PBF4 THEN
   LP_AL1_CLAMP:=0;
END_IF;
(*LP_AL1_RAISE*)
IF PA0 OR PA1 OR PA2 OR PA3 OR PA4 OR PA5 OR PA6 OR PA7 OR PA8 OR PA11 OR PA12 THEN
   LP_AL1_RAISE:=0;
END_IF;
(*MCB_CONTROL*)
IF PP0 OR PPL3 THEN
   MCB_CONTROL:=0;
END_IF;
(*PAS_AL1_PLUS*)
IF PP0 OR PP3 OR PP4 THEN
   PAS_AL1_PLUS:=0;
END_IF;
(*PAS_AL1_ST_TURN*)
IF PSA0 THEN
   PAS_AL1_ST_TURN:=0;
END_IF;
(*PAS_AL1_TURN*)
IF PP0 OR PP3 OR PP4 THEN
   PAS_AL1_TURN:=0;
END_IF;
(*PUWS_AL1_1_PLUS*)
IF P1 OR P2 OR P3 OR P4 THEN
   PUWS_AL1_1_PLUS:=0;
END_IF;
(*PUWS_AL1_1_RT*)
IF P1 OR P2 OR P3 OR P4 OR PB THEN
   PUWS_AL1_1_RT:=0;
END_IF;
(*PUWS_AL1_B1_RIGHT*)
IF PPAL1 OR PP2 THEN
   PUWS_AL1_B1_RIGHT:=0;
END_IF;
(*P_AL1_B*)
IF P_BASE OR PB1 OR PB3 THEN
   P_AL1_B:=0;
END_IF;
(*P_AL1_L*)
IF P_LID OR PL1 OR PL3 THEN
   P_AL1_L:=0;
END_IF;
(*RC_AL1_G7*)
IF PG1 OR PG2 OR PG3 OR PG4 OR PG5 OR PG6 OR PG7 OR PG8 OR PG9 OR PG10 OR PG11 OR PG12 OR PG13 OR PG14 OR PG15 OR PG16 OR PG17 OR PG18 OR PG19 OR PG20 OR PG21 OR PG22 OR PG23 OR PG24 OR PG25 OR PG26 THEN
   RC_AL1_G7:=0;
END_IF;
(*RC_AL1_ST*)
IF PSE0 THEN
   RC_AL1_ST:=0;
END_IF;
(*RP_AL1_CLAMP*)
IF PA3 OR PA4 OR PLF4 THEN
   RP_AL1_CLAMP:=0;
END_IF;
(*RP_AL1_ST_CLAMP*)
IF PSC OR PS23 THEN
   RP_AL1_ST_CLAMP:=0;
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
(*AL1_ST_X_SET*)
IF PS0 THEN
   AL1_ST_X_SET:=0;
END_IF;
(*AL1_ST_Y_SET*)
IF PS3 THEN
   AL1_ST_Y_SET:=560;
END_IF;
(*AL1_ST_Z_SET*)
IF PS4 THEN
   AL1_ST_Z_SET:=800;
END_IF;
(*AL1_ST_Z_SET*)
IF PS6 THEN
   AL1_ST_Z_SET:=410;
END_IF;
(*AL1_ST_X_SET*)
IF PS7 THEN
   AL1_ST_X_SET:=770;
END_IF;
(*AL1_ST_Z_SET*)
IF PS8 THEN
   AL1_ST_Z_SET:=600;
END_IF;
(*AL1_G_SC_TG*)
IF PG THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG1 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG2 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG3 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG4 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG5 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG6 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG7 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG8 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG9 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG10 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG11 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG12 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG13 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG14 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG15 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG16 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG17 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG18 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG19 THEN
   AL1_G_SC_TG:=TG_POS;
END_IF;
(*AL1_G_SC_TG*)
IF PG20 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG21 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG22 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG23 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG24 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG25 THEN
   AL1_G_SC_TG:=55;
END_IF;
(*AL1_G_SC_TG*)
IF PG26 THEN
   AL1_G_SC_TG:=55;
END_IF;


END_PROGRAM


PROGRAM program1



(*=====================================================================*)
(*DECLARATION*)
(*=====================================================================*)

VAR


(*INPUTS*)
S_AL2_P_B1 AT %IX108.5 : BOOL;
S_AL2_P_B2 AT %IX108.6 : BOOL;
S_AL2_MCL AT %IX108.7 : BOOL;
MCL_BUSY AT %IX109.0 : BOOL;
MCL_ERROR AT %IX109.1 : BOOL;
S_AL2_MCLR AT %IX109.2 : BOOL;
MCLR_BUSY AT %IX109.3 : BOOL;
MCLR_ERROR AT %IX109.4 : BOOL;
S_AL2_P_B3 AT %IX109.5 : BOOL;
S_AL2_MCL2 AT %IX109.6 : BOOL;
S_AL2_MCLR2 AT %IX109.7 : BOOL;
S_AL2_B AT %IX106.0 : BOOL;
P_AL2_B_FT AT %IX106.1 : BOOL;
P_AL2_B_BK AT %IX106.2 : BOOL;
S_AL2_B1 AT %IX106.3 : BOOL;
S_AL2_B2 AT %IX106.4 : BOOL;
S_AL2_B3 AT %IX106.5 : BOOL;
LP_AL2_CLAMPED AT %IX106.6 : BOOL;
S_AL2_LP AT %IX106.7 : BOOL;
S_AL2_L AT %IX107.0 : BOOL;
P_AL2_L_FT AT %IX107.1 : BOOL;
P_AL2_L_BK AT %IX107.2 : BOOL;
S_AL2_L1 AT %IX107.3 : BOOL;
S_AL2_L2 AT %IX107.4 : BOOL;
S_AL2_L3 AT %IX107.5 : BOOL;
RP_AL2_CLAMPED AT %IX107.6 : BOOL;
S_AL2_RP AT %IX107.7 : BOOL;
S_AL2 AT %IX108.0 : BOOL;
CS_AL2_W AT %IW107 : WORD;
S_BIN_2 AT %IX108.1 : BOOL;
S_AL2_BL AT %IX108.2 : BOOL;
AL2_DETECTED AT %IX108.3 : BOOL;
LP_AL2_LIMIT AT %IX108.4 : BOOL;
AL2_X_POS AT %IW108 : WORD;
AL2_Y_POS AT %IW109 : WORD;
AL2_Z_POS AT %IW110 : WORD;
ST_AL2_ST0 AT %IX111.3 : BOOL;
ST_AL2_ST1 AT %IX110.0 : BOOL;
ST_AL2_ST2 AT %IX110.1 : BOOL;
ST_AL2_ST3 AT %IX110.2 : BOOL;
RP_AL2_ST_CLAMPED AT %IX110.3 : BOOL;
AL2_ST_DETECTED AT %IX110.4 : BOOL;
AL2_ST_X_POS AT %IW111 : WORD;
AL2_ST_Y_POS AT %IW112 : WORD;
AL2_ST_Z_POS AT %IW113 : WORD;
AL2_G_S1 AT %IX110.5 : BOOL;
AL2_G_SC_LL AT %IX110.6 : BOOL;
AL2_G_SC_MZ AT %IX110.7 : BOOL;
AL2_G_SC_ML AT %IX111.0 : BOOL;
AL2_G_SC_MX AT %IX111.1 : BOOL;
AL2_G_SC_RL AT %IX111.2 : BOOL;
E_AL2_B1 AT %QX106.0 : BOOL;
PUWS_AL2_B1_PLUS AT %QX106.1 : BOOL;
PUWS_AL2_B1_LEFT AT %QX106.2 : BOOL;
PAS_AL2_PLUS AT %QX106.3 : BOOL;
PAS_AL2_TURN AT %QX106.4 : BOOL;
SB_AL2 AT %QX105.2 : BOOL;
PUWS_AL2_1_PLUS AT %QX105.3 : BOOL;
PUWS_AL2_1_LT AT %QX105.4 : BOOL;
CS_AL2_PLUS AT %QX105.5 : BOOL;
P_AL2_B AT %QX104.0 : BOOL;
SB_AL2_B1 AT %QX104.1 : BOOL;
SB_AL2_B2 AT %QX104.2 : BOOL;
SB_AL2_B3 AT %QX104.3 : BOOL;
LP_AL2_CLAMP AT %QX104.4 : BOOL;
P_AL2_L AT %QX104.5 : BOOL;
SB_AL2_L1 AT %QX104.6 : BOOL;
SB_AL2_L2 AT %QX104.7 : BOOL;
SB_AL2_L3 AT %QX105.0 : BOOL;
RP_AL2_CLAMP AT %QX105.1 : BOOL;
AL2_GRAB AT %QX105.6 : BOOL;
LP_AL2_RAISE AT %QX105.7 : BOOL;
AL2_X_SET AT %QW107 : WORD;
AL2_Y_SET AT %QW108 : WORD;
AL2_Z_SET AT %QW109 : WORD;
PAS_AL2_ST_TURN AT %QX107.5 : BOOL;
AL2_ST_X_SET AT %QW110 : WORD;
AL2_ST_Y_SET AT %QW111 : WORD;
AL2_ST_Z_SET AT %QW112 : WORD;
RP_AL2_ST_CLAMP AT %QX106.5 : BOOL;
AL2_ST_GRAB AT %QX106.6 : BOOL;
AL2_EMIT AT %QX106.7 : BOOL;
RC_AL2_ST AT %QX107.0 : BOOL;
RC_AL2_G7 AT %QX107.1 : BOOL;
AL2_G_SC_LT AT %QX107.2 : BOOL;
AL2_G_SC_LIFT AT %QX107.3 : BOOL;
AL2_G_SC_RT AT %QX107.4 : BOOL;
AL2_G_SC_TG AT %QW113 : INT;

END_VAR


VAR

(*PLACES*)

PPAL2 : BOOL := 1;
PP0 : BOOL := 1;
PP1 : BOOL := 0;
PP2 : BOOL := 0;
PP3 : BOOL := 0;
PP4 : BOOL := 0;
MCL : BOOL := 1;
PP5 : BOOL := 0;
PP7 : BOOL := 0;
PPL3 : BOOL := 0;
PPL4 : BOOL := 0;
MCLR : BOOL := 1;
PPL5 : BOOL := 0;
PPL7 : BOOL := 0;
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
PA0 : BOOL := 1;
PA1 : BOOL := 0;
PA2 : BOOL := 0;
PA3 : BOOL := 0;
PA4 : BOOL := 0;
PA5 : BOOL := 0;
PA6 : BOOL := 0;
PA7 : BOOL := 0;
PA8 : BOOL := 0;
PA9 : BOOL := 0;
PA10 : BOOL := 0;
PA11 : BOOL := 0;
PA12 : BOOL := 0;
PA13 : BOOL := 0;
PBF4 : BOOL := 1;
PB8 : BOOL := 0;
PB9 : BOOL := 0;
PLF4 : BOOL := 1;
PL8 : BOOL := 0;
PL9 : BOOL := 0;
PSA0 : BOOL := 1;
PSA1 : BOOL := 0;
PS0 : BOOL := 1;
PSC : BOOL := 1;
PS1 : BOOL := 0;
PS23 : BOOL := 0;
PS2 : BOOL := 0;
PS3 : BOOL := 0;
PS4 : BOOL := 0;
PS5 : BOOL := 0;
PS6 : BOOL := 0;
PS7 : BOOL := 0;
PS8 : BOOL := 0;
PS9 : BOOL := 0;
PS10 : BOOL := 0;
PS11 : BOOL := 0;
PS12 : BOOL := 0;
PSE1 : BOOL := 0;
PSE2 : BOOL := 0;
PSE0 : BOOL := 1;
PG0 : BOOL := 0;
PG : BOOL := 1;
PG1 : BOOL := 0;
PG2 : BOOL := 0;
PG3 : BOOL := 0;
PG4 : BOOL := 0;
PG5 : BOOL := 0;
PG6 : BOOL := 0;
PG7 : BOOL := 0;
PG8 : BOOL := 0;
PG9 : BOOL := 0;
PG10 : BOOL := 0;
PG11 : BOOL := 0;
PG12 : BOOL := 0;
PG13 : BOOL := 0;
PG14 : BOOL := 0;
PG15 : BOOL := 0;
PG16 : BOOL := 0;
PG17 : BOOL := 0;
PG18 : BOOL := 0;
PG19 : BOOL := 0;
PG20 : BOOL := 0;
PG21 : BOOL := 0;
PG22 : BOOL := 0;
PG23 : BOOL := 0;
PG24 : BOOL := 0;
PG25 : BOOL := 0;
PG26 : BOOL := 0;
STABLE : BOOL := 0;

END_VAR


VAR

(*INTERNAL VARIABLES*)

MCL_CONTROL : BOOL;
timer_1_TL1 : TON;
timer_1_TB1 : TON;
timer_1_P2 : TON;
timer_1_P3 : TON;
AL2_BASE : BOOL;
AL2_LID : BOOL;
timer_1_PL9 : TON;
timer_1_PL7 : TON;
timer_1_PB7 : TON;
timer_1_PS23 : TON;
timer_1_PSA1 : TON;
TG_POS : INT;
placeCtr : CTU;

END_VAR

timer_1_TL1(IN:= PL1, PT:= T#750ms);
timer_1_TB1(IN:= PB1, PT:= T#900ms);
timer_1_P2(IN:= P2, PT:= T#1000ms);
timer_1_P3(IN:= P3, PT:= T#1000ms);
timer_1_PL9(IN:= PL9, PT:= T#300ms);
timer_1_PL7(IN:= PL78, PT:= T#1500ms);
timer_1_PB7(IN:= PB78, PT:= T#1500ms);
timer_1_PS23(IN:= PS23, PT:= T#1500ms);
timer_1_PSA1(IN:= PSA1, PT:= T#5000ms);
TG_POS:=placeCtr.CV+10;
placeCtr(CU:= PG, R:= 0, PV:= 54);


(*=====================================================================*)
(*TRANSITIONS*)
(*=====================================================================*)

STABLE:=0;
WHILE STABLE=0 DO
   STABLE:=1;
   (*TP0*)
   IF (PP0) AND ( (NOT MCL_CONTROL) ) AND (NOT PP1) THEN
       PP0:=0;
       PP1:=1;
       STABLE:=0;
   END_IF;
   (*TP1*)
   IF (PP1) AND ( (S_AL2_P_B1) ) AND (NOT PP2) THEN
       PP1:=0;
       PP2:=1;
       STABLE:=0;
   END_IF;
   (*TP2*)
   IF (PP2) AND ( (S_AL2_P_B2 AND NOT MCL_CONTROL) ) AND (NOT PP3) THEN
       PP2:=0;
       PP3:=1;
       STABLE:=0;
   END_IF;
   (*TP3*)
   IF (PP3) AND ( (S_AL2_MCL) ) AND (NOT PP4 AND NOT PP1) THEN
       PP3:=0;
       PP4:=1;
       PP1:=1;
       STABLE:=0;
   END_IF;
   (*TP4*)
   IF (PP4 AND MCL) AND ( (MCL_BUSY) ) AND (NOT PP5) THEN
       PP4:=0;
       MCL:=0;
       PP5:=1;
       STABLE:=0;
   END_IF;
   (*TP6*)
   IF (PP5) AND ( (S_AL2_MCL2) ) AND (NOT PP7 AND NOT MCL) THEN
       PP5:=0;
       PP7:=1;
       MCL:=1;
       STABLE:=0;
   END_IF;
   (*TP7*)
   IF (PP7) AND ( (S_AL2_P_B3) ) AND (NOT P0) THEN
       PP7:=0;
       P0:=1;
       STABLE:=0;
   END_IF;
   (*TPL2*)
   IF (PP2) AND ( (S_AL2_P_B2 AND MCL_CONTROL) ) AND (NOT PPL3 AND NOT PP1) THEN
       PP2:=0;
       PPL3:=1;
       PP1:=1;
       STABLE:=0;
   END_IF;
   (*TPL3*)
   IF (PPL3) AND ( (S_AL2_MCLR) ) AND (NOT PPL4) THEN
       PPL3:=0;
       PPL4:=1;
       STABLE:=0;
   END_IF;
   (*TPL4*)
   IF (PPL4 AND MCLR) AND ( (MCLR_BUSY) ) AND (NOT PPL5) THEN
       PPL4:=0;
       MCLR:=0;
       PPL5:=1;
       STABLE:=0;
   END_IF;
   (*TPL6*)
   IF (PPL5) AND ( (S_AL2_MCLR2) ) AND (NOT PPL7 AND NOT MCLR) THEN
       PPL5:=0;
       PPL7:=1;
       MCLR:=1;
       STABLE:=0;
   END_IF;
   (*TPL7*)
   IF (PPL7) AND ( (S_AL2_P_B3) ) AND (NOT P0) THEN
       PPL7:=0;
       P0:=1;
       STABLE:=0;
   END_IF;
   (*T0212*)
   IF (P0 AND P1) AND ( (S_AL2) ) AND (NOT P2) THEN
       P0:=0;
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
   IF (P4) AND ( ((CS_AL2_W < 200) OR (CS_AL2_W > 400)) ) AND (NOT PB) THEN
       P4:=0;
       PB:=1;
       STABLE:=0;
   END_IF;
   (*T4B2*)
   IF (PB AND BIN1) AND ( (S_BIN_2) ) AND (NOT BIN2 AND NOT P1) THEN
       PB:=0;
       BIN1:=0;
       BIN2:=1;
       P1:=1;
       STABLE:=0;
   END_IF;
   (*TB21*)
   IF (BIN2) AND ( (NOT S_BIN_2) ) AND (NOT BIN1) THEN
       BIN2:=0;
       BIN1:=1;
       STABLE:=0;
   END_IF;
   (*T45*)
   IF (P4) AND ( ((CS_AL2_W > 200) AND (CS_AL2_W <= 300)) ) AND (NOT P5) THEN
       P4:=0;
       P5:=1;
       STABLE:=0;
   END_IF;
   (*T46*)
   IF (P4) AND ( ((CS_AL2_W > 300) AND (CS_AL2_W <= 400)) ) AND (NOT P6) THEN
       P4:=0;
       P6:=1;
       STABLE:=0;
   END_IF;
   (*T57*)
   IF (P5) AND ( (S_AL2_BL) ) AND (NOT P_LID AND NOT P1) THEN
       P5:=0;
       P_LID:=1;
       P1:=1;
       STABLE:=0;
   END_IF;
   (*T67*)
   IF (P6) AND ( (S_AL2_BL) ) AND (NOT P_BASE AND NOT P1) THEN
       P6:=0;
       P_BASE:=1;
       P1:=1;
       STABLE:=0;
   END_IF;
   (*TB0*)
   IF (P_BASE) AND ( (S_AL2_B) ) AND (NOT PB1) THEN
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
   IF (PB2) AND ( (P_AL2_B_FT) ) AND (NOT PB23) THEN
       PB2:=0;
       PB23:=1;
       STABLE:=0;
   END_IF;
   (*TB2*)
   IF (PB23) AND ( (P_AL2_B_FT) ) AND (NOT PB3) THEN
       PB23:=0;
       PB3:=1;
       STABLE:=0;
   END_IF;
   (*TB3*)
   IF (PB3) AND ( (P_AL2_B_BK) ) AND (NOT PB4 AND NOT PUSH_B) THEN
       PB3:=0;
       PB4:=1;
       PUSH_B:=1;
       STABLE:=0;
   END_IF;
   (*TB4*)
   IF (PB4 AND PBF1) AND ( (S_AL2_B1) ) AND (NOT PB5) THEN
       PB4:=0;
       PBF1:=0;
       PB5:=1;
       STABLE:=0;
   END_IF;
   (*TB5*)
   IF (PB5 AND PBF2) AND ( (S_AL2_B2) ) AND (NOT PB6 AND NOT PBF1) THEN
       PB5:=0;
       PBF2:=0;
       PB6:=1;
       PBF1:=1;
       STABLE:=0;
   END_IF;
   (*TB6*)
   IF (PB6 AND PBF3) AND ( (S_AL2_B3) ) AND (NOT PB7 AND NOT PBF2) THEN
       PB6:=0;
       PBF3:=0;
       PB7:=1;
       PBF2:=1;
       STABLE:=0;
   END_IF;
   (*TB7*)
   IF (PB7 AND PBF4) AND ( (S_AL2_LP) ) AND (NOT PB78) THEN
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
   IF (P_LID) AND ( (S_AL2_L) ) AND (NOT PL1) THEN
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
   IF (PL2) AND ( (P_AL2_L_FT) ) AND (NOT PL23) THEN
       PL2:=0;
       PL23:=1;
       STABLE:=0;
   END_IF;
   (*TL2*)
   IF (PL23) AND ( (P_AL2_L_FT) ) AND (NOT PL3) THEN
       PL23:=0;
       PL3:=1;
       STABLE:=0;
   END_IF;
   (*TL3*)
   IF (PL3) AND ( (P_AL2_L_BK) ) AND (NOT PL4 AND NOT PUSH_L) THEN
       PL3:=0;
       PL4:=1;
       PUSH_L:=1;
       STABLE:=0;
   END_IF;
   (*TL4*)
   IF (PL4 AND PLF1) AND ( (S_AL2_L1) ) AND (NOT PL5) THEN
       PL4:=0;
       PLF1:=0;
       PL5:=1;
       STABLE:=0;
   END_IF;
   (*TL5*)
   IF (PL5 AND PLF2) AND ( (S_AL2_L2) ) AND (NOT PL6 AND NOT PLF1) THEN
       PL5:=0;
       PLF2:=0;
       PL6:=1;
       PLF1:=1;
       STABLE:=0;
   END_IF;
   (*TL6*)
   IF (PL6 AND PLF3) AND ( (S_AL2_L3) ) AND (NOT PL7 AND NOT PLF2) THEN
       PL6:=0;
       PLF3:=0;
       PL7:=1;
       PLF2:=1;
       STABLE:=0;
   END_IF;
   (*TL7*)
   IF (PL7 AND PLF4) AND ( (S_AL2_RP) ) AND (NOT PL78) THEN
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
   IF (PL8) AND ( (RP_AL2_CLAMPED) ) AND (NOT PL9) THEN
       PL8:=0;
       PL9:=1;
       STABLE:=0;
   END_IF;
   (*TB8*)
   IF (PB8) AND ( (LP_AL2_CLAMPED) ) AND (NOT PB9) THEN
       PB8:=0;
       PB9:=1;
       STABLE:=0;
   END_IF;
   (*TA0*)
   IF (PL9 AND PA0) AND ( (timer_1_PL9.Q AND RP_AL2_CLAMPED AND NOT AL2_DETECTED) ) AND (NOT PA1) THEN
       PL9:=0;
       PA0:=0;
       PA1:=1;
       STABLE:=0;
   END_IF;
   (*TA1*)
   IF (PA1) AND ( (AL2_X_POS>798 AND AL2_X_POS<802) ) AND (NOT PA2) THEN
       PA1:=0;
       PA2:=1;
       STABLE:=0;
   END_IF;
   (*TA2*)
   IF (PA2) AND ( (AL2_Z_POS>798 AND AL2_Z_POS<802) ) AND (NOT PA3) THEN
       PA2:=0;
       PA3:=1;
       STABLE:=0;
   END_IF;
   (*TA3*)
   IF (PA3) AND ( (NOT RP_AL2_CLAMPED) ) AND (NOT PA4) THEN
       PA3:=0;
       PA4:=1;
       STABLE:=0;
   END_IF;
   (*TA4*)
   IF (PA4) AND ( (AL2_Z_POS>398 AND AL2_Z_POS<402) ) AND (NOT PA5 AND NOT PLF3 AND NOT PLF4) THEN
       PA4:=0;
       PA5:=1;
       PLF3:=1;
       PLF4:=1;
       STABLE:=0;
   END_IF;
   (*TA5*)
   IF (PB9 AND PA5) AND ( (AL2_DETECTED AND LP_AL2_CLAMPED AND AL2_X_POS>208 AND AL2_X_POS<212) ) AND (NOT PA6) THEN
       PB9:=0;
       PA5:=0;
       PA6:=1;
       STABLE:=0;
   END_IF;
   (*TA6*)
   IF (PA6) AND ( (AL2_Z_POS>810 AND AL2_Z_POS<820) ) AND (NOT PA7) THEN
       PA6:=0;
       PA7:=1;
       STABLE:=0;
   END_IF;
   (*TA7*)
   IF (PA7) AND ( (AL2_Z_POS>398 AND AL2_Z_POS<402) ) AND (NOT PA8) THEN
       PA7:=0;
       PA8:=1;
       STABLE:=0;
   END_IF;
   (*TA8*)
   IF (PA8) AND ( (NOT LP_AL2_CLAMPED) ) AND (NOT PA9) THEN
       PA8:=0;
       PA9:=1;
       STABLE:=0;
   END_IF;
   (*TA9*)
   IF (PA9) AND ( (NOT LP_AL2_LIMIT) ) AND (NOT PA10) THEN
       PA9:=0;
       PA10:=1;
       STABLE:=0;
   END_IF;
   (*TA10*)
   IF (PA10) AND ( (LP_AL2_LIMIT) ) AND (NOT PA11) THEN
       PA10:=0;
       PA11:=1;
       STABLE:=0;
   END_IF;
   (*TA11*)
   IF (PA11) AND ( (NOT LP_AL2_LIMIT) ) AND (NOT PA12) THEN
       PA11:=0;
       PA12:=1;
       STABLE:=0;
   END_IF;
   (*TA12*)
   IF (PA12) AND ( (LP_AL2_LIMIT) ) AND (NOT PA13 AND NOT PA0 AND NOT PBF3 AND NOT PBF4) THEN
       PA12:=0;
       PA13:=1;
       PA0:=1;
       PBF3:=1;
       PBF4:=1;
       STABLE:=0;
   END_IF;
   (*TSA0*)
   IF (PA13 AND PSA0) AND ( (ST_AL2_ST0) ) AND (NOT PSA1) THEN
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
   IF (PA13) AND ( (ST_AL2_ST1) ) AND (NOT PS1) THEN
       PA13:=0;
       PS1:=1;
       STABLE:=0;
   END_IF;
   (*TS2*)
   IF (PS0 AND PSC AND PS1) AND ( (ST_AL2_ST2) ) AND (NOT PS23) THEN
       PS0:=0;
       PSC:=0;
       PS1:=0;
       PS23:=1;
       STABLE:=0;
   END_IF;
   (*TS23*)
   IF (PS23) AND ( (timer_1_PS23.Q) ) AND (NOT PS2) THEN
       PS23:=0;
       PS2:=1;
       STABLE:=0;
   END_IF;
   (*TS3*)
   IF (PS2) AND ( (RP_AL2_ST_CLAMPED) ) AND (NOT PS3) THEN
       PS2:=0;
       PS3:=1;
       STABLE:=0;
   END_IF;
   (*TS4*)
   IF (PS3) AND ( ((AL2_ST_Y_POS>358) AND (AL2_ST_Y_POS<362)) ) AND (NOT PS4) THEN
       PS3:=0;
       PS4:=1;
       STABLE:=0;
   END_IF;
   (*TS5*)
   IF (PS4) AND ( ((AL2_ST_Z_POS>780) AND (AL2_ST_Z_POS<820)) ) AND (NOT PSC AND NOT PS5) THEN
       PS4:=0;
       PSC:=1;
       PS5:=1;
       STABLE:=0;
   END_IF;
   (*TS6*)
   IF (PS5) AND ( (AL2_ST_DETECTED) ) AND (NOT PS6) THEN
       PS5:=0;
       PS6:=1;
       STABLE:=0;
   END_IF;
   (*TS7*)
   IF (PS6) AND ( ((AL2_ST_Z_POS>390) AND (AL2_ST_Z_POS<430)) ) AND (NOT PS7) THEN
       PS6:=0;
       PS7:=1;
       STABLE:=0;
   END_IF;
   (*TS8*)
   IF (PS7) AND ( ((AL2_ST_X_POS>750) AND (AL2_ST_X_POS<790)) ) AND (NOT PS8) THEN
       PS7:=0;
       PS8:=1;
       STABLE:=0;
   END_IF;
   (*TS9*)
   IF (PS8 AND PSE0) AND ( ((AL2_ST_Z_POS>580) AND (AL2_ST_Z_POS<620)) ) AND (NOT PS9) THEN
       PS8:=0;
       PSE0:=0;
       PS9:=1;
       STABLE:=0;
   END_IF;
   (*TS10*)
   IF (PS9) AND ( (NOT AL2_ST_DETECTED) ) AND (NOT PS0 AND NOT PS10 AND NOT PSE0) THEN
       PS9:=0;
       PS0:=1;
       PS10:=1;
       PSE0:=1;
       STABLE:=0;
   END_IF;
   (*TS11*)
   IF (PS9) AND ( (NOT AL2_ST_DETECTED) ) AND (NOT PS0 AND NOT PS11 AND NOT PSE0) THEN
       PS9:=0;
       PS0:=1;
       PS11:=1;
       PSE0:=1;
       STABLE:=0;
   END_IF;
   (*TS12*)
   IF (PS9) AND ( (NOT AL2_ST_DETECTED) ) AND (NOT PS0 AND NOT PS12 AND NOT PSE0) THEN
       PS9:=0;
       PS0:=1;
       PS12:=1;
       PSE0:=1;
       STABLE:=0;
   END_IF;
   (*TS13*)
   IF (PS10 AND PS11 AND PS12 AND PSE0) AND ( (TRUE) ) AND (NOT PSE1) THEN
       PS10:=0;
       PS11:=0;
       PS12:=0;
       PSE0:=0;
       PSE1:=1;
       STABLE:=0;
   END_IF;
   (*TSE1*)
   IF (PSE1) AND ( (NOT ST_AL2_ST3) ) AND (NOT PSE2 AND NOT PG0) THEN
       PSE1:=0;
       PSE2:=1;
       PG0:=1;
       STABLE:=0;
   END_IF;
   (*TSE2*)
   IF (PSE2) AND ( (ST_AL2_ST3) ) AND (NOT PSE0) THEN
       PSE2:=0;
       PSE0:=1;
       STABLE:=0;
   END_IF;
   (*TG1*)
   IF (PG AND PG0) AND ( (AL2_G_S1) ) AND (NOT PG1) THEN
       PG:=0;
       PG0:=0;
       PG1:=1;
       STABLE:=0;
   END_IF;
   (*TG2*)
   IF (PG1) AND ( (AL2_G_SC_LL) ) AND (NOT PG2) THEN
       PG1:=0;
       PG2:=1;
       STABLE:=0;
   END_IF;
   (*TG3*)
   IF (PG2) AND ( (AL2_G_SC_MZ) ) AND (NOT PG3) THEN
       PG2:=0;
       PG3:=1;
       STABLE:=0;
   END_IF;
   (*TG4*)
   IF (PG3) AND ( (NOT AL2_G_SC_MZ) ) AND (NOT PG4) THEN
       PG3:=0;
       PG4:=1;
       STABLE:=0;
   END_IF;
   (*TG5*)
   IF (PG4) AND ( (AL2_G_SC_ML) ) AND (NOT PG5) THEN
       PG4:=0;
       PG5:=1;
       STABLE:=0;
   END_IF;
   (*TG6*)
   IF (PG5) AND ( (AL2_G_SC_MZ) ) AND (NOT PG6) THEN
       PG5:=0;
       PG6:=1;
       STABLE:=0;
   END_IF;
   (*TG7*)
   IF (PG6) AND ( (NOT AL2_G_SC_MZ) ) AND (NOT PG7) THEN
       PG6:=0;
       PG7:=1;
       STABLE:=0;
   END_IF;
   (*TG8*)
   IF (PG7) AND ( (TRUE) ) AND (NOT PG8 AND NOT PG11) THEN
       PG7:=0;
       PG8:=1;
       PG11:=1;
       STABLE:=0;
   END_IF;
   (*TG9*)
   IF (PG8) AND ( (AL2_G_SC_MX) ) AND (NOT PG9) THEN
       PG8:=0;
       PG9:=1;
       STABLE:=0;
   END_IF;
   (*TG10*)
   IF (PG9) AND ( (NOT AL2_G_SC_MX) ) AND (NOT PG10) THEN
       PG9:=0;
       PG10:=1;
       STABLE:=0;
   END_IF;
   (*TG12*)
   IF (PG11) AND ( (AL2_G_SC_MZ) ) AND (NOT PG12) THEN
       PG11:=0;
       PG12:=1;
       STABLE:=0;
   END_IF;
   (*TG13*)
   IF (PG12) AND ( (NOT AL2_G_SC_MZ) ) AND (NOT PG13) THEN
       PG12:=0;
       PG13:=1;
       STABLE:=0;
   END_IF;
   (*TG14*)
   IF (PG10 AND PG13) AND ( (TRUE) ) AND (NOT PG14) THEN
       PG10:=0;
       PG13:=0;
       PG14:=1;
       STABLE:=0;
   END_IF;
   (*TG15*)
   IF (PG14) AND ( (AL2_G_SC_MZ) ) AND (NOT PG15) THEN
       PG14:=0;
       PG15:=1;
       STABLE:=0;
   END_IF;
   (*TG16*)
   IF (PG15) AND ( (NOT AL2_G_SC_MZ) ) AND (NOT PG16) THEN
       PG15:=0;
       PG16:=1;
       STABLE:=0;
   END_IF;
   (*TG17*)
   IF (PG16) AND ( (AL2_G_SC_RL) ) AND (NOT PG17) THEN
       PG16:=0;
       PG17:=1;
       STABLE:=0;
   END_IF;
   (*TG18*)
   IF (PG17) AND ( (AL2_G_SC_MZ) ) AND (NOT PG18) THEN
       PG17:=0;
       PG18:=1;
       STABLE:=0;
   END_IF;
   (*TG19*)
   IF (PG18) AND ( (NOT AL2_G_SC_MZ) ) AND (NOT PG19) THEN
       PG18:=0;
       PG19:=1;
       STABLE:=0;
   END_IF;
   (*TG20*)
   IF (PG19) AND ( (AL2_G_SC_ML) ) AND (NOT PG20) THEN
       PG19:=0;
       PG20:=1;
       STABLE:=0;
   END_IF;
   (*TG21*)
   IF (PG20) AND ( (TRUE) ) AND (NOT PG21 AND NOT PG24) THEN
       PG20:=0;
       PG21:=1;
       PG24:=1;
       STABLE:=0;
   END_IF;
   (*TG22*)
   IF (PG21) AND ( (AL2_G_SC_MX) ) AND (NOT PG22) THEN
       PG21:=0;
       PG22:=1;
       STABLE:=0;
   END_IF;
   (*TG23*)
   IF (PG22) AND ( (NOT AL2_G_SC_MX) ) AND (NOT PG23) THEN
       PG22:=0;
       PG23:=1;
       STABLE:=0;
   END_IF;
   (*TG25*)
   IF (PG24) AND ( (AL2_G_SC_MZ) ) AND (NOT PG25) THEN
       PG24:=0;
       PG25:=1;
       STABLE:=0;
   END_IF;
   (*TG26*)
   IF (PG25) AND ( (NOT AL2_G_SC_MZ) ) AND (NOT PG26) THEN
       PG25:=0;
       PG26:=1;
       STABLE:=0;
   END_IF;
   (*TG27*)
   IF (PG23 AND PG26) AND ( (TRUE) ) AND (NOT PG) THEN
       PG23:=0;
       PG26:=0;
       PG:=1;
       STABLE:=0;
   END_IF;
END_WHILE;


(*=====================================================================*)
(*OUTPUTS*)
(*=====================================================================*)

(*AL2_BASE*)
IF P6 THEN
   AL2_BASE:=1;
END_IF;
(*AL2_EMIT*)
IF PSE1 THEN
   AL2_EMIT:=1;
END_IF;
(*AL2_GRAB*)
IF PA3 OR PA4 OR PA5 OR PA6 THEN
   AL2_GRAB:=1;
END_IF;
(*AL2_G_SC_LIFT*)
IF PG2 OR PG3 OR PG4 OR PG14 OR PG15 OR PG16 THEN
   AL2_G_SC_LIFT:=1;
END_IF;
(*AL2_G_SC_LT*)
IF PG1 OR PG2 OR PG3 THEN
   AL2_G_SC_LT:=1;
END_IF;
(*AL2_G_SC_RT*)
IF PG16 OR PG17 OR PG18 THEN
   AL2_G_SC_RT:=1;
END_IF;
(*AL2_LID*)
IF P5 THEN
   AL2_LID:=1;
END_IF;
(*AL2_ST_GRAB*)
IF PS5 OR PS6 OR PS7 OR PS8 THEN
   AL2_ST_GRAB:=1;
END_IF;
(*CS_AL2_PLUS*)
IF P1 OR P2 OR PB OR P5 OR P6 THEN
   CS_AL2_PLUS:=1;
END_IF;
(*E_AL2_B1*)
IF PP0 OR PP1 THEN
   E_AL2_B1:=1;
END_IF;
(*LP_AL2_CLAMP*)
IF PA6 OR PA7 OR PB8 OR PB9 THEN
   LP_AL2_CLAMP:=1;
END_IF;
(*LP_AL2_RAISE*)
IF PA9 OR PA10 THEN
   LP_AL2_RAISE:=1;
END_IF;
(*MCL_CONTROL*)
IF PP3 THEN
   MCL_CONTROL:=1;
END_IF;
(*PAS_AL2_PLUS*)
IF PPL3 OR PPL4 THEN
   PAS_AL2_PLUS:=1;
END_IF;
(*PAS_AL2_ST_TURN*)
IF PSA1 THEN
   PAS_AL2_ST_TURN:=1;
END_IF;
(*PAS_AL2_TURN*)
IF PPL3 OR PPL4 THEN
   PAS_AL2_TURN:=1;
END_IF;
(*PUWS_AL2_1_LT*)
IF P5 OR P6 THEN
   PUWS_AL2_1_LT:=1;
END_IF;
(*PUWS_AL2_1_PLUS*)
IF PB OR P5 OR P6 THEN
   PUWS_AL2_1_PLUS:=1;
END_IF;
(*PUWS_AL2_B1_PLUS*)
IF PPAL2 OR PP2 THEN
   PUWS_AL2_B1_PLUS:=1;
END_IF;
(*P_AL2_B*)
IF PB2 OR PB23 THEN
   P_AL2_B:=1;
END_IF;
(*P_AL2_L*)
IF PL2 OR PL23 THEN
   P_AL2_L:=1;
END_IF;
(*RC_AL2_G7*)
IF PG THEN
   RC_AL2_G7:=1;
END_IF;
(*RC_AL2_ST*)
IF PSE1 OR PSE2 THEN
   RC_AL2_ST:=1;
END_IF;
(*RP_AL2_CLAMP*)
IF PL8 OR PL9 THEN
   RP_AL2_CLAMP:=1;
END_IF;
(*RP_AL2_ST_CLAMP*)
IF PS2 OR PS3 OR PS4 THEN
   RP_AL2_ST_CLAMP:=1;
END_IF;
(*SB_AL2*)
IF P3 OR P4 OR PB OR P5 OR P6 THEN
   SB_AL2:=1;
END_IF;
(*SB_AL2_B1*)
IF PB5 THEN
   SB_AL2_B1:=1;
END_IF;
(*SB_AL2_B2*)
IF PB6 THEN
   SB_AL2_B2:=1;
END_IF;
(*SB_AL2_B3*)
IF PB7 OR PB78 THEN
   SB_AL2_B3:=1;
END_IF;
(*SB_AL2_L1*)
IF PL5 THEN
   SB_AL2_L1:=1;
END_IF;
(*SB_AL2_L2*)
IF PL6 THEN
   SB_AL2_L2:=1;
END_IF;
(*SB_AL2_L3*)
IF PL7 OR PL78 THEN
   SB_AL2_L3:=1;
END_IF;
(*AL2_BASE*)
IF P1 OR P5 THEN
   AL2_BASE:=0;
END_IF;
(*AL2_EMIT*)
IF PSE2 OR PSE0 THEN
   AL2_EMIT:=0;
END_IF;
(*AL2_GRAB*)
IF PA0 OR PA1 OR PA2 OR PA7 OR PA8 THEN
   AL2_GRAB:=0;
END_IF;
(*AL2_G_SC_LIFT*)
IF PG OR PG1 OR PG5 OR PG6 OR PG7 OR PG8 OR PG9 OR PG10 OR PG11 OR PG12 OR PG13 OR PG17 OR PG18 OR PG19 OR PG20 OR PG21 OR PG22 OR PG23 OR PG24 OR PG25 OR PG26 THEN
   AL2_G_SC_LIFT:=0;
END_IF;
(*AL2_G_SC_LT*)
IF PG OR PG4 OR PG5 OR PG6 OR PG7 OR PG8 OR PG9 OR PG10 OR PG11 OR PG12 OR PG13 OR PG14 OR PG15 OR PG16 OR PG17 OR PG18 OR PG19 OR PG20 OR PG21 OR PG22 OR PG23 OR PG24 OR PG25 OR PG26 THEN
   AL2_G_SC_LT:=0;
END_IF;
(*AL2_G_SC_RT*)
IF PG OR PG1 OR PG2 OR PG3 OR PG4 OR PG5 OR PG6 OR PG7 OR PG8 OR PG9 OR PG10 OR PG11 OR PG12 OR PG13 OR PG14 OR PG15 OR PG19 OR PG20 OR PG21 OR PG22 OR PG23 OR PG24 OR PG25 OR PG26 THEN
   AL2_G_SC_RT:=0;
END_IF;
(*AL2_LID*)
IF P1 OR P6 THEN
   AL2_LID:=0;
END_IF;
(*AL2_ST_GRAB*)
IF PS23 OR PS2 OR PS3 OR PS4 OR PS9 THEN
   AL2_ST_GRAB:=0;
END_IF;
(*CS_AL2_PLUS*)
IF P3 OR P4 THEN
   CS_AL2_PLUS:=0;
END_IF;
(*E_AL2_B1*)
IF PP2 OR PP3 OR PPL3 THEN
   E_AL2_B1:=0;
END_IF;
(*LP_AL2_CLAMP*)
IF PA8 OR PA9 OR PA10 OR PA11 OR PA12 OR PBF4 THEN
   LP_AL2_CLAMP:=0;
END_IF;
(*LP_AL2_RAISE*)
IF PA0 OR PA1 OR PA2 OR PA3 OR PA4 OR PA5 OR PA6 OR PA7 OR PA8 OR PA11 OR PA12 THEN
   LP_AL2_RAISE:=0;
END_IF;
(*MCL_CONTROL*)
IF PP0 OR PPL3 THEN
   MCL_CONTROL:=0;
END_IF;
(*PAS_AL2_PLUS*)
IF PP0 OR PP3 OR PP4 THEN
   PAS_AL2_PLUS:=0;
END_IF;
(*PAS_AL2_ST_TURN*)
IF PSA0 THEN
   PAS_AL2_ST_TURN:=0;
END_IF;
(*PAS_AL2_TURN*)
IF PP0 OR PP3 OR PP4 THEN
   PAS_AL2_TURN:=0;
END_IF;
(*PUWS_AL2_1_LT*)
IF P1 OR P2 OR P3 OR P4 OR PB THEN
   PUWS_AL2_1_LT:=0;
END_IF;
(*PUWS_AL2_1_PLUS*)
IF P1 OR P2 OR P3 OR P4 THEN
   PUWS_AL2_1_PLUS:=0;
END_IF;
(*PUWS_AL2_B1_LEFT*)
IF PPAL2 OR PP2 THEN
   PUWS_AL2_B1_LEFT:=0;
END_IF;
(*P_AL2_B*)
IF P_BASE OR PB1 OR PB3 THEN
   P_AL2_B:=0;
END_IF;
(*P_AL2_L*)
IF P_LID OR PL1 OR PL3 THEN
   P_AL2_L:=0;
END_IF;
(*RC_AL2_G7*)
IF PG1 OR PG2 OR PG3 OR PG4 OR PG5 OR PG6 OR PG7 OR PG8 OR PG9 OR PG10 OR PG11 OR PG12 OR PG13 OR PG14 OR PG15 OR PG16 OR PG17 OR PG18 OR PG19 OR PG20 OR PG21 OR PG22 OR PG23 OR PG24 OR PG25 OR PG26 THEN
   RC_AL2_G7:=0;
END_IF;
(*RC_AL2_ST*)
IF PSE0 THEN
   RC_AL2_ST:=0;
END_IF;
(*RP_AL2_CLAMP*)
IF PA3 OR PA4 OR PLF4 THEN
   RP_AL2_CLAMP:=0;
END_IF;
(*RP_AL2_ST_CLAMP*)
IF PSC OR PS23 THEN
   RP_AL2_ST_CLAMP:=0;
END_IF;
(*SB_AL2*)
IF P1 OR P2 THEN
   SB_AL2:=0;
END_IF;
(*SB_AL2_B1*)
IF PBF1 THEN
   SB_AL2_B1:=0;
END_IF;
(*SB_AL2_B2*)
IF PBF2 THEN
   SB_AL2_B2:=0;
END_IF;
(*SB_AL2_B3*)
IF PBF3 THEN
   SB_AL2_B3:=0;
END_IF;
(*SB_AL2_L1*)
IF PLF1 THEN
   SB_AL2_L1:=0;
END_IF;
(*SB_AL2_L2*)
IF PLF2 THEN
   SB_AL2_L2:=0;
END_IF;
(*SB_AL2_L3*)
IF PLF3 THEN
   SB_AL2_L3:=0;
END_IF;
(*AL2_X_SET*)
IF PA0 THEN
   AL2_X_SET:=210;
END_IF;
(*AL2_X_SET*)
IF PA1 THEN
   AL2_X_SET:=800;
END_IF;
(*AL2_Z_SET*)
IF PA2 THEN
   AL2_Z_SET:=800;
END_IF;
(*AL2_Z_SET*)
IF PA4 THEN
   AL2_Z_SET:=400;
END_IF;
(*AL2_X_SET*)
IF PA5 THEN
   AL2_X_SET:=210;
END_IF;
(*AL2_Z_SET*)
IF PA6 THEN
   AL2_Z_SET:=818;
END_IF;
(*AL2_Z_SET*)
IF PA7 THEN
   AL2_Z_SET:=400;
END_IF;
(*AL2_ST_X_SET*)
IF PS0 THEN
   AL2_ST_X_SET:=0;
END_IF;
(*AL2_ST_Y_SET*)
IF PS3 THEN
   AL2_ST_Y_SET:=360;
END_IF;
(*AL2_ST_Z_SET*)
IF PS4 THEN
   AL2_ST_Z_SET:=800;
END_IF;
(*AL2_ST_Z_SET*)
IF PS6 THEN
   AL2_ST_Z_SET:=410;
END_IF;
(*AL2_ST_X_SET*)
IF PS7 THEN
   AL2_ST_X_SET:=770;
END_IF;
(*AL2_ST_Z_SET*)
IF PS8 THEN
   AL2_ST_Z_SET:=600;
END_IF;
(*AL2_G_SC_TG*)
IF PG THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG1 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG2 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG3 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG4 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG5 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG6 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG7 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG8 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG9 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG10 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG11 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG12 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG13 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG14 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG15 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG16 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG17 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG18 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG19 THEN
   AL2_G_SC_TG:=TG_POS;
END_IF;
(*AL2_G_SC_TG*)
IF PG20 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG21 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG22 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG23 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG24 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG25 THEN
   AL2_G_SC_TG:=55;
END_IF;
(*AL2_G_SC_TG*)
IF PG26 THEN
   AL2_G_SC_TG:=55;
END_IF;


END_PROGRAM


CONFIGURATION config0

    RESOURCE res0 ON PLC
        TASK task0(INTERVAL := T#20ms, PRIORITY := 0);
        TASK task1(INTERVAL := T#20ms, PRIORITY := 0);
        PROGRAM instance0 WITH task0 : program0;
        PROGRAM instance1 WITH task1 : program1;
    END_RESOURCE

END_CONFIGURATION

