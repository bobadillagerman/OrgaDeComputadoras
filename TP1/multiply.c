#include <stdlib.h>
#include "multiply.h"
#include "mymalloc.h"

// Constructor de matrix_t
matrix_t* create_matrix(size_t rows, size_t cols){
	matrix_t* matriz = mymalloc(sizeof(matrix_t));
	matriz->rows = rows;
	matriz->cols = cols;
	matriz->array = (double*) mymalloc(rows*cols*sizeof(double));
	return matriz;
}

matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2){
	matrix_t* resultado;
	size_t dimension;
	dimension = m2->cols;
	resultado = create_matrix(dimension,dimension);
    int i;
	for (i = 0; i < dimension; i++) {
        int j;
        for (j = 0; j < dimension; j++) {
            float sum = 0.0;
            int k;
            for (k = 0; k < dimension; k++)
                sum = sum + m1->array[i * dimension + k] * m2->array[k * dimension + j];
            resultado->array[i * dimension + j] = sum;
        }
	}
	return resultado;
}



