/**
  ******************************************************************************
  * @file    FatFs/FatFs_uSD_TrustZone/Secure_nsclib/Src/secure_nsc.h
  * @author  MCD Application Team
  * @brief   Header for secure non-secure callable APIs list
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef SECURE_NSC_H
#define SECURE_NSC_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include "stm32l562e_discovery_sd.h"
/* Exported types ------------------------------------------------------------*/
/**
  * @brief  non-secure callback ID enumeration definition
  */
typedef enum
{
  TASK1_ID				 = 0X02U,
  SECURE_FAULT_CB_ID     = 0x00U, /*!< System secure fault callback ID */
  GTZC_ERROR_CB_ID       = 0x01U  /*!< GTZC secure error callback ID */

} SECURE_CallbackIDTypeDef;

/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
/* Exported functions ------------------------------------------------------- */
void SECURE_RegisterCallback(SECURE_CallbackIDTypeDef CallbackId, void *func);
void SECURE_LEDOn(void);
int32_t SECURE_SD_Init(uint32_t Instance);
int32_t SECURE_SD_GetCardState(uint32_t Instance);
int32_t SECURE_SD_GetCardInfo(uint32_t Instance, BSP_SD_CardInfo *CardInfo);
int32_t SECURE_SD_ReadBlocks(uint32_t Instance, uint32_t *pData, uint32_t BlockIdx, uint32_t BlocksNbr);
int32_t SECURE_SD_WriteBlocks(uint32_t Instance, uint32_t *pData, uint32_t BlockIdx, uint32_t BlocksNbr);
int32_t SECURE_SD_DetectITConfig(uint32_t Instance);
int32_t SECURE_SD_IsDetected(uint32_t Instance);
#endif /* SECURE_NSC_H */
