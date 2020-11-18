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





void ASSEMBLY_init__(ASSEMBLY *data__, BOOL retain) {
  __INIT_VAR(data__->RP_AL1_CLAMPED,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AL1_DETECTED,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LP_AL1_CLAMPED,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LP_AL1_LIMIT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RUNNING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AL1_X_POS,0,retain)
  __INIT_VAR(data__->AL1_Y_POS,0,retain)
  __INIT_VAR(data__->AL1_Z_POS,0,retain)
  __INIT_VAR(data__->AL1_GRAB,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RP_AL1_CLAMP,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LP_AL1_CLAMP,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LP_AL1_RAISE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AL1_X_SET,0,retain)
  __INIT_VAR(data__->AL1_Y_SET,0,retain)
  __INIT_VAR(data__->AL1_Z_SET,0,retain)
  __INIT_VAR(data__->PLF3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PLF4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PBF3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PBF4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PL9,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB9,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA0,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA8,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA9,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA10,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA11,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA12,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PA13,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STABLE,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void ASSEMBLY_body__(ASSEMBLY *data__) {
  // Initialise TEMP variables

  if (!(__GET_VAR(data__->RUNNING,))) {
    __SET_VAR(data__->,PLF3,,0);
    __SET_VAR(data__->,PLF4,,0);
    __SET_VAR(data__->,PBF3,,0);
    __SET_VAR(data__->,PBF4,,0);
    __SET_VAR(data__->,PL9,,1);
    __SET_VAR(data__->,PB9,,1);
    __SET_VAR(data__->,PA0,,1);
    __SET_VAR(data__->,PA1,,0);
    __SET_VAR(data__->,PA2,,0);
    __SET_VAR(data__->,PA3,,0);
    __SET_VAR(data__->,PA4,,0);
    __SET_VAR(data__->,PA5,,0);
    __SET_VAR(data__->,PA6,,0);
    __SET_VAR(data__->,PA7,,0);
    __SET_VAR(data__->,PA8,,0);
    __SET_VAR(data__->,PA9,,0);
    __SET_VAR(data__->,PA10,,0);
    __SET_VAR(data__->,PA11,,0);
    __SET_VAR(data__->,PA12,,0);
    __SET_VAR(data__->,PA13,,0);
  };
  __SET_VAR(data__->,STABLE,,0);
  while ((__GET_VAR(data__->STABLE,) == 0)) {
    __SET_VAR(data__->,STABLE,,1);
    if (((((__GET_VAR(data__->PL9,) && __GET_VAR(data__->PA0,)) && __GET_VAR(data__->RP_AL1_CLAMPED,)) && !(__GET_VAR(data__->AL1_DETECTED,))) && !(__GET_VAR(data__->PA1,)))) {
      __SET_VAR(data__->,PL9,,0);
      __SET_VAR(data__->,PA0,,0);
      __SET_VAR(data__->,PA1,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((((__GET_VAR(data__->PA1,) && (__GET_VAR(data__->AL1_X_POS,) > 798)) && (__GET_VAR(data__->AL1_X_POS,) < 802)) && (__GET_VAR(data__->AL1_Y_POS,) > 148)) && (__GET_VAR(data__->AL1_Y_POS,) < 152)) && !(__GET_VAR(data__->PA2,)))) {
      __SET_VAR(data__->,PA1,,0);
      __SET_VAR(data__->,PA2,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((__GET_VAR(data__->PA2,) && (__GET_VAR(data__->AL1_Z_POS,) > 798)) && (__GET_VAR(data__->AL1_Z_POS,) < 802)) && !(__GET_VAR(data__->PA3,)))) {
      __SET_VAR(data__->,PA2,,0);
      __SET_VAR(data__->,PA3,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->PA3,) && !(__GET_VAR(data__->RP_AL1_CLAMPED,))) && !(__GET_VAR(data__->PA4,)))) {
      __SET_VAR(data__->,PA3,,0);
      __SET_VAR(data__->,PA4,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((((__GET_VAR(data__->PA4,) && (__GET_VAR(data__->AL1_Z_POS,) > 398)) && (__GET_VAR(data__->AL1_Z_POS,) < 402)) && !(__GET_VAR(data__->PA5,))) && !(__GET_VAR(data__->PLF3,))) && !(__GET_VAR(data__->PLF4,)))) {
      __SET_VAR(data__->,PA4,,0);
      __SET_VAR(data__->,PA5,,1);
      __SET_VAR(data__->,PLF3,,1);
      __SET_VAR(data__->,PLF4,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((((((((__GET_VAR(data__->PA5,) && __GET_VAR(data__->PB9,)) && __GET_VAR(data__->AL1_DETECTED,)) && __GET_VAR(data__->LP_AL1_CLAMPED,)) && (__GET_VAR(data__->AL1_X_POS,) > 208)) && (__GET_VAR(data__->AL1_X_POS,) < 212)) && (__GET_VAR(data__->AL1_Y_POS,) > 148)) && (__GET_VAR(data__->AL1_Y_POS,) < 152)) && !(__GET_VAR(data__->PA6,)))) {
      __SET_VAR(data__->,PA5,,0);
      __SET_VAR(data__->,PB9,,0);
      __SET_VAR(data__->,PA6,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((__GET_VAR(data__->PA6,) && (__GET_VAR(data__->AL1_Z_POS,) > 810)) && (__GET_VAR(data__->AL1_Z_POS,) < 820)) && !(__GET_VAR(data__->PA7,)))) {
      __SET_VAR(data__->,PA6,,0);
      __SET_VAR(data__->,PA7,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((__GET_VAR(data__->PA7,) && (__GET_VAR(data__->AL1_Z_POS,) > 398)) && (__GET_VAR(data__->AL1_Z_POS,) < 402)) && !(__GET_VAR(data__->PA8,)))) {
      __SET_VAR(data__->,PA7,,0);
      __SET_VAR(data__->,PA8,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->PA8,) && !(__GET_VAR(data__->LP_AL1_CLAMPED,))) && !(__GET_VAR(data__->PA9,)))) {
      __SET_VAR(data__->,PA8,,0);
      __SET_VAR(data__->,PA9,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->PA9,) && !(__GET_VAR(data__->LP_AL1_LIMIT,))) && !(__GET_VAR(data__->PA10,)))) {
      __SET_VAR(data__->,PA9,,0);
      __SET_VAR(data__->,PA10,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->PA10,) && __GET_VAR(data__->LP_AL1_LIMIT,)) && !(__GET_VAR(data__->PA11,)))) {
      __SET_VAR(data__->,PA10,,0);
      __SET_VAR(data__->,PA11,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if (((__GET_VAR(data__->PA11,) && !(__GET_VAR(data__->LP_AL1_LIMIT,))) && !(__GET_VAR(data__->PA12,)))) {
      __SET_VAR(data__->,PA11,,0);
      __SET_VAR(data__->,PA12,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
    if ((((((__GET_VAR(data__->PA12,) && __GET_VAR(data__->LP_AL1_LIMIT,)) && !(__GET_VAR(data__->PA13,))) && !(__GET_VAR(data__->PA0,))) && !(__GET_VAR(data__->PBF3,))) && !(__GET_VAR(data__->PBF4,)))) {
      __SET_VAR(data__->,PA12,,0);
      __SET_VAR(data__->,PA13,,1);
      __SET_VAR(data__->,PA0,,1);
      __SET_VAR(data__->,PBF3,,1);
      __SET_VAR(data__->,PBF4,,1);
      __SET_VAR(data__->,STABLE,,0);
    };
  };
  if (__GET_VAR(data__->PA1,)) {
    __SET_VAR(data__->,AL1_X_SET,,800);
    __SET_VAR(data__->,AL1_Y_SET,,150);
  };
  if (__GET_VAR(data__->PA2,)) {
    __SET_VAR(data__->,AL1_Z_SET,,800);
  };
  if ((((__GET_VAR(data__->PA3,) || __GET_VAR(data__->PA4,)) || __GET_VAR(data__->PA5,)) || __GET_VAR(data__->PA6,))) {
    __SET_VAR(data__->,AL1_GRAB,,1);
  };
  if (((__GET_VAR(data__->PA0,) || __GET_VAR(data__->PA4,)) || __GET_VAR(data__->PA7,))) {
    __SET_VAR(data__->,AL1_Z_SET,,400);
  };
  if ((__GET_VAR(data__->PA0,) || __GET_VAR(data__->PA5,))) {
    __SET_VAR(data__->,AL1_X_SET,,210);
    __SET_VAR(data__->,AL1_Y_SET,,150);
  };
  if (__GET_VAR(data__->PA6,)) {
    __SET_VAR(data__->,AL1_Z_SET,,818);
  };
  if (((((((((__GET_VAR(data__->PA0,) || __GET_VAR(data__->PA1,)) || __GET_VAR(data__->PA2,)) || __GET_VAR(data__->PA7,)) || __GET_VAR(data__->PA8,)) || __GET_VAR(data__->PA9,)) || __GET_VAR(data__->PA10,)) || __GET_VAR(data__->PA11,)) || __GET_VAR(data__->PA12,))) {
    __SET_VAR(data__->,AL1_GRAB,,0);
  };
  if ((__GET_VAR(data__->PA1,) || __GET_VAR(data__->PA2,))) {
    __SET_VAR(data__->,RP_AL1_CLAMP,,1);
  };
  if (((__GET_VAR(data__->PA3,) || __GET_VAR(data__->PA4,)) || __GET_VAR(data__->PLF4,))) {
    __SET_VAR(data__->,RP_AL1_CLAMP,,0);
  };
  if (((((__GET_VAR(data__->PA8,) || __GET_VAR(data__->PA9,)) || __GET_VAR(data__->PA10,)) || __GET_VAR(data__->PA11,)) || __GET_VAR(data__->PA12,))) {
    __SET_VAR(data__->,LP_AL1_CLAMP,,0);
  };
  if (((__GET_VAR(data__->PB9,) || __GET_VAR(data__->PA6,)) || __GET_VAR(data__->PA7,))) {
    __SET_VAR(data__->,LP_AL1_CLAMP,,1);
  };
  if (((((((((((__GET_VAR(data__->PA0,) || __GET_VAR(data__->PA1,)) || __GET_VAR(data__->PA2,)) || __GET_VAR(data__->PA3,)) || __GET_VAR(data__->PA4,)) || __GET_VAR(data__->PA5,)) || __GET_VAR(data__->PA6,)) || __GET_VAR(data__->PA7,)) || __GET_VAR(data__->PA8,)) || __GET_VAR(data__->PA11,)) || __GET_VAR(data__->PA12,))) {
    __SET_VAR(data__->,LP_AL1_RAISE,,0);
  };
  if ((__GET_VAR(data__->PA9,) || __GET_VAR(data__->PA10,))) {
    __SET_VAR(data__->,LP_AL1_RAISE,,1);
  };

  goto __end;

__end:
  return;
} // ASSEMBLY_body__() 





