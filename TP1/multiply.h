#ifndef MULTIPLY_H_
#define MULTIPLY_H_

typedef struct matrix {
    size_t rows;
    size_t cols;
    double* array;
} matrix_t;

matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2);

#endif




