
/**
  ******************************************************************************
  * @file    app_x-cube-ai.c
  * @author  X-CUBE-AI C code generator
  * @brief   AI program body
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

 /*
  * Description
  *   v1.0 - Basic template to show how to use the TensorFlow lite micro API
  *
  */

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/

/* System headers */
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <inttypes.h>
#include <string.h>

#include "app_x-cube-ai.h"
#include "bsp_ai.h"
#include "aiSystemPerformance.h"

/* USER CODE BEGIN includes */
/* USER CODE END includes */

/* Entry points --------------------------------------------------------------*/

void MX_X_CUBE_AI_Init(void)
{
    MX_UARTx_Init();
    aiSystemPerformanceInit();
    /* USER CODE BEGIN 5 */
    /* USER CODE END 5 */
}

void MX_X_CUBE_AI_Process(void)
{
    aiSystemPerformanceProcess();
    HAL_Delay(1000); /* delay 1s */
    /* USER CODE BEGIN 6 */
    /* USER CODE END 6 */
}
#ifdef __cplusplus
}
#endif
