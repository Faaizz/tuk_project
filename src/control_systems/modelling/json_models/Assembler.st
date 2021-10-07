
PROGRAM program0



(*=====================================================================*)
(*DECLARATION*)
(*=====================================================================*)

VAR

    
(*INPUTS*)
RP_AL1_CLAMPED AT %IX101.6 : BOOL;
LP_AL1_CLAMPED AT %IX100.6 : BOOL;
AL1_DETECTED AT %IX102.3 : BOOL;
LP_AL1_LIMIT AT %IX102.4 : BOOL;
AL1_X_POS AT %IW101 : WORD;
AL1_Y_POS AT %IW102 : WORD;
AL1_Z_POS AT %IW103 : WORD;
ST_AL1_ST0 AT %IX105.3 : BOOL;
RP_AL1_CLAMP AT %QX101.1 : BOOL;
LP_AL1_CLAMP AT %QX100.4 : BOOL;
AL1_X_SET AT %QW100 : WORD;
AL1_Y_SET AT %QW101 : WORD;
AL1_Z_SET AT %QW102 : WORD;
AL1_GRAB AT %QX101.6 : BOOL;
LP_AL1_RAISE AT %QX101.7 : BOOL;
PAS_AL1_ST_TURN AT %QX103.5 : BOOL;
SB_AL1_B3 AT %QX100.3 : BOOL;
SB_AL1_L3 AT %QX101.0 : BOOL;

END_VAR


VAR

(*PLACES*)

PB9 : BOOL := 1;
PBF3 : BOOL := 0;
PBF4 : BOOL := 0;
PL9 : BOOL := 1;
PLF3 : BOOL := 0;
PLF4 : BOOL := 0;
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
PSA0 : BOOL := 1;
PSA1 : BOOL := 0;
PS1 : BOOL := 0;
STABLE : BOOL := 0;

END_VAR


VAR

(*INTERNAL VARIABLES*)

timer_1_PL9 : TON;
timer_1_PSA1 : TON;

END_VAR

timer_1_PL9(IN:= PL9, PT:= T#300ms);
timer_1_PSA1(IN:= PSA1, PT:= T#5000ms);


(*=====================================================================*)
(*TRANSITIONS*)
(*=====================================================================*)

STABLE:=0;
WHILE STABLE=0 DO
   STABLE:=1;
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
   IF (PA13) AND ( (TRUE) ) AND (NOT PS1) THEN
       PA13:=0;
       PS1:=1;
       STABLE:=0;
   END_IF;
   (*CLEAR*)
   IF (PBF3 AND PBF4 AND PLF3 AND PLF4 AND PS1) AND ( (TRUE) OR (FALSE) ) AND (NOT PB9 AND NOT PL9) THEN
       PBF3:=0;
       PBF4:=0;
       PLF3:=0;
       PLF4:=0;
       PS1:=0;
       PB9:=1;
       PL9:=1;
       STABLE:=0;
   END_IF;
END_WHILE;


(*=====================================================================*)
(*OUTPUTS*)
(*=====================================================================*)

(*AL1_GRAB*)
IF PA3 OR PA4 OR PA5 OR PA6 THEN
   AL1_GRAB:=1;
END_IF;
(*LP_AL1_CLAMP*)
IF PB9 OR PA6 OR PA7 THEN
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
(*RP_AL1_CLAMP*)
IF PL9 THEN
   RP_AL1_CLAMP:=1;
END_IF;
(*AL1_GRAB*)
IF PA0 OR PA1 OR PA2 OR PA7 OR PA8 THEN
   AL1_GRAB:=0;
END_IF;
(*LP_AL1_CLAMP*)
IF PBF4 OR PA8 OR PA9 OR PA10 OR PA11 OR PA12 THEN
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
(*RP_AL1_CLAMP*)
IF PLF4 OR PA3 OR PA4 THEN
   RP_AL1_CLAMP:=0;
END_IF;
(*SB_AL1_B3*)
IF PBF3 THEN
   SB_AL1_B3:=0;
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

