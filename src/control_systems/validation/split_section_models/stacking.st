
PROGRAM program0



(*=====================================================================*)
(*DECLARATION*)
(*=====================================================================*)

VAR


(*INPUTS*)
S_AL1_ST1 AT %IX100.0: BOOL;
S_AL1_ST2 AT %IX100.1: BOOL;
S_AL1_ST3 AT %IX100.2: BOOL;
RP_AL1_ST_CLAMPED AT %IX100.3: BOOL;
AL1_ST_DETECTED AT %IX100.4: BOOL;
RESET AT %IX100.5: BOOL;
AL1_ST_X_POS AT %IW100: WORD;
AL1_ST_Y_POS AT %IW101: WORD;
AL1_ST_Z_POS AT %IW102: WORD;
RUNNING AT %IX100.7: BOOL;
AL1_ST_X_SET AT %QW100: INT;
AL1_ST_Y_SET AT %QW101: INT;
AL1_ST_Z_SET AT %QW102: INT;
RP_AL1_ST_CLAMP AT %QX100.0: BOOL;
AL1_ST_GRAB AT %QX100.1: BOOL;
AL1_EMIT AT %QX100.2: BOOL;
RC_AL1_ST AT %QX100.3: BOOL;

END_VAR


VAR

(*PLACES*)

PA13: BOOL:= 1;
PS0: BOOL:= 1;
PSC: BOOL:= 1;
PS1: BOOL:= 0;
PS2: BOOL:= 0;
PS3: BOOL:= 0;
PS4: BOOL:= 0;
PS5: BOOL:= 0;
PS6: BOOL:= 0;
PS7: BOOL:= 0;
PS8: BOOL:= 0;
PS9: BOOL:= 0;
PS10: BOOL:= 0;
PS11: BOOL:= 0;
PS12: BOOL:= 0;
PSE1: BOOL:= 0;
PSE2: BOOL:= 0;
PSE0: BOOL:= 1;
STABLE: BOOL:= 0;

END_VAR



(*=====================================================================*)
(*TRANSITIONS*)
(*=====================================================================*)

STABLE:=0;
WHILE STABLE=0 DO
   STABLE:=1;
   (*TS1*)
   IF (PA13) AND ( (S_AL1_ST1) ) AND (NOT PS1) THEN
       PA13:=0;
       PS1:=1;
       STABLE:=0;
   END_IF;
   (*TS2*)
   IF (PS0 AND PSC AND PS1) AND ( (S_AL1_ST2) ) AND (NOT PS2) THEN
       PS0:=0;
       PSC:=0;
       PS1:=0;
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
   IF (PS4) AND ( ((AL1_ST_Z_POS>730) AND (AL1_ST_Z_POS<770)) ) AND (NOT PSC AND NOT PS5) THEN
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
   IF (PS7) AND ( ((AL1_ST_X_POS>840) AND (AL1_ST_X_POS<880)) ) AND (NOT PS8) THEN
       PS7:=0;
       PS8:=1;
       STABLE:=0;
   END_IF;
   (*TS9*)
   IF (PS8) AND ( ((AL1_ST_Z_POS>580) AND (AL1_ST_Z_POS<620)) ) AND (NOT PS9) THEN
       PS8:=0;
       PS9:=1;
       STABLE:=0;
   END_IF;
   (*TS10*)
   IF (PS9) AND ( (NOT AL1_ST_DETECTED) ) AND (NOT PS0 AND NOT PS10 AND NOT PA13) THEN
       PS9:=0;
       PS0:=1;
       PS10:=1;
       PA13:=1;
       STABLE:=0;
   END_IF;
   (*TS11*)
   IF (PS9) AND ( (NOT AL1_ST_DETECTED) ) AND (NOT PS0 AND NOT PS11 AND NOT PA13) THEN
       PS9:=0;
       PS0:=1;
       PS11:=1;
       PA13:=1;
       STABLE:=0;
   END_IF;
   (*TS12*)
   IF (PS9) AND ( (NOT AL1_ST_DETECTED) ) AND (NOT PS0 AND NOT PS12 AND NOT PA13) THEN
       PS9:=0;
       PS0:=1;
       PS12:=1;
       PA13:=1;
       STABLE:=0;
   END_IF;
   (*TS13*)
   IF (PS10 AND PS11 AND PS12) AND ( (TRUE) ) AND (NOT PSE1) THEN
       PS10:=0;
       PS11:=0;
       PS12:=0;
       PSE1:=1;
       STABLE:=0;
   END_IF;
   (*TSE1*)
   IF (PSE1) AND ( (NOT S_AL1_ST3) ) AND (NOT PSE2) THEN
       PSE1:=0;
       PSE2:=1;
       STABLE:=0;
   END_IF;
   (*TSE2*)
   IF (PSE1) AND ( (S_AL1_ST3) ) AND (NOT PSE0) THEN
       PSE1:=0;
       PSE0:=1;
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
IF PS2 OR PS3 OR PS4 OR PS9 THEN
   AL1_ST_GRAB:=0;
END_IF;
(*RC_AL1_ST*)
IF PSE0 THEN
   RC_AL1_ST:=0;
END_IF;
(*RP_AL1_ST_CLAMP*)
IF PSC THEN
   RP_AL1_ST_CLAMP:=0;
END_IF;
(*AL1_ST_X_SET*)
IF PS7 THEN
   AL1_ST_X_SET:=860;
END_IF;
(*AL1_ST_Y_SET*)
IF PS3 THEN
   AL1_ST_Y_SET:=560;
END_IF;
(*AL1_ST_Z_SET*)
IF PS6 THEN
   AL1_ST_Z_SET:=410;
END_IF;
(*AL1_Z_SET*)
IF PS8 THEN
   AL1_Z_SET:=600;
END_IF;


END_PROGRAM



CONFIGURATION config0

    RESOURCE res0 ON PLC
        TASK task0(INTERVAL := T#20ms, PRIORITY := 0);
        PROGRAM instance0 WITH task0 : program0;
    END_RESOURCE

END_CONFIGURATION

