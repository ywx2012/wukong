# KERNEL:=$(shell uname -r)
KERNEL:=6.4.13-200.fc38.x86_64
CFLAGS:= \
	-O0 -g \
	-Wall -Wextra \
	-Wno-unused-parameter \
	-Wno-sign-compare \
	-Wno-type-limits \
	-Werror \
	-idirafter /usr/include \
	-I /usr/src/kernels/$(KERNEL)/include \
	-I /usr/src/kernels/$(KERNEL)/arch/x86/include \
	-I /usr/src/kernels/$(KERNEL)/arch/x86/include/generated \
	-fcf-protection \
	-D__KERNEL__ -D_GNU_SOURCE \
	-std=gnu11 \
	-include /usr/src/kernels/$(KERNEL)/include/linux/kconfig.h

all: crc4.elf

crc4.elf: crc4.c crc4.ko
	gcc $(CFLAGS) -o crc4.elf crc4.c crc4.ko

clean:
	rm -f $(BINS)