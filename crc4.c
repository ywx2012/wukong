#include <linux/module.h>
#include <linux/crc4.h>
#include <stdio.h>
extern struct module __this_module;
int main() {
  printf("module name: %s\n", __this_module.name);
  printf("crc4(0, 1023, 16): %d\n", crc4(0, 1023, 16));
}

__asm__(".globl __x86_return_thunk\n__x86_return_thunk: ret");