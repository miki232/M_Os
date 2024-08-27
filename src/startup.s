.global _start

.section .text.startup
_start:
    // Initialize stack pointer
    l32r a0, _stack_end
    mov sp, a0

    // Call main function
    call0 main

.global _stack_end
.align 4
.section .bss.stack
.space 4096
_stack_end:
