
// Build with: gcc -Wall -O2 -o gen-loot gen-loot.c

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <limits.h>

#define ARRAY_SZ(array) (sizeof((array))/sizeof((array)[0]))

static const unsigned int DEF_N_TOKENS = 1138;
static const unsigned int NXC_SEED = 2716689190;

// qsort helper function; compare two unsigned ints.
static int cmp_int(const void *p1, const void *p2)
{
	const unsigned int *a = p1;
	const unsigned int *b = p2;

	return (*a) - (*b);
}

// roll(d6)
static unsigned int roll_d6(void)
{
	unsigned int val = (random() % 6) + 1;

	return val;
}

// diagnostic: dump result array
static void dump_res(const char *pfx, const unsigned int *res)
{
#if 0
	for (unsigned int n = 0; n < 4; n++)
		printf("%s res[%u]=%u\n", pfx, n, res[n]);
#endif
}

// roll 4d6, and drop the lowest score
static unsigned int roll_4d6(void)
{
	unsigned int res[4];

	// roll(4d6)
	for (unsigned int n = 0; n < 4; n++)
		res[n] = roll_d6();

	dump_res("pre", res);
	qsort(res, 4, sizeof(unsigned int), cmp_int);
	dump_res("post", res);

	// only include greatest 3 in total
	unsigned int total = 0;
	for (unsigned int n = 1; n < 4; n++)
		total += res[n];

	// printf("total %u\n", total);
	return total;
}

// the standard character attributes
static const char *attribs[] = {
	"str",
	"dex",
	"con",
	"int",
	"wis",
	"chr",
};

// generate JSON metadata (the loot) for a single NFT
static void generate_token_text(unsigned int id)
{
	char fn[PATH_MAX];
	snprintf(fn, sizeof(fn), "jsondata/%04u.json", id);
	FILE *f = fopen(fn, "w");

	fprintf(f, "{\n");

	for (unsigned int n = 0; n < ARRAY_SZ(attribs); n++) {
		fprintf(f, "\t\"%s\":%u%s\n",
			attribs[n],
			roll_4d6(),
			(n == (ARRAY_SZ(attribs)-1)) ? "" : ",");
	}
	fprintf(f, "}\n");

	fclose(f);
}

int main (int argc, char *argv[])
{
	// use seed from mkseed for determinism
	srandom(NXC_SEED);

	// single CLI arg: number of tokens
	unsigned int n_tokens = DEF_N_TOKENS;
	if ((argc == 2) && (atoi(argv[1]) > 0))
		n_tokens = (unsigned int) atoi(argv[1]);

	// generate, starting with number 1
	for (unsigned int n = 0; n < n_tokens; n++)
		generate_token_text(n + 1);

	// success
	return 0;
}

