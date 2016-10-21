all: threaded_riemann threaded_multmat

function.o:
	gcc -c function.c

function.lib: function.o
	ar -cvq libfunction.a function.o

threaded_riemann: function.lib
	gcc -I . -L . -pthread threaded_riemann.c -lfunction -o threaded_riemann


util.o:
	gcc -c util.c
util.lib: util.o
	ar -cvq libutil.a util.o
threaded_multmat: util.lib
	gcc -I . -L . -pthread threaded_multmat.c -lutil -o threaded_multmat

clean:
	rm -rf *.o *.a threaded_riemann multmat_test threaded_multmat a.out
