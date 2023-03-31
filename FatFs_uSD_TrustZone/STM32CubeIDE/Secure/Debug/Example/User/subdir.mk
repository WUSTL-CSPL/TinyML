################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Secure/Src/main.c \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Secure/Src/secure_nsc.c \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Secure/Src/stm32l5xx_hal_msp.c \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Secure/Src/stm32l5xx_it.c \
../Example/User/syscalls.c \
../Example/User/sysmem.c 

OBJS += \
./Example/User/main.o \
./Example/User/secure_nsc.o \
./Example/User/stm32l5xx_hal_msp.o \
./Example/User/stm32l5xx_it.o \
./Example/User/syscalls.o \
./Example/User/sysmem.o 

C_DEPS += \
./Example/User/main.d \
./Example/User/secure_nsc.d \
./Example/User/stm32l5xx_hal_msp.d \
./Example/User/stm32l5xx_it.d \
./Example/User/syscalls.d \
./Example/User/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
Example/User/main.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Secure/Src/main.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/STM32L5xx_HAL_Driver/Src -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/Target -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/Components/mfxstm32l152 -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../../Drivers/BSP/STM32L562E-DK -I../../../Secure/Inc -I../../../Middlewares/Third_Party/FatFs/src -I../../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/secure_nsc.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Secure/Src/secure_nsc.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/STM32L5xx_HAL_Driver/Src -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/Target -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/Components/mfxstm32l152 -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../../Drivers/BSP/STM32L562E-DK -I../../../Secure/Inc -I../../../Middlewares/Third_Party/FatFs/src -I../../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/stm32l5xx_hal_msp.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Secure/Src/stm32l5xx_hal_msp.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/STM32L5xx_HAL_Driver/Src -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/Target -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/Components/mfxstm32l152 -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../../Drivers/BSP/STM32L562E-DK -I../../../Secure/Inc -I../../../Middlewares/Third_Party/FatFs/src -I../../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/stm32l5xx_it.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Secure/Src/stm32l5xx_it.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/STM32L5xx_HAL_Driver/Src -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/Target -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/Components/mfxstm32l152 -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../../Drivers/BSP/STM32L562E-DK -I../../../Secure/Inc -I../../../Middlewares/Third_Party/FatFs/src -I../../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/%.o Example/User/%.su Example/User/%.cyclo: ../Example/User/%.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/STM32L5xx_HAL_Driver/Src -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/Target -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/Components/mfxstm32l152 -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../../Drivers/BSP/STM32L562E-DK -I../../../Secure/Inc -I../../../Middlewares/Third_Party/FatFs/src -I../../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Example-2f-User

clean-Example-2f-User:
	-$(RM) ./Example/User/main.cyclo ./Example/User/main.d ./Example/User/main.o ./Example/User/main.su ./Example/User/secure_nsc.cyclo ./Example/User/secure_nsc.d ./Example/User/secure_nsc.o ./Example/User/secure_nsc.su ./Example/User/stm32l5xx_hal_msp.cyclo ./Example/User/stm32l5xx_hal_msp.d ./Example/User/stm32l5xx_hal_msp.o ./Example/User/stm32l5xx_hal_msp.su ./Example/User/stm32l5xx_it.cyclo ./Example/User/stm32l5xx_it.d ./Example/User/stm32l5xx_it.o ./Example/User/stm32l5xx_it.su ./Example/User/syscalls.cyclo ./Example/User/syscalls.d ./Example/User/syscalls.o ./Example/User/syscalls.su ./Example/User/sysmem.cyclo ./Example/User/sysmem.d ./Example/User/sysmem.o ./Example/User/sysmem.su

.PHONY: clean-Example-2f-User

