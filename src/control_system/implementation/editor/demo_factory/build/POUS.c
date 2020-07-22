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





void DEMO_FACTORY_init__(DEMO_FACTORY *data__, BOOL retain) {
  __INIT_VAR(data__->ST_X,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST_Z,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_L,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SL_P,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SL_M,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SBC,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SB_P,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SB_M,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESET,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AT_X,0,retain)
  __INIT_VAR(data__->AT_Z,0,retain)
  __INIT_VAR(data__->AT_G,0,retain)
  __INIT_VAR(data__->AL_C,0,retain)
  __INIT_VAR(data__->AL_M,0,retain)
  __INIT_VAR(data__->RB_M,0,retain)
  __INIT_VAR(data__->AB_C,0,retain)
  __INIT_VAR(data__->AB_M,0,retain)
  TON_init__(&data__->TM_1_TA1,retain);
  TON_init__(&data__->TM_1_TC3,retain);
  TON_init__(&data__->TM_1_TB1,retain);
  TON_init__(&data__->TM_1_TD3,retain);
  TON_init__(&data__->TM_2_TA3,retain);
  TON_init__(&data__->TM_2_TB3,retain);
  __INIT_VAR(data__->STABLE,1,retain)
  __INIT_VAR(data__->PA1,1,retain)
  __INIT_VAR(data__->PA2,0,retain)
  __INIT_VAR(data__->PA3,0,retain)
  __INIT_VAR(data__->PA4,0,retain)
  __INIT_VAR(data__->PB1,1,retain)
  __INIT_VAR(data__->PB2,0,retain)
  __INIT_VAR(data__->PB3,0,retain)
  __INIT_VAR(data__->PB4,0,retain)
  __INIT_VAR(data__->PC1,0,retain)
  __INIT_VAR(data__->PC2,0,retain)
  __INIT_VAR(data__->PC3,0,retain)
  __INIT_VAR(data__->PC4,0,retain)
  __INIT_VAR(data__->PC5,0,retain)
  __INIT_VAR(data__->PC6,0,retain)
  __INIT_VAR(data__->PC7,0,retain)
  __INIT_VAR(data__->PC8,0,retain)
  __INIT_VAR(data__->PD1,0,retain)
  __INIT_VAR(data__->PD2,0,retain)
  __INIT_VAR(data__->PD3,0,retain)
  __INIT_VAR(data__->PE1,0,retain)
  __INIT_VAR(data__->PE2,0,retain)
  __INIT_VAR(data__->PE3,0,retain)
  __INIT_VAR(data__->PE4,0,retain)
  __INIT_VAR(data__->PE5,0,retain)
  __INIT_VAR(data__->PE6,0,retain)
  __INIT_VAR(data__->PE7,0,retain)
  __INIT_VAR(data__->PF1,0,retain)
  __INIT_VAR(data__->PF2,0,retain)
  __INIT_VAR(data__->PF3,0,retain)
  __INIT_VAR(data__->PF4,0,retain)
  __INIT_VAR(data__->PF5,1,retain)
}

// Code part
void DEMO_FACTORY_body__(DEMO_FACTORY *data__) {
  // Initialise TEMP variables

  if (!(__GET_VAR(data__->RESET,))) {
    __SET_VAR(data__->,PA1,,1);
    __SET_VAR(data__->,PA2,,0);
    __SET_VAR(data__->,PA3,,0);
    __SET_VAR(data__->,PA4,,0);
    __SET_VAR(data__->,PB1,,1);
    __SET_VAR(data__->,PB2,,0);
    __SET_VAR(data__->,PB3,,0);
    __SET_VAR(data__->,PB4,,0);
    __SET_VAR(data__->,PC1,,0);
    __SET_VAR(data__->,PC2,,0);
    __SET_VAR(data__->,PC3,,0);
    __SET_VAR(data__->,PC4,,0);
    __SET_VAR(data__->,PC5,,0);
    __SET_VAR(data__->,PC6,,0);
    __SET_VAR(data__->,PC7,,0);
    __SET_VAR(data__->,PC8,,0);
    __SET_VAR(data__->,PD1,,0);
    __SET_VAR(data__->,PD2,,0);
    __SET_VAR(data__->,PD3,,0);
    __SET_VAR(data__->,PE1,,0);
    __SET_VAR(data__->,PE2,,0);
    __SET_VAR(data__->,PE3,,0);
    __SET_VAR(data__->,PE4,,0);
    __SET_VAR(data__->,PE5,,0);
    __SET_VAR(data__->,PE6,,0);
    __SET_VAR(data__->,PE7,,0);
    __SET_VAR(data__->,PF1,,0);
    __SET_VAR(data__->,PF2,,0);
    __SET_VAR(data__->,PF3,,0);
    __SET_VAR(data__->,PF4,,0);
    __SET_VAR(data__->,PF5,,1);
  };
  __SET_VAR(data__->TM_1_TA1.,IN,,__GET_VAR(data__->PA1,));
  __SET_VAR(data__->TM_1_TA1.,PT,,__time_to_timespec(1, 1000, 0, 0, 0, 0));
  TON_body__(&data__->TM_1_TA1);
  __SET_VAR(data__->TM_1_TC3.,IN,,__GET_VAR(data__->PC3,));
  __SET_VAR(data__->TM_1_TC3.,PT,,__time_to_timespec(1, 1000, 0, 0, 0, 0));
  TON_body__(&data__->TM_1_TC3);
  __SET_VAR(data__->TM_1_TB1.,IN,,__GET_VAR(data__->PB1,));
  __SET_VAR(data__->TM_1_TB1.,PT,,__time_to_timespec(1, 1000, 0, 0, 0, 0));
  TON_body__(&data__->TM_1_TB1);
  __SET_VAR(data__->TM_1_TD3.,IN,,__GET_VAR(data__->PD3,));
  __SET_VAR(data__->TM_1_TD3.,PT,,__time_to_timespec(1, 1000, 0, 0, 0, 0));
  TON_body__(&data__->TM_1_TD3);
  __SET_VAR(data__->TM_2_TA3.,IN,,__GET_VAR(data__->PA3,));
  __SET_VAR(data__->TM_2_TA3.,PT,,__time_to_timespec(1, 2000, 0, 0, 0, 0));
  TON_body__(&data__->TM_2_TA3);
  __SET_VAR(data__->TM_2_TB3.,IN,,__GET_VAR(data__->PB3,));
  __SET_VAR(data__->TM_2_TB3.,PT,,__time_to_timespec(1, 2000, 0, 0, 0, 0));
  TON_body__(&data__->TM_2_TB3);
  __SET_VAR(data__->,STABLE,,1);
  if (((__GET_VAR(data__->PA1,) && !(__GET_VAR(data__->PA2,))) && __GET_VAR(data__->TM_1_TA1.Q,))) {
    __SET_VAR(data__->,PA1,,0);
    __SET_VAR(data__->,PA2,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PA2,) && !(__GET_VAR(data__->PA3,))) && __GET_VAR(data__->SL_P,))) {
    __SET_VAR(data__->,PA2,,0);
    __SET_VAR(data__->,PA3,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PA3,) && !(__GET_VAR(data__->PA4,))) && __GET_VAR(data__->TM_2_TA3.Q,))) {
    __SET_VAR(data__->,PA3,,0);
    __SET_VAR(data__->,PA4,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PB1,) && !(__GET_VAR(data__->PB2,))) && __GET_VAR(data__->TM_1_TB1.Q,))) {
    __SET_VAR(data__->,PB1,,0);
    __SET_VAR(data__->,PB2,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PB2,) && !(__GET_VAR(data__->PB3,))) && __GET_VAR(data__->SB_P,))) {
    __SET_VAR(data__->,PB2,,0);
    __SET_VAR(data__->,PB3,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PB3,) && !(__GET_VAR(data__->PB4,))) && __GET_VAR(data__->TM_2_TB3.Q,))) {
    __SET_VAR(data__->,PB3,,0);
    __SET_VAR(data__->,PB4,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PC1,) && !(__GET_VAR(data__->PC2,))) && __GET_VAR(data__->ST_Z,))) {
    __SET_VAR(data__->,PC1,,0);
    __SET_VAR(data__->,PC2,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PC2,) && !(__GET_VAR(data__->PC3,))) && !(__GET_VAR(data__->ST_Z,)))) {
    __SET_VAR(data__->,PC2,,0);
    __SET_VAR(data__->,PC3,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PC3,) && !(__GET_VAR(data__->PC4,))) && __GET_VAR(data__->TM_1_TC3.Q,))) {
    __SET_VAR(data__->,PC3,,0);
    __SET_VAR(data__->,PC4,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PC4,) && !(__GET_VAR(data__->PC5,))) && !(__GET_VAR(data__->SL_M,)))) {
    __SET_VAR(data__->,PC4,,0);
    __SET_VAR(data__->,PC5,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PC5,) && !(__GET_VAR(data__->PC6,))) && __GET_VAR(data__->ST_Z,))) {
    __SET_VAR(data__->,PC5,,0);
    __SET_VAR(data__->,PC6,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PC6,) && !(__GET_VAR(data__->PC7,))) && !(__GET_VAR(data__->ST_Z,)))) {
    __SET_VAR(data__->,PC6,,0);
    __SET_VAR(data__->,PC7,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PC7,) && !(__GET_VAR(data__->PC8,))) && __GET_VAR(data__->ST_X,))) {
    __SET_VAR(data__->,PC7,,0);
    __SET_VAR(data__->,PC8,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PD1,) && !(__GET_VAR(data__->PD2,))) && __GET_VAR(data__->ST_Z,))) {
    __SET_VAR(data__->,PD1,,0);
    __SET_VAR(data__->,PD2,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PD2,) && !(__GET_VAR(data__->PD3,))) && !(__GET_VAR(data__->ST_Z,)))) {
    __SET_VAR(data__->,PD2,,0);
    __SET_VAR(data__->,PD3,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PE1,) && !(__GET_VAR(data__->PE2,))) && !(__GET_VAR(data__->SB_M,)))) {
    __SET_VAR(data__->,PE1,,0);
    __SET_VAR(data__->,PE2,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PE2,) && !(__GET_VAR(data__->PE3,))) && !(__GET_VAR(data__->SBC,)))) {
    __SET_VAR(data__->,PE2,,0);
    __SET_VAR(data__->,PE3,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PE3,) && !(__GET_VAR(data__->PE4,))) && __GET_VAR(data__->SBC,))) {
    __SET_VAR(data__->,PE3,,0);
    __SET_VAR(data__->,PE4,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PE4,) && !(__GET_VAR(data__->PE5,))) && __GET_VAR(data__->S_L,))) {
    __SET_VAR(data__->,PE4,,0);
    __SET_VAR(data__->,PE5,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PE5,) && !(__GET_VAR(data__->PE6,))) && !(__GET_VAR(data__->S_L,)))) {
    __SET_VAR(data__->,PE5,,0);
    __SET_VAR(data__->,PE6,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PE6,) && !(__GET_VAR(data__->PE7,))) && !(__GET_VAR(data__->SBC,)))) {
    __SET_VAR(data__->,PE6,,0);
    __SET_VAR(data__->,PE7,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PF1,) && !(__GET_VAR(data__->PF2,))) && __GET_VAR(data__->ST_Z,))) {
    __SET_VAR(data__->,PF1,,0);
    __SET_VAR(data__->,PF2,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if ((((__GET_VAR(data__->PF2,) && !(__GET_VAR(data__->PF3,))) && !(__GET_VAR(data__->ST_Z,))) && !(__GET_VAR(data__->S_L,)))) {
    __SET_VAR(data__->,PF2,,0);
    __SET_VAR(data__->,PF3,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PF3,) && !(__GET_VAR(data__->PF4,))) && __GET_VAR(data__->ST_Z,))) {
    __SET_VAR(data__->,PF3,,0);
    __SET_VAR(data__->,PF4,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((__GET_VAR(data__->PF4,) && !(__GET_VAR(data__->PF5,))) && !(__GET_VAR(data__->ST_X,)))) {
    __SET_VAR(data__->,PF4,,0);
    __SET_VAR(data__->,PF5,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if ((((__GET_VAR(data__->PA4,) && __GET_VAR(data__->PF5,)) && !(__GET_VAR(data__->PC1,))) && __GET_VAR(data__->SL_M,))) {
    __SET_VAR(data__->,PA4,,0);
    __SET_VAR(data__->,PF5,,0);
    __SET_VAR(data__->,PC1,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if (((((__GET_VAR(data__->PB4,) && __GET_VAR(data__->PC8,)) && !(__GET_VAR(data__->PD1,))) && !(__GET_VAR(data__->ST_X,))) && __GET_VAR(data__->SB_M,))) {
    __SET_VAR(data__->,PB4,,0);
    __SET_VAR(data__->,PC8,,0);
    __SET_VAR(data__->,PD1,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if ((((__GET_VAR(data__->PD3,) && !(__GET_VAR(data__->PF1,))) && !(__GET_VAR(data__->PE1,))) && __GET_VAR(data__->TM_1_TD3.Q,))) {
    __SET_VAR(data__->,PD3,,0);
    __SET_VAR(data__->,PF1,,1);
    __SET_VAR(data__->,PE1,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if ((((__GET_VAR(data__->PE7,) && !(__GET_VAR(data__->PA1,))) && !(__GET_VAR(data__->PB1,))) && __GET_VAR(data__->SBC,))) {
    __SET_VAR(data__->,PE7,,0);
    __SET_VAR(data__->,PA1,,1);
    __SET_VAR(data__->,PB1,,1);
    __SET_VAR(data__->,STABLE,,0);
  };
  if ((__GET_VAR(data__->PA2,) || __GET_VAR(data__->PA3,))) {
    __SET_VAR(data__->,AL_C,,1);
  };
  if (__GET_VAR(data__->PA4,)) {
    __SET_VAR(data__->,AL_C,,0);
    __SET_VAR(data__->,AL_M,,1);
  };
  if ((__GET_VAR(data__->PB2,) || __GET_VAR(data__->PB3,))) {
    __SET_VAR(data__->,AB_C,,1);
  };
  if (__GET_VAR(data__->PB4,)) {
    __SET_VAR(data__->,AB_C,,0);
    __SET_VAR(data__->,AB_M,,1);
  };
  if ((((__GET_VAR(data__->PC1,) || __GET_VAR(data__->PC2,)) || __GET_VAR(data__->PD1,)) || __GET_VAR(data__->PD2,))) {
    __SET_VAR(data__->,AT_Z,,1);
  };
  if (__GET_VAR(data__->PC3,)) {
    __SET_VAR(data__->,AT_G,,1);
  };
  if (__GET_VAR(data__->PC4,)) {
    __SET_VAR(data__->,AL_M,,0);
  };
  if ((((__GET_VAR(data__->PC5,) || __GET_VAR(data__->PC6,)) || __GET_VAR(data__->PF1,)) || __GET_VAR(data__->PF2,))) {
    __SET_VAR(data__->,AT_Z,,0);
  };
  if ((((__GET_VAR(data__->PC7,) || __GET_VAR(data__->PC8,)) || __GET_VAR(data__->PF3,)) || __GET_VAR(data__->PF4,))) {
    __SET_VAR(data__->,AT_X,,1);
  };
  if (__GET_VAR(data__->PD3,)) {
    __SET_VAR(data__->,AT_G,,0);
  };
  if (__GET_VAR(data__->PE1,)) {
    __SET_VAR(data__->,AB_M,,0);
  };
  if ((__GET_VAR(data__->PE2,) || __GET_VAR(data__->PE3,))) {
    __SET_VAR(data__->,RB_M,,1);
  };
  if (__GET_VAR(data__->PE4,)) {
    __SET_VAR(data__->,AB_C,,1);
  };
  if (__GET_VAR(data__->PE5,)) {
    __SET_VAR(data__->,RB_M,,1);
    __SET_VAR(data__->,AB_C,,1);
  };
  if ((__GET_VAR(data__->PE6,) || __GET_VAR(data__->PE7,))) {
    __SET_VAR(data__->,RB_M,,0);
  };
  if (__GET_VAR(data__->PF5,)) {
    __SET_VAR(data__->,AT_X,,0);
  };

  goto __end;

__end:
  return;
} // DEMO_FACTORY_body__() 





