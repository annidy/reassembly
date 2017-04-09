test: *.c a.o
	gcc -o a.out a.c
	clang -c a.s -o a.o
	gcc -o test test.c a.o

clean:
	rm -rf a.out test *.dSYM