test: *.c
	gcc -o a.out a.c
	clang -masm=intel -c a.s -o a.o
	gcc -o test test.c a.o

clean:
	rm -rf a.out test *.dSYM