################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/add.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/conv.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/mul.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/pooling.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/softmax.cc \
../Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/svdf.cc 

CC_DEPS += \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/add.d \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/conv.d \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.d \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.d \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/mul.d \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/pooling.d \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/softmax.d \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/svdf.d 

OBJS += \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/add.o \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/conv.o \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.o \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.o \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/mul.o \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/pooling.o \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/softmax.o \
./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/svdf.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/%.o Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/%.su: ../Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/%.cc Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m33 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L562xx -DTFLM_RUNTIME -DCMSIS_NN -DTFLM_RUNTIME_USE_ALL_OPERATORS=0 -DTF_LITE_STATIC_MEMORY -DTF_LITE_DISABLE_X86_NEON -DTF_LITE_MCU_DEBUG_LOG -DARM_MATH -DARM_MATH_LOOPUNROLL -DARM_MATH_DSP -DARM_MATH_CM33 -D__FPU_PRESENT=1U -c -I../Core/Inc -I../../Secure_nsclib -I../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../X-CUBE-AI/App -I../X-CUBE-AI -I../X-CUBE-AI/Target -I../Middlewares/tensorflow -I../Middlewares/tensorflow/third_party/flatbuffers/include -I../Middlewares/tensorflow/third_party/cmsis_nn -I../Middlewares/tensorflow/third_party/cmsis_nn/Include -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core -I../Middlewares/tensorflow/third_party/gemmlowp -I../Middlewares/tensorflow/third_party/ruy -I../Middlewares/tensorflow/third_party/cmsis/CMSIS/Core/Include -Os -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-tensorflow-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-cmsis_nn

clean-Middlewares-2f-tensorflow-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-cmsis_nn:
	-$(RM) ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/add.d ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/add.o ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/add.su ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/conv.d ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/conv.o ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/conv.su ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.d ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.o ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.su ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.d ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.o ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.su ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/mul.d ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/mul.o ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/mul.su ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/pooling.d ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/pooling.o ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/pooling.su ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/softmax.d ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/softmax.o ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/softmax.su ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/svdf.d ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/svdf.o ./Middlewares/tensorflow/tensorflow/lite/micro/kernels/cmsis_nn/svdf.su

.PHONY: clean-Middlewares-2f-tensorflow-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-cmsis_nn

