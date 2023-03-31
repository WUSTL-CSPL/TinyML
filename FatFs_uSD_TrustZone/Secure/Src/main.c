/**
  ******************************************************************************
  * @file    FatFs/FatFs_uSD_TrustZone/Secure/Src/main.c
  * @author  MCD Application Team
  * @brief   Main secure program body
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
#include <stdio.h>

/** @addtogroup STM32L5xx_HAL_Examples
  * @{
  */

/** @addtogroup GPIO_SecureIOToggle
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Non-secure Vector table to jump to (internal Flash Bank2 here)             */
/* Caution: address must correspond to non-secure internal Flash where is     */
/*          mapped in the non-secure vector table                             */
#define VTOR_TABLE_NS_START_ADDR  0x08040000UL

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
static void NonSecure_main(void);
static void SystemIsolation_Config(void);
static void SystemClock_Config(void); /* provided as example if secure sets clocks */
HAL_StatusTypeDef MX_SDMMC1_SD_Init(SD_HandleTypeDef *hsd);
/**
  * @brief  Main program
  * @retval None
  */
#define FATFS_MKFS_ALLOWED 1
/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
int32_t ProcessStatus = 0;

/////////////////Define a demo secure task
static uint8_t* Secure_task(uint8_t size);


////////////////Define MX_GTZC_S_Init(void)
static void MX_GTZC_S_Init(int size_s);

////////////////Define timer
TIM_HandleTypeDef htim17;
static void MX_TIM17_Init(void);
int flag_s = 0;
uint8_t size = 1000;
uint8_t* arr;

extern funcptr_NS pTask1Callback;

CMSE_NS_ENTRY void jump_secure(int num)
{
	flag_s++;
	main();
}



int main(void)
{

  ///////////////// Initialize the hardware and secure world
  if (flag_s==0){
  /* SAU/IDAU, FPU and interrupts secure/non-secure allocation setup done */
  /* in SystemInit() based on partition_stm32l562xx.h file's definitions. */

  /* Secure/Non-secure Memory and Peripheral isolation configuration */
  SystemIsolation_Config();

  /* Enable SecureFault handler (HardFault is default) */
  SCB->SHCSR |= SCB_SHCSR_SECUREFAULTENA_Msk;

  /* STM32L5xx **SECURE** HAL library initialization:
       - Secure Systick timer is configured by default as source of time base,
         but user can eventually implement his proper time base source (a general
         purpose timer for example or other time source), keeping in mind that
         Time base duration should be kept 1ms since PPP_TIMEOUT_VALUEs are defined
         and handled in milliseconds basis.
       - Low Level Initialization
     */
  HAL_Init();

  /* Enable Instruction cache (default 2-ways set associative cache) */
  if(HAL_ICACHE_Enable() != HAL_OK)
  {
    /* Initialization Error */
    while(1);
  }

  /* Configure the System clock to have a frequency of 110 MHz */
  SystemClock_Config();


  /* Add your secure application code here prior to non-secure initialization
     */

  /* All IOs are by default allocated to secure */
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOF_CLK_ENABLE();
  __HAL_RCC_GPIOG_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  HAL_GPIO_ConfigPinAttributes(GPIOA, GPIO_PIN_All, GPIO_PIN_NSEC);
  HAL_GPIO_ConfigPinAttributes(GPIOB, GPIO_PIN_All, GPIO_PIN_NSEC);
  HAL_GPIO_ConfigPinAttributes(GPIOC, (GPIO_PIN_All & ~(GPIO_PIN_8)& ~(GPIO_PIN_9)& ~(GPIO_PIN_10)& ~(GPIO_PIN_11)& ~(GPIO_PIN_12)), GPIO_PIN_NSEC);
  HAL_GPIO_ConfigPinAttributes(GPIOD, (GPIO_PIN_All & ~(GPIO_PIN_2)), GPIO_PIN_NSEC);
  HAL_GPIO_ConfigPinAttributes(GPIOE, GPIO_PIN_All, GPIO_PIN_NSEC);
  HAL_GPIO_ConfigPinAttributes(GPIOF, GPIO_PIN_All, GPIO_PIN_NSEC);
  HAL_GPIO_ConfigPinAttributes(GPIOG, GPIO_PIN_All, GPIO_PIN_NSEC);
  HAL_GPIO_ConfigPinAttributes(GPIOH, GPIO_PIN_All, GPIO_PIN_NSEC);

 	/* Leave the GPIO clocks enabled to let non-secure having I/Os control */

  /*************** Setup and jump to non-secure *******************************/

   /* USER CODE END SysInit */

   /* Initialize all configured peripherals */


  ////////////Initialize the file system
   SECURE_SD_Init(0);
   MX_FATFS_Init();
   MX_FATFS_Process();


   ///////////Initialize the model input by storing it into SD card
   arr = Secure_task(size);
   FS_FileWrite(arr);

   ///////////Initialize the normal world
   NonSecure_main();

  }

  ///////////Initialize the timer in the secure world and start timer interrupt
  if (flag_s==1){
	  MX_TIM17_Init();
      HAL_TIM_Base_Start_IT(&htim17);
  }

  ///////////Start executing model inference
  while(1)
  {
	int layer_num = flag_s-1;
	switch(layer_num){
	case 1: //layer 1 execution:
	   ///////////Step1: Read the stored SRAM content from the SD card;
	   FS_FileRead(arr, size);

	   ///////////Step2: Execute the secure world task. Here is a demo task. In our scenario, it should be a TinyML task.
	   arr = Secure_task(size);

	   ///////////Step3: Store the layer output in the secure world with memory swapping between the SD card and SRAM. Then, free the allocated SRAM.
	   FS_FileWrite(arr);
	   free(arr);

	   ///////////Step4: Configure the allocation scheme between the secure world and the normal world of the TrustZone
	   MX_GTZC_S_Init(128);

	   ///////////Step5: Jump back to the normal world to execute the tasks in the normal world.
	   Normal_entry(pTask1Callback);

	case 2: //layer 2 execution:
	   ///////////Step1: Read the stored SRAM content from the SD card;
	   FS_FileRead(arr, size);

	   ///////////Step2: Execute the secure world task. Here is a demo task. In our scenario, it should be a TinyML task.
	   arr = Secure_task(size);

	   ///////////Step3: Store the layer output in the secure world with memory swapping between the SD card and SRAM. Then, free the allocated SRAM.
	   FS_FileWrite(arr);
	   free(arr);

	   ///////////Step4: Configure the allocation scheme between the secure world and the normal world of the TrustZone
	   MX_GTZC_S_Init(128);

	   ///////////Step5: Jump back to the normal world to execute the tasks in the normal world.
	   Normal_entry(pTask1Callback);

	default:
	   ///////////Step1: Read the stored SRAM content from the SD card;
	   FS_FileRead(arr, size);

	   ///////////Step2: Execute the secure world task. Here is a demo task. In our scenario, it should be a TinyML task.
	   arr = Secure_task(size);

	   ///////////Step3: Store the layer output in the secure world with memory swapping between the SD card and SRAM. Then, free the allocated SRAM.
	   FS_FileWrite(arr);
	   free(arr);

	   ///////////Step4: Configure the allocation scheme between the secure world and the normal world of the TrustZone
	   MX_GTZC_S_Init(128);

	   ///////////Step5: Jump back to the normal world to execute the tasks in the normal world.
	   Normal_entry(pTask1Callback);

	}
  }
}


/* Infinite loop */
/* USER CODE BEGIN WHILE */
//   while (1)
//   {
//     ProcessStatus = MX_FATFS_Process();
//     /* Call middleware background task */
//     if (ProcessStatus >= APP_OK)
//     {
//       BSP_LED_Off(LED_ERROR);
//       BSP_LED_On(LED_OK);
//     }
//     else
//     {
////       Error_Handler();
//    	 ;
//     }
//
//     /* USER CODE END WHILE */
//
//     /* USER CODE BEGIN 3 */
//   }



///////////A demo secure task
static uint8_t* Secure_task(uint8_t size)
{
	uint8_t* arr = (uint8_t*)malloc(size * sizeof(uint8_t));
    for (uint8_t i = 0; i < size; i++) {
        arr[i] = i;
    }
    return arr;
}


//////////Timer callback
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef* htim)
{

	//   NonSecure_main();
//	HAL_TIM_Base_Stop_IT(&htim17);
   Normal_entry(pTask1Callback);
}

/**
  * @brief TIM17 Initialization Function
  * @param None
  * @retval None
  */





static void MX_TIM17_Init(void)
{

  /* USER CODE BEGIN TIM17_Init 0 */

  /* USER CODE END TIM17_Init 0 */

  /* USER CODE BEGIN TIM17_Init 1 */

  /* USER CODE END TIM17_Init 1 */
  htim17.Instance = TIM17;
  htim17.Init.Prescaler = 2000;
  htim17.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim17.Init.Period = 36000;
  htim17.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim17.Init.RepetitionCounter = 0;
  htim17.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim17) != HAL_OK)
  {
	  ;
//    Error_Handler();
  }
  /* USER CODE BEGIN TIM17_Init 2 */

  /* USER CODE END TIM17_Init 2 */

}



///////////The size_s representing the size of SRAM in kb
static void MX_GTZC_S_Init(int size_s)
{
//  int block_s;
//  int num_sixteens;
  int array_num;
  int remainder;

//  block_s = (size_s*1024 + 255)/256;
//  num_sixteens = (block_s + 15) / 16;
  array_num = size_s/8;
  remainder = size_s % 8;

  if (remainder != 0) {
      array_num = array_num + 1;
  }
//  remainder = num_sixteens%8;



  /* USER CODE BEGIN GTZC_S_Init 0 */

  /* USER CODE END GTZC_S_Init 0 */

  MPCBB_ConfigTypeDef MPCBB_NonSecureArea_Desc = {0};

  /* USER CODE BEGIN GTZC_S_Init 1 */

  /* USER CODE END GTZC_S_Init 1 */
  MPCBB_NonSecureArea_Desc.SecureRWIllegalMode = GTZC_MPCBB_SRWILADIS_ENABLE;
  MPCBB_NonSecureArea_Desc.InvertSecureState = GTZC_MPCBB_INVSECSTATE_NOT_INVERTED;
  if (array_num<=24){
	 int i;
	 int j;
	 for (i=0; i<array_num; i++){
		 MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[i] = 0xFFFFFFFF;
	 }
	 for (j=array_num; j<24; j++){
		 MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[j] = 0x00000000;
	 }
  }

  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_LockConfig_array[0] =   0x00000000;
  if (HAL_GTZC_MPCBB_ConfigMem(SRAM1_BASE, &MPCBB_NonSecureArea_Desc) != HAL_OK)
  {
    ;
  }

  if (array_num>24){
	  int k;
	  k = array_num-24;
	  int i;
	  int j;
	  for (i=0; i<k; i++){
		  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[i] = 0xFFFFFFFF;
	  }
	  for (j=k; j<8; j++){
		  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[j] = 0x00000000;
	  }
  } else {
	  int i;
	  for (i=0; i<8; i++){
		  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[i] = 0x00000000;
	  }
  }

  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_LockConfig_array[0] =   0x00000000;
  if (HAL_GTZC_MPCBB_ConfigMem(SRAM2_BASE, &MPCBB_NonSecureArea_Desc) != HAL_OK)
  {
    ;
  }
  /* USER CODE BEGIN GTZC_S_Init 2 */

  /* USER CODE END GTZC_S_Init 2 */

}


//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[0] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[1] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[2] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[3] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[4] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[5] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[6] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[7] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[8] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[9] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[10] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[11] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[12] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[13] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[14] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[15] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[16] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[17] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[18] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[19] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[20] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[21] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[22] =   0x00000000;
//  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[23] =   0x00000000;


//MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[0] =   0x00000000;
//MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[1] =   0x00000000;
//MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[2] =   0x00000000;
//MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[3] =   0x00000000;
//MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[4] =   0x00000000;
//MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[5] =   0x00000000;
//MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[6] =   0x00000000;
//MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[7] =   0x00000000;

///////////SAU configuration function and error handler
void MX_GTZC_S_Init_test(void)
{

  /* USER CODE BEGIN GTZC_S_Init 0 */

  /* USER CODE END GTZC_S_Init 0 */

  MPCBB_ConfigTypeDef MPCBB_NonSecureArea_Desc = {0};

  /* USER CODE BEGIN GTZC_S_Init 1 */

  /* USER CODE END GTZC_S_Init 1 */
  MPCBB_NonSecureArea_Desc.SecureRWIllegalMode = GTZC_MPCBB_SRWILADIS_ENABLE;
  MPCBB_NonSecureArea_Desc.InvertSecureState = GTZC_MPCBB_INVSECSTATE_NOT_INVERTED;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[0] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[1] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[2] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[3] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[4] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[5] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[6] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[7] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[8] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[9] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[10] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[11] =   0xFFFFFFFF;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[12] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[13] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[14] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[15] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[16] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[17] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[18] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[19] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[20] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[21] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[22] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[23] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_LockConfig_array[0] =   0x00000000;
  if (HAL_GTZC_MPCBB_ConfigMem(SRAM1_BASE, &MPCBB_NonSecureArea_Desc) != HAL_OK)
  {
    ;
  }
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[0] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[1] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[2] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[3] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[4] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[5] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[6] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_SecConfig_array[7] =   0x00000000;
  MPCBB_NonSecureArea_Desc.AttributeConfig.MPCBB_LockConfig_array[0] =   0x00000000;
  if (HAL_GTZC_MPCBB_ConfigMem(SRAM2_BASE, &MPCBB_NonSecureArea_Desc) != HAL_OK)
  {
    ;
  }
  /* USER CODE BEGIN GTZC_S_Init 2 */

  /* USER CODE END GTZC_S_Init 2 */

}



void __attribute__((cmse_nonsecure_entry)) Normal_entry(funcptr_NS pTask1Callback){
	funcptr_NS callback_NS; /* non-secure callback function pointer */

	if(pTask1Callback != (funcptr_NS)NULL)
	{
	 /* return function pointer with cleared LSB */
	 callback_NS = (funcptr_NS)cmse_nsfptr_create(pTask1Callback);
	 callback_NS();
	}
	else
	{
	  while(1);  /* Something went wrong */
	}
}


/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Non-secure call function
  *         This function is responsible for Non-secure initialization and switch
  *         to non-secure state
  * @retval None
  */
static void NonSecure_main(void)
{
  funcptr_NS NonSecure_ResetHandler;

  SCB_NS->VTOR = VTOR_TABLE_NS_START_ADDR;

  /* Set non-secure main stack (MSP_NS) */
  __TZ_set_MSP_NS((*(uint32_t *)VTOR_TABLE_NS_START_ADDR));

  /* Get non-secure reset handler */
  NonSecure_ResetHandler = (funcptr_NS)(*((uint32_t *)((VTOR_TABLE_NS_START_ADDR) + 4U)));

  /* Start non-secure state software application */
  NonSecure_ResetHandler();
}

/**
  * @brief  System Isolation Configuration
  *         This function is responsible for Memory and Peripheral isolation
  *         for secure and non-secure application parts
  * @retval None
  */
static void SystemIsolation_Config(void)
{
  uint32_t index;
  MPCBB_ConfigTypeDef MPCBB_desc;

  /* Enable GTZC peripheral clock */
  __HAL_RCC_GTZC_CLK_ENABLE();

  /* -------------------------------------------------------------------------*/
  /*                   Memory isolation configuration                         */
  /* Initializes the memory that secure application books for non secure      */
  /* -------------------------------------------------------------------------*/

  /* -------------------------------------------------------------------------*/
  /* Internal RAM */
  /* The booking is done in both IDAU/SAU and GTZC MPCBB */

  /* GTZC MPCBB setup */
  /* based on non-secure RAM memory area starting from 0x20018000         */
  /* 0x20018000 is the start address of second SRAM1 half                 */
  /* Internal SRAM is secured by default and configured by block          */
  /* of 256bytes.                                                         */
  /* Non-secure block-based memory starting from 0x20018000 means         */
  /* 0x18000 / (256 * 32) = 12 super-blocks for secure block-based memory */
  /* and remaining super-blocks set to 0 for all non-secure blocks        */
  MPCBB_desc.SecureRWIllegalMode = GTZC_MPCBB_SRWILADIS_ENABLE;
  MPCBB_desc.InvertSecureState = GTZC_MPCBB_INVSECSTATE_NOT_INVERTED;
  MPCBB_desc.AttributeConfig.MPCBB_LockConfig_array[0] = 0x00000000U;  /* Locked configuration */
  for(index=0; index<12; index++)
  {
    /* Secure blocks */
    MPCBB_desc.AttributeConfig.MPCBB_SecConfig_array[index] = 0xFFFFFFFFU;
  }
  for(index=12; index<24; index++)
  {
    /* Non-secure blocks */
    MPCBB_desc.AttributeConfig.MPCBB_SecConfig_array[index] = 0x00000000U;
  }

  if (HAL_GTZC_MPCBB_ConfigMem(SRAM1_BASE, &MPCBB_desc) != HAL_OK)
  {
    /* Initialization Error */
    while(1);
  }

  /* Internal SRAM2 is set as non-secure and configured by block          */
  /* Non-secure block-based memory starting from 0x20030000 means         */
  /* 0x10000 / (256 * 32) = 8 super-blocks set to 0 for non-secure        */
  /* block-based memory                                                   */
  for(index=0; index<8; index++)
  {
    /* Non-secure blocks */
    MPCBB_desc.AttributeConfig.MPCBB_SecConfig_array[index] = 0x00000000U;
  }

  if (HAL_GTZC_MPCBB_ConfigMem(SRAM2_BASE, &MPCBB_desc) != HAL_OK)
  {
    /* Initialization Error */
    while(1);
  }

  /* -------------------------------------------------------------------------*/
  /* Internal Flash */
  /* The booking is done in both IDAU/SAU and FLASH interface */

  /* Setup done based on Flash dual-bank mode described with 1 area per bank  */
  /* Non-secure Flash memory area starting from 0x08040000 (Bank2)            */
  /* Flash memory is secured by default and modified with Option Byte Loading */
  /* Insure SECWM2_PSTRT > SECWM2_PEND in order to have all Bank2 non-secure  */

  /* -------------------------------------------------------------------------*/
  /* External OctoSPI memory */
  /* The booking is done in both IDAU/SAU and GTZC MPCWM interface */

  /* Default secure configuration */
  /* Else need to use HAL_GTZC_TZSC_MPCWM_ConfigMemAttributes() */

  /* -------------------------------------------------------------------------*/
  /* External NOR/FMC memory */
  /* The booking is done in both IDAU/SAU and GTZC MPCWM interface */

  /* Default secure configuration */
  /* Else need to use HAL_GTZC_TZSC_MPCWM_ConfigMemAttributes() */

  /* -------------------------------------------------------------------------*/
  /* External NAND/FMC memory */
  /* The booking is done in both IDAU/SAU and GTZC MPCWM interface */

  /* Default secure configuration */
  /* Else need to use HAL_GTZC_TZSC_MPCWM_ConfigMemAttributes() */


  /* -------------------------------------------------------------------------*/
  /*                   Peripheral isolation configuration                     */
  /* Initializes the peripherals and features that secure application books   */
  /* for secure (RCC, PWR, RTC, EXTI, DMA, OTFDEC, etc..) or leave them to    */
  /* non-secure (GPIO (secured by default))                                   */
  /* -------------------------------------------------------------------------*/

  /* Enable illegal access interrupts in TZIC for any non-secure application */
  /* access to TZSC/TZIC/MPCBB/MPCWM registers */
  if (    (HAL_GTZC_TZIC_EnableIT(GTZC_PERIPH_MPCBB2_REG)   != HAL_OK)
       || (HAL_GTZC_TZIC_EnableIT(GTZC_PERIPH_SRAM2)        != HAL_OK)
       || (HAL_GTZC_TZIC_EnableIT(GTZC_PERIPH_MPCBB1_REG)   != HAL_OK)
       || (HAL_GTZC_TZIC_EnableIT(GTZC_PERIPH_SRAM1)        != HAL_OK)
       || (HAL_GTZC_TZIC_EnableIT(GTZC_PERIPH_OCTOSPI1_MEM) != HAL_OK)
       || (HAL_GTZC_TZIC_EnableIT(GTZC_PERIPH_FMC_MEM)      != HAL_OK)
       || (HAL_GTZC_TZIC_EnableIT(GTZC_PERIPH_TZIC)         != HAL_OK)
       || (HAL_GTZC_TZIC_EnableIT(GTZC_PERIPH_TZSC)         != HAL_OK))
  {
    /* Initialization Error */
    while(1);
  }

  /* Clear all illegal access pending interrupts in TZIC */
  if (HAL_GTZC_TZIC_ClearFlag(GTZC_PERIPH_ALL) != HAL_OK)
  {
    /* Initialization Error */
    while(1);
  }

  /* Enable GTZC TZIC secure interrupt */
  HAL_NVIC_SetPriority(GTZC_IRQn, 0, 0); /* Highest priority level */
  HAL_NVIC_ClearPendingIRQ(GTZC_IRQn);
  HAL_NVIC_EnableIRQ(GTZC_IRQn);
}

/**
  * @brief  System Clock Configuration
  *         The system Clock is configured as follows :
  *            System Clock source            = PLL (MSI)
  *            SYSCLK(Hz)                     = 110000000
  *            HCLK(Hz)                       = 110000000
  *            AHB Prescaler                  = 1
  *            APB1 Prescaler                 = 1
  *            APB2 Prescaler                 = 1
  *            MSI Frequency(Hz)              = 4000000
  *            PLL_M                          = 1
  *            PLL_N                          = 55
  *            PLL_Q                          = 2
  *            PLL_R                          = 2
  *            PLL_P                          = 7
  *            Flash Latency(WS)              = 5
  * @retval None
  */
static void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};

  /* Enable voltage range 0 for frequency above 80 Mhz */
  __HAL_RCC_PWR_CLK_ENABLE();
  HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE0);
  __HAL_RCC_PWR_CLK_DISABLE();

  /* MSI Oscillator enabled at reset (4Mhz), activate PLL with MSI as source */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_NONE;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_MSI;
  RCC_OscInitStruct.PLL.PLLM = 1;
  RCC_OscInitStruct.PLL.PLLN = 55;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV7;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    /* Initialization Error */
    while(1);
  }

  /* Select PLL as system clock source with transition state */
  /* with AHB prescaler divider 2 as first step */
  RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV2;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
  if(HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3) != HAL_OK)
  {
    /* Initialization Error */
    while(1);
  }

  /* AHB prescaler divider at 1 as second step */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  if(HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    /* Initialization Error */
    while(1);
  }
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Initializes the SDMMC1 peripheral.
  * @param  hsd SD handle
  * @retval HAL status
  */
HAL_StatusTypeDef MX_SDMMC1_SD_Init(SD_HandleTypeDef *hsd)
{
  HAL_StatusTypeDef ret = HAL_OK;

  /* uSD device interface configuration */
  hsd->Instance                 = SDMMC1;
  hsd->Init.ClockEdge           = SDMMC_CLOCK_EDGE_FALLING;
  hsd->Init.ClockPowerSave      = SDMMC_CLOCK_POWER_SAVE_DISABLE;
  hsd->Init.BusWide             = SDMMC_BUS_WIDE_4B;
  hsd->Init.HardwareFlowControl = SDMMC_HARDWARE_FLOW_CONTROL_ENABLE;
  hsd->Init.ClockDiv            = SDMMC_NSpeed_CLK_DIV;

  /* HAL SD initialization */
  if(HAL_SD_Init(hsd) != HAL_OK)
  {
    ret = HAL_ERROR;
  }
  /* Configure SDMMC1 in secure mode only */
  if (HAL_GTZC_TZSC_ConfigPeriphAttributes(GTZC_PERIPH_SDMMC1, GTZC_TZSC_PERIPH_SEC) != HAL_OK)
  {
    /* Initialization error */
    while(1);
  }
  /* enable illegal access interrupt on COM2 */
  if (HAL_GTZC_TZIC_EnableIT(GTZC_PERIPH_SDMMC1) != HAL_OK)
  {
    /* Initialization error */
    while(1);
  }
  return ret;
}
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/**
  * @}
  */
