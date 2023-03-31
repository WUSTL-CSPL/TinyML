################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Secure/Src/system_stm32l5xx_s.c 

OBJS += \
./Drivers/CMSIS/system_stm32l5xx_s.o 

C_DEPS += \
./Drivers/CMSIS/system_stm32l5xx_s.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/system_stm32l5xx_s.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Secure/Src/system_stm32l5xx_s.c Drivers/CMSIS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/STM32L5xx_HAL_Driver/Src -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/Target -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/Components/mfxstm32l152 -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../../Drivers/BSP/STM32L562E-DK -I../../../Secure/Inc -I../../../Middlewares/Third_Party/FatFs/src -I../../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS

clean-Drivers-2f-CMSIS:
	-$(RM) ./Drivers/CMSIS/system_stm32l5xx_s.cyclo ./Drivers/CMSIS/system_stm32l5xx_s.d ./Drivers/CMSIS/system_stm32l5xx_s.o ./Drivers/CMSIS/system_stm32l5xx_s.su

.PHONY: clean-Drivers-2f-CMSIS

