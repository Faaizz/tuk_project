(****************************************************************************************************************************)
(* SORTING FUNCTION BLOCK *)
(****************************************************************************************************************************)

FUNCTION_BLOCK sorting
  (*==========================================================================================*)
  (* INPUTS AND OUTPUTS *)
  (*==========================================================================================*)

  (* INPUT *)
  (*------------------------------------------------------------*)
  VAR_INPUT
    S_AL1: BOOL; 
    S_BIN_1: BOOL;
    S_AL1_BL: BOOL;
    CS_AL1_W: INT;
    RUNNING: BOOL;
  END_VAR 

  (* OUTPUT *)
  (*------------------------------------------------------------*)
  VAR_OUTPUT
    SB_AL1: BOOL;
    PUWS_AL1_1_PLUS: BOOL;
    PUWS_AL1_1_RT: BOOL;
    CS_AL1_PLUS: BOOL;
  END_VAR
  
  (* PLACES *)
  (*------------------------------------------------------------*)
  VAR_EXTERNAL
    P0: BOOL;
    P1: BOOL;
    P2: BOOL;
    P3: BOOL;
    P4: BOOL;
    PB: BOOL;
    P5: BOOL;
    P6: BOOL;
    BIN1: BOOL;
    BIN2: BOOL;
    P_LID: BOOL;
    P_BASE: BOOL;
    STABLE: BOOL;
  END_VAR


  (* OTHERS *)
  (*------------------------------------------------------------*)
  VAR
    timer_1_P2 : TON;
    timer_1_P3 : TON;
  END_VAR

  timer_1_P2(IN:= P2, PT:= T#1000ms);
  timer_1_P3(IN:= P3, PT:= T#1000ms);

  STABLE:= 0;


  IF NOT RUNNING THEN
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
    P_LID:= 0;
    P_BASE:= 0;
  END_IF;

  P0:= 1;

  (*==========================================================================================*)
  (* TRANSITIONS *)
  (*==========================================================================================*)
  WHILE STABLE= 0 DO
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
    IF PB AND BIN1 AND S_BIN_1 AND NOT BIN2 AND NOT P1 THEN
      PB:= 0;
      BIN1:= 0;
      BIN2:= 1;
      P1:= 1;
      STABLE:= 0;
    END_IF;

    (*TB21*)
    IF BIN2 AND NOT S_BIN_1 AND NOT BIN1 THEN
      BIN2:= 0;
      BIN1:= 1;
      STABLE:= 0;
    END_IF;

    (*T45*)
    IF P4 AND ( (CS_AL1_W > 200) AND (CS_AL1_W <= 300) ) AND NOT P5 THEN
      P4:= 0;
      P5:= 1;
      STABLE:= 0;
    END_IF;

    (*T46*)
    IF P4 AND ( (CS_AL1_W > 300) AND (CS_AL1_W <= 400) ) AND NOT P6 THEN
      P4:= 0;
      P6:= 1;
      STABLE:= 0;
    END_IF;

    (*T57*)
    IF P5 AND S_AL1_BL AND NOT P_LID AND NOT P1 THEN
      P5:= 0;
      P_LID:= 1;
      P1:= 1;
      STABLE:= 0;
    END_IF;

    (*T67*)
    IF P6 AND S_AL1_BL AND NOT P_BASE AND NOT P1 THEN
      P6:= 0;
      P_BASE:= 1;
      P1:= 1;
      STABLE:= 0;
    END_IF;

  END_WHILE;


  (*==========================================================================================*)
  (* OUTPUTS *)
  (*==========================================================================================*)
  (*SET SB_AL1*)
  IF P3 OR P4 OR PB OR P5 OR P6 THEN
    SB_AL1:= 1;
  END_IF;
  (*RESET SB_AL1*)
  IF P1 OR P2 THEN
    SB_AL1:= 0;
  END_IF;

  (*SET PUWS_AL1_1_PLUS*)
  IF PB OR P5 OR P6 THEN
    PUWS_AL1_1_PLUS:= 1;
  END_IF;

  (*RESET PUWS_AL1_1_PLUS*)
  IF P1 OR P2 OR P3 OR P4 THEN
    PUWS_AL1_1_PLUS:= 0;
  END_IF;

  (*SET PUWS_AL1_1_RT*)
  IF P5 OR P6 THEN
    PUWS_AL1_1_RT:= 1;
  END_IF;

  (*RESET PUWS_AL1_1_RT*)
  IF P1 OR P2 OR P3 OR P4 OR PB THEN
    PUWS_AL1_1_RT:= 0;
  END_IF;

  (*SET CS_AL1_PLUS*)
  IF P1 OR P2 OR P5 OR P6 OR PB THEN
    CS_AL1_PLUS:= 1;
  END_IF;

  (*RESET CS_AL1_PLUS*)
  IF P3 OR P4 THEN
    CS_AL1_PLUS:= 0;
  END_IF;

  
END_FUNCTION_BLOCK



(****************************************************************************************************************************)
(* BASE BUFFER FUNCTION BLOCK *)
(****************************************************************************************************************************)

FUNCTION_BLOCK base_buffer
  (*==========================================================================================*)
  (* INPUTS AND OUTPUTS *)
  (*==========================================================================================*)

  (* INPUT *)
  (*------------------------------------------------------------*)
  VAR_INPUT
    S_AL1_B: BOOL; 
    P_AL1_B_FT: BOOL;
    P_AL1_B_BK: BOOL;
    S_AL1_B1: BOOL;
    S_AL1_B2: BOOL;
    S_AL1_B3 : BOOL;
    LP_AL1_CLAMPED: BOOL;
    S_AL1_LP: BOOL;
    RUNNING: BOOL;
  END_VAR 


  (* OUTPUT *)
  (*------------------------------------------------------------*)
  VAR_OUTPUT
    P_AL1_B: BOOL;
    SB_AL1_B1 : BOOL;
    SB_AL1_B2 : BOOL;
    SB_AL1_B3 : BOOL;
    LP_AL1_CLAMP : BOOL;
    STABLE: BOOL;
  END_VAR

  
  (* PLACES *)
  (*------------------------------------------------------------*)
  VAR_EXTERNAL
    P_BASE : BOOL;
    PB1 : BOOL;
    PUSH_B : BOOL;
    PB2 : BOOL;
    PB23 : BOOL;
    PB3 : BOOL;
    PB4 : BOOL;
    PB5 : BOOL;
    PB6 : BOOL;
    PB7 : BOOL;
    PB8 : BOOL;
    PB9 : BOOL;
    PBF1 : BOOL;
    PBF2 : BOOL;
    PBF3 : BOOL;
    PBF4 : BOOL;
  END_VAR


  (* OTHERS *)
  (*------------------------------------------------------------*)
  VAR
    timer_1_TB1 : TON;
  END_VAR

  timer_1_TB1(IN:= PB1, PT:= T#900ms);

  STABLE:= 0;

  IF NOT RUNNING THEN
    P_BASE:= 0;
    PB1:= 0;
    PUSH_B:= 1;
    PB2:= 0;
    PB23:= 0;
    PB3:= 0;
    PB4:= 0;
    PB5:= 0;
    PB6:= 0;
    PB7:= 0;
    PB8:= 0;
    PB9:=0;
    PBF1:=1;
    PBF2:=1;
    PBF3:=1;
    PBF4:=1;
    
    
  END_IF;

  (*==========================================================================================*)
  (* TRANSITIONS *)
  (*==========================================================================================*)
  WHILE STABLE= 0 DO
    STABLE:= 1;
    
    (*TB0*)
    IF P_BASE AND S_AL1_B AND NOT PB1 THEN
      P_BASE:=0;
      PB1:=1;
      STABLE:=0;
    END_IF;
    
    (*TB1*)
    IF PB1 AND PUSH_B AND timer_1_TB1.Q AND NOT PB2 THEN
      PB1:=0;
      PUSH_B:=0;
      PB2:=1;
      STABLE:=0;
    END_IF;
    
    (*TB23*)
    IF PB2 AND P_AL1_B_FT AND NOT PB23 THEN
      PB2:=0;
      PB23:=1;
      STABLE:=0;
    END_IF;
    
    (*TB2*)
    IF PB23 AND P_AL1_B_FT AND NOT PB3 THEN
      PB23:=0;
      PB3:=1;
      STABLE:=0;
    END_IF;
    
    (*TB3*)
    IF PB3 AND P_AL1_B_BK AND NOT PB4 AND NOT PUSH_B THEN
      PB3:=0;
      PB4:=1;
      PUSH_B:=1;
      STABLE:=0;
    END_IF;
    
    (*TB4*)
    IF PB4 AND PBF1 AND S_AL1_B1 AND NOT PB5 THEN 
      PB4:=0;
      PBF1:=0;
      PB5:=1;
      STABLE:=0;
    END_IF;
    
    (*TB5*)
    IF PB5 AND PBF2 AND S_AL1_B2 AND NOT PB6 AND NOT PBF1 THEN
      PB5:=0;
      PBF2:=0;
      PB6:=1;
      PBF1:=1;
      STABLE:=0;
    END_IF; 
    
    (*TB6*)
    IF PB6 AND PBF3 AND S_AL1_B3 AND  NOT PB7 AND NOT PBF2 THEN 
      PB6:=0;
      PBF3:=0;
      PB7:=1;
      PBF2:=1;
      STABLE:=0;
    END_IF;
    
    (*TB7*)
    IF PB7 AND PBF4 AND S_AL1_LP AND NOT PB8 THEN
      PB7:=0;
      PBF4:=0;
      PB8:=1;
      STABLE:=0;
    END_IF;
    
    (*TB8*)
    IF PB8 AND LP_AL1_CLAMPED AND NOT PB9 THEN
      PB8:=0;
      PB9:=1;
      STABLE:=0;
    END_IF;
    
    (*TB9*)
    IF PB9 AND NOT LP_AL1_CLAMPED AND NOT PBF3 AND NOT PBF4 THEN
      PB9:=0;
      PBF3:=1;
      PBF4:=1;
      STABLE:=0;
    END_IF;

  END_WHILE;


  (*==========================================================================================*)
  (* OUTPUTS *)
  (*==========================================================================================*)
  (*P_AL1_B*)
  IF PB2 OR PB23 THEN 
    P_AL1_B:=1;
  END_IF;
  IF P_BASE OR PB1 OR PB3 THEN
    P_AL1_B:=0;
  END_IF;

  (*SB_AL1_B1*)
  IF PB5 THEN
    SB_AL1_B1:=1;
  END_IF;
  IF PBF1 THEN
    SB_AL1_B1:=0;
  END_IF;

  (*SB_AL1_B2*)
  IF PB6 THEN
    SB_AL1_B2:=1;
  END_IF;
  IF PBF2 THEN 
    SB_AL1_B2:=0;
  END_IF;

  (*SB_AL1_B3*)
  IF PB7 THEN
    SB_AL1_B3:=1;
  END_IF;
  IF PBF3 THEN
    SB_AL1_B3:=0;
  END_IF;

  (*LP_AL1_CLAMP*)
  IF PB8 OR PB9 THEN
    LP_AL1_CLAMP:=1;
  END_IF;
  IF PBF4 THEN
    LP_AL1_CLAMP:=0;
  END_IF;  


END_FUNCTION_BLOCK



(****************************************************************************************************************************)
(* LID BUFFER FUNCTION BLOCK *)
(****************************************************************************************************************************)

FUNCTION_BLOCK lid_buffer
  (*==========================================================================================*)
  (* INPUTS AND OUTPUTS *)
  (*==========================================================================================*)

  (* INPUT *)
  (*------------------------------------------------------------*)
  VAR_INPUT
    S_AL1_L: BOOL; 
    P_AL1_L_FT: BOOL;
    P_AL1_L_BK: BOOL;
    S_AL1_L1: BOOL;
    S_AL1_L2: BOOL;
    S_AL1_L3 : BOOL;
    RP_AL1_CLAMPED: BOOL;
    S_AL1_RP: BOOL;
    RUNNING: BOOL;
  END_VAR 


  (* OUTPUT *)
  (*------------------------------------------------------------*)
  VAR_OUTPUT
    P_AL1_L: BOOL;
    SB_AL1_L1 : BOOL;
    SB_AL1_L2 : BOOL;
    SB_AL1_L3 : BOOL;
    RP_AL1_CLAMP : BOOL;
    STABLE: BOOL;
  END_VAR

  
  (* PLACES *)
  (*------------------------------------------------------------*)
  VAR_EXTERNAL
    P_LID : BOOL;
    PL1 : BOOL;
    PUSH_L : BOOL;
    PL2 : BOOL;
    PL23 : BOOL;
    PL3 : BOOL;
    PL4 : BOOL;
    PL5 : BOOL;
    PL6 : BOOL;
    PL7 : BOOL;
    PL8 : BOOL;
    PL9 : BOOL;
    PLF1 : BOOL;
    PLF2 : BOOL;
    PLF3 : BOOL;
    PLF4 : BOOL;
  END_VAR


  (* OTHERS *)
  (*------------------------------------------------------------*)
  VAR
    timer_1_TL1 : TON;
  END_VAR

  timer_1_TL1(IN:= PL1, PT:= T#900ms);

  STABLE:= 0;

  IF NOT RUNNING THEN
    P_LID:= 0;
    PL1:= 0;
    PUSH_L:= 1;
    PL2:= 0;
    PL23:= 0;
    PL3:= 0;
    PL4:= 0;
    PL5:= 0;
    PL6:= 0;
    PL7:= 0;
    PL8:= 0;
    PL9:=0;
    PLF1:=1;
    PLF2:=1;
    PLF3:=1;
    PLF4:=1;
    
    
  END_IF;

  (*==========================================================================================*)
  (* TRANSITIONS *)
  (*==========================================================================================*)
  WHILE STABLE= 0 DO
    STABLE:= 1;
    
    (*TB0*)
    IF P_LID AND S_AL1_L AND NOT PL1 THEN
      P_LID:=0;
      PL1:=1;
      STABLE:=0;
    END_IF;
    
    (*TB1*)
    IF PL1 AND PUSH_L AND timer_1_TL1.Q AND NOT PL2 THEN
      PL1:=0;
      PUSH_L:=0;
      PL2:=1;
      STABLE:=0;
    END_IF;
    
    (*TB23*)
    IF PL2 AND P_AL1_L_FT AND NOT PL23 THEN
      PL2:=0;
      PL23:=1;
      STABLE:=0;
    END_IF;
    
    (*TB2*)
    IF PL23 AND P_AL1_L_FT AND NOT PL3 THEN
      PL23:=0;
      PL3:=1;
      STABLE:=0;
    END_IF;
    
    (*TB3*)
    IF PL3 AND P_AL1_L_BK AND NOT PL4 AND NOT PUSH_L THEN
      PL3:=0;
      PL4:=1;
      PUSH_L:=1;
      STABLE:=0;
    END_IF;
    
    (*TB4*)
    IF PL4 AND PLF1 AND S_AL1_L1 AND NOT PL5 THEN 
      PL4:=0;
      PLF1:=0;
      PL5:=1;
      STABLE:=0;
    END_IF;
    
    (*TB5*)
    IF PL5 AND PLF2 AND S_AL1_L2 AND NOT PL6 AND NOT PLF1 THEN
      PL5:=0;
      PLF2:=0;
      PL6:=1;
      PLF1:=1;
      STABLE:=0;
    END_IF; 
    
    (*TB6*)
    IF PL6 AND PLF3 AND S_AL1_L3 AND  NOT PL7 AND NOT PLF2 THEN 
      PL6:=0;
      PLF3:=0;
      PL7:=1;
      PLF2:=1;
      STABLE:=0;
    END_IF;
    
    (*TB7*)
    IF PL7 AND PLF4 AND S_AL1_RP AND NOT PL8 THEN
      PL7:=0;
      PLF4:=0;
      PL8:=1;
      STABLE:=0;
    END_IF;
    
    (*TB8*)
    IF PL8 AND RP_AL1_CLAMPED AND NOT PL9 THEN
      PL8:=0;
      PL9:=1;
      STABLE:=0;
    END_IF;
    
    (*TB9*)
    IF PL9 AND NOT RP_AL1_CLAMPED AND NOT PLF3 AND NOT PLF4 THEN
      PL9:=0;
      PLF3:=1;
      PLF4:=1;
      STABLE:=0;
    END_IF;

  END_WHILE;


  (*==========================================================================================*)
  (* OUTPUTS *)
  (*==========================================================================================*)
  (*P_AL1_L*)
  IF PL2 OR PL23 THEN 
    P_AL1_L:=1;
  END_IF;
  IF P_LID OR PL1 OR PL3 THEN
    P_AL1_L:=0;
  END_IF;

  (*SB_AL1_L1*)
  IF PL5 THEN
    SB_AL1_L1:=1;
  END_IF;
  IF PLF1 THEN
    SB_AL1_L1:=0;
  END_IF;

  (*SB_AL1_L2*)
  IF PL6 THEN
    SB_AL1_L2:=1;
  END_IF;
  IF PLF2 THEN 
    SB_AL1_L2:=0;
  END_IF;

  (*SB_AL1_L3*)
  IF PL7 THEN
    SB_AL1_L3:=1;
  END_IF;
  IF PLF3 THEN
    SB_AL1_L3:=0;
  END_IF;

  (*RP_AL1_CLAMP*)
  IF PL8 OR PL9 THEN
    RP_AL1_CLAMP:=1;
  END_IF;
  IF PLF4 THEN
    RP_AL1_CLAMP:=0;
  END_IF;  

END_FUNCTION_BLOCK



(****************************************************************************************************************************)
(* MAIN PROGRAM *)
(****************************************************************************************************************************)

PROGRAM sorting_buffer


  (****************************************************************************************************************************)
  (* VARIABLE DECLARATION *)
  (****************************************************************************************************************************)



  (*==========================================================================================*)
  (* INPUTS AND OUTPUTS *)
  (*==========================================================================================*)


  (* SORTING *)
  (*------------------------------------------------------------*)
  VAR
    (* INPUTS *)
    S_AL1 AT %IX102.0 : BOOL;
    S_BIN_1 AT %IX102.1 : BOOL;
    S_AL1_BL AT %IX102.2 : BOOL;
    CS_AL1_W AT %IW100 : INT;

    (* OUTPUTS *)
    SB_AL1 AT %QX102.0 : BOOL;
    PUWS_AL1_1_PLUS AT %QX102.1 : BOOL;
    PUWS_AL1_1_RT AT %QX102.2 : BOOL;
    CS_AL1_PLUS AT %QX102.3 : BOOL;
  END_VAR


  (* BUFFER *)
  (*------------------------------------------------------------*)
  VAR
    (* INPUTS *)
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

    (* OUTPUTS *)
    P_AL1_B AT %QX100.0 : BOOL;
    SB_AL1_B1 AT %QX100.1 : BOOL;
    SB_AL1_B2 AT %QX100.2 : BOOL;
    SB_AL1_B3 AT %QX100.3 : BOOL;
    LP_AL1_CLAMP AT %QX100.4 : BOOL;
    P_AL1_L AT %QX101.0 : BOOL;
    SB_AL1_L1 AT %QX101.1 : BOOL;
    SB_AL1_L2 AT %QX101.2 : BOOL;
    SB_AL1_L3 AT %QX101.3 : BOOL;
    RP_AL1_CLAMP AT %QX101.4 : BOOL;

  END_VAR

  (* OTHERS *)
  (*------------------------------------------------------------*)
  VAR    
    (* RUNNING *)
    RUNNING AT %IX102.7 : BOOL;
  END_VAR

  (*==========================================================================================*)
  (* PLACES *)
  (*==========================================================================================*)


  (* SORTING *)
  (*------------------------------------------------------------*)
  VAR_EXTERNAL
    P0: BOOL;
    P1: BOOL;
    P2: BOOL;
    P3: BOOL;
    P4: BOOL;
    PB: BOOL;
    P5: BOOL;
    P6: BOOL;
    BIN1: BOOL;
    BIN2: BOOL;
    P_LID: BOOL;
    P_BASE: BOOL;
  END_VAR

  (* BUFFER *)
  (*------------------------------------------------------------*)
  VAR_EXTERNAL
    PB1: BOOL;
    PUSH_B: BOOL;
    PB2: BOOL;
    PB23: BOOL;
    PB3: BOOL;
    PB4: BOOL;
    PB5: BOOL;
    PB6: BOOL;
    PB7: BOOL;
    PB8: BOOL;
    PB9: BOOL;
    PBF1: BOOL;
    PBF2: BOOL;
    PBF3: BOOL;
    PBF4: BOOL;
    PL1: BOOL;
    PL2: BOOL;
    PUSH_L: BOOL;
    PL23: BOOL;
    PL3: BOOL;
    PL4: BOOL;
    PL5: BOOL;
    PL6: BOOL;
    PL7: BOOL;
    PL8: BOOL;
    PL9: BOOL;
    PLF1: BOOL;
    PLF2: BOOL;
    PLF3: BOOL;
    PLF4: BOOL;
  END_VAR


  (*==========================================================================================*)
  (* OTHERS *)
  (*==========================================================================================*)
  VAR_EXTERNAL
    STABLE: BOOL;
  END_VAR



  (****************************************************************************************************************************)
  (* VARIABLE INITIALIZATION *)
  (****************************************************************************************************************************)



  (*==========================================================================================*)
  (* FUNTION BLOCKS *)
  (*==========================================================================================*)
  VAR
    sorting0: sorting;
    base_buffer0: base_buffer;
    lid_buffer0: lid_buffer;
  END_VAR



  (*==========================================================================================*)
  (* PLACES *)
  (*==========================================================================================*)


  (* SORTING *)
  (*------------------------------------------------------------*)





  (****************************************************************************************************************************)
  (* FUNCTION BLOCKS *)
  (****************************************************************************************************************************)
  


  (* SORTING *)
  (*------------------------------------------------------------*)
  sorting0(
    S_AL1:=S_AL1, S_BIN_1:=S_BIN_1, S_AL1_BL:=S_AL1_BL, 
    CS_AL1_W:=CS_AL1_W, RUNNING:=RUNNING,

    SB_AL1=>SB_AL1, PUWS_AL1_1_PLUS=>PUWS_AL1_1_PLUS, 
    PUWS_AL1_1_RT=>PUWS_AL1_1_RT, CS_AL1_PLUS=>CS_AL1_PLUS
  );


  (* BASE BUFFER *)
  (*------------------------------------------------------------*)
  base_buffer0(
    S_AL1_B:=S_AL1_B, P_AL1_B_FT:=P_AL1_B_FT, P_AL1_B_BK:=P_AL1_B_BK,
    S_AL1_B1:=S_AL1_B1, S_AL1_B2:=S_AL1_B2, S_AL1_B3:=S_AL1_B3,
    S_AL1_LP:=S_AL1_LP, LP_AL1_CLAMPED:=LP_AL1_CLAMPED, RUNNING:=RUNNING,

    P_AL1_B=>P_AL1_B, SB_AL1_B1=>SB_AL1_B1, SB_AL1_B2=>SB_AL1_B2, 
    SB_AL1_B3=>SB_AL1_B3, LP_AL1_CLAMP=>LP_AL1_CLAMP
  );


  (* LID BUFFER *)
  (*------------------------------------------------------------*)
  lid_buffer0(
    S_AL1_L:=S_AL1_L, P_AL1_L_FT:=P_AL1_L_FT, P_AL1_L_BK:=P_AL1_L_BK,
    S_AL1_L1:=S_AL1_L1, S_AL1_L2:=S_AL1_L2, S_AL1_L3:=S_AL1_L3,
    S_AL1_RP:=S_AL1_RP, RP_AL1_CLAMPED:=RP_AL1_CLAMPED, RUNNING:=RUNNING,

    P_AL1_L=>P_AL1_L, SB_AL1_L1=>SB_AL1_L1, SB_AL1_L2=>SB_AL1_L2, 
    SB_AL1_L3=>SB_AL1_L3, RP_AL1_CLAMP=>RP_AL1_CLAMP
  );



END_PROGRAM


CONFIGURATION Config0

  (*==========================================================================================*)
  (* PLACES *)
  (*==========================================================================================*)


  (* SORTING *)
  (*------------------------------------------------------------*)
  VAR_GLOBAL
    P0 AT %QX103.0 : BOOL;
    P1 AT %QX103.1 : BOOL;
    P2 AT %QX103.2 : BOOL;
    P3 AT %QX103.3 : BOOL;
    P4 AT %QX103.4 : BOOL;
    PB AT %QX103.5 : BOOL;
    P5 AT %QX103.6 : BOOL;
    P6 AT %QX103.7 : BOOL;
    BIN1 AT %QX104.0 : BOOL;
    BIN2 AT %QX104.1 : BOOL;
    P_LID AT %QX104.2 : BOOL;
    P_BASE AT %QX104.3 : BOOL;
  END_VAR

  (* BUFFER *)
  (*------------------------------------------------------------*)
  VAR_GLOBAL
    PB1 AT %QX104.4 : BOOL;
    PUSH_B AT %QX104.5 : BOOL;
    PB2 AT %QX104.6 : BOOL;
    PB23 AT %QX104.7 : BOOL;
    PB3 AT %QX105.0 : BOOL;
    PB4 AT %QX105.1 : BOOL;
    PB5 AT %QX105.2 : BOOL;
    PB6 AT %QX3.0 : BOOL;
    PB7 AT %QX3.1 : BOOL;
    PB8 AT %QX3.2 : BOOL;
    PB9 AT %QX3.3 : BOOL;
    PBF1 AT %QX3.4 : BOOL;
    PBF2 AT %QX3.5 : BOOL;
    PBF3 AT %QX3.6 : BOOL;
    PBF4 AT %QX3.7 : BOOL;
    PL1 AT %QX4.1 : BOOL;
    PL2 AT %QX4.2 : BOOL;
    PUSH_L AT %QX4.3 : BOOL;
    PL23 AT %QX4.4 : BOOL;
    PL3 AT %QX4.5 : BOOL;
    PL4 AT %QX4.6 : BOOL;
    PL5 AT %QX4.7 : BOOL;
    PL6 AT %QX5.0 : BOOL;
    PL7 AT %QX5.1 : BOOL;
    PL8 AT %QX5.2 : BOOL;
    PL9 AT %QX5.3 : BOOL;
    PLF1 AT %QX5.4 : BOOL;
    PLF2 AT %QX5.5 : BOOL;
    PLF3 AT %QX5.6 : BOOL;
    PLF4 AT %QX5.7 : BOOL;
  END_VAR


  (*==========================================================================================*)
  (* OTHERS *)
  (*==========================================================================================*)
  VAR_GLOBAL
    STABLE AT %QX210.0 : BOOL;
  END_VAR

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : sorting_buffer;
  END_RESOURCE
END_CONFIGURATION