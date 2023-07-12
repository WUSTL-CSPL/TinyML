################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../Middlewares/tensorflow/tensorflow/lite/micro/all_ops_resolver.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/fake_micro_context.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/flatbuffer_utils.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/memory_helpers.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/micro_allocation_info.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/micro_allocator.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/micro_context.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/micro_graph.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/micro_interpreter.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/micro_log.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/micro_profiler.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/micro_resource_variable.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/micro_string.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/micro_time.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/micro_utils.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/mock_micro_graph.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/recording_micro_allocator.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/system_setup.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/test_helper_custom_ops.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/test_helpers.cc 

CC_DEPS += \
./Middlewares/tensorflow/tensorflow/lite/micro/all_ops_resolver.d \
./Middlewares/tensorflow/tensorflow/lite/micro/fake_micro_context.d \
./Middlewares/tensorflow/tensorflow/lite/micro/flatbuffer_utils.d \
./Middlewares/tensorflow/tensorflow/lite/micro/memory_helpers.d \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_allocation_info.d \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_allocator.d \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_context.d \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_graph.d \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_interpreter.d \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_log.d \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_profiler.d \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_resource_variable.d \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_string.d \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_time.d \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_utils.d \
./Middlewares/tensorflow/tensorflow/lite/micro/mock_micro_graph.d \
./Middlewares/tensorflow/tensorflow/lite/micro/recording_micro_allocator.d \
./Middlewares/tensorflow/tensorflow/lite/micro/system_setup.d \
./Middlewares/tensorflow/tensorflow/lite/micro/test_helper_custom_ops.d \
./Middlewares/tensorflow/tensorflow/lite/micro/test_helpers.d 

OBJS += \
./Middlewares/tensorflow/tensorflow/lite/micro/all_ops_resolver.o \
./Middlewares/tensorflow/tensorflow/lite/micro/fake_micro_context.o \
./Middlewares/tensorflow/tensorflow/lite/micro/flatbuffer_utils.o \
./Middlewares/tensorflow/tensorflow/lite/micro/memory_helpers.o \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_allocation_info.o \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_allocator.o \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_context.o \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_graph.o \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_interpreter.o \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_log.o \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_profiler.o \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_resource_variable.o \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_string.o \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_time.o \
./Middlewares/tensorflow/tensorflow/lite/micro/micro_utils.o \
./Middlewares/tensorflow/tensorflow/lite/micro/mock_micro_graph.o \
./Middlewares/tensorflow/tensorflow/lite/micro/recording_micro_allocator.o \
./Middlewares/tensorflow/tensorflow/lite/micro/system_setup.o \
./Middlewares/tensorflow/tensorflow/lite/micro/test_helper_custom_ops.o \
./Middlewares/tensorflow/tensorflow/lite/micro/test_helpers.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/tensorflow/tensorflow/lite/micro/%.o Middlewares/tensorflow/tensorflow/lite/micro/%.su: ../Middlewares/tensorflow/tensorflow/lite/micro/%.cc Middlewares/tensorflow/tensorflow/lite/micro/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m33 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L562xx -DTFLM_RUNTIME -DCMSIS_NN -DTFLM_RUNTIME_USE_ALL_OPERATORS=0 -DTF_LITE_STATIC_MEMORY -DTF_LITE_DISABLE_X86_NEON -DTF_LITE_MCU_DEBUG_LOG -DARM_MATH -DARM_MATH_LOOPUNROLL -DARM_MATH_DSP -DARM_MATH_CM33 -D__FPU_PRESENT=1U -c -I../Core/Inc -I../../Secure_nsclib -I../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../X-CUBE-AI/App -I../X-CUBE-AI -I../X-CUBE-AI/Target -I../Middlewares/tensorflow -I../Middlewares/tensorflow/third_party/flatbuffers/include -I../Middlewares/tensorflow/third_party/cmsis_nn -I../Middlewares/tensorflow/third_party/cmsis_nn/Include -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core -I../Middlewares/tensorflow/third_party/gemmlowp -I../Middlewares/tensorflow/third_party/ruy -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core/Include -Os -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-tensorflow-2f-tensorflow-2f-lite-2f-micro

clean-Middlewares-2f-tensorflow-2f-tensorflow-2f-lite-2f-micro:
	-$(RM) ./Middlewares/tensorflow/tensorflow/lite/micro/all_ops_resolver.d ./Middlewares/tensorflow/tensorflow/lite/micro/all_ops_resolver.o ./Middlewares/tensorflow/tensorflow/lite/micro/all_ops_resolver.su ./Middlewares/tensorflow/tensorflow/lite/micro/fake_micro_context.d ./Middlewares/tensorflow/tensorflow/lite/micro/fake_micro_context.o ./Middlewares/tensorflow/tensorflow/lite/micro/fake_micro_context.su ./Middlewares/tensorflow/tensorflow/lite/micro/flatbuffer_utils.d ./Middlewares/tensorflow/tensorflow/lite/micro/flatbuffer_utils.o ./Middlewares/tensorflow/tensorflow/lite/micro/flatbuffer_utils.su ./Middlewares/tensorflow/tensorflow/lite/micro/memory_helpers.d ./Middlewares/tensorflow/tensorflow/lite/micro/memory_helpers.o ./Middlewares/tensorflow/tensorflow/lite/micro/memory_helpers.su ./Middlewares/tensorflow/tensorflow/lite/micro/micro_allocation_info.d ./Middlewares/tensorflow/tensorflow/lite/micro/micro_allocation_info.o ./Middlewares/tensorflow/tensorflow/lite/micro/micro_allocation_info.su ./Middlewares/tensorflow/tensorflow/lite/micro/micro_allocator.d ./Middlewares/tensorflow/tensorflow/lite/micro/micro_allocator.o ./Middlewares/tensorflow/tensorflow/lite/micro/micro_allocator.su ./Middlewares/tensorflow/tensorflow/lite/micro/micro_context.d ./Middlewares/tensorflow/tensorflow/lite/micro/micro_context.o ./Middlewares/tensorflow/tensorflow/lite/micro/micro_context.su ./Middlewares/tensorflow/tensorflow/lite/micro/micro_graph.d ./Middlewares/tensorflow/tensorflow/lite/micro/micro_graph.o ./Middlewares/tensorflow/tensorflow/lite/micro/micro_graph.su ./Middlewares/tensorflow/tensorflow/lite/micro/micro_interpreter.d ./Middlewares/tensorflow/tensorflow/lite/micro/micro_interpreter.o ./Middlewares/tensorflow/tensorflow/lite/micro/micro_interpreter.su ./Middlewares/tensorflow/tensorflow/lite/micro/micro_log.d ./Middlewares/tensorflow/tensorflow/lite/micro/micro_log.o ./Middlewares/tensorflow/tensorflow/lite/micro/micro_log.su ./Middlewares/tensorflow/tensorflow/lite/micro/micro_profiler.d ./Middlewares/tensorflow/tensorflow/lite/micro/micro_profiler.o ./Middlewares/tensorflow/tensorflow/lite/micro/micro_profiler.su ./Middlewares/tensorflow/tensorflow/lite/micro/micro_resource_variable.d ./Middlewares/tensorflow/tensorflow/lite/micro/micro_resource_variable.o ./Middlewares/tensorflow/tensorflow/lite/micro/micro_resource_variable.su ./Middlewares/tensorflow/tensorflow/lite/micro/micro_string.d ./Middlewares/tensorflow/tensorflow/lite/micro/micro_string.o ./Middlewares/tensorflow/tensorflow/lite/micro/micro_string.su ./Middlewares/tensorflow/tensorflow/lite/micro/micro_time.d ./Middlewares/tensorflow/tensorflow/lite/micro/micro_time.o ./Middlewares/tensorflow/tensorflow/lite/micro/micro_time.su ./Middlewares/tensorflow/tensorflow/lite/micro/micro_utils.d ./Middlewares/tensorflow/tensorflow/lite/micro/micro_utils.o ./Middlewares/tensorflow/tensorflow/lite/micro/micro_utils.su ./Middlewares/tensorflow/tensorflow/lite/micro/mock_micro_graph.d ./Middlewares/tensorflow/tensorflow/lite/micro/mock_micro_graph.o ./Middlewares/tensorflow/tensorflow/lite/micro/mock_micro_graph.su ./Middlewares/tensorflow/tensorflow/lite/micro/recording_micro_allocator.d ./Middlewares/tensorflow/tensorflow/lite/micro/recording_micro_allocator.o ./Middlewares/tensorflow/tensorflow/lite/micro/recording_micro_allocator.su ./Middlewares/tensorflow/tensorflow/lite/micro/system_setup.d ./Middlewares/tensorflow/tensorflow/lite/micro/system_setup.o ./Middlewares/tensorflow/tensorflow/lite/micro/system_setup.su ./Middlewares/tensorflow/tensorflow/lite/micro/test_helper_custom_ops.d ./Middlewares/tensorflow/tensorflow/lite/micro/test_helper_custom_ops.o ./Middlewares/tensorflow/tensorflow/lite/micro/test_helper_custom_ops.su ./Middlewares/tensorflow/tensorflow/lite/micro/test_helpers.d ./Middlewares/tensorflow/tensorflow/lite/micro/test_helpers.o ./Middlewares/tensorflow/tensorflow/lite/micro/test_helpers.su

.PHONY: clean-Middlewares-2f-tensorflow-2f-tensorflow-2f-lite-2f-micro

