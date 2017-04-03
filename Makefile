all: binary 
libs: libh.a libg.a
binary: hello.o libg.a libh.a 
	gcc -o binary hello.o -L. -lh -lg -Wl,-rpath,.

hello.o: hello.c
	gcc -c hello.c

libh.a: libhello.o
	ar cr libh.a libhello.o 

libg.a: libgoodbye.o
	ar cr libg.a libgoodbye.o 

libhello.o: libhello.c
	gcc -c libhello.c

libgoodbye.o: libgoodbye.c
	gcc -c libgoodbye.c

clean:
	rm -f *.o *.a *.so binary