#include <stdlib.h>
#include "mymalloc.h"

void *mymalloc(size_t size) {
    return malloc(size);
}

void myfree(void * thing) {
    free(thing);
}


