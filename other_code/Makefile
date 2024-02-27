project: project.o
	ld project.o -o project
project.o: project.asm
	as project.asm -o project.o
clean:
	rm project.o project
exec: project
	./project