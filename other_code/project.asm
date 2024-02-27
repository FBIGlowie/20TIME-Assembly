.globl _start
.section .data
# How many data elements we have
list:
    .quad 1,2,4,3,5,6,3,2,4,6,4
    .ascii "\0"
offset:
    .quad 8
.section .text
_start:
### Initialize Registers ###
# Put the number of elements of the array in %rcx
movq $0, %rcx
find_nums:
# r8 is gonna hold the rgister
movq list,%r8
cmpq $0,%r8

# Use %rdi to hold the current-high value
movq $0, %rdi
### Check Preconditions ###
# If there are no numbers, stop
cmp $0, %rcx
je endloop
### Main Loop ###
myloop:
# Get the next value of mynumbers indexed by %rbx
movq list-8(,%rcx,8), %rax
# If it is not bigger, go to the end of the loop
cmp %rdi, %rax
jbe loopcontrol
# Otherwise, store this as the biggest element so far
movq %rax, %rdi
loopcontrol:
# Decrement %rcx and keep going until %rcx is zero
loopq myloop
### Cleanup and Exit ###
endloop:
# We're done - exit
movq $60, %rax
syscall