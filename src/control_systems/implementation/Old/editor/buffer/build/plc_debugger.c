/*
 * DEBUGGER code
 * 
 * On "publish", when buffer is free, debugger stores arbitrary variables 
 * content into, and mark this buffer as filled
 * 
 * 
 * Buffer content is read asynchronously, (from non real time part), 
 * and then buffer marked free again.
 *  
 * 
 * */
#ifdef TARGET_DEBUG_AND_RETAIN_DISABLE

void __init_debug    (void){}
void __cleanup_debug (void){}
void __retrieve_debug(void){}
void __publish_debug (void){}

#else

#include "iec_types_all.h"
#include "POUS.h"
/*for memcpy*/
#include <string.h>
#include <stdio.h>

#ifndef TARGET_ONLINE_DEBUG_DISABLE
#define BUFFER_SIZE 136

/* Atomically accessed variable for buffer state */
#define BUFFER_FREE 0
#define BUFFER_BUSY 1
static long buffer_state = BUFFER_FREE;

/* The buffer itself */
char debug_buffer[BUFFER_SIZE];

/* Buffer's cursor*/
static char* buffer_cursor = debug_buffer;
#endif

static unsigned int retain_offset = 0;
/***
 * Declare programs 
 **/
extern BUFFER_STAGE RES0__INSTANCE0;

/***
 * Declare global variables from resources and conf 
 **/
extern       BUFFER_STAGE   RES0__INSTANCE0;

typedef const struct {
    void *ptr;
    __IEC_types_enum type;
} dbgvardsc_t;

static dbgvardsc_t dbgvardsc[] = {
{&(RES0__INSTANCE0.S_AL1_B), BOOL_ENUM},
{&(RES0__INSTANCE0.P_AL1_B_FT), BOOL_ENUM},
{&(RES0__INSTANCE0.P_AL1_B_BK), BOOL_ENUM},
{&(RES0__INSTANCE0.S_AL1_B1), BOOL_ENUM},
{&(RES0__INSTANCE0.S_AL1_B2), BOOL_ENUM},
{&(RES0__INSTANCE0.S_AL1_B3), BOOL_ENUM},
{&(RES0__INSTANCE0.LP_AL1_CLAMPED), BOOL_ENUM},
{&(RES0__INSTANCE0.S_AL1_LP), BOOL_ENUM},
{&(RES0__INSTANCE0.S_AL1_L), BOOL_ENUM},
{&(RES0__INSTANCE0.P_AL1_L_FT), BOOL_ENUM},
{&(RES0__INSTANCE0.P_AL1_L_BK), BOOL_ENUM},
{&(RES0__INSTANCE0.S_AL1_L1), BOOL_ENUM},
{&(RES0__INSTANCE0.S_AL1_L2), BOOL_ENUM},
{&(RES0__INSTANCE0.S_AL1_L3), BOOL_ENUM},
{&(RES0__INSTANCE0.RP_AL1_CLAMPED), BOOL_ENUM},
{&(RES0__INSTANCE0.S_AL1_RP), BOOL_ENUM},
{&(RES0__INSTANCE0.RUNNING), BOOL_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TB1.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TB1.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TB1.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TB1.PT), TIME_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TB1.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TB1.ET), TIME_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TB1.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TB1.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TB1.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TB1.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TL1.EN), BOOL_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TL1.ENO), BOOL_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TL1.IN), BOOL_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TL1.PT), TIME_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TL1.Q), BOOL_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TL1.ET), TIME_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TL1.STATE), SINT_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TL1.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TL1.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.TIMER_1_TL1.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE0.P_AL1_B), BOOL_ENUM},
{&(RES0__INSTANCE0.SB_AL1_B1), BOOL_ENUM},
{&(RES0__INSTANCE0.SB_AL1_B2), BOOL_ENUM},
{&(RES0__INSTANCE0.SB_AL1_B3), BOOL_ENUM},
{&(RES0__INSTANCE0.LP_AL1_CLAMP), BOOL_ENUM},
{&(RES0__INSTANCE0.P_AL1_L), BOOL_ENUM},
{&(RES0__INSTANCE0.SB_AL1_L1), BOOL_ENUM},
{&(RES0__INSTANCE0.SB_AL1_L2), BOOL_ENUM},
{&(RES0__INSTANCE0.SB_AL1_L3), BOOL_ENUM},
{&(RES0__INSTANCE0.RP_AL1_CLAMP), BOOL_ENUM},
{&(RES0__INSTANCE0.P_BASE), BOOL_ENUM},
{&(RES0__INSTANCE0.PB1), BOOL_ENUM},
{&(RES0__INSTANCE0.PUSH_B), BOOL_ENUM},
{&(RES0__INSTANCE0.PB2), BOOL_ENUM},
{&(RES0__INSTANCE0.PB23), BOOL_ENUM},
{&(RES0__INSTANCE0.PB3), BOOL_ENUM},
{&(RES0__INSTANCE0.PB4), BOOL_ENUM},
{&(RES0__INSTANCE0.PB5), BOOL_ENUM},
{&(RES0__INSTANCE0.PB6), BOOL_ENUM},
{&(RES0__INSTANCE0.PB7), BOOL_ENUM},
{&(RES0__INSTANCE0.PB8), BOOL_ENUM},
{&(RES0__INSTANCE0.PB9), BOOL_ENUM},
{&(RES0__INSTANCE0.PBF1), BOOL_ENUM},
{&(RES0__INSTANCE0.PBF2), BOOL_ENUM},
{&(RES0__INSTANCE0.PBF3), BOOL_ENUM},
{&(RES0__INSTANCE0.PBF4), BOOL_ENUM},
{&(RES0__INSTANCE0.P_LID), BOOL_ENUM},
{&(RES0__INSTANCE0.PL1), BOOL_ENUM},
{&(RES0__INSTANCE0.PL2), BOOL_ENUM},
{&(RES0__INSTANCE0.PUSH_L), BOOL_ENUM},
{&(RES0__INSTANCE0.PL23), BOOL_ENUM},
{&(RES0__INSTANCE0.PL3), BOOL_ENUM},
{&(RES0__INSTANCE0.PL4), BOOL_ENUM},
{&(RES0__INSTANCE0.PL5), BOOL_ENUM},
{&(RES0__INSTANCE0.PL6), BOOL_ENUM},
{&(RES0__INSTANCE0.PL7), BOOL_ENUM},
{&(RES0__INSTANCE0.PL8), BOOL_ENUM},
{&(RES0__INSTANCE0.PL9), BOOL_ENUM},
{&(RES0__INSTANCE0.PLF1), BOOL_ENUM},
{&(RES0__INSTANCE0.PLF2), BOOL_ENUM},
{&(RES0__INSTANCE0.PLF3), BOOL_ENUM},
{&(RES0__INSTANCE0.PLF4), BOOL_ENUM},
{&(RES0__INSTANCE0.STABLE), BOOL_ENUM}
};

typedef void(*__for_each_variable_do_fp)(dbgvardsc_t*);
void __for_each_variable_do(__for_each_variable_do_fp fp)
{
    unsigned int i;
    for(i = 0; i < sizeof(dbgvardsc)/sizeof(dbgvardsc_t); i++){
        dbgvardsc_t *dsc = &dbgvardsc[i];
        if(dsc->type != UNKNOWN_ENUM) 
            (*fp)(dsc);
    }
}

#define __Unpack_case_t(TYPENAME) \
        case TYPENAME##_ENUM :\
            *flags = ((__IEC_##TYPENAME##_t *)varp)->flags;\
            forced_value_p = *real_value_p = &((__IEC_##TYPENAME##_t *)varp)->value;\
            break;

#define __Unpack_case_p(TYPENAME)\
        case TYPENAME##_O_ENUM :\
            *flags = __IEC_OUTPUT_FLAG;\
        case TYPENAME##_P_ENUM :\
            *flags |= ((__IEC_##TYPENAME##_p *)varp)->flags;\
            *real_value_p = ((__IEC_##TYPENAME##_p *)varp)->value;\
            forced_value_p = &((__IEC_##TYPENAME##_p *)varp)->fvalue;\
            break;

void* UnpackVar(dbgvardsc_t *dsc, void **real_value_p, char *flags)
{
    void *varp = dsc->ptr;
    void *forced_value_p = NULL;
    *flags = 0;
    /* find data to copy*/
    switch(dsc->type){
        __ANY(__Unpack_case_t)
        __ANY(__Unpack_case_p)
    default:
        break;
    }
    if (*flags & __IEC_FORCE_FLAG)
        return forced_value_p;
    return *real_value_p;
}

void Remind(unsigned int offset, unsigned int count, void * p);

void RemindIterator(dbgvardsc_t *dsc)
{
    void *real_value_p = NULL;
    char flags = 0;
    UnpackVar(dsc, &real_value_p, &flags);

    if(flags & __IEC_RETAIN_FLAG){
        USINT size = __get_type_enum_size(dsc->type);
        /* compute next cursor positon*/
        unsigned int next_retain_offset = retain_offset + size;
        /* if buffer not full */
        Remind(retain_offset, size, real_value_p);
        /* increment cursor according size*/
        retain_offset = next_retain_offset;
    }
}

extern int CheckRetainBuffer(void);
extern void InitRetain(void);

void __init_debug(void)
{
    /* init local static vars */
#ifndef TARGET_ONLINE_DEBUG_DISABLE	
    buffer_cursor = debug_buffer;
    buffer_state = BUFFER_FREE;
#endif

    retain_offset = 0;
    InitRetain();
    /* Iterate over all variables to fill debug buffer */
    if(CheckRetainBuffer()){
    	__for_each_variable_do(RemindIterator);
    }else{
    	char mstr[] = "RETAIN memory invalid - defaults used";
        LogMessage(LOG_WARNING, mstr, sizeof(mstr));
    }
    retain_offset = 0;
}

extern void InitiateDebugTransfer(void);
extern void CleanupRetain(void);

extern unsigned long __tick;

void __cleanup_debug(void)
{
#ifndef TARGET_ONLINE_DEBUG_DISABLE	
    buffer_cursor = debug_buffer;
    InitiateDebugTransfer();
#endif    

    CleanupRetain();
}

void __retrieve_debug(void)
{
}


void Retain(unsigned int offset, unsigned int count, void * p);

static inline void BufferIterator(dbgvardsc_t *dsc, int do_debug)
{
    void *real_value_p = NULL;
    void *visible_value_p = NULL;
    char flags = 0;

    visible_value_p = UnpackVar(dsc, &real_value_p, &flags);

    if(flags & ( __IEC_DEBUG_FLAG | __IEC_RETAIN_FLAG)){
        USINT size = __get_type_enum_size(dsc->type);

#ifndef TARGET_ONLINE_DEBUG_DISABLE	
        if(flags & __IEC_DEBUG_FLAG){
            /* copy visible variable to buffer */;
            if(do_debug){
                /* compute next cursor positon.
                   No need to check overflow, as BUFFER_SIZE
                   is computed large enough */
		if((dsc->type == STRING_ENUM)   ||
		   (dsc->type == STRING_P_ENUM) ||
		   (dsc->type == STRING_O_ENUM)){
                    /* optimization for strings */
                    size = ((STRING*)visible_value_p)->len + 1;
                }
                char* next_cursor = buffer_cursor + size;
                /* copy data to the buffer */
                memcpy(buffer_cursor, visible_value_p, size);
                /* increment cursor according size*/
                buffer_cursor = next_cursor;
            }
            /* re-force real value of outputs (M and Q)*/
            if((flags & __IEC_FORCE_FLAG) && (flags & __IEC_OUTPUT_FLAG)){
                memcpy(real_value_p, visible_value_p, size);
            }
        }
#endif	

        if(flags & __IEC_RETAIN_FLAG){
            /* compute next cursor positon*/
            unsigned int next_retain_offset = retain_offset + size;
            /* if buffer not full */
            Retain(retain_offset, size, real_value_p);
            /* increment cursor according size*/
            retain_offset = next_retain_offset;
        }
    }
}

void DebugIterator(dbgvardsc_t *dsc){
    BufferIterator(dsc, 1);
}

void RetainIterator(dbgvardsc_t *dsc){
    BufferIterator(dsc, 0);
}


unsigned int retain_size = 0;

/* GetRetainSizeIterator */
void GetRetainSizeIterator(dbgvardsc_t *dsc)
{
    void *real_value_p = NULL;
    char flags = 0;
    UnpackVar(dsc, &real_value_p, &flags);

    if(flags & __IEC_RETAIN_FLAG){
        USINT size = __get_type_enum_size(dsc->type);
        /* Calc retain buffer size */
        retain_size += size;
    }
}

/* Return size of all retain variables */
unsigned int GetRetainSize(void)
{
    __for_each_variable_do(GetRetainSizeIterator);
    return retain_size;
}


extern void PLC_GetTime(IEC_TIME*);
extern int TryEnterDebugSection(void);
extern long AtomicCompareExchange(long*, long, long);
extern long long AtomicCompareExchange64(long long* , long long , long long);
extern void LeaveDebugSection(void);
extern void ValidateRetainBuffer(void);
extern void InValidateRetainBuffer(void);

void __publish_debug(void)
{
    retain_offset = 0;
    InValidateRetainBuffer();
    
#ifndef TARGET_ONLINE_DEBUG_DISABLE 
    /* Check there is no running debugger re-configuration */
    if(TryEnterDebugSection()){
        /* Lock buffer */
        long latest_state = AtomicCompareExchange(
            &buffer_state,
            BUFFER_FREE,
            BUFFER_BUSY);
            
        /* If buffer was free */
        if(latest_state == BUFFER_FREE)
        {
            /* Reset buffer cursor */
            buffer_cursor = debug_buffer;
            /* Iterate over all variables to fill debug buffer */
            __for_each_variable_do(DebugIterator);
            
            /* Leave debug section,
             * Trigger asynchronous transmission 
             * (returns immediately) */
            InitiateDebugTransfer(); /* size */
        }else{
            /* when not debugging, do only retain */
            __for_each_variable_do(RetainIterator);
        }
        LeaveDebugSection();
    }else
#endif
    {
        /* when not debugging, do only retain */
        __for_each_variable_do(RetainIterator);
    }
    ValidateRetainBuffer();
}

#ifndef TARGET_ONLINE_DEBUG_DISABLE
#define __RegisterDebugVariable_case_t(TYPENAME) \
        case TYPENAME##_ENUM :\
            ((__IEC_##TYPENAME##_t *)varp)->flags |= flags;\
            if(force)\
             ((__IEC_##TYPENAME##_t *)varp)->value = *((TYPENAME *)force);\
            break;
#define __RegisterDebugVariable_case_p(TYPENAME)\
        case TYPENAME##_P_ENUM :\
            ((__IEC_##TYPENAME##_p *)varp)->flags |= flags;\
            if(force)\
             ((__IEC_##TYPENAME##_p *)varp)->fvalue = *((TYPENAME *)force);\
            break;\
        case TYPENAME##_O_ENUM :\
            ((__IEC_##TYPENAME##_p *)varp)->flags |= flags;\
            if(force){\
             ((__IEC_##TYPENAME##_p *)varp)->fvalue = *((TYPENAME *)force);\
             *(((__IEC_##TYPENAME##_p *)varp)->value) = *((TYPENAME *)force);\
            }\
            break;
void RegisterDebugVariable(unsigned int idx, void* force)
{
    if(idx  < sizeof(dbgvardsc)/sizeof(dbgvardsc_t)){
        unsigned char flags = force ?
            __IEC_DEBUG_FLAG | __IEC_FORCE_FLAG :
            __IEC_DEBUG_FLAG;
        dbgvardsc_t *dsc = &dbgvardsc[idx];
        void *varp = dsc->ptr;
        switch(dsc->type){
            __ANY(__RegisterDebugVariable_case_t)
            __ANY(__RegisterDebugVariable_case_p)
        default:
            break;
        }
    }
}

#define __ResetDebugVariablesIterator_case_t(TYPENAME) \
        case TYPENAME##_ENUM :\
            ((__IEC_##TYPENAME##_t *)varp)->flags &= ~(__IEC_DEBUG_FLAG|__IEC_FORCE_FLAG);\
            break;

#define __ResetDebugVariablesIterator_case_p(TYPENAME)\
        case TYPENAME##_P_ENUM :\
        case TYPENAME##_O_ENUM :\
            ((__IEC_##TYPENAME##_p *)varp)->flags &= ~(__IEC_DEBUG_FLAG|__IEC_FORCE_FLAG);\
            break;

void ResetDebugVariablesIterator(dbgvardsc_t *dsc)
{
    /* force debug flag to 0*/
    void *varp = dsc->ptr;
    switch(dsc->type){
        __ANY(__ResetDebugVariablesIterator_case_t)
        __ANY(__ResetDebugVariablesIterator_case_p)
    default:
        break;
    }
}

void ResetDebugVariables(void)
{
    __for_each_variable_do(ResetDebugVariablesIterator);
}

void FreeDebugData(void)
{
    /* atomically mark buffer as free */
    AtomicCompareExchange(
        &buffer_state,
        BUFFER_BUSY,
        BUFFER_FREE);
}
int WaitDebugData(unsigned long *tick);
/* Wait until debug data ready and return pointer to it */
int GetDebugData(unsigned long *tick, unsigned long *size, void **buffer){
    int wait_error = WaitDebugData(tick);
    if(!wait_error){
        *size = buffer_cursor - debug_buffer;
        *buffer = debug_buffer;
    }
    return wait_error;
}
#endif
#endif

