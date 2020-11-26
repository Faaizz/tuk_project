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
    S_AL1 : BOOL; 
    S_BIN_1 : BOOL;
    S_AL1_BL : BOOL;
    CS_AL1_W : INT;
    RUNNING : BOOL;
  END_VAR 

  (* OUTPUT *)
  (*------------------------------------------------------------*)
  VAR_OUTPUT
    SB_AL1 : BOOL;
    PUWS_AL1_1_PLUS : BOOL;
    PUWS_AL1_1_RT : BOOL;
    CS_AL1_PLUS : BOOL;
  END_VAR
  
  (* PLACES *)
  (*------------------------------------------------------------*)
  VAR_EXTERNAL
    P0 : BOOL;
    P1 : BOOL;
    P2 : BOOL;
    P3 : BOOL;
    P4 : BOOL;
    PB : BOOL;
    P5 : BOOL;
    P6 : BOOL;
    BIN1 : BOOL;
    BIN2 : BOOL;
    P_LID : BOOL;
    P_BASE : BOOL;
    STABLE : BOOL;
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
    S_AL1_B : BOOL; 
    P_AL1_B_FT : BOOL;
    P_AL1_B_BK : BOOL;
    S_AL1_B1 : BOOL;
    S_AL1_B2 : BOOL;
    S_AL1_B3 : BOOL;
    S_AL1_LP : BOOL;
    RUNNING : BOOL;
  END_VAR 


  (* OUTPUT *)
  (*------------------------------------------------------------*)
  VAR_OUTPUT
    P_AL1_B : BOOL;
    SB_AL1_B1 : BOOL;
    SB_AL1_B2 : BOOL;
    SB_AL1_B3 : BOOL;
    STABLE : BOOL;
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
    S_AL1_L : BOOL; 
    P_AL1_L_FT : BOOL;
    P_AL1_L_BK : BOOL;
    S_AL1_L1 : BOOL;
    S_AL1_L2 : BOOL;
    S_AL1_L3 : BOOL;
    S_AL1_RP : BOOL;
    RUNNING : BOOL;
  END_VAR 


  (* OUTPUT *)
  (*------------------------------------------------------------*)
  VAR_OUTPUT
    P_AL1_L : BOOL;
    SB_AL1_L1 : BOOL;
    SB_AL1_L2 : BOOL;
    SB_AL1_L3 : BOOL;
    STABLE : BOOL;
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
    
    (*TL0*)
    IF P_LID AND S_AL1_L AND NOT PL1 THEN
      P_LID:=0;
      PL1:=1;
      STABLE:=0;
    END_IF;
    
    (*TL1*)
    IF PL1 AND PUSH_L AND timer_1_TL1.Q AND NOT PL2 THEN
      PL1:=0;
      PUSH_L:=0;
      PL2:=1;
      STABLE:=0;
    END_IF;
    
    (*TL23*)
    IF PL2 AND P_AL1_L_FT AND NOT PL23 THEN
      PL2:=0;
      PL23:=1;
      STABLE:=0;
    END_IF;
    
    (*TL2*)
    IF PL23 AND P_AL1_L_FT AND NOT PL3 THEN
      PL23:=0;
      PL3:=1;
      STABLE:=0;
    END_IF;
    
    (*TL3*)
    IF PL3 AND P_AL1_L_BK AND NOT PL4 AND NOT PUSH_L THEN
      PL3:=0;
      PL4:=1;
      PUSH_L:=1;
      STABLE:=0;
    END_IF;
    
    (*TL4*)
    IF PL4 AND PLF1 AND S_AL1_L1 AND NOT PL5 THEN 
      PL4:=0;
      PLF1:=0;
      PL5:=1;
      STABLE:=0;
    END_IF;
    
    (*TL5*)
    IF PL5 AND PLF2 AND S_AL1_L2 AND NOT PL6 AND NOT PLF1 THEN
      PL5:=0;
      PLF2:=0;
      PL6:=1;
      PLF1:=1;
      STABLE:=0;
    END_IF; 
    
    (*TL6*)
    IF PL6 AND PLF3 AND S_AL1_L3 AND  NOT PL7 AND NOT PLF2 THEN 
      PL6:=0;
      PLF3:=0;
      PL7:=1;
      PLF2:=1;
      STABLE:=0;
    END_IF;
    
    (*TL7*)
    IF PL7 AND PLF4 AND S_AL1_RP AND NOT PL8 THEN
      PL7:=0;
      PLF4:=0;
      PL8:=1;
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


END_FUNCTION_BLOCK


(****************************************************************************************************************************)
(* ASSEMBLY FUNCTION BLOCK *)
(****************************************************************************************************************************)
FUNCTION_BLOCK assembly
  (*==========================================================================================*)
  (* INPUTS AND OUTPUTS *)
  (*==========================================================================================*)

  (* INPUT *)
  (*------------------------------------------------------------*)
  VAR_INPUT
    AL1_DETECTED : BOOL; 
    AL1_X_POS : WORD;
    AL1_Y_POS : WORD;
    AL1_Z_POS : WORD;
    LP_AL1_CLAMPED : BOOL;
    LP_AL1_LIMIT : BOOL;
    RP_AL1_CLAMPED : BOOL;
    RUNNING : BOOL;
  END_VAR 


  (* OUTPUT *)
  (*------------------------------------------------------------*)
  VAR_OUTPUT
    AL1_X_SET : WORD;
    AL1_Y_SET : WORD;
    AL1_Z_SET : WORD;
    AL1_GRAB : BOOL;
    RP_AL1_CLAMP : BOOL;
    LP_AL1_RAISE : BOOL;
    LP_AL1_CLAMP : BOOL;
    SB_AL1_B3 : BOOL;
    SB_AL1_L3 : BOOL;
    STABLE : BOOL;
  END_VAR

  (* PLACES *)
  (*------------------------------------------------------------*)
  VAR_EXTERNAL
    PA0 : BOOL;
    PA1 : BOOL;
    PA2 : BOOL;
    PA3 : BOOL;
    PA4 : BOOL;
    PA5 : BOOL;
    PA6 : BOOL;
    PA7 : BOOL;
    PA8 : BOOL;
    PA9 : BOOL;
    PA10 : BOOL;
    PA11 : BOOL;
    PA12 : BOOL;
    PA13 : BOOL;
    PB8 : BOOL;
    PB9 : BOOL;
    PL8 : BOOL;
    PL9 : BOOL;
    PBF3 : BOOL;
    PBF4 : BOOL;
    PLF3 : BOOL;
    PLF4 : BOOL;
  END_VAR

  (* OTHERS *)
  (*------------------------------------------------------------*)
  VAR
    timer_1 : TON;
  END_VAR

  timer_1(IN:= PL9, PT:= T#300ms);

  STABLE:= 0;

  IF NOT RUNNING THEN

    PB9:=0;
    PL9:=0;
    PA0:=1;
    PA1:=0;
    PA2:=0;
    PA3:=0;
    PA4:=0;
    PA5:=0;
    PA6:=0;
    PA7:=0;
    PA8:=0;
    PA9:=0;
    PA10:=0;
    PA11:=0;
    PA12:=0;
    PA13:=0;
  END_IF;

  (*==========================================================================================*)
  (* TRANSITIONS *)
  (*==========================================================================================*)
  WHILE STABLE=0 DO
    
    STABLE:=1;
    
    (*TB8*)
    IF PB8 AND LP_AL1_CLAMPED AND NOT PB9 THEN
      PB8:=0;
      PB9:=1;
      STABLE:=0;
    END_IF;
    
    (*TL8*)
    IF PL8 AND RP_AL1_CLAMPED AND NOT PL9 THEN
      PL8:=0;
      PL9:=1;
      STABLE:=0;
    END_IF;
    
    (*TA0*)
    IF PL9 AND timer_1.Q AND PA0 AND RP_AL1_CLAMPED AND NOT AL1_DETECTED AND NOT PA1 THEN
      PL9:=0;
      PA0:=0;
      PA1:=1;
      STABLE:=0;
    END_IF;
    
    (*TA1*)
    IF PA1 AND AL1_X_POS>798 AND AL1_X_POS<802 AND AL1_Y_POS>148 AND AL1_Y_POS<152 AND NOT PA2 THEN
      PA1:=0;
      PA2:=1;
      STABLE:=0;
    END_IF;
    
    (*TA2*)
    IF PA2 AND AL1_Z_POS>798 AND AL1_Z_POS<802 AND NOT PA3 THEN
      PA2:=0;
      PA3:=1;
      STABLE:=0;
    END_IF;
    
    (*TA3*)
    IF PA3 AND NOT RP_AL1_CLAMPED AND NOT PA4 THEN
      PA3:=0;
      PA4:=1;
      STABLE:=0;
    END_IF;
    
    (*TA4*)
    IF PA4 AND AL1_Z_POS>398 AND AL1_Z_POS<402 AND NOT PA5 AND NOT PLF3 AND NOT PLF4 THEN
      PA4:=0;
      PA5:=1;
      PLF3:=1;
      PLF4:=1;
      STABLE:=0;
    END_IF;
    
    (*TA5*)
    IF PA5 AND PB9 AND AL1_DETECTED AND LP_AL1_CLAMPED AND AL1_X_POS>208 AND AL1_X_POS<212 AND AL1_Y_POS>148 AND AL1_Y_POS<152 AND NOT PA6 THEN
      PA5:=0;
      PB9:=0;
      PA6:=1;
      STABLE:=0;
    END_IF;
    
    (*TA6*)
    IF PA6 AND AL1_Z_POS>810 AND AL1_Z_POS<820 AND NOT PA7 THEN
      PA6:=0;
      PA7:=1;
      STABLE:=0;
    END_IF;
    
    (*TA7*)
    IF PA7 AND AL1_Z_POS>398 AND AL1_Z_POS<402 AND NOT PA8 THEN
      PA7:=0;
      PA8:=1;
      STABLE:=0;
    END_IF;
    
    (*TA8*)
    IF PA8 AND NOT LP_AL1_CLAMPED AND NOT PA9 THEN
      PA8:=0;
      PA9:=1;
      STABLE:=0;
    END_IF;
    
    (*TA9*)
    IF PA9 AND NOT LP_AL1_LIMIT AND NOT PA10 THEN
      PA9:=0;
      PA10:=1;
      STABLE:=0;
    END_IF;
    
    (*TA10*)
    IF PA10 AND LP_AL1_LIMIT AND NOT PA11 THEN
      PA10:=0;
      PA11:=1;
      STABLE:=0;
    END_IF;
    
    (*TA11*)
    IF PA11 AND NOT LP_AL1_LIMIT AND NOT PA12 THEN
      PA11:=0;
      PA12:=1;
      STABLE:=0;
    END_IF;
    
    (*TA12*)
    IF PA12 AND LP_AL1_LIMIT AND NOT PA13 AND NOT PA0 AND NOT PBF3 AND NOT PBF4 THEN
      PA12:=0;
      PA13:=1;
      PA0:=1;
      PBF3:=1;
      PBF4:=1;
      STABLE:=0;
    END_IF;
    
  END_WHILE;


  (*==========================================================================================*)
  (* OUTPUTS *)
  (*==========================================================================================*)

  (*LP_AL1_CLAMP*)
  IF PB8 OR PB9 THEN
    LP_AL1_CLAMP:=1;
  END_IF;
  IF PBF4 THEN
    LP_AL1_CLAMP:=0;
  END_IF;  

  (*RP_AL1_CLAMP*)
  IF PL8 OR PL9 THEN
    RP_AL1_CLAMP:=1;
  END_IF;
  IF PLF4 THEN
    RP_AL1_CLAMP:=0;
  END_IF;  

  (*MOVE GRABBER TO LID POSITION*)
  IF PA1 THEN
    AL1_X_SET:=800;
    AL1_Y_SET:=150;
  END_IF;

  (*GRABBER DOWN TO PICK LID*)
  IF PA2 THEN
    AL1_Z_SET:= 800;
  END_IF;

  (*GRAB LID*)
  IF PA3 OR PA4 OR PA5 OR PA6 THEN
    AL1_GRAB:=1;
  END_IF;

  (*RAISE GRABBER A LITTLE*)
  IF PA0 OR PA4 OR PA7 THEN
    AL1_Z_SET:=400;
  END_IF;

  (*MOVE GRABBER TO BASE POSITION*)
  IF PA0 OR PA5 THEN
    AL1_X_SET:=210;
    AL1_Y_SET:=150;
  END_IF;

  (*LOWER LID TO FIT ON BASE*)
  IF PA6 THEN
    AL1_Z_SET:=818;
  END_IF;

  (*RELEASE LID*)
  IF PA0 OR PA1 OR PA2 OR PA7 OR PA8 OR PA9 OR PA10 OR PA11 OR PA12 THEN
    AL1_GRAB:=0;
  END_IF;

  (*LID CLAMP*)
  IF PA1 OR PA2 THEN
    RP_AL1_CLAMP:=1;
  END_IF;

  IF PA3 OR PA4 OR PLF4 THEN
    RP_AL1_CLAMP:=0;
  END_IF;

  (*BASE CLAMP*)
  IF PA8 OR PA9 OR PA10 OR PA11 OR PA12 THEN
    LP_AL1_CLAMP:=0;
  END_IF;

  IF PB9 OR PA6 OR PA7 THEN
    LP_AL1_CLAMP:=1;
  END_IF;

  (*RAISE BASE CLAMP*)
  IF PA0 OR PA1 OR PA2 OR PA3 OR PA4 OR PA5 OR PA6 OR PA7 OR PA8 OR PA11 OR PA12 THEN
    LP_AL1_RAISE:=0;
  END_IF;

  IF PA9 OR PA10 THEN
    LP_AL1_RAISE:=1;
  END_IF;

  (* OUTPUTS OF PLACES FROM OTHER STAGES *)
  (*LP_AL1_CLAMP*)
  (*IF PB9 THEN
    LP_AL1_CLAMP:=1;
  END_IF;
  IF PBF4 THEN
    LP_AL1_CLAMP:=0;
  END_IF; 

  (*SB_AL1_B3
  IF PBF3 THEN
    SB_AL1_B3:=0;
  END_IF;

  (*SB_AL1_L3
  IF PLF3 THEN
    SB_AL1_L3:=0;
  END_IF;

  (*RP_AL1_CLAMP
  IF PL9 THEN
    RP_AL1_CLAMP:=1;
  END_IF;
  IF PLF4 THEN
    RP_AL1_CLAMP:=0;
  END_IF;  *)



END_FUNCTION_BLOCK

(****************************************************************************************************************************)
(* MAIN PROGRAM *)
(****************************************************************************************************************************)

PROGRAM sorting_buffer_assembly


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
    SB_AL1 AT %QX101.2 : BOOL;
    PUWS_AL1_1_PLUS AT %QX101.3 : BOOL;
    PUWS_AL1_1_RT AT %QX101.4 : BOOL;
    CS_AL1_PLUS AT %QX101.5 : BOOL;
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
    P_AL1_L AT %QX100.5 : BOOL;
    SB_AL1_L1 AT %QX100.6 : BOOL;
    SB_AL1_L2 AT %QX100.7 : BOOL;
    SB_AL1_L3 AT %QX101.0 : BOOL;
    RP_AL1_CLAMP AT %QX101.1 : BOOL;

  END_VAR


  (* ASSEMBLY *)
  (*------------------------------------------------------------*)
  VAR
    (* INPUTS *)
    AL1_DETECTED AT %IX102.3 : BOOL;
    LP_AL1_LIMIT AT %IX102.4 : BOOL;
    AL1_X_POS AT %IW101 : WORD;
    AL1_Y_POS AT %IW102 : WORD;
    AL1_Z_POS AT %IW103 : WORD;

    (* OUTPUTS *)
    AL1_GRAB AT %QX101.6 : BOOL;
    LP_AL1_RAISE AT %QX101.7 : BOOL;
    AL1_X_SET AT %QW100 : WORD;
    AL1_Y_SET AT %QW101 : WORD;
    AL1_Z_SET AT %QW102 : WORD;

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
  (* ASSEMBLY *)
  (*------------------------------------------------------------*)
  VAR_EXTERNAL
    
    PA0 : BOOL;
    PA1 : BOOL;
    PA2 : BOOL;
    PA3 : BOOL;
    PA4 : BOOL;
    PA5 : BOOL;
    PA6 : BOOL;
    PA7 : BOOL;
    PA8 : BOOL;
    PA9 : BOOL;
    PA10 : BOOL;
    PA11 : BOOL;
    PA12 : BOOL;
    PA13 : BOOL;
    PL9 : BOOL;
    PB9 : BOOL;
    PBF3 : BOOL;
    PBF4 : BOOL;
    PLF3 : BOOL;
    PLF4 : BOOL;
  END_VAR
  (*==========================================================================================*)
  (* OTHERS *)
  (*==========================================================================================*)
  VAR_EXTERNAL
    STABLE : BOOL;
  END_VAR



  (****************************************************************************************************************************)
  (* VARIABLE INITIALIZATION *)
  (****************************************************************************************************************************)



  (*==========================================================================================*)
  (* FUNTION BLOCKS *)
  (*==========================================================================================*)
  VAR
    sorting0 : sorting;
    base_buffer0 : base_buffer;
    lid_buffer0 : lid_buffer;
    assembly0 : assembly;
  END_VAR



  (*==========================================================================================*)
  (* PLACES *)
  (*==========================================================================================*)

  



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
    S_AL1_LP:=S_AL1_LP, (*LP_AL1_CLAMPED:=LP_AL1_CLAMPED,*) RUNNING:=RUNNING,

    P_AL1_B=>P_AL1_B, SB_AL1_B1=>SB_AL1_B1, SB_AL1_B2=>SB_AL1_B2, 
    SB_AL1_B3=>SB_AL1_B3, STABLE=>STABLE (*, LP_AL1_CLAMP=>LP_AL1_CLAMP*)
  );


  (* LID BUFFER *)
  (*------------------------------------------------------------*)
  lid_buffer0(
    S_AL1_L:=S_AL1_L, P_AL1_L_FT:=P_AL1_L_FT, P_AL1_L_BK:=P_AL1_L_BK,
    S_AL1_L1:=S_AL1_L1, S_AL1_L2:=S_AL1_L2, S_AL1_L3:=S_AL1_L3,
    S_AL1_RP:=S_AL1_RP, (*RP_AL1_CLAMPED:=RP_AL1_CLAMPED,*) RUNNING:=RUNNING,

    P_AL1_L=>P_AL1_L, SB_AL1_L1=>SB_AL1_L1, SB_AL1_L2=>SB_AL1_L2, 
    SB_AL1_L3=>SB_AL1_L3, STABLE=>STABLE (*, RP_AL1_CLAMP=>RP_AL1_CLAMP*)
  );


  (* ASSEMBLY *)
  (*------------------------------------------------------------*)
  assembly0(
    RP_AL1_CLAMPED:=RP_AL1_CLAMPED, AL1_DETECTED:=AL1_DETECTED, 
    AL1_X_POS:=AL1_X_POS, AL1_Y_POS:=AL1_Y_POS, AL1_Z_POS:=AL1_Z_POS,
    LP_AL1_CLAMPED:=LP_AL1_CLAMPED, LP_AL1_LIMIT:=LP_AL1_LIMIT,
    RUNNING:=RUNNING,

    AL1_X_SET=>AL1_X_SET, AL1_Y_SET=>AL1_Y_SET, AL1_Z_SET=>AL1_Z_SET,
    AL1_GRAB=>AL1_GRAB, RP_AL1_CLAMP=>RP_AL1_CLAMP, LP_AL1_CLAMP=>LP_AL1_CLAMP,
    LP_AL1_RAISE=>LP_AL1_RAISE, STABLE=>STABLE (*,SB_AL1_B3=>SB_AL1_B3, SB_AL1_L3=>SB_AL1_L3*)
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
    PB1 AT %QX105.1 : BOOL;
    PUSH_B AT %QX105.2 : BOOL;
    PB2 AT %QX105.3 : BOOL;
    PB23 AT %QX105.4 : BOOL;
    PB3 AT %QX105.5 : BOOL;
    PB4 AT %QX105.6 : BOOL;
    PB5 AT %QX105.7 : BOOL;
    PB6 AT %QX106.0 : BOOL;
    PB7 AT %QX106.1 : BOOL;
    PB8 AT %QX106.2 : BOOL;
    PB9 AT %QX106.3 : BOOL;
    PBF1 AT %QX106.4 : BOOL;
    PBF2 AT %QX106.5 : BOOL;
    PBF3 AT %QX106.6 : BOOL;
    PBF4 AT %QX106.7 : BOOL;
    PL1 AT %QX107.1 : BOOL;
    PL2 AT %QX107.2 : BOOL;
    PUSH_L AT %QX107.3 : BOOL;
    PL23 AT %QX107.4 : BOOL;
    PL3 AT %QX107.5 : BOOL;
    PL4 AT %QX107.6 : BOOL;
    PL5 AT %QX107.7 : BOOL;
    PL6 AT %QX108.0 : BOOL;
    PL7 AT %QX108.1 : BOOL;
    PL8 AT %QX108.2 : BOOL;
    PL9 AT %QX108.3 : BOOL;
    PLF1 AT %QX108.4 : BOOL;
    PLF2 AT %QX108.5 : BOOL;
    PLF3 AT %QX108.6 : BOOL;
    PLF4 AT %QX108.7 : BOOL;
  END_VAR

  (* ASSEMBLY *)
  (*------------------------------------------------------------*)
  VAR_GLOBAL
    PA0 AT %QX109.0 : BOOL;
    PA1 AT %QX109.1 : BOOL;
    PA2 AT %QX109.2 : BOOL;
    PA3 AT %QX109.3 : BOOL;
    PA4 AT %QX109.4 : BOOL;
    PA5 AT %QX109.5 : BOOL;
    PA6 AT %QX109.6 : BOOL;
    PA7 AT %QX109.7 : BOOL;
    PA8 AT %QX110.0 : BOOL;
    PA9 AT %QX110.1 : BOOL;
    PA10 AT %QX110.2 : BOOL;
    PA11 AT %QX110.3 : BOOL;
    PA12 AT %QX110.4 : BOOL;
    PA13 AT %QX110.5 : BOOL;
  END_VAR


  (*==========================================================================================*)
  (* OTHERS *)
  (*==========================================================================================*)
  VAR_GLOBAL
    STABLE AT %QX510.0 : BOOL;
  END_VAR

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : sorting_buffer_assembly;
  END_RESOURCE
END_CONFIGURATION