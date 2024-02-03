# Week 4 Reflection
This week the fun started, I reached apoint in the book where I could understant the instructions in the examples. I learned about how 
registers can be used in different ways like accessing the entire length of 64 bits or only just the starting 8 bits. I also learned how 
to add variables into the program like numbers and words. Syscalls are were the fun started. I realized that assembly is itself good for 
fast arithmetic when done by hand but other functionality like printing to terminal or reading files, network sockets is filled in by the kernel.
Every network request or packet transmitted is a syscall. Just like in normal programming, syscalls are a function and the paremeters are the registers themselves
. The ```%rax``` is always used as the value inside determines the syscall type, other registers like ```%rdi``` and ```%rdx``` are used to store
different parameters for different types of syscalls. Here is a usefull [table](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/) I found online.
I plan to experiment more with assembly and later I plan to switch to a higher level language to make shellcode, maybe around week 6.

Here is some assembly [code](https://github.com/FBIGlowie/20TIME-Assembly/blob/main/Weekly_Reflections/WEEK4----2.3.24/artifact1.asm) I was experiment with, this serves as the first artifact.