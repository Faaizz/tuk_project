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





void SORTING_init__(SORTING *data__, BOOL retain) {
  __INIT_VAR(data__->S_AL1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_BIN_1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_AL1_BL,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RUNNING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CS_AL1_W,0,retain)
  __INIT_VAR(data__->SB_AL1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PUWS_AL1_1_PLUS,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PUWS_AL1_1_RT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CS_AL1_PLUS,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STABLE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P0,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->P6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->BIN1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->BIN2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ASSEMBLY,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PRODUCTION,__BOOL_LITERAL(FALSE),retain)
  TON_init__(&data__->TIMER_1_P2,retain);
  TON_init__(&data__->TIMER_1_P3,retain);
}

// Code part
void SORTING_body__(SORTING *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->TIMER_1_P2.,IN,,__GET_VAR(data__->P2,));
  __SET_VAR(data__->TIMER_1_P2.,PT,,__time_to_timespec(1, 1000, 0, 0, 0, 0));
  TON_body__(&data__->TIMER_1_P2);
  __SET_VAR(data__->TIMER_1_P3.,IN,,__GET_VAR(data__->P3,));
  __SET_VAR(data__->TIMER_1_P3.,PT,,__time_to_timespec(1, 3000, 0, 0, 0, 0));
  TON_body__(&data__->TIMER_1_P3);
  if (!(__GET_VAR(data__->RUNNING,))) {
    __SET_VAR(data__->,SB_AL1,,0);
    __SET_VAR(data__->,PUWS_AL1_1_PLUS,,0);
    __SET_VAR(data__->,PUWS_AL1_1_RT,,0);
    __SET_VAR(data__->,P0,,1);
    __SET_VAR(data__->,P1,,1);
    __SET_VAR(data__->,P2,,0);
    __SET_VAR(data__->,P3,,0);
    __SET_VAR(data__->,P4,,0);
    __SET_VAR(data__->,PB,,0);
    __SET_VAR(data__->,BIN1,,1);
    __SET_VAR(data__->,BIN2,,0);
    __SET_VAR(data__->,P5,,0);
    __SET_VAR(data__->,P6,,0);
    __SET_VAR(data__->,ASSEMBLY,,0);
    __SET_VAR(data__->,PRODUCTION,,0);
  };
  __SET_VAR(data__->,STABLE,,1);
  if ((((__GET_VAR(data__->P0,) && __GET_VAR(data__->P1,)) && __GET_VAR(data__->S_AL1,)) && !(__GET_VAR(data__->P2,)))) {
    __SET_VAR(data__->,P0,,0);
    __SET_VAR(data__->,P1,,0);
    __SET_VAR(data__->,P2,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->P2,) && __GET_VAR(data__->TIMER_1_P2.Q,)) && !(__GET_VAR(data__->P3,)))) {
    __SET_VAR(data__->,P2,,0);
    __SET_VAR(data__->,P3,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->P3,) && __GET_VAR(data__->TIMER_1_P3.Q,)) && !(__GET_VAR(data__->P4,)))) {
    __SET_VAR(data__->,P3,,0);
    __SET_VAR(data__->,P4,,1);
  };
  if (((__GET_VAR(data__->P4,) && ((__GET_VAR(data__->CS_AL1_W,) < 200) || (__GET_VAR(data__->CS_AL1_W,) > 400))) && !(__GET_VAR(data__->PB,)))) {
    __SET_VAR(data__->,P4,,0);
    __SET_VAR(data__->,PB,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if ((((((__GET_VAR(data__->PB,) && __GET_VAR(data__->BIN1,)) && __GET_VAR(data__->S_BIN_1,)) && !(__GET_VAR(data__->BIN2,))) && !(__GET_VAR(data__->P1,))) && !(__GET_VAR(data__->PRODUCTION,)))) {
    __SET_VAR(data__->,PB,,0);
    __SET_VAR(data__->,BIN1,,0);
    __SET_VAR(data__->,BIN2,,1);
    __SET_VAR(data__->,P1,,1);
    __SET_VAR(data__->,PRODUCTION,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->BIN2,) && !(__GET_VAR(data__->S_BIN_1,))) && !(__GET_VAR(data__->BIN1,)))) {
    __SET_VAR(data__->,BIN2,,0);
    __SET_VAR(data__->,BIN1,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->P4,) && ((__GET_VAR(data__->CS_AL1_W,) > 200) && (__GET_VAR(data__->CS_AL1_W,) <= 300))) && !(__GET_VAR(data__->P5,)))) {
    __SET_VAR(data__->,P4,,0);
    __SET_VAR(data__->,P5,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->P4,) && ((__GET_VAR(data__->CS_AL1_W,) > 300) && (__GET_VAR(data__->CS_AL1_W,) <= 400))) && !(__GET_VAR(data__->P6,)))) {
    __SET_VAR(data__->,P4,,0);
    __SET_VAR(data__->,P6,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if ((((__GET_VAR(data__->P5,) && __GET_VAR(data__->S_AL1_BL,)) && !(__GET_VAR(data__->ASSEMBLY,))) && !(__GET_VAR(data__->P1,)))) {
    __SET_VAR(data__->,P5,,0);
    __SET_VAR(data__->,ASSEMBLY,,1);
    __SET_VAR(data__->,P1,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if ((((__GET_VAR(data__->P6,) && __GET_VAR(data__->S_AL1_BL,)) && !(__GET_VAR(data__->ASSEMBLY,))) && !(__GET_VAR(data__->P1,)))) {
    __SET_VAR(data__->,P6,,0);
    __SET_VAR(data__->,ASSEMBLY,,1);
    __SET_VAR(data__->,P1,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if ((__GET_VAR(data__->ASSEMBLY,) && !(__GET_VAR(data__->PRODUCTION,)))) {
    __SET_VAR(data__->,ASSEMBLY,,0);
    __SET_VAR(data__->,PRODUCTION,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if ((__GET_VAR(data__->PRODUCTION,) && !(__GET_VAR(data__->P0,)))) {
    __SET_VAR(data__->,PRODUCTION,,0);
    __SET_VAR(data__->,P0,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((((__GET_VAR(data__->P3,) || __GET_VAR(data__->P4,)) || __GET_VAR(data__->PB,)) || __GET_VAR(data__->P5,)) || (__GET_VAR(data__->P6,) && __GET_VAR(data__->STABLE,)))) {
    __SET_VAR(data__->,SB_AL1,,1);
  };
  if ((__GET_VAR(data__->P1,) || (__GET_VAR(data__->P2,) && __GET_VAR(data__->STABLE,)))) {
    __SET_VAR(data__->,SB_AL1,,0);
  };
  if (((__GET_VAR(data__->PB,) || __GET_VAR(data__->P5,)) || (__GET_VAR(data__->P6,) && __GET_VAR(data__->STABLE,)))) {
    __SET_VAR(data__->,PUWS_AL1_1_PLUS,,1);
  };
  if ((((__GET_VAR(data__->P1,) || __GET_VAR(data__->P2,)) || __GET_VAR(data__->P3,)) || (__GET_VAR(data__->P4,) && __GET_VAR(data__->STABLE,)))) {
    __SET_VAR(data__->,PUWS_AL1_1_PLUS,,0);
  };
  if ((__GET_VAR(data__->P5,) || (__GET_VAR(data__->P6,) && __GET_VAR(data__->STABLE,)))) {
    __SET_VAR(data__->,PUWS_AL1_1_RT,,1);
  };
  if (((((__GET_VAR(data__->P1,) || __GET_VAR(data__->P2,)) || __GET_VAR(data__->P3,)) || __GET_VAR(data__->P4,)) || (__GET_VAR(data__->PB,) && __GET_VAR(data__->STABLE,)))) {
    __SET_VAR(data__->,PUWS_AL1_1_RT,,0);
  };
  if (((((__GET_VAR(data__->P1,) || __GET_VAR(data__->P2,)) || __GET_VAR(data__->P5,)) || __GET_VAR(data__->P6,)) || __GET_VAR(data__->PB,))) {
    __SET_VAR(data__->,CS_AL1_PLUS,,1);
  };
  if ((__GET_VAR(data__->P3,) || __GET_VAR(data__->P4,))) {
    __SET_VAR(data__->,CS_AL1_PLUS,,0);
  };

  goto __end;

__end:
  return;
} // SORTING_body__() 





