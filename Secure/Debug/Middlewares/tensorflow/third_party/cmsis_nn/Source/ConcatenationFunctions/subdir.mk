################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_w.c \
../Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_x.c \
../Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_y.c \
../Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_z.c 

C_DEPS += \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_w.d \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_x.d \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_y.d \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_z.d 

OBJS += \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_w.o \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_x.o \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_y.o \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_z.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/%.o Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/%.su: ../Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/%.c Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L562xx -DTFLM_RUNTIME -DCMSIS_NN -DTFLM_RUNTIME_USE_ALL_OPERATORS=0 -DTF_LITE_STATIC_MEMORY -DTF_LITE_DISABLE_X86_NEON -DTF_LITE_MCU_DEBUG_LOG -DARM_MATH -DARM_MATH_LOOPUNROLL -DARM_MATH_DSP -DARM_MATH_CM33 -D__FPU_PRESENT=1U -c -I../Core/Inc -I../../Secure_nsclib -I../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../X-CUBE-AI/App -I../X-CUBE-AI -I../X-CUBE-AI/Target -I../Middlewares/tensorflow -I../Middlewares/tensorflow/third_party/flatbuffers/include -I../Middlewares/tensorflow/third_party/cmsis_nn -I../Middlewares/tensorflow/third_party/cmsis_nn/Include -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core -I../Middlewares/tensorflow/third_party/gemmlowp -I../Middlewares/tensorflow/third_party/ruy -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core/Include -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-tensorflow-2f-third_party-2f-cmsis_nn-2f-Source-2f-ConcatenationFunctions

clean-Middlewares-2f-tensorflow-2f-third_party-2f-cmsis_nn-2f-Source-2f-ConcatenationFunctions:
	-$(RM) ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_w.d ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_w.o ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_w.su ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_x.d ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_x.o ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_x.su ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_y.d ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_y.o ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_y.su ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_z.d ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_z.o ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_z.su

.PHONY: clean-Middlewares-2f-tensorflow-2f-third_party-2f-cmsis_nn-2f-Source-2f-ConcatenationFunctions

