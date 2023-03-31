################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Middlewares/Third_Party/FatFs/src/diskio.c \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Middlewares/Third_Party/FatFs/src/ff.c \
/home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Middlewares/Third_Party/FatFs/src/ff_gen_drv.c 

OBJS += \
./Middlewares/FatFs/Core/diskio.o \
./Middlewares/FatFs/Core/ff.o \
./Middlewares/FatFs/Core/ff_gen_drv.o 

C_DEPS += \
./Middlewares/FatFs/Core/diskio.d \
./Middlewares/FatFs/Core/ff.d \
./Middlewares/FatFs/Core/ff_gen_drv.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/FatFs/Core/diskio.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Middlewares/Third_Party/FatFs/src/diskio.c Middlewares/FatFs/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../Drivers/BSP/Components/mfxstm32l152 -I../../../NonSecure/Core/Src -I../../../NonSecure/Core/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../.. -I../../../Drivers/BSP/STM32L562E-DK -I../../../NonSecure/FATFS/App -I../../../Drivers/CMSIS/Include -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../NonSecure/FATFS/Target -I../../../Drivers/STM32L5xx_HAL_Driver/Src -I../../../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/FatFs/Core/ff.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Middlewares/Third_Party/FatFs/src/ff.c Middlewares/FatFs/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../Drivers/BSP/Components/mfxstm32l152 -I../../../NonSecure/Core/Src -I../../../NonSecure/Core/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../.. -I../../../Drivers/BSP/STM32L562E-DK -I../../../NonSecure/FATFS/App -I../../../Drivers/CMSIS/Include -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../NonSecure/FATFS/Target -I../../../Drivers/STM32L5xx_HAL_Driver/Src -I../../../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/FatFs/Core/ff_gen_drv.o: /home/cspl/STM32CubeIDE/workspace_tinyml/FatFs_uSD_TrustZone/Middlewares/Third_Party/FatFs/src/ff_gen_drv.c Middlewares/FatFs/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L562xx -DDEBUG -c -I../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../Drivers/BSP/Components/mfxstm32l152 -I../../../NonSecure/Core/Src -I../../../NonSecure/Core/Inc -I../../../Secure_nsclib -I../../../Middlewares/Third_Party/FatFs/src/option -I../../.. -I../../../Drivers/BSP/STM32L562E-DK -I../../../NonSecure/FATFS/App -I../../../Drivers/CMSIS/Include -I../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../NonSecure/FATFS/Target -I../../../Drivers/STM32L5xx_HAL_Driver/Src -I../../../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-FatFs-2f-Core

clean-Middlewares-2f-FatFs-2f-Core:
	-$(RM) ./Middlewares/FatFs/Core/diskio.cyclo ./Middlewares/FatFs/Core/diskio.d ./Middlewares/FatFs/Core/diskio.o ./Middlewares/FatFs/Core/diskio.su ./Middlewares/FatFs/Core/ff.cyclo ./Middlewares/FatFs/Core/ff.d ./Middlewares/FatFs/Core/ff.o ./Middlewares/FatFs/Core/ff.su ./Middlewares/FatFs/Core/ff_gen_drv.cyclo ./Middlewares/FatFs/Core/ff_gen_drv.d ./Middlewares/FatFs/Core/ff_gen_drv.o ./Middlewares/FatFs/Core/ff_gen_drv.su

.PHONY: clean-Middlewares-2f-FatFs-2f-Core

