#include <stdio.h>
#include <mach/mach.h>
#include <mach/vm_map.h>

char buf[0x10000]; 	// 40k
int main() {
	FILE *fp = fopen("a.out", "rb");
	fread(buf, sizeof(buf), 1, fp);
	fclose(fp);
	void (*setkey)(int) = (void *)(buf+0xe20);
	char *(*encrypt)(char *) = (void *)(buf+0xe80);

	vm_address_t tbuf = buf; //0x0000048800000000; 
  	// vm_allocate(mach_task_self(), &tgt, 0x1000, 0);
  	vm_protect(mach_task_self(), tbuf, 0x10000, 0,
         VM_PROT_READ|VM_PROT_WRITE|VM_PROT_EXECUTE);

	char *secret;
    setkey(5);
    secret=strdup("Hello World");
    printf("%s\n", encrypt(secret));

	return 0;
}