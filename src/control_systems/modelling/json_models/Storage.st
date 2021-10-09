
PROGRAM program0



(*=====================================================================*)
(*DECLARATION*)
(*=====================================================================*)

VAR

    
(*INPUTS*)
AL1_G_S1 AT %IX104.5 : BOOL;
AL1_G_SC_LL AT %IX104.6 : BOOL;
AL1_G_SC_MZ AT %IX104.7 : BOOL;
AL1_G_SC_ML AT %IX105.0 : BOOL;
AL1_G_SC_MX AT %IX105.1 : BOOL;
AL1_G_SC_RL AT %IX105.2 : BOOL;
RC_AL1_G7 AT %QX103.1 : BOOL;
AL1_G_SC_LT AT %QX103.2 : BOOL;
AL1_G_SC_LIFT AT %QX103.3 : BOOL;
AL1_G_SC_RT AT %QX103.4 : BOOL;
AL1_G_SC_TG AT %QW106 : INT;

END_VAR


VAR

(*PLACES*)

PG0 : BOOL := 1;
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

TG_POS : INT;
placeCtr : CTU;

END_VAR

TG_POS:=placeCtr.CV+10;
placeCtr(CU:= PG, R:= 0, PV:= 54);


(*=====================================================================*)
(*TRANSITIONS*)
(*=====================================================================*)

STABLE:=0;
WHILE STABLE=0 DO
   STABLE:=1;
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
   (*GENERIC_PRE*)
   IF (TRUE) AND ( (TRUE AND NOT FALSE) ) AND (NOT PG0) THEN
       TRUE:=0;
       PG0:=1;
       STABLE:=0;
   END_IF;
END_WHILE;


(*=====================================================================*)
(*OUTPUTS*)
(*=====================================================================*)

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
(*RC_AL1_G7*)
IF PG THEN
   RC_AL1_G7:=1;
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
(*RC_AL1_G7*)
IF PG1 OR PG2 OR PG3 OR PG4 OR PG5 OR PG6 OR PG7 OR PG8 OR PG9 OR PG10 OR PG11 OR PG12 OR PG13 OR PG14 OR PG15 OR PG16 OR PG17 OR PG18 OR PG19 OR PG20 OR PG21 OR PG22 OR PG23 OR PG24 OR PG25 OR PG26 THEN
   RC_AL1_G7:=0;
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



CONFIGURATION config0

    RESOURCE res0 ON PLC
        TASK task0(INTERVAL := T#20ms, PRIORITY := 0);
        PROGRAM instance0 WITH task0 : program0;
    END_RESOURCE

END_CONFIGURATION

