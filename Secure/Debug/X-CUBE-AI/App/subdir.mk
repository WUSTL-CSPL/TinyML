################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../X-CUBE-AI/App/debug_log_imp.cc \
../X-CUBE-AI/App/tflm_c.cc 

C_SRCS += \
../X-CUBE-AI/App/aiSystemPerformance_TFLM.c \
../X-CUBE-AI/App/aiTestHelper.c \
../X-CUBE-AI/App/aiTestUtility.c \
../X-CUBE-AI/App/app_x-cube-ai.c \
../X-CUBE-AI/App/lc_print.c \
../X-CUBE-AI/App/network.c 

C_DEPS += \
./X-CUBE-AI/App/aiSystemPerformance_TFLM.d \
./X-CUBE-AI/App/aiTestHelper.d \
./X-CUBE-AI/App/aiTestUtility.d \
./X-CUBE-AI/App/app_x-cube-ai.d \
./X-CUBE-AI/App/lc_print.d \
./X-CUBE-AI/App/network.d 

CC_DEPS += \
./X-CUBE-AI/App/debug_log_imp.d \
./X-CUBE-AI/App/tflm_c.d 

OBJS += \
./X-CUBE-AI/App/aiSystemPerformance_TFLM.o \
./X-CUBE-AI/App/aiTestHelper.o \
./X-CUBE-AI/App/aiTestUtility.o \
./X-CUBE-AI/App/app_x-cube-ai.o \
./X-CUBE-AI/App/debug_log_imp.o \
./X-CUBE-AI/App/lc_print.o \
./X-CUBE-AI/App/network.o \
./X-CUBE-AI/App/tflm_c.o 


# Each subdirectory must supply rules for building sources it contributes
X-CUBE-AI/App/%.o X-CUBE-AI/App/%.su: ../X-CUBE-AI/App/%.c X-CUBE-AI/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L562xx -DTFLM_RUNTIME -DCMSIS_NN -DTFLM_RUNTIME_USE_ALL_OPERATORS=0 -DTF_LITE_STATIC_MEMORY -DTF_LITE_DISABLE_X86_NEON -DTF_LITE_MCU_DEBUG_LOG -DARM_MATH -DARM_MATH_LOOPUNROLL -DARM_MATH_DSP -DARM_MATH_CM33 -D__FPU_PRESENT=1U -c -I../Core/Inc -I../../Secure_nsclib -I../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../X-CUBE-AI/App -I../X-CUBE-AI -I../X-CUBE-AI/Target -I../Middlewares/tensorflow -I../Middlewares/tensorflow/third_party/flatbuffers/include -I../Middlewares/tensorflow/third_party/cmsis_nn -I../Middlewares/tensorflow/third_party/cmsis_nn/Include -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core -I../Middlewares/tensorflow/third_party/gemmlowp -I../Middlewares/tensorflow/third_party/ruy -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core/Include -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
X-CUBE-AI/App/%.o X-CUBE-AI/App/%.su: ../X-CUBE-AI/App/%.cc X-CUBE-AI/App/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m33 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L562xx -DTFLM_RUNTIME -DCMSIS_NN -DTFLM_RUNTIME_USE_ALL_OPERATORS=0 -DTF_LITE_STATIC_MEMORY -DTF_LITE_DISABLE_X86_NEON -DTF_LITE_MCU_DEBUG_LOG -DARM_MATH -DARM_MATH_LOOPUNROLL -DARM_MATH_DSP -DARM_MATH_CM33 -D__FPU_PRESENT=1U -c -I../Core/Inc -I../../Secure_nsclib -I../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../X-CUBE-AI/App -I../X-CUBE-AI -I../X-CUBE-AI/Target -I../Middlewares/tensorflow -I../Middlewares/tensorflow/third_party/flatbuffers/include -I../Middlewares/tensorflow/third_party/cmsis_nn -I../Middlewares/tensorflow/third_party/cmsis_nn/Include -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core -I../Middlewares/tensorflow/third_party/gemmlowp -I../Middlewares/tensorflow/third_party/ruy -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core/Include -Os -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-X-2d-CUBE-2d-AI-2f-App

clean-X-2d-CUBE-2d-AI-2f-App:
	-$(RM) ./X-CUBE-AI/App/aiSystemPerformance_TFLM.d ./X-CUBE-AI/App/aiSystemPerformance_TFLM.o ./X-CUBE-AI/App/aiSystemPerformance_TFLM.su ./X-CUBE-AI/App/aiTestHelper.d ./X-CUBE-AI/App/aiTestHelper.o ./X-CUBE-AI/App/aiTestHelper.su ./X-CUBE-AI/App/aiTestUtility.d ./X-CUBE-AI/App/aiTestUtility.o ./X-CUBE-AI/App/aiTestUtility.su ./X-CUBE-AI/App/app_x-cube-ai.d ./X-CUBE-AI/App/app_x-cube-ai.o ./X-CUBE-AI/App/app_x-cube-ai.su ./X-CUBE-AI/App/debug_log_imp.d ./X-CUBE-AI/App/debug_log_imp.o ./X-CUBE-AI/App/debug_log_imp.su ./X-CUBE-AI/App/lc_print.d ./X-CUBE-AI/App/lc_print.o ./X-CUBE-AI/App/lc_print.su ./X-CUBE-AI/App/network.d ./X-CUBE-AI/App/network.o ./X-CUBE-AI/App/network.su ./X-CUBE-AI/App/tflm_c.d ./X-CUBE-AI/App/tflm_c.o ./X-CUBE-AI/App/tflm_c.su

.PHONY: clean-X-2d-CUBE-2d-AI-2f-App

