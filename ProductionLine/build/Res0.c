/*******************************************/
/*     FILE GENERATED BY iec2c             */
/* Editing this file is not recommended... */
/*******************************************/

#include "iec_std_lib.h"

// RESOURCE RES0

extern unsigned long long common_ticktime__;

#include "accessor.h"
#include "POUS.h"

#include "Config0.h"

#include "POUS.c"

BOOL TASK0;
PL RES0__INSTANCE0;
#define INSTANCE0 RES0__INSTANCE0

void RES0_init__(void) {
  BOOL retain;
  retain = 0;
  
  TASK0 = __BOOL_LITERAL(FALSE);
  PL_init__(&INSTANCE0,retain);
}

void RES0_run__(unsigned long tick) {
  TASK0 = !(tick % 1);
  if (TASK0) {
    PL_body__(&INSTANCE0);
  }
}

