.globl _start
.section .data
list:
    .quad 1, 2, 4, 50, 13, 52, 20, 24, 26, 3
numwanted:
    .quad 3
numofnums:
    .quad 9
.section .text
_start:
#more index to rbx
movq numofnums, %rcx
#move 3 into rdi
movq $numwanted, %rdi
# put the address of first item in list in rbx
movq $list, %rbx
mainloop:
movq (%rbx), %rax
cmp (%rdi), %rax
jmp end
pushq %rax
loopcontrol:
# Change the address in %rbx to point to the next value
addq $8, %rbx
# Decrement %rcx and keep going until %rcx is zero
loopq mainloop
### Cleanup and Exit ###
.end:
popq %rdi
movq $60, %rax
syscall
# this just tries to find if the number 3 is in the list but I cant figure out why it segfaults man