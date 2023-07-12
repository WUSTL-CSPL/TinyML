################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu6_s8.c \
../Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q15.c \
../Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q7.c 

C_DEPS += \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu6_s8.d \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q15.d \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q7.d 

OBJS += \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu6_s8.o \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q15.o \
./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q7.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/%.o Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/%.su: ../Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/%.c Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L562xx -DTFLM_RUNTIME -DCMSIS_NN -DTFLM_RUNTIME_USE_ALL_OPERATORS=0 -DTF_LITE_STATIC_MEMORY -DTF_LITE_DISABLE_X86_NEON -DTF_LITE_MCU_DEBUG_LOG -DARM_MATH -DARM_MATH_LOOPUNROLL -DARM_MATH_DSP -DARM_MATH_CM33 -D__FPU_PRESENT=1U -c -I../Core/Inc -I../../Secure_nsclib -I../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../X-CUBE-AI/App -I../X-CUBE-AI -I../X-CUBE-AI/Target -I../Middlewares/tensorflow -I../Middlewares/tensorflow/third_party/flatbuffers/include -I../Middlewares/tensorflow/third_party/cmsis_nn -I../Middlewares/tensorflow/third_party/cmsis_nn/Include -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core -I../Middlewares/tensorflow/third_party/gemmlowp -I../Middlewares/tensorflow/third_party/ruy -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core/Include -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-tensorflow-2f-third_party-2f-cmsis_nn-2f-Source-2f-ActivationFunctions

clean-Middlewares-2f-tensorflow-2f-third_party-2f-cmsis_nn-2f-Source-2f-ActivationFunctions:
	-$(RM) ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu6_s8.d ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu6_s8.o ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu6_s8.su ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q15.d ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q15.o ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q15.su ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q7.d ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q7.o ./Middlewares/tensorflow/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q7.su

.PHONY: clean-Middlewares-2f-tensorflow-2f-third_party-2f-cmsis_nn-2f-Source-2f-ActivationFunctions

