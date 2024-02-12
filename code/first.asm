.globl _start mv m#this just tells the compiler to not ignore the _start section
.section .data # this tells the compiler everything under this section is stored as data, like a variable
rag: .quad 0xffffffffffffffff ; #create variable rag to be the maximum of quadword (64 bit number) (preciselly 18446744073709551615)
str: .asciz "Hello, World!\n" ; #average hello world string to showcase the syscall to print to the therminal
.section .text # this sections indicate that everything bellow is executable code

#the whole point of this program is to increment the 64 bit register by 1 until it reaches it max, after that a comparison is made and the syscalls are showcased

_start: #this is the start of the execution chain
    movq $0, %rax # Initialize rax register to 0

.loop:
    incq %rax # Increment rax register by 1
    cmpq %rax, rag # Compare rax and rag (if register %rax is equal to variable rax aka its maximum it does the jump instruction bellow)
    je .equal # Jump if rax equals rag ( the jmp instruction tells the cpu to go to a specific place in memory that has other code and start executing that code, ingnoring everything bellow)
    jmp .loop # Jump back to the start of the loop (this jumps back to the section .loop, repeating the chain if the instruction above doesn't just to .equal section)

.equal: 
    # Code to execute when rax equals rag goes here
    movq $1, %rax    # sys_write
    movq $1, %rdi    # stdout
    lea str(%rip), %rsi # buffer
    movq $14, %rdx   # length
    syscall          # call kernel
    #code above just showcases a syscall on printing the string Hello World to terminal
    # Exit syscall
    movq $60, %rax   # sys_exit
    movq $0, %rdi # exit code
    syscall     # call kernel
    # this is another syscall that exits (terminates) the program and outputs a number indicating success or failute (0 is success, anything else is failure)
