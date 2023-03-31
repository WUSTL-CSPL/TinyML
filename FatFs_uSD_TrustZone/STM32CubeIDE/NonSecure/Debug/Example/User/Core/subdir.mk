################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/Core/Src/main.c \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/Core/Src/stm32l5xx_hal_msp.c \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/Core/Src/stm32l5xx_it.c \
../Example/User/Core/syscalls.c \
../Example/User/Core/sysmem.c 

OBJS += \
./Example/User/Core/main.o \
./Example/User/Core/stm32l5xx_hal_msp.o \
./Example/User/Core/stm32l5xx_it.o \
./Example/User/Core/syscalls.o \
./Example/User/Core/sysmem.o 

C_DEPS += \
./Example/User/Core/main.d \
./Example/User/Core/stm32l5xx_hal_msp.d \
./Example/User/Core/stm32l5xx_it.d \
./Example/User/Core/syscalls.d \
./Example/User/Core/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
Example/User/Core/main.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/Core/Src/main.c Example/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../Drivers/BSP/Components/mfxstm32l152 -I../../../NonSecure/Core/Src -I../../../NonSecure/Core/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../.. -I../../../Drivers/BSP/STM32L562E-DK -I../../../NonSecure/FATFS/App -I../../../Drivers/CMSIS/Include -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../NonSecure/FATFS/Target -I../../../Drivers/STM32L5xx_HAL_Driver/Src -I../../../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/Core/stm32l5xx_hal_msp.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/Core/Src/stm32l5xx_hal_msp.c Example/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../Drivers/BSP/Components/mfxstm32l152 -I../../../NonSecure/Core/Src -I../../../NonSecure/Core/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../.. -I../../../Drivers/BSP/STM32L562E-DK -I../../../NonSecure/FATFS/App -I../../../Drivers/CMSIS/Include -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../NonSecure/FATFS/Target -I../../../Drivers/STM32L5xx_HAL_Driver/Src -I../../../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/Core/stm32l5xx_it.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/Core/Src/stm32l5xx_it.c Example/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../Drivers/BSP/Components/mfxstm32l152 -I../../../NonSecure/Core/Src -I../../../NonSecure/Core/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../.. -I../../../Drivers/BSP/STM32L562E-DK -I../../../NonSecure/FATFS/App -I../../../Drivers/CMSIS/Include -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../NonSecure/FATFS/Target -I../../../Drivers/STM32L5xx_HAL_Driver/Src -I../../../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/Core/%.o Example/User/Core/%.su Example/User/Core/%.cyclo: ../Example/User/Core/%.c Example/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../Drivers/BSP/Components/mfxstm32l152 -I../../../NonSecure/Core/Src -I../../../NonSecure/Core/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../.. -I../../../Drivers/BSP/STM32L562E-DK -I../../../NonSecure/FATFS/App -I../../../Drivers/CMSIS/Include -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../NonSecure/FATFS/Target -I../../../Drivers/STM32L5xx_HAL_Driver/Src -I../../../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Example-2f-User-2f-Core

clean-Example-2f-User-2f-Core:
	-$(RM) ./Example/User/Core/main.cyclo ./Example/User/Core/main.d ./Example/User/Core/main.o ./Example/User/Core/main.su ./Example/User/Core/stm32l5xx_hal_msp.cyclo ./Example/User/Core/stm32l5xx_hal_msp.d ./Example/User/Core/stm32l5xx_hal_msp.o ./Example/User/Core/stm32l5xx_hal_msp.su ./Example/User/Core/stm32l5xx_it.cyclo ./Example/User/Core/stm32l5xx_it.d ./Example/User/Core/stm32l5xx_it.o ./Example/User/Core/stm32l5xx_it.su ./Example/User/Core/syscalls.cyclo ./Example/User/Core/syscalls.d ./Example/User/Core/syscalls.o ./Example/User/Core/syscalls.su ./Example/User/Core/sysmem.cyclo ./Example/User/Core/sysmem.d ./Example/User/Core/sysmem.o ./Example/User/Core/sysmem.su

.PHONY: clean-Example-2f-User-2f-Core

