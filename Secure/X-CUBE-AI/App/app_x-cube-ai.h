
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __APP_AI_H
#define __APP_AI_H
#ifdef __cplusplus
extern "C" {
#endif
/**
  ******************************************************************************
  * @file    app_x-cube-ai.h
  * @author  X-CUBE-AI C code generator
  * @brief   AI entry function definitions
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2023 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include "ai_platform.h"
#define MIN_HEAP_SIZE 0x800
#define MIN_STACK_SIZE 0x1000

/* IO buffers ----------------------------------------------------------------*/

extern ai_i8* data_ins[];
extern ai_i8* data_outs[];

extern ai_handle data_activations0[];

void MX_X_CUBE_AI_Init(void);
void MX_X_CUBE_AI_Process(void);
/* USER CODE BEGIN includes */
/* USER CODE END includes */

#define AI_MNETWORK_NUMBER  (1)
#ifdef __cplusplus
}
#endif
#endif /*__STMicroelectronics_X-CUBE-AI_8_0_0_H */
