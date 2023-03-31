################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.c \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.c 

OBJS += \
./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.o \
./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.o 

C_DEPS += \
./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.d \
./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.c Drivers/BSP/STM32L562E-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../Drivers/BSP/Components/mfxstm32l152 -I../../../NonSecure/Core/Src -I../../../NonSecure/Core/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../.. -I../../../Drivers/BSP/STM32L562E-DK -I../../../NonSecure/FATFS/App -I../../../Drivers/CMSIS/Include -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../NonSecure/FATFS/Target -I../../../Drivers/STM32L5xx_HAL_Driver/Src -I../../../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.c Drivers/BSP/STM32L562E-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../Drivers/BSP/Components/mfxstm32l152 -I../../../NonSecure/Core/Src -I../../../NonSecure/Core/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../.. -I../../../Drivers/BSP/STM32L562E-DK -I../../../NonSecure/FATFS/App -I../../../Drivers/CMSIS/Include -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../NonSecure/FATFS/Target -I../../../Drivers/STM32L5xx_HAL_Driver/Src -I../../../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-STM32L562E-2d-DK

clean-Drivers-2f-BSP-2f-STM32L562E-2d-DK:
	-$(RM) ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.cyclo ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.d ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.o ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery.su ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.cyclo ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.d ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.o ./Drivers/BSP/STM32L562E-DK/stm32l562e_discovery_bus.su

.PHONY: clean-Drivers-2f-BSP-2f-STM32L562E-2d-DK

