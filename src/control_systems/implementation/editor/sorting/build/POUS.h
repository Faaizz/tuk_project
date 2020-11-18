#include "beremiz.h"
#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

__DECLARE_ENUMERATED_TYPE(LOGLEVEL,
  LOGLEVEL__CRITICAL,
  LOGLEVEL__WARNING,
  LOGLEVEL__INFO,
  LOGLEVEL__DEBUG
)
// FUNCTION_BLOCK LOGGER
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,MSG)
  __DECLARE_VAR(LOGLEVEL,LEVEL)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,TRIG0)

} LOGGER;

void LOGGER_init__(LOGGER *data__, BOOL retain);
// Code part
void LOGGER_body__(LOGGER *data__);
// FUNCTION_BLOCK PYTHON_EVAL
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(DWORD,STATE)
  __DECLARE_VAR(STRING,BUFFER)
  __DECLARE_VAR(STRING,PREBUFFER)
  __DECLARE_VAR(BOOL,TRIGM1)
  __DECLARE_VAR(BOOL,TRIGGED)

} PYTHON_EVAL;

void PYTHON_EVAL_init__(PYTHON_EVAL *data__, BOOL retain);
// Code part
void PYTHON_EVAL_body__(PYTHON_EVAL *data__);
// FUNCTION_BLOCK PYTHON_POLL
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(DWORD,STATE)
  __DECLARE_VAR(STRING,BUFFER)
  __DECLARE_VAR(STRING,PREBUFFER)
  __DECLARE_VAR(BOOL,TRIGM1)
  __DECLARE_VAR(BOOL,TRIGGED)

} PYTHON_POLL;

void PYTHON_POLL_init__(PYTHON_POLL *data__, BOOL retain);
// Code part
void PYTHON_POLL_body__(PYTHON_POLL *data__);
// FUNCTION_BLOCK PYTHON_GEAR
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(UINT,N)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  PYTHON_EVAL PY_EVAL;
  __DECLARE_VAR(UINT,COUNTER)
  __DECLARE_VAR(UINT,ADD10_OUT)
  __DECLARE_VAR(BOOL,EQ13_OUT)
  __DECLARE_VAR(UINT,SEL15_OUT)
  __DECLARE_VAR(BOOL,AND7_OUT)

} PYTHON_GEAR;

void PYTHON_GEAR_init__(PYTHON_GEAR *data__, BOOL retain);
// Code part
void PYTHON_GEAR_body__(PYTHON_GEAR *data__);
// PROGRAM SORTING
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables

  // PROGRAM private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,S_AL1)
  __DECLARE_VAR(BOOL,S_BIN_1)
  __DECLARE_VAR(BOOL,S_AL1_BL)
  __DECLARE_VAR(BOOL,RUNNING)
  __DECLARE_VAR(INT,CS_AL1_W)
  __DECLARE_VAR(BOOL,SB_AL1)
  __DECLARE_VAR(BOOL,PUWS_AL1_1_PLUS)
  __DECLARE_VAR(BOOL,PUWS_AL1_1_RT)
  __DECLARE_VAR(BOOL,CS_AL1_PLUS)
  __DECLARE_VAR(BOOL,STABLE)
  __DECLARE_VAR(BOOL,P0)
  __DECLARE_VAR(BOOL,P1)
  __DECLARE_VAR(BOOL,P2)
  __DECLARE_VAR(BOOL,P3)
  __DECLARE_VAR(BOOL,P4)
  __DECLARE_VAR(BOOL,PB)
  __DECLARE_VAR(BOOL,P5)
  __DECLARE_VAR(BOOL,P6)
  __DECLARE_VAR(BOOL,BIN1)
  __DECLARE_VAR(BOOL,BIN2)
  __DECLARE_VAR(BOOL,P_LID)
  __DECLARE_VAR(BOOL,P_BASE)
  __DECLARE_VAR(BOOL,PRODUCTION)
  TON TIMER_1_P2;
  TON TIMER_1_P3;

} SORTING;

void SORTING_init__(SORTING *data__, BOOL retain);
// Code part
void SORTING_body__(SORTING *data__);
#endif //__POUS_H
