/**
  ******************************************************************************
  * @file    FatFs/FatFs_uSD_TrustZone/Secure/Src/secure_nsc.c
  * @author  MCD Application Team
  * @brief   This file contains the non-secure callable APIs (secure world)
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2019 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "secure_nsc.h"
#include <stdio.h>
/** @addtogroup STM32L5xx_HAL_Examples
  * @{
  */

/** @addtogroup GPIO_SecureIOToggle
  * @{
  */

/* Global variables ----------------------------------------------------------*/
void *pSecureFaultCallback = NULL;   /* Pointer to secure fault callback in Non-secure */
void *pSecureErrorCallback = NULL;   /* Pointer to secure error callback in Non-secure */
void *pTask1Callback = NULL;

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
      case SECURE_FAULT_CB_ID:           /* SecureFault IT */
        pSecureFaultCallback = func;
        break;
      case GTZC_ERROR_CB_ID:             /* GTZC IT */
        pSecureErrorCallback = func;
        break;
      case TASK1_ID:             /* GTZC IT */
    	pTask1Callback = func;
        break;
      default:
        /* unknown */
        break;
    }
  }
}

/**
  * @brief  Secure SD Init
  * @retval None
  */
CMSE_NS_ENTRY int32_t SECURE_SD_Init(uint32_t Instance)
{
  return BSP_SD_Init(Instance);
}

/**
  * @brief  Secure Get Card State
  * @retval None
  */
CMSE_NS_ENTRY int32_t SECURE_SD_GetCardState(uint32_t Instance)
{
  return BSP_SD_GetCardState(Instance);
}


/**
  * @brief  Secure Get Card Info
  * @retval None
  */
CMSE_NS_ENTRY int32_t SECURE_SD_GetCardInfo(uint32_t Instance, BSP_SD_CardInfo *CardInfo)
{
 return BSP_SD_GetCardInfo(Instance, CardInfo);
}

/**
  * @brief  Secure SD Read Blocks
  * @retval None
  */
CMSE_NS_ENTRY int32_t SECURE_SD_ReadBlocks(uint32_t Instance, uint32_t *pData, uint32_t BlockIdx, uint32_t BlocksNbr)
{
 return BSP_SD_ReadBlocks( Instance, pData, BlockIdx, BlocksNbr);
}

/**
  * @brief  Secure SD Write Blocks
  * @retval None
  */
CMSE_NS_ENTRY int32_t SECURE_SD_WriteBlocks(uint32_t Instance, uint32_t *pData, uint32_t BlockIdx, uint32_t BlocksNbr)
{
  return BSP_SD_WriteBlocks( Instance, pData,BlockIdx,BlocksNbr);
}

/**
  * @brief  Secure SD Detect ITConfig
  * @retval None
  */
CMSE_NS_ENTRY int32_t SECURE_SD_IsDetected(uint32_t Instance)
{
  return BSP_SD_IsDetected(Instance);
}
/**
  * @}
  */

/**
  * @}
  */
