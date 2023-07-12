################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/main.c \
../Core/Src/secure_nsc.c \
../Core/Src/stm32l5xx_hal_msp.c \
../Core/Src/stm32l5xx_it.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32l5xx_s.c 

C_DEPS += \
./Core/Src/main.d \
./Core/Src/secure_nsc.d \
./Core/Src/stm32l5xx_hal_msp.d \
./Core/Src/stm32l5xx_it.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32l5xx_s.d 

OBJS += \
./Core/Src/main.o \
./Core/Src/secure_nsc.o \
./Core/Src/stm32l5xx_hal_msp.o \
./Core/Src/stm32l5xx_it.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32l5xx_s.o 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L562xx -DTFLM_RUNTIME -DCMSIS_NN -DTFLM_RUNTIME_USE_ALL_OPERATORS=0 -DTF_LITE_STATIC_MEMORY -DTF_LITE_DISABLE_X86_NEON -DTF_LITE_MCU_DEBUG_LOG -DARM_MATH -DARM_MATH_LOOPUNROLL -DARM_MATH_DSP -DARM_MATH_CM33 -D__FPU_PRESENT=1U -c -I../Core/Inc -I../../Secure_nsclib -I../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../X-CUBE-AI/App -I../X-CUBE-AI -I../X-CUBE-AI/Target -I../Middlewares/tensorflow -I../Middlewares/tensorflow/third_party/flatbuffers/include -I../Middlewares/tensorflow/third_party/cmsis_nn -I../Middlewares/tensorflow/third_party/cmsis_nn/Include -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core -I../Middlewares/tensorflow/third_party/gemmlowp -I../Middlewares/tensorflow/third_party/ruy -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core/Include -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/secure_nsc.d ./Core/Src/secure_nsc.o ./Core/Src/secure_nsc.su ./Core/Src/stm32l5xx_hal_msp.d ./Core/Src/stm32l5xx_hal_msp.o ./Core/Src/stm32l5xx_hal_msp.su ./Core/Src/stm32l5xx_it.d ./Core/Src/stm32l5xx_it.o ./Core/Src/stm32l5xx_it.su ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32l5xx_s.d ./Core/Src/system_stm32l5xx_s.o ./Core/Src/system_stm32l5xx_s.su

.PHONY: clean-Core-2f-Src

