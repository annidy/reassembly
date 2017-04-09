#include <stdio.h>

	int c = 1000;
int main() {
	while (1) {
		int a = 0;
		scanf("%d", &a);
		c += a;
		printf("%d\n", c);
	}
	return 0;
}