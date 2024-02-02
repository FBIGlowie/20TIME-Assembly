.globl _start
.section .data
rag: .quad 0xffffffffffffffff ;
str: .asciz "Hello, World!\n"
.section .text
_start:
    movq $0, %rax # Initialize rax to 0

.loop:
    incq %rax # Increment rax by 1
    cmpq %rax, rag # Compare rax and rag
    je .equal # Jump if rax equals rag
    jmp .loop # Jump back to the start of the loop

.equal:
    # Code to execute when rax equals rag goes here
    pushq %rax
    movq $1, %rax    # sys_write
    movq $1, %rdi    # stdout
    lea str(%rip), %rsi # buffer
    movq $14, %rdx   # length
    syscall          # call kernel
    # Exit syscall
    movq $60, %rax   # sys_exit
    movq $0, %rdi # exit code
    syscall     # call kernel
