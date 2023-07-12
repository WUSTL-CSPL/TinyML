################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/greedy_memory_planner.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/linear_memory_planner.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.cc 

CC_DEPS += \
./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/greedy_memory_planner.d \
./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/linear_memory_planner.d \
./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.d 

OBJS += \
./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/greedy_memory_planner.o \
./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/linear_memory_planner.o \
./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/%.o Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/%.su: ../Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/%.cc Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m33 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L562xx -DTFLM_RUNTIME -DCMSIS_NN -DTFLM_RUNTIME_USE_ALL_OPERATORS=0 -DTF_LITE_STATIC_MEMORY -DTF_LITE_DISABLE_X86_NEON -DTF_LITE_MCU_DEBUG_LOG -DARM_MATH -DARM_MATH_LOOPUNROLL -DARM_MATH_DSP -DARM_MATH_CM33 -D__FPU_PRESENT=1U -c -I../Core/Inc -I../../Secure_nsclib -I../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../X-CUBE-AI/App -I../X-CUBE-AI -I../X-CUBE-AI/Target -I../Middlewares/tensorflow -I../Middlewares/tensorflow/third_party/flatbuffers/include -I../Middlewares/tensorflow/third_party/cmsis_nn -I../Middlewares/tensorflow/third_party/cmsis_nn/Include -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core -I../Middlewares/tensorflow/third_party/gemmlowp -I../Middlewares/tensorflow/third_party/ruy -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core/Include -Os -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-tensorflow-2f-tensorflow-2f-lite-2f-micro-2f-memory_planner

clean-Middlewares-2f-tensorflow-2f-tensorflow-2f-lite-2f-micro-2f-memory_planner:
	-$(RM) ./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/greedy_memory_planner.d ./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/greedy_memory_planner.o ./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/greedy_memory_planner.su ./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/linear_memory_planner.d ./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/linear_memory_planner.o ./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/linear_memory_planner.su ./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.d ./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.o ./Middlewares/tensorflow/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.su

.PHONY: clean-Middlewares-2f-tensorflow-2f-tensorflow-2f-lite-2f-micro-2f-memory_planner

