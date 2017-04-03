all: binary 
libs: libh.so libg.a
binary: hello.o libg.a libh.so 
	gcc -o binary hello.o -L. -lh -lg -Wl,-rpath,.

hello.o: hello.c
	gcc -c hello.c

libh.so: libhello.o
	gcc -shared -o libh.so libhello.o 

libg.a: libgoodbye.o
	ar cr libg.a libgoodbye.o 

libhello.o: libhello.c
	gcc -c -fPIC libhello.c

libgoodbye.o: libgoodbye.c
	gcc -c libgoodbye.c

clean:
	rm -f *.o *.a *.so binary