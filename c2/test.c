#include <stdio.h>
#include <mach/mach.h>
#include <mach/vm_map.h>

char buf[0x10000]; 	// 40k
int main() {

	FILE *fp = fopen("a.out", "rb");
	fread(buf, sizeof(buf), 1, fp);
	fclose(fp);
	void (*main_)(void) = (void *)(buf+0xdd0);

	*(size_t *)(buf+0x00001018) = strdup;
	*(size_t *)(buf+0x00001010) = printf;
	vm_address_t tbuf = buf; //0x0000048800000000; 
  	// vm_allocate(mach_task_self(), &tgt, 0x1000, 0);
  	vm_protect(mach_task_self(), tbuf, 0x10000, 0,
         VM_PROT_READ|VM_PROT_WRITE|VM_PROT_EXECUTE);


    main_();


	return 0;
}