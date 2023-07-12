/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "app_x-cube-ai.h"
#include "network_tflite_data.h"
#include "partition_stm32l562xx.h"
#include "secure_nsc.h"
/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* Non-secure Vector table to jump to (internal Flash Bank2 here)             */
/* Caution: address must correspond to non-secure internal Flash where is     */
/*          mapped in the non-secure vector table                             */
#define VTOR_TABLE_NS_START_ADDR  0x08040000UL
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
CRYP_HandleTypeDef hcryp;
__ALIGN_BEGIN static const uint32_t pKeyAES[4] __ALIGN_END = {
                            0x11110000,0x00000000,0x00000000,0x00000000};
__ALIGN_BEGIN static const uint32_t pInitVectAES[4] __ALIGN_END = {
                            0x00000000,0x00000000,0x00000000,0x00000000};

CRC_HandleTypeDef hcrc;

SD_HandleTypeDef hsd1;

UART_HandleTypeDef huart1;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
static void NonSecure_Init(void);
void SystemClock_Config(void);
void PeriphCommonClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_GTZC_S_Init(void);
static void MX_CRC_Init(void);
static void MX_ICACHE_Init(void);
static void MX_SDMMC1_SD_Init(void);
static void MX_AES_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */
/**
  * @brief  The application entry point.
  * @retval int
  */
extern volatile int global_dma_write_done;
extern volatile int global_dma_read_done;

int write2sd(uint8_t *buffer, uint32_t start_block, uint32_t size_blocks){
    int write_result = 1;
    while(write_result){
      write_result = HAL_SD_WriteBlocks_DMA(&hsd1, buffer, start_block, size_blocks);
    }

//    while(!global_dma_write_done){}
//    global_dma_write_done = 0;

    return write_result;
}

int check_wait_write_DMA(){
    while(!global_dma_write_done){}
    global_dma_write_done = 0;
    return 0;
}



int read2sd(uint8_t *buffer, uint32_t start_block, uint32_t size_blocks){
    int read_result = 1;
    while(read_result){
      read_result = HAL_SD_ReadBlocks_DMA(&hsd1, buffer, start_block, size_blocks);
    }

//    while(!global_dma_read_done){}
//    global_dma_read_done = 0;

      return read_result;
}

int check_wait_read_DMA(){
     while(!global_dma_read_done){}
     global_dma_read_done = 0;
     return 0;
}


//sau configurations
/*
    max 8 SAU regions.
    SAU regions are defined in partition.h
 */
uint32_t sau_init_start_6 = 0;
uint32_t sau_init_end_6 = 0;
uint32_t sau_init_nsc_6 = 0;

#define MY_SAU_INIT_START_6 sau_init_start_6
#define MY_SAU_INIT_END_6 sau_init_end_6
#define MY_SAU_INIT_NSC_6 sau_init_nsc_6

#define MY_SAU_INIT_REGION(n) \
    SAU->RNR  =  (n                                     & SAU_RNR_REGION_Msk); \
    SAU->RBAR =  (MY_SAU_INIT_START_6                     & SAU_RBAR_BADDR_Msk); \
    SAU->RLAR =  (MY_SAU_INIT_END_6                       & SAU_RLAR_LADDR_Msk) | \
                ((MY_SAU_INIT_NSC_6 << SAU_RLAR_NSC_Pos)  & SAU_RLAR_NSC_Msk)   | 1U

/**
  \brief   Setup a SAU Region
  \details Writes the region information contained in SAU_Region to the
           registers SAU_RNR, SAU_RBAR, and SAU_RLAR
 */
__STATIC_INLINE void MY_TZ_SAU_Setup (uint32_t start_addr, uint32_t end_addr, uint32_t secure_state)
{

	sau_init_start_6 = start_addr;
	sau_init_end_6 = end_addr;
	sau_init_nsc_6 = secure_state;
    MY_SAU_INIT_REGION(6);

  /* repeat this for all possible SAU regions */

}


//int __S2NS(uint32_t s_start_addr, uint32_t s_end_addr, uint32_t ns_start_addr, uint32_t ns_end_addr){
//	//save the memory content to sd card with range from s_start_addr to s_end_addr
//
//	//restore the content from SD card to memory
//}
//
//int __NS2S(){
//
//}

//store ns memory contents from 5000000th block 2.5 GB
uint32_t ns_mem_content_sd_blk_start[TOTAL_TASK_CNT] = {5000000};
uint32_t ns_mem_content_blk_size[TOTAL_TASK_CNT] = {2};
uint32_t ns_mem_content_mem_size[TOTAL_TASK_CNT] = {1024};
//uint32_t curr_ns_mem_content_blk_pos = 5000000;

extern uint32_t task_ram_start_addr[TOTAL_TASK_CNT];
extern uint32_t task_ram_end_addr[TOTAL_TASK_CNT];
uint8_t crypto_mem_content[3000] = {0};
uint8_t copy_buffer[3000] = {0};
void __SAVE_S(){


	if(HAL_CRYP_Encrypt(&hcryp, 0x20030000, 1024, crypto_mem_content, 1000) != HAL_OK){
		Error_Handler();
	}
	while(HAL_CRYP_GetState(&hcryp) != HAL_CRYP_STATE_READY);
	while(HAL_SD_WriteBlocks(&hsd1, crypto_mem_content, 6000000, 2, 1000)){

	}

	while(HAL_SD_GetCardState(&hsd1) != HAL_SD_CARD_TRANSFER){

	}

//	write2sd(crypto_mem_content, 6000000, 2);
//	check_wait_write_DMA();
	MY_TZ_SAU_Setup(0x20030000,0x20030000+ns_mem_content_mem_size[TOTAL_TASK_CNT],0);


	return;
}

void __RESTORE_S(){

	MY_TZ_SAU_Setup(0x20030000,0x20030000+ns_mem_content_mem_size[TOTAL_TASK_CNT],1);
//	read2sd(crypto_mem_content, 6000000, 2);
	while(HAL_SD_ReadBlocks(&hsd1, crypto_mem_content, 6000000, 2, 1000)){

	}
	while(HAL_SD_GetCardState(&hsd1) != HAL_SD_CARD_TRANSFER){

	}
//	check_wait_read_DMA();
	if(HAL_CRYP_Decrypt(&hcryp, crypto_mem_content, 1024, 0x20030000, 1000) != HAL_OK){
	    Error_Handler();
	}
	while(HAL_CRYP_GetState(&hcryp) != HAL_CRYP_STATE_READY);

	return;
}


void __LOAD_NS(task_idx){

//	read2sd(0x20030000, ns_mem_content_sd_blk_start[task_idx], ns_mem_content_blk_size[task_idx]);
	//0x20030000


	while(HAL_SD_ReadBlocks(&hsd1, 0x20030000, ns_mem_content_sd_blk_start[task_idx], ns_mem_content_blk_size[task_idx], 1000)){
//	while(HAL_SD_ReadBlocks(&hsd1, copy_buffer, 5000000, 2, 1000)){

	}
	while(HAL_SD_GetCardState(&hsd1) != HAL_SD_CARD_TRANSFER){

	}
//	check_wait_read_DMA();
	return;
}

void __STORE_NS(task_idx){

//	write2sd(0x20030000, ns_mem_content_sd_blk_start[task_idx], ns_mem_content_blk_size[task_idx]);
	//0x20030000
	while(HAL_SD_WriteBlocks(&hsd1, 0x20030000, ns_mem_content_sd_blk_start[task_idx], ns_mem_content_blk_size[task_idx], 1000)){

	}
//	check_wait_write_DMA();
	//save content
	while(HAL_SD_GetCardState(&hsd1) != HAL_SD_CARD_TRANSFER){

	}
	return;
}

//the buffer used to store params metadata
uint32_t md_buffer[400];
uint32_t block_size = 0;
uint32_t encrypted_model_size;
uint32_t decrypted_model_size;
//uint8_t tmp_g_tflm_network_model_data[MAX_LAYER_PARAM] = {0};
uint8_t decrypted_model_data[2000] = {0};


int __DNN_Start(){
  int next_model_param_index = 501;

  /* USER CODE END WHILE */

  //read params of layer 0 from SD card
  encrypted_model_size = md_buffer[0];
  decrypted_model_size = md_buffer[1];
  block_size = encrypted_model_size / 512 + (encrypted_model_size % 512 == 0 ? 0 : 1);
  read2sd((uint8_t*)g_tflm_network_model_data, next_model_param_index, block_size);
//      read2sd((uint8_t*)tmp_g_tflm_network_model_data, next_model_param_index, block_size);
  next_model_param_index += block_size;
  //TODO
  //decrypt params buffer and get model params
  check_wait_read_DMA();

  if(HAL_CRYP_Decrypt_IT(&hcryp, g_tflm_network_model_data, encrypted_model_size, decrypted_model_data) != HAL_OK){
    Error_Handler();
  }
  while(HAL_CRYP_GetState(&hcryp) != HAL_CRYP_STATE_READY);

//      current_model_data = g_tflm_network_model_data;
  current_model_data = decrypted_model_data;
  g_tflm_network_model_data_len = decrypted_model_size;

  //read params of layer 1 from SD card
  encrypted_model_size = md_buffer[2];
  decrypted_model_size = md_buffer[3];
  block_size = encrypted_model_size / 512 + (encrypted_model_size % 512 == 0 ? 0 : 1);
  read2sd((uint8_t*)g_tflm_network_model_data_next, next_model_param_index, block_size);
  next_model_param_index += block_size;

  //processing the 0 layer
  MX_X_CUBE_AI_Init();
  MX_X_CUBE_AI_Process();

  //wait read layer 1 params finish
  check_wait_read_DMA();
  //TODO
  //decrypt params buffer and get model params
  if(HAL_CRYP_Decrypt_IT(&hcryp, g_tflm_network_model_data_next, encrypted_model_size, decrypted_model_data) != HAL_OK){
    Error_Handler();
  }
  while(HAL_CRYP_GetState(&hcryp) != HAL_CRYP_STATE_READY);

//        current_model_data = g_tflm_network_model_data_next;
  current_model_data = decrypted_model_data;
  g_tflm_network_model_data_len = decrypted_model_size;

  //TODO
  //read params of layer 2 from SD card
  //processing the 1 layer
  MX_X_CUBE_AI_Init();
  MX_X_CUBE_AI_Process();

////    current_model_data = &g_tflm_network_model_data_1[0];
//    current_model_data = yy;
//
//    g_tflm_network_model_data_len = g_tflm_network_model_data_len_1;
//    MX_X_CUBE_AI_Init();
//    MX_X_CUBE_AI_Process();

  /* USER CODE BEGIN 3 */
}


int main(void)
{
  /* SAU/IDAU, FPU and interrupts secure/non-secure allocation setup done */
  /* in SystemInit() based on partition_stm32l562xx.h file's definitions. */
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

/* Configure the peripherals common clocks */
  PeriphCommonClock_Config();
  /* GTZC initialisation */
  MX_GTZC_S_Init();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_CRC_Init();
  MX_ICACHE_Init();
  MX_SDMMC1_SD_Init();
  MX_AES_Init();
//  MX_X_CUBE_AI_Init();
  /* USER CODE BEGIN 2 */

  /* USER CODE END 2 */

  /*************** Setup and jump to non-secure *******************************/

//  NonSecure_Init();

  /* Non-secure software does not return, this code is not executed */
  /* Infinite loop */
  /* USER CODE BEGIN WHILE */


  //the metadata is stored on sd card from block 100 to 500 blocks
  //the format of metadata is encrypted data size, model data size
  //model data is stored from 501 blocks

  //read models metadata
  read2sd((uint8_t *)md_buffer, 100, 3);
  check_wait_read_DMA();
  NonSecure_Init();


//  __DNN_Start();

  while (1)
    {
//	  __DNN_Start();

	  //  	   int next_model_param_index = 501;
//
//      /* USER CODE END WHILE */
//
//  	    //read params of layer 0 from SD card
//  	    encrypted_model_size = md_buffer[0];
//  	    decrypted_model_size = md_buffer[1];
//  	    block_size = encrypted_model_size / 512 + (encrypted_model_size % 512 == 0 ? 0 : 1);
//  	    read2sd((uint8_t*)g_tflm_network_model_data, next_model_param_index, block_size);
//  //	    read2sd((uint8_t*)tmp_g_tflm_network_model_data, next_model_param_index, block_size);
//  	    next_model_param_index += block_size;
//  	    //TODO
//     	//decrypt params buffer and get model params
// 	    check_wait_read_DMA();
//
//  	    if(HAL_CRYP_Decrypt_IT(&hcryp, g_tflm_network_model_data, encrypted_model_size, decrypted_model_data) != HAL_OK){
//  	      	Error_Handler();
//  	    }
//  	    while(HAL_CRYP_GetState(&hcryp) != HAL_CRYP_STATE_READY);
//
////     	current_model_data = g_tflm_network_model_data;
//  	    current_model_data = decrypted_model_data;
//  	    g_tflm_network_model_data_len = decrypted_model_size;
//
//  	    //read params of layer 1 from SD card
//  	    encrypted_model_size = md_buffer[2];
//  	    decrypted_model_size = md_buffer[3];
//  	    block_size = encrypted_model_size / 512 + (encrypted_model_size % 512 == 0 ? 0 : 1);
//  	    read2sd((uint8_t*)g_tflm_network_model_data_next, next_model_param_index, block_size);
//  	    next_model_param_index += block_size;
//
//  	    //processing the 0 layer
//  		MX_X_CUBE_AI_Init();
//  		MX_X_CUBE_AI_Process();
//
//  		//wait read layer 1 params finish
//  	    check_wait_read_DMA();
//  	    //TODO
//  	    //decrypt params buffer and get model params
//  	    if(HAL_CRYP_Decrypt_IT(&hcryp, g_tflm_network_model_data_next, encrypted_model_size, decrypted_model_data) != HAL_OK){
//  	      	Error_Handler();
//  	    }
//  	    while(HAL_CRYP_GetState(&hcryp) != HAL_CRYP_STATE_READY);
//
////  	    current_model_data = g_tflm_network_model_data_next;
//  	    current_model_data = decrypted_model_data;
//  	    g_tflm_network_model_data_len = decrypted_model_size;
//
//  	    //TODO
//  	    //read params of layer 2 from SD card
//  	    //processing the 1 layer
//  		MX_X_CUBE_AI_Init();
//  		MX_X_CUBE_AI_Process();
//
//  ////		current_model_data = &g_tflm_network_model_data_1[0];
//  //		current_model_data = yy;
//  //
//  //		g_tflm_network_model_data_len = g_tflm_network_model_data_len_1;
//  //		MX_X_CUBE_AI_Init();
//  //		MX_X_CUBE_AI_Process();
//
//      /* USER CODE BEGIN 3 */
    }
  /* USER CODE END 3 */
}

/**
  * @brief  Non-secure call function
  *         This function is responsible for Non-secure initialization and switch
  *         to non-secure state
  * @retval None
  */
static void NonSecure_Init(void)
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
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  if (HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE0) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure LSE Drive Capability
  */
  HAL_PWR_EnableBkUpAccess();
  __HAL_RCC_LSEDRIVE_CONFIG(RCC_LSEDRIVE_LOW);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI|RCC_OSCILLATORTYPE_LSE
                              |RCC_OSCILLATORTYPE_MSI;
  RCC_OscInitStruct.LSEState = RCC_LSE_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.MSIState = RCC_MSI_ON;
  RCC_OscInitStruct.MSICalibrationValue = RCC_MSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.MSIClockRange = RCC_MSIRANGE_11;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_MSI;
  RCC_OscInitStruct.PLL.PLLM = 12;
  RCC_OscInitStruct.PLL.PLLN = 55;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV7;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }

  /** Enable MSI Auto calibration
  */
  HAL_RCCEx_EnableMSIPLLMode();
}

/**
  * @brief Peripherals Common Clock Configuration
  * @retval None
  */
void PeriphCommonClock_Config(void)
{
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the common periph clock
  */
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_ADC|RCC_PERIPHCLK_SAI1;
  PeriphClkInit.Sai1ClockSelection = RCC_SAI1CLKSOURCE_PLLSAI1;
  PeriphClkInit.AdcClockSelection = RCC_ADCCLKSOURCE_PLLSAI1;
  PeriphClkInit.PLLSAI1.PLLSAI1Source = RCC_PLLSAI1SOURCE_HSI;
  PeriphClkInit.PLLSAI1.PLLSAI1M = 4;
  PeriphClkInit.PLLSAI1.PLLSAI1N = 48;
  PeriphClkInit.PLLSAI1.PLLSAI1P = RCC_PLLP_DIV17;
  PeriphClkInit.PLLSAI1.PLLSAI1Q = RCC_PLLQ_DIV2;
  PeriphClkInit.PLLSAI1.PLLSAI1R = RCC_PLLR_DIV2;
  PeriphClkInit.PLLSAI1.PLLSAI1ClockOut = RCC_PLLSAI1_SAI1CLK|RCC_PLLSAI1_ADC1CLK;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief AES Initialization Function
  * @param None
  * @retval None
  */
static void MX_AES_Init(void)
{

  /* USER CODE BEGIN AES_Init 0 */

  /* USER CODE END AES_Init 0 */

  /* USER CODE BEGIN AES_Init 1 */

  /* USER CODE END AES_Init 1 */
  hcryp.Instance = AES;
  hcryp.Init.DataType = CRYP_DATATYPE_8B;
  hcryp.Init.KeySize = CRYP_KEYSIZE_128B;
  hcryp.Init.pKey = (uint32_t *)pKeyAES;
  hcryp.Init.pInitVect = (uint32_t *)pInitVectAES;
  hcryp.Init.Algorithm = CRYP_AES_CTR;
  hcryp.Init.DataWidthUnit = CRYP_DATAWIDTHUNIT_BYTE;
  hcryp.Init.KeyIVConfigSkip = CRYP_KEYIVCONFIG_ALWAYS;
  if (HAL_CRYP_Init(&hcryp) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN AES_Init 2 */

  /* USER CODE END AES_Init 2 */

}

/**
  * @brief CRC Initialization Function
  * @param None
  * @retval None
  */
static void MX_CRC_Init(void)
{

  /* USER CODE BEGIN CRC_Init 0 */

  /* USER CODE END CRC_Init 0 */

  /* USER CODE BEGIN CRC_Init 1 */

  /* USER CODE END CRC_Init 1 */
  hcrc.Instance = CRC;
  hcrc.Init.DefaultPolynomialUse = DEFAULT_POLYNOMIAL_ENABLE;
  hcrc.Init.DefaultInitValueUse = DEFAULT_INIT_VALUE_ENABLE;
  hcrc.Init.InputDataInversionMode = CRC_INPUTDATA_INVERSION_NONE;
  hcrc.Init.OutputDataInversionMode = CRC_OUTPUTDATA_INVERSION_DISABLE;
  hcrc.InputDataFormat = CRC_INPUTDATA_FORMAT_BYTES;
  if (HAL_CRC_Init(&hcrc) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN CRC_Init 2 */

  /* USER CODE END CRC_Init 2 */

}

/**
  * @brief GTZC_S Initialization Function
  * @param None
  * @retval None
  */
static void MX_GTZC_S_Init(void)
{

  /* USER CODE BEGIN GTZC_S_Init 0 */

  /* USER CODE END GTZC_S_Init 0 */

  MPCBB_ConfigTypeDef MPCBB_NonSecureArea_Desc = {0};

  /* USER CODE BEGIN GTZC_S_Init 1 */

  /* USER CODE END GTZC_S_Init 1 */
  if (HAL_GTZC_TZSC_ConfigPeriphAttributes(GTZC_PERIPH_USART1, GTZC_TZSC_PERIPH_SEC|GTZC_TZSC_PERIPH_NPRIV) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_GTZC_TZSC_ConfigPeriphAttributes(GTZC_PERIPH_CRC, GTZC_TZSC_PERIPH_SEC|GTZC_TZSC_PERIPH_NPRIV) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_GTZC_TZSC_ConfigPeriphAttributes(GTZC_PERIPH_ICACHE_REG, GTZC_TZSC_PERIPH_SEC|GTZC_TZSC_PERIPH_NPRIV) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_GTZC_TZSC_ConfigPeriphAttributes(GTZC_PERIPH_AES, GTZC_TZSC_PERIPH_SEC|GTZC_TZSC_PERIPH_NPRIV) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_GTZC_TZSC_ConfigPeriphAttributes(GTZC_PERIPH_SDMMC1, GTZC_TZSC_PERIPH_SEC|GTZC_TZSC_PERIPH_NPRIV) != HAL_OK)
  {
    Error_Handler();
  }
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
    Error_Handler();
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
    Error_Handler();
  }
  /* USER CODE BEGIN GTZC_S_Init 2 */

  /* USER CODE END GTZC_S_Init 2 */

}

/**
  * @brief ICACHE Initialization Function
  * @param None
  * @retval None
  */
static void MX_ICACHE_Init(void)
{

  /* USER CODE BEGIN ICACHE_Init 0 */

  /* USER CODE END ICACHE_Init 0 */

  /* USER CODE BEGIN ICACHE_Init 1 */

  /* USER CODE END ICACHE_Init 1 */

  /** Enable instruction cache (default 2-ways set associative cache)
  */
  if (HAL_ICACHE_Enable() != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ICACHE_Init 2 */

  /* USER CODE END ICACHE_Init 2 */

}

/**
  * @brief SDMMC1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SDMMC1_SD_Init(void)
{

  /* USER CODE BEGIN SDMMC1_Init 0 */

  /* USER CODE END SDMMC1_Init 0 */

  /* USER CODE BEGIN SDMMC1_Init 1 */

  /* USER CODE END SDMMC1_Init 1 */
  hsd1.Instance = SDMMC1;
  hsd1.Init.ClockEdge = SDMMC_CLOCK_EDGE_RISING;
  hsd1.Init.ClockPowerSave = SDMMC_CLOCK_POWER_SAVE_ENABLE;
  hsd1.Init.BusWide = SDMMC_BUS_WIDE_4B;
  hsd1.Init.HardwareFlowControl = SDMMC_HARDWARE_FLOW_CONTROL_ENABLE;
  hsd1.Init.ClockDiv = 0;
  if (HAL_SD_Init(&hsd1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SDMMC1_Init 2 */

  /* USER CODE END SDMMC1_Init 2 */

}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 115200;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  huart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart1.Init.ClockPrescaler = UART_PRESCALER_DIV1;
  huart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetTxFifoThreshold(&huart1, UART_TXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetRxFifoThreshold(&huart1, UART_RXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_DisableFifoMode(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOF_CLK_ENABLE();
  __HAL_RCC_GPIOG_CLK_ENABLE();
  HAL_PWREx_EnableVddIO2();

  /*IO attributes management functions */
  HAL_GPIO_ConfigPinAttributes(GPIOE, GPIO_PIN_5|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_2
                          |GPIO_PIN_6|GPIO_PIN_8|GPIO_PIN_10|GPIO_PIN_12
                          |GPIO_PIN_7|GPIO_PIN_14|GPIO_PIN_11|GPIO_PIN_15
                          |GPIO_PIN_9|GPIO_PIN_13, GPIO_PIN_NSEC);

  /*IO attributes management functions */
  HAL_GPIO_ConfigPinAttributes(GPIOD, GPIO_PIN_5|GPIO_PIN_4|GPIO_PIN_1|GPIO_PIN_0
                          |GPIO_PIN_7|GPIO_PIN_14|GPIO_PIN_15|GPIO_PIN_9
                          |GPIO_PIN_8|GPIO_PIN_10, GPIO_PIN_NSEC);

  /*IO attributes management functions */
  HAL_GPIO_ConfigPinAttributes(GPIOA, GPIO_PIN_15|GPIO_PIN_12|GPIO_PIN_11|GPIO_PIN_2
                          |GPIO_PIN_7|GPIO_PIN_3|GPIO_PIN_6|VBUS_SENSE_Pin, GPIO_PIN_NSEC);

  /*IO attributes management functions */
  HAL_GPIO_ConfigPinAttributes(GPIOF, GPIO_PIN_0, GPIO_PIN_NSEC);

  /*IO attributes management functions */
  HAL_GPIO_ConfigPinAttributes(GPIOC, GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_1|GPIO_PIN_0, GPIO_PIN_NSEC);

  /*IO attributes management functions */
  HAL_GPIO_ConfigPinAttributes(GPIOG, GPIO_PIN_7|GPIO_PIN_4|GPIO_PIN_2|GPIO_PIN_3
                          |BLE_CSN_Pin, GPIO_PIN_NSEC);

  /*IO attributes management functions */
  HAL_GPIO_ConfigPinAttributes(GPIOB, GPIO_PIN_2|GPIO_PIN_15|GPIO_PIN_1|GPIO_PIN_12
                          |GPIO_PIN_0, GPIO_PIN_NSEC);

  /*Configure GPIO pins : PB6 PB7 */
  GPIO_InitStruct.Pin = GPIO_PIN_6|GPIO_PIN_7;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_OD;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  GPIO_InitStruct.Alternate = GPIO_AF4_I2C1;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
