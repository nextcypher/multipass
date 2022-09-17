
// build with: gcc -Wall -O -o mkseed mkseed.c

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#define SEED_STR "nextcypher multipass - Oct. 2022 - one small step for man, one giant step for men, women, cyborgs and robots"

static unsigned long djb2_hash(unsigned char *str)
{
    unsigned long hash = 5381;
    int c;

    while ((c = *str++))
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */

    return hash;
}

int main (int argc, char *argv[])
{
	unsigned int seed = (unsigned int) djb2_hash((unsigned char *)SEED_STR);

	printf("%u\n", seed);

	return 0;
}

