void LOGGER_init__(LOGGER *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MSG,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->LEVEL,LOGLEVEL__INFO,retain)
  __INIT_VAR(data__->TRIG0,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void LOGGER_body__(LOGGER *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  if ((__GET_VAR(data__->TRIG,) && !(__GET_VAR(data__->TRIG0,)))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  
    #undef GetFbVar
    #undef SetFbVar
;
  };
  __SET_VAR(data__->,TRIG0,,__GET_VAR(data__->TRIG,));

  goto __end;

__end:
  return;
} // LOGGER_body__() 





void PYTHON_EVAL_init__(PYTHON_EVAL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_EVAL_body__(PYTHON_EVAL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_EVAL_body__() 





void PYTHON_POLL_init__(PYTHON_POLL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_POLL_body__(PYTHON_POLL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_POLL_body__() 





void PYTHON_GEAR_init__(PYTHON_GEAR *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->N,0,retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  PYTHON_EVAL_init__(&data__->PY_EVAL,retain);
  __INIT_VAR(data__->COUNTER,0,retain)
  __INIT_VAR(data__->ADD10_OUT,0,retain)
  __INIT_VAR(data__->EQ13_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SEL15_OUT,0,retain)
  __INIT_VAR(data__->AND7_OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_GEAR_body__(PYTHON_GEAR *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,ADD10_OUT,,ADD__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->COUNTER,),
    (UINT)1));
  __SET_VAR(data__->,EQ13_OUT,,EQ__BOOL__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->N,),
    (UINT)__GET_VAR(data__->ADD10_OUT,)));
  __SET_VAR(data__->,SEL15_OUT,,SEL__UINT__BOOL__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (BOOL)__GET_VAR(data__->EQ13_OUT,),
    (UINT)__GET_VAR(data__->ADD10_OUT,),
    (UINT)0));
  __SET_VAR(data__->,COUNTER,,__GET_VAR(data__->SEL15_OUT,));
  __SET_VAR(data__->,AND7_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->EQ13_OUT,),
    (BOOL)__GET_VAR(data__->TRIG,)));
  __SET_VAR(data__->PY_EVAL.,TRIG,,__GET_VAR(data__->AND7_OUT,));
  __SET_VAR(data__->PY_EVAL.,CODE,,__GET_VAR(data__->CODE,));
  PYTHON_EVAL_body__(&data__->PY_EVAL);
  __SET_VAR(data__->,ACK,,__GET_VAR(data__->PY_EVAL.ACK,));
  __SET_VAR(data__->,RESULT,,__GET_VAR(data__->PY_EVAL.RESULT,));

  goto __end;

__end:
  return;
} // PYTHON_GEAR_body__() 





void BUFFER_STAGE_init__(BUFFER_STAGE *data__, BOOL retain) {
  __INIT_VAR(data__->S_AL1_B,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P_AL1_B_FT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P_AL1_B_BK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_AL1_B1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_AL1_B2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_AL1_B3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LP_AL1_CLAMPED,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_AL1_LP,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_AL1_L,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P_AL1_L_FT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P_AL1_L_BK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_AL1_L1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_AL1_L2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_AL1_L3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RP_AL1_CLAMPED,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_AL1_RP,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RUNNING,__BOOL_LITERAL(FALSE),retain)
  TON_init__(&data__->TIMER_1_TB1,retain);
  TON_init__(&data__->TIMER_1_TL1,retain);
  __INIT_VAR(data__->P_AL1_B,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SB_AL1_B1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SB_AL1_B2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SB_AL1_B3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LP_AL1_CLAMP,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P_AL1_L,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SB_AL1_L1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SB_AL1_L2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SB_AL1_L3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RP_AL1_CLAMP,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P_BASE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PUSH_B,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB23,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB8,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB9,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PBF1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PBF2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PBF3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PBF4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P_LID,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PL1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PL2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PUSH_L,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PL23,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PL3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PL4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PL5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PL6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PL7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PL8,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PL9,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PLF1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PLF2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PLF3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PLF4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STABLE,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void BUFFER_STAGE_body__(BUFFER_STAGE *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->TIMER_1_TB1.,IN,,__GET_VAR(data__->PB1,));
  __SET_VAR(data__->TIMER_1_TB1.,PT,,__time_to_timespec(1, 900, 0, 0, 0, 0));
  TON_body__(&data__->TIMER_1_TB1);
  __SET_VAR(data__->TIMER_1_TL1.,IN,,__GET_VAR(data__->PL1,));
  __SET_VAR(data__->TIMER_1_TL1.,PT,,__time_to_timespec(1, 900, 0, 0, 0, 0));
  TON_body__(&data__->TIMER_1_TL1);
  if (!(__GET_VAR(data__->RUNNING,))) {
    __SET_VAR(data__->,P_BASE,,1);
    __SET_VAR(data__->,PB1,,0);
    __SET_VAR(data__->,PUSH_B,,1);
    __SET_VAR(data__->,PB2,,0);
    __SET_VAR(data__->,PB23,,0);
    __SET_VAR(data__->,PB3,,0);
    __SET_VAR(data__->,PB4,,0);
    __SET_VAR(data__->,PB5,,0);
    __SET_VAR(data__->,PB6,,0);
    __SET_VAR(data__->,PB7,,0);
    __SET_VAR(data__->,PB8,,0);
    __SET_VAR(data__->,PB9,,0);
    __SET_VAR(data__->,PBF1,,1);
    __SET_VAR(data__->,PBF2,,1);
    __SET_VAR(data__->,PBF3,,1);
    __SET_VAR(data__->,PBF4,,1);
    __SET_VAR(data__->,P_LID,,1);
    __SET_VAR(data__->,PL1,,0);
    __SET_VAR(data__->,PUSH_L,,1);
    __SET_VAR(data__->,PL2,,0);
    __SET_VAR(data__->,PL23,,0);
    __SET_VAR(data__->,PL3,,0);
    __SET_VAR(data__->,PL4,,0);
    __SET_VAR(data__->,PL5,,0);
    __SET_VAR(data__->,PL6,,0);
    __SET_VAR(data__->,PL7,,0);
    __SET_VAR(data__->,PL8,,0);
    __SET_VAR(data__->,PL9,,0);
    __SET_VAR(data__->,PLF1,,1);
    __SET_VAR(data__->,PLF2,,1);
    __SET_VAR(data__->,PLF3,,1);
    __SET_VAR(data__->,PLF4,,1);
  };
  __SET_VAR(data__->,STABLE,,0);
  while ((__GET_VAR(data__->STABLE,) == 0)) {
    __SET_VAR(data__->,STABLE,,1);
    if (((__GET_VAR(data__->P_BASE,) && __GET_VAR(data__->S_AL1_B,)) && !(__GET_VAR(data__->PB1,)))) {
      __SET_VAR(data__->,P_BASE,,0);
      __SET_VAR(data__->,PB1,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((__GET_VAR(data__->PB1,) && __GET_VAR(data__->PUSH_B,)) && __GET_VAR(data__->TIMER_1_TB1.Q,)) && !(__GET_VAR(data__->PB2,)))) {
      __SET_VAR(data__->,PB1,,0);
      __SET_VAR(data__->,PUSH_B,,0);
      __SET_VAR(data__->,PB2,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->PB2,) && __GET_VAR(data__->P_AL1_B_FT,)) && !(__GET_VAR(data__->PB23,)))) {
      __SET_VAR(data__->,PB2,,0);
      __SET_VAR(data__->,PB23,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->PB23,) && __GET_VAR(data__->P_AL1_B_FT,)) && !(__GET_VAR(data__->PB3,)))) {
      __SET_VAR(data__->,PB23,,0);
      __SET_VAR(data__->,PB3,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((((__GET_VAR(data__->PB3,) && __GET_VAR(data__->P_AL1_B_BK,)) && !(__GET_VAR(data__->PB4,))) && !(__GET_VAR(data__->PUSH_B,))) && !(__GET_VAR(data__->P_BASE,)))) {
      __SET_VAR(data__->,PB3,,0);
      __SET_VAR(data__->,PB4,,1);
      __SET_VAR(data__->,PUSH_B,,1);
      __SET_VAR(data__->,P_BASE,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((__GET_VAR(data__->PB4,) && __GET_VAR(data__->PBF1,)) && __GET_VAR(data__->S_AL1_B1,)) && !(__GET_VAR(data__->PB5,)))) {
      __SET_VAR(data__->,PB4,,0);
      __SET_VAR(data__->,PBF1,,0);
      __SET_VAR(data__->,PB5,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((((__GET_VAR(data__->PB5,) && __GET_VAR(data__->PBF2,)) && __GET_VAR(data__->S_AL1_B2,)) && !(__GET_VAR(data__->PB6,))) && !(__GET_VAR(data__->PBF1,)))) {
      __SET_VAR(data__->,PB5,,0);
      __SET_VAR(data__->,PBF2,,0);
      __SET_VAR(data__->,PB6,,1);
      __SET_VAR(data__->,PBF1,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((((__GET_VAR(data__->PB6,) && __GET_VAR(data__->PBF3,)) && __GET_VAR(data__->S_AL1_B3,)) && !(__GET_VAR(data__->PB7,))) && !(__GET_VAR(data__->PBF2,)))) {
      __SET_VAR(data__->,PB6,,0);
      __SET_VAR(data__->,PBF3,,0);
      __SET_VAR(data__->,PB7,,1);
      __SET_VAR(data__->,PBF2,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((__GET_VAR(data__->PB7,) && __GET_VAR(data__->PBF4,)) && __GET_VAR(data__->S_AL1_LP,)) && !(__GET_VAR(data__->PB8,)))) {
      __SET_VAR(data__->,PB7,,0);
      __SET_VAR(data__->,PBF4,,0);
      __SET_VAR(data__->,PB8,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->PB8,) && __GET_VAR(data__->LP_AL1_CLAMPED,)) && !(__GET_VAR(data__->PB9,)))) {
      __SET_VAR(data__->,PB8,,0);
      __SET_VAR(data__->,PB9,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((__GET_VAR(data__->PB9,) && !(__GET_VAR(data__->LP_AL1_CLAMPED,))) && !(__GET_VAR(data__->PBF3,))) && !(__GET_VAR(data__->PBF4,)))) {
      __SET_VAR(data__->,PB9,,0);
      __SET_VAR(data__->,PBF3,,1);
      __SET_VAR(data__->,PBF4,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->P_LID,) && __GET_VAR(data__->S_AL1_B,)) && !(__GET_VAR(data__->PL1,)))) {
      __SET_VAR(data__->,P_LID,,0);
      __SET_VAR(data__->,PL1,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((__GET_VAR(data__->PL1,) && __GET_VAR(data__->PUSH_L,)) && __GET_VAR(data__->TIMER_1_TL1.Q,)) && !(__GET_VAR(data__->PL2,)))) {
      __SET_VAR(data__->,PL1,,0);
      __SET_VAR(data__->,PUSH_L,,0);
      __SET_VAR(data__->,PL2,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->PL2,) && __GET_VAR(data__->P_AL1_L_FT,)) && !(__GET_VAR(data__->PL23,)))) {
      __SET_VAR(data__->,PL2,,0);
      __SET_VAR(data__->,PL23,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->PL23,) && __GET_VAR(data__->P_AL1_L_FT,)) && !(__GET_VAR(data__->PL3,)))) {
      __SET_VAR(data__->,PL23,,0);
      __SET_VAR(data__->,PL3,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((((__GET_VAR(data__->PL3,) && __GET_VAR(data__->P_AL1_L_BK,)) && !(__GET_VAR(data__->PL4,))) && !(__GET_VAR(data__->PUSH_L,))) && !(__GET_VAR(data__->P_LID,)))) {
      __SET_VAR(data__->,PL3,,0);
      __SET_VAR(data__->,PL4,,1);
      __SET_VAR(data__->,PUSH_L,,1);
      __SET_VAR(data__->,P_LID,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((__GET_VAR(data__->PL4,) && __GET_VAR(data__->PLF1,)) && __GET_VAR(data__->S_AL1_L1,)) && !(__GET_VAR(data__->PL5,)))) {
      __SET_VAR(data__->,PL4,,0);
      __SET_VAR(data__->,PLF1,,0);
      __SET_VAR(data__->,PL5,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((((__GET_VAR(data__->PL5,) && __GET_VAR(data__->PLF2,)) && __GET_VAR(data__->S_AL1_L2,)) && !(__GET_VAR(data__->PL6,))) && !(__GET_VAR(data__->PLF1,)))) {
      __SET_VAR(data__->,PL5,,0);
      __SET_VAR(data__->,PLF2,,0);
      __SET_VAR(data__->,PL6,,1);
      __SET_VAR(data__->,PLF1,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((((__GET_VAR(data__->PL6,) && __GET_VAR(data__->PLF3,)) && __GET_VAR(data__->S_AL1_L3,)) && !(__GET_VAR(data__->PL7,))) && !(__GET_VAR(data__->PLF2,)))) {
      __SET_VAR(data__->,PL6,,0);
      __SET_VAR(data__->,PLF3,,0);
      __SET_VAR(data__->,PL7,,1);
      __SET_VAR(data__->,PLF2,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((__GET_VAR(data__->PL7,) && __GET_VAR(data__->PLF4,)) && __GET_VAR(data__->S_AL1_LP,)) && !(__GET_VAR(data__->PL8,)))) {
      __SET_VAR(data__->,PL7,,0);
      __SET_VAR(data__->,PLF4,,0);
      __SET_VAR(data__->,PL8,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->PL8,) && __GET_VAR(data__->LP_AL1_CLAMPED,)) && !(__GET_VAR(data__->PL9,)))) {
      __SET_VAR(data__->,PL8,,0);
      __SET_VAR(data__->,PL9,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((__GET_VAR(data__->PL9,) && !(__GET_VAR(data__->LP_AL1_CLAMPED,))) && !(__GET_VAR(data__->PLF3,))) && !(__GET_VAR(data__->PLF4,)))) {
      __SET_VAR(data__->,PL9,,0);
      __SET_VAR(data__->,PLF3,,1);
      __SET_VAR(data__->,PLF4,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
  };
  if ((__GET_VAR(data__->PB2,) || __GET_VAR(data__->PB23,))) {
    __SET_VAR(data__->,P_AL1_B,,1);
  };
  if (((__GET_VAR(data__->P_BASE,) || __GET_VAR(data__->PB1,)) || __GET_VAR(data__->PB3,))) {
    __SET_VAR(data__->,P_AL1_B,,0);
  };
  if (__GET_VAR(data__->PB5,)) {
    __SET_VAR(data__->,SB_AL1_B1,,1);
  };
  if (__GET_VAR(data__->PBF1,)) {
    __SET_VAR(data__->,SB_AL1_B1,,0);
  };
  if (__GET_VAR(data__->PB6,)) {
    __SET_VAR(data__->,SB_AL1_B2,,1);
  };
  if (__GET_VAR(data__->PBF2,)) {
    __SET_VAR(data__->,SB_AL1_B2,,0);
  };
  if (__GET_VAR(data__->PB7,)) {
    __SET_VAR(data__->,SB_AL1_B3,,1);
  };
  if (__GET_VAR(data__->PBF3,)) {
    __SET_VAR(data__->,SB_AL1_B3,,0);
  };
  if ((__GET_VAR(data__->PB8,) || __GET_VAR(data__->PB9,))) {
    __SET_VAR(data__->,LP_AL1_CLAMP,,1);
  };
  if (__GET_VAR(data__->PBF4,)) {
    __SET_VAR(data__->,LP_AL1_CLAMP,,0);
  };
  if ((__GET_VAR(data__->PL2,) || __GET_VAR(data__->PL23,))) {
    __SET_VAR(data__->,P_AL1_L,,1);
  };
  if (((__GET_VAR(data__->P_LID,) || __GET_VAR(data__->PL1,)) || __GET_VAR(data__->PL3,))) {
    __SET_VAR(data__->,P_AL1_L,,0);
  };
  if (__GET_VAR(data__->PL5,)) {
    __SET_VAR(data__->,SB_AL1_L1,,1);
  };
  if (__GET_VAR(data__->PLF1,)) {
    __SET_VAR(data__->,SB_AL1_L1,,0);
  };
  if (__GET_VAR(data__->PL6,)) {
    __SET_VAR(data__->,SB_AL1_L2,,1);
  };
  if (__GET_VAR(data__->PLF2,)) {
    __SET_VAR(data__->,SB_AL1_L2,,0);
  };
  if (__GET_VAR(data__->PL7,)) {
    __SET_VAR(data__->,SB_AL1_L3,,1);
  };
  if (__GET_VAR(data__->PLF3,)) {
    __SET_VAR(data__->,SB_AL1_L3,,0);
  };
  if ((__GET_VAR(data__->PL8,) || __GET_VAR(data__->PL9,))) {
    __SET_VAR(data__->,LP_AL1_CLAMP,,1);
  };
  if (__GET_VAR(data__->PLF4,)) {
    __SET_VAR(data__->,LP_AL1_CLAMP,,0);
  };

  goto __end;

__end:
  return;
} // BUFFER_STAGE_body__() 





