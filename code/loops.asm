.globl _start
.section .data
str: .asciz "Hello, World!\n"

.section .text
_start:
movq $4, %rax
addq $0, %rcx
jz loop 
loop:
    pushq %rax
    movq $1, %rax    # sys_write
    movq $1, %rdi    # stdout
    lea str(%rip), %rsi # buffer
    movq $14, %rdx   # length
    syscall          # call kernel
    popq %rax
    decq %rax
    addq $0, %rcx
    jz done
done:
movq $60, %rax
movq $0, %rdi
syscall
