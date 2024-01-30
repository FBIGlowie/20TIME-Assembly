.globl _start
.section .text
StringToPrint:
.string "Hellol"
_start:
movl $4, %eax
movl $1, %ebx
movl $StringToPrint, %ecx
movl $5, %edx
int $0x80
