################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App/app_fatfs.c 

OBJS += \
./Example/FATFS/App/app_fatfs.o 

C_DEPS += \
./Example/FATFS/App/app_fatfs.d 


# Each subdirectory must supply rules for building sources it contributes
Example/FATFS/App/app_fatfs.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App/app_fatfs.c Example/FATFS/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/STM32L5xx_HAL_Driver/Src -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/Target -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/Components/mfxstm32l152 -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../../Drivers/BSP/STM32L562E-DK -I../../../Secure/Inc -I../../../Middlewares/Third_Party/FatFs/src -I../../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Example-2f-FATFS-2f-App

clean-Example-2f-FATFS-2f-App:
	-$(RM) ./Example/FATFS/App/app_fatfs.cyclo ./Example/FATFS/App/app_fatfs.d ./Example/FATFS/App/app_fatfs.o ./Example/FATFS/App/app_fatfs.su

.PHONY: clean-Example-2f-FATFS-2f-App

