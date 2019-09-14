#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

#define ERROR -1
#define SALIDA_EXITOSA 0

typedef struct matrix {
    size_t rows;
    size_t cols;
    double* array;
} matrix_t;

// Constructor de matrix_t
matrix_t* create_matrix(size_t rows, size_t cols){
	matrix_t* matriz = malloc(sizeof(matrix_t));
	matriz->rows = rows;
	matriz->cols = cols;
	return matriz;
}

// Destructor de matrix_t
void destroy_matrix(matrix_t* m){
	free(m);
}

// Imprime matrix_t sobre el file pointer fp en el formato solicitado
// por el enunciado
int print_matrix(FILE* fp, matrix_t* m){
    fprintf(fp, "%d ", m->cols);
    int i = 0;
    while (i < (int)(m->cols*m->rows)){
        fprintf(fp, "%g ", m->array[i]);
        i++;
    }
    fprintf(fp, "\n");

    return SALIDA_EXITOSA;
}

// Multiplica las matrices en m1 y m2
//matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2);


int main(int argc, char *argv[]) {
    int option = 0;
    const char *short_opt = "hV";
    struct option long_opt[] = {
            {"version", no_argument,       NULL, 'V'},
            {"help",    no_argument,       NULL, 'h'},
            {NULL, 0,                      NULL, 0}
    };
    FILE *inputFile = NULL;
    FILE *outputFile = NULL;
    size_t dimension;
    
    while ((option = getopt_long(argc, argv, short_opt, long_opt, NULL)) != -1) {
        switch (option) {
            case 'V':
                printf("TP #0 de la materia Organizacion de Computadoras \n");
                printf("Alumnos: \n");
                printf("	Bobadilla Catalan, German\n	Leloutre, Daniela \n	Soro, Lucas \n");
                return 0;
            case 'h':
                printf("Usage: \n");
                printf("	%s -h \n", argv[0]);
                printf("	%s -V \n", argv[0]);
                printf("	%s < in_file > out_file \n", argv[0]);
                printf("Options: \n");
                printf("	-V, --version  Print version and quit. \n");
                printf("	-h, --help     Print this information. \n");
		printf("Examples: \n");
		printf("	tp0 < in.txt > out.txt \n");
                printf("	cat in.txt | tp0 > out.txt \n");
                return 0;
            default:
                // as� est� en el manual de getopt
                abort();
        }
    }

    inputFile = stdin;
    outputFile = stdout;

    matrix_t* matriz1;
    matrix_t* matriz2;

    while ((fscanf(inputFile,"%d",&dimension)) != EOF) {
		matriz1 = create_matrix(dimension,dimension);
		matriz2 = create_matrix(dimension,dimension);
		float dato;

		double* arreglo1 = (double*) malloc(dimension*dimension*sizeof(double));
		double* arreglo2 = (double*) malloc(dimension*dimension*sizeof(double));
		
		for(int i=0;i<(int)(dimension*dimension);i++){
			fscanf(inputFile,"%g",&dato);
			arreglo1[i] = dato;
		}

		for(int j=0;j<(int)(dimension*dimension);j++){
			fscanf(inputFile,"%g",&dato);
			arreglo2[j] = dato;
		}
		
		matriz1->array = arreglo1;
		matriz2->array = arreglo2;
		
		//matrix_t* resultado;
		//resultado = matrix_multiply(&matriz1, &matriz2);
	
		//Aca imprimo la primer matriz para probar, pero tiene que imprimir "resultado"
		if(print_matrix(outputFile, matriz1) == ERROR) {
			return ERROR;
		}
    }
    
    destroy_matrix(matriz1);
    destroy_matrix(matriz2);
    //free(matriz1);
    //free(matriz2);
    
    if(fclose(inputFile)==EOF){
        fprintf(stderr, "Error fclose: %s\n", strerror( errno ));
        return ERROR;
    }

    return SALIDA_EXITOSA;
}

/*matrix_t* create_matrix(size_t rows, size_t cols){
	struct matrix matrix = {.rows = rows,.cols = cols };
	printf("creo matriz de %c x %c \n", rows, cols);
	
}*/
