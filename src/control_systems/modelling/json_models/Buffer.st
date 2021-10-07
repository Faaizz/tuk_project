
PROGRAM program0



(*=====================================================================*)
(*DECLARATION*)
(*=====================================================================*)

VAR

    
(*INPUTS*)
S_AL1_L1 AT %IX101.3 : BOOL;
S_AL1_L2 AT %IX101.4 : BOOL;
S_AL1_L3 AT %IX101.5 : BOOL;
RP_AL1_CLAMPED AT %IX101.6 : BOOL;
S_AL1_RP AT %IX101.7 : BOOL;
S_AL1_B1 AT %IX100.3 : BOOL;
S_AL1_B2 AT %IX100.4 : BOOL;
S_AL1_B3 AT %IX100.5 : BOOL;
LP_AL1_CLAMPED AT %IX100.6 : BOOL;
S_AL1_LP AT %IX100.7 : BOOL;
SB_AL1_L1 AT %QX100.6 : BOOL;
SB_AL1_L2 AT %QX100.7 : BOOL;
SB_AL1_L3 AT %QX101.0 : BOOL;
RP_AL1_CLAMP AT %QX101.1 : BOOL;
SB_AL1_B1 AT %QX100.1 : BOOL;
SB_AL1_B2 AT %QX100.2 : BOOL;
SB_AL1_B3 AT %QX100.3 : BOOL;
LP_AL1_CLAMP AT %QX100.4 : BOOL;

END_VAR


VAR

(*PLACES*)

PB4 : BOOL := 0;
PBF1 : BOOL := 1;
PB5 : BOOL := 0;
PBF2 : BOOL := 1;
PB6 : BOOL := 0;
PBF3 : BOOL := 1;
PB7 : BOOL := 0;
PB78 : BOOL := 0;
PBF4 : BOOL := 1;
PB8 : BOOL := 0;
PB9 : BOOL := 0;
PL4 : BOOL := 0;
PLF1 : BOOL := 1;
PL5 : BOOL := 0;
PLF2 : BOOL := 1;
PL6 : BOOL := 0;
PLF3 : BOOL := 1;
PL7 : BOOL := 0;
PL78 : BOOL := 0;
PLF4 : BOOL := 1;
PL8 : BOOL := 0;
PL9 : BOOL := 0;
STABLE : BOOL := 0;

END_VAR


VAR

(*INTERNAL VARIABLES*)

timer_1_PL7 : TON;
timer_1_PB7 : TON;

END_VAR

timer_1_PL7(IN:= PL78, PT:= T#1500ms);
timer_1_PB7(IN:= PB78, PT:= T#1500ms);


(*=====================================================================*)
(*TRANSITIONS*)
(*=====================================================================*)

STABLE:=0;
WHILE STABLE=0 DO
   STABLE:=1;
   (*TB4*)
   IF (TRUE AND PBF1) AND ( (S_AL1_B1) ) AND (NOT PB5) THEN
       TRUE:=0;
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
   (*TL4*)
   IF (TRUE AND PLF1) AND ( (S_AL1_L1) ) AND (NOT PL5) THEN
       TRUE:=0;
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
   IF (PL9 AND TRUE) AND ( (TRUE AND NOT FALSE) ) AND (NOT FALSE) THEN
       PL9:=0;
       TRUE:=0;
       FALSE:=1;
       STABLE:=0;
   END_IF;
   (*TA4*)
   IF (TRUE) AND ( (TRUE) ) AND (NOT FALSE AND NOT PLF3 AND NOT PLF4) THEN
       TRUE:=0;
       FALSE:=1;
       PLF3:=1;
       PLF4:=1;
       STABLE:=0;
   END_IF;
   (*TA5*)
   IF (PB9 AND TRUE) AND ( (TRUE) ) AND (NOT FALSE) THEN
       PB9:=0;
       TRUE:=0;
       FALSE:=1;
       STABLE:=0;
   END_IF;
   (*TA12*)
   IF (TRUE) AND ( (TRUE) ) AND (NOT FALSE AND NOT FALSE AND NOT PBF3 AND NOT PBF4) THEN
       TRUE:=0;
       FALSE:=1;
       FALSE:=1;
       PBF3:=1;
       PBF4:=1;
       STABLE:=0;
   END_IF;
END_WHILE;


(*=====================================================================*)
(*OUTPUTS*)
(*=====================================================================*)

(*LP_AL1_CLAMP*)
IF PB8 OR PB9 THEN
   LP_AL1_CLAMP:=1;
END_IF;
(*RP_AL1_CLAMP*)
IF PL8 OR PL9 THEN
   RP_AL1_CLAMP:=1;
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
(*LP_AL1_CLAMP*)
IF PBF4 THEN
   LP_AL1_CLAMP:=0;
END_IF;
(*RP_AL1_CLAMP*)
IF PLF4 THEN
   RP_AL1_CLAMP:=0;
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


END_PROGRAM



CONFIGURATION config0

    RESOURCE res0 ON PLC
        TASK task0(INTERVAL := T#20ms, PRIORITY := 0);
        PROGRAM instance0 WITH task0 : program0;
    END_RESOURCE

END_CONFIGURATION

