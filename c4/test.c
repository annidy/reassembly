#include <stdio.h>
#include <mach/mach.h>
#include <mach/vm_map.h>

extern 	void setkey(int);
extern	char *encrypt(char *);
char keybuf[26];

int main() {

    char *secret;
    setkey(5);
    secret=strdup("Hello World");
    printf("%s\n", encrypt(secret));

	return 0;
}