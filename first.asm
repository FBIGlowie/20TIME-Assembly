.globl sheesh
.section .data
msg: 
.section .text

sheesh:
    movq $60, %rax
    movq $3, %rdi
    syscall
