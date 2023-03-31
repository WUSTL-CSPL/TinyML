################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App/app_fatfs.c 

OBJS += \
./Example/User/FATFS/App/app_fatfs.o 

C_DEPS += \
./Example/User/FATFS/App/app_fatfs.d 


# Each subdirectory must supply rules for building sources it contributes
Example/User/FATFS/App/app_fatfs.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App/app_fatfs.c Example/User/FATFS/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../Drivers/BSP/Components/mfxstm32l152 -I../../../NonSecure/Core/Src -I../../../NonSecure/Core/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../.. -I../../../Drivers/BSP/STM32L562E-DK -I../../../NonSecure/FATFS/App -I../../../Drivers/CMSIS/Include -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../NonSecure/FATFS/Target -I../../../Drivers/STM32L5xx_HAL_Driver/Src -I../../../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Example-2f-User-2f-FATFS-2f-App

clean-Example-2f-User-2f-FATFS-2f-App:
	-$(RM) ./Example/User/FATFS/App/app_fatfs.cyclo ./Example/User/FATFS/App/app_fatfs.d ./Example/User/FATFS/App/app_fatfs.o ./Example/User/FATFS/App/app_fatfs.su

.PHONY: clean-Example-2f-User-2f-FATFS-2f-App

