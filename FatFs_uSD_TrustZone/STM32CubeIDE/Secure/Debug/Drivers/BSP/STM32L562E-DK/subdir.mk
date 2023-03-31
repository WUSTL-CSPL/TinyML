################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.c \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.c \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_sd.c 

OBJS += \
./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.o \
./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.o \
./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_sd.o 

C_DEPS += \
./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.d \
./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.d \
./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_sd.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.c Drivers/BSP/STM32L562E-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/STM32L5xx_HAL_Driver/Src -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/Target -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/Components/mfxstm32l152 -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../../Drivers/BSP/STM32L562E-DK -I../../../Secure/Inc -I../../../Middlewares/Third_Party/FatFs/src -I../../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.c Drivers/BSP/STM32L562E-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/STM32L5xx_HAL_Driver/Src -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/Target -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/Components/mfxstm32l152 -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../../Drivers/BSP/STM32L562E-DK -I../../../Secure/Inc -I../../../Middlewares/Third_Party/FatFs/src -I../../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_sd.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_sd.c Drivers/BSP/STM32L562E-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/STM32L5xx_HAL_Driver/Src -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/App -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/NonSecure/FATFS/Target -I/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/Components/mfxstm32l152 -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../../Drivers/BSP/STM32L562E-DK -I../../../Secure/Inc -I../../../Middlewares/Third_Party/FatFs/src -I../../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-STM32L562E-2d-DK

clean-Drivers-2f-BSP-2f-STM32L562E-2d-DK:
	-$(RM) ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.cyclo ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.d ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.o ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.su ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.cyclo ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.d ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.o ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.su ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_sd.cyclo ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_sd.d ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_sd.o ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_sd.su

.PHONY: clean-Drivers-2f-BSP-2f-STM32L562E-2d-DK

