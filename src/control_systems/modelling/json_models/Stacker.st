
PROGRAM program0



(*=====================================================================*)
(*DECLARATION*)
(*=====================================================================*)

VAR

    
(*INPUTS*)
ST_AL1_ST1 AT %IX104.0 : BOOL;
ST_AL1_ST2 AT %IX104.1 : BOOL;
ST_AL1_ST3 AT %IX104.2 : BOOL;
RP_AL1_ST_CLAMPED AT %IX104.3 : BOOL;
AL1_ST_DETECTED AT %IX104.4 : BOOL;
AL1_ST_X_POS AT %IW104 : WORD;
AL1_ST_Y_POS AT %IW105 : WORD;
AL1_ST_Z_POS AT %IW106 : WORD;
AL1_ST_X_SET AT %QW103 : WORD;
AL1_ST_Y_SET AT %QW104 : WORD;
AL1_ST_Z_SET AT %QW105 : WORD;
RP_AL1_ST_CLAMP AT %QX102.5 : BOOL;
AL1_ST_GRAB AT %QX102.6 : BOOL;
RC_AL1_ST AT %QX103.0 : BOOL;
AL1_EMIT AT %QX102.7 : BOOL;

END_VAR


VAR

(*PLACES*)

PA13 : BOOL := 1;
PSA0 : BOOL := 0;
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
STABLE : BOOL := 0;

END_VAR


VAR

(*INTERNAL VARIABLES*)

timer_1_PS23 : TON;

END_VAR

timer_1_PS23(IN:= PS23, PT:= T#1500ms);


(*=====================================================================*)
(*TRANSITIONS*)
(*=====================================================================*)

STABLE:=0;
WHILE STABLE=0 DO
   STABLE:=1;
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
   (*GENERIC_POST*)
   IF (PG0) AND ( (TRUE AND NOT FALSE) ) AND (NOT FALSE) THEN
       PG0:=0;
       FALSE:=1;
       STABLE:=0;
   END_IF;
   (*GENERIC_PRE*)
   IF (TRUE) AND ( (TRUE AND NOT FALSE) ) AND (NOT PA13) THEN
       TRUE:=0;
       PA13:=1;
       STABLE:=0;
   END_IF;
END_WHILE;


(*=====================================================================*)
(*OUTPUTS*)
(*=====================================================================*)

(*AL1_EMIT*)
IF PSE1 THEN
   AL1_EMIT:=1;
END_IF;
(*AL1_ST_GRAB*)
IF PS5 OR PS6 OR PS7 OR PS8 THEN
   AL1_ST_GRAB:=1;
END_IF;
(*PAS_AL1_ST_TURN*)
IF PSA1 THEN
   PAS_AL1_ST_TURN:=1;
END_IF;
(*RC_AL1_ST*)
IF PSE1 OR PSE2 THEN
   RC_AL1_ST:=1;
END_IF;
(*RP_AL1_ST_CLAMP*)
IF PS2 OR PS3 OR PS4 THEN
   RP_AL1_ST_CLAMP:=1;
END_IF;
(*AL1_EMIT*)
IF PSE2 OR PSE0 THEN
   AL1_EMIT:=0;
END_IF;
(*AL1_ST_GRAB*)
IF PS23 OR PS2 OR PS3 OR PS4 OR PS9 THEN
   AL1_ST_GRAB:=0;
END_IF;
(*PAS_AL1_ST_TURN*)
IF PSA0 THEN
   PAS_AL1_ST_TURN:=0;
END_IF;
(*RC_AL1_ST*)
IF PSE0 THEN
   RC_AL1_ST:=0;
END_IF;
(*RP_AL1_ST_CLAMP*)
IF PSC OR PS23 THEN
   RP_AL1_ST_CLAMP:=0;
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


END_PROGRAM



CONFIGURATION config0

    RESOURCE res0 ON PLC
        TASK task0(INTERVAL := T#20ms, PRIORITY := 0);
        PROGRAM instance0 WITH task0 : program0;
    END_RESOURCE

END_CONFIGURATION

