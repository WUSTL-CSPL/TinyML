/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    Secure/Src/secure_nsc.c
  * @author  MCD Application Team
  * @brief   This file contains the non-secure callable APIs (secure world)
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
/* USER CODE END Header */

/* USER CODE BEGIN Non_Secure_CallLib */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "secure_nsc.h"
/** @addtogroup STM32L5xx_HAL_Examples
  * @{
  */

/** @addtogroup Templates
  * @{
  */

/* Global variables ----------------------------------------------------------*/
void *pSecureFaultCallback = NULL;   /* Pointer to secure fault callback in Non-secure */
void *pSecureErrorCallback = NULL;   /* Pointer to secure error callback in Non-secure */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Secure registration of non-secure callback.
  * @param  CallbackId  callback identifier
  * @param  func        pointer to non-secure function
  * @retval None
  */
CMSE_NS_ENTRY void SECURE_RegisterCallback(SECURE_CallbackIDTypeDef CallbackId, void *func)
{
  if(func != NULL)
  {
    switch(CallbackId)
    {
      case SECURE_FAULT_CB_ID:           /* SecureFault Interrupt occurred */
        pSecureFaultCallback = func;
        break;
      case GTZC_ERROR_CB_ID:             /* GTZC Interrupt occurred */
        pSecureErrorCallback = func;
        break;
      default:
        /* unknown */
        break;
    }
  }
}



uint32_t task_ram_start_addr[TOTAL_TASK_CNT] = {0x2003000};
uint32_t task_ram_end_addr[TOTAL_TASK_CNT] = {0x2001000};


extern int __DNN_Start();

CMSE_NS_ENTRY void SECURE_DNN_Start(){
	__DNN_Start();
}

CMSE_NS_ENTRY void SECURE_SAVE_S(){
	__SAVE_S();
}

CMSE_NS_ENTRY void SECURE_RESTORE_S(){
	__RESTORE_S();
}

CMSE_NS_ENTRY void SECURE_LOAD_NS(uint32_t task_idx){
	__LOAD_NS(task_idx);
}

CMSE_NS_ENTRY void SECURE_STORE_NS(uint32_t task_idx){
	__STORE_NS(task_idx);
}



//extern int __S2NS(uint32_t s_start_addr, uint32_t s_end_addr, uint32_t ns_start_addr, uint32_t ns_end_addr);
//
//CMSE_NS_ENTRY void SECURE_S2NS(){
//	return;
//}
//
//extern int __NS2S();
//CMSE_NS_ENTRY void SECURE_NS2S(){
//	return;
//}



/**
  * @}
  */

/**
  * @}
  */
/* USER CODE END Non_Secure_CallLib */

