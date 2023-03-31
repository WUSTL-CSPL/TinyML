################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Example/User/Startup/startup_stm32l562qeixq.s 

OBJS += \
./Example/User/Startup/startup_stm32l562qeixq.o 

S_DEPS += \
./Example/User/Startup/startup_stm32l562qeixq.d 


# Each subdirectory must supply rules for building sources it contributes
Example/User/Startup/%.o: ../Example/User/Startup/%.s Example/User/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m33 -g3 -c -I../../ -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Example-2f-User-2f-Startup

clean-Example-2f-User-2f-Startup:
	-$(RM) ./Example/User/Startup/startup_stm32l562qeixq.d ./Example/User/Startup/startup_stm32l562qeixq.o

.PHONY: clean-Example-2f-User-2f-Startup

