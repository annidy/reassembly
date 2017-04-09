//http://reverseengineering.stackexchange.com/questions/6759/how-to-extract-functions-from-one-executable-to-include-link-in-another
#include <stdio.h>
#include <string.h>

#define NCHAR   26

void setkey(int i);
char *encrypt(char *s);
char keybuf[NCHAR];
char codepoint(char c);

int main(void) {
    char *secret;
    setkey(5);
    secret=strdup("Hello World");
    printf("%s\n", encrypt(secret));
}

void setkey(int key) {
    int i, val;
    val=key;
    for (i=0; i<NCHAR; i++) {
        keybuf[i]=val%NCHAR;
        val+=key;
    }
}

char *encrypt(char *s) {
    char *t=s;
    while (*s) {
        if (*s>='a' && *s<='z') {
            *s='a'+codepoint(*s-'a');
        } else if (*s>='A' && *s<='Z') {
            *s='A'+codepoint(*s-'A');
        }
        s++;
    }
    return t;
}

char codepoint(char c) {
    return keybuf[c];
}
