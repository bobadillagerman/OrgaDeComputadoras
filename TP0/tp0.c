#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
//#include <unistd.h>
//#include <errno.h>

#define ERROR -1
#define SALIDA_EXITOSA 0

typedef struct matrix {
    size_t rows;
    size_t cols;
    double* array;
} matrix_t;

// Constructor de matrix_t
matrix_t* create_matrix(size_t rows, size_t cols);

// Destructor de matrix_t
void destroy_matrix(matrix_t* m);

// Imprime matrix_t sobre el file pointer fp en el formato solicitado
// por el enunciado
int print_matrix(FILE* fp, matrix_t* m);

// Multiplica las matrices en m1 y m2
matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2);


int main(int argc, char *argv[]) {
    int option = 0;
    const char *short_opt = "i:o:hV";
    struct option long_opt[] = {
            {"version", no_argument,       NULL, 'V'},
            {"help",    no_argument,       NULL, 'h'},
            {"input",   required_argument, NULL, 'i'},
            {"output",  required_argument, NULL, 'o'},
            {NULL, 0,                      NULL, 0}
    };
    FILE *inputFile = NULL;
    FILE *outputFile = NULL;

    while ((option = getopt_long(argc, argv, short_opt, long_opt, NULL)) != -1) {
        switch (option) {
            case 'V':
                printf("TP #0 de la materia Organización de Computadoras \n");
                printf("Alumnos: \n");
                printf("	Bobadilla Catalan, German\n	Leloutre, Daniela \n	Soro, Lucas \n");
                return 0;
            case 'h':
                printf("Usage: \n");
                printf("	%s -h \n", argv[0]);
                printf("	%s -V \n", argv[0]);
                printf("	%s [options] \n", argv[0]);
                printf("Options: \n");
                printf("	-V, --version  Print version and quit. \n");
                printf("	-h, --help     Print this information. \n");
                return 0;
            case 'i':
            	if(strcmp(optarg, "-") != 0){
					inputFile = fopen(optarg, "r");
					if(inputFile == NULL) {
						fprintf(stderr, "Error archivo entrada: %s\n", strerror(errno));
						return ERROR;
					}
            	}
                break;
            case 'o':
            	if(strcmp(optarg, "-") != 0){
					outputFile = fopen(optarg, "w+");
					if(outputFile == NULL) {
						fprintf(stderr, "Error archivo salida: %s\n", strerror(errno));
						return ERROR;
					}
            	}
                break;
            default:
                // así está en el manual de getopt
                abort();
        }
    }

    if(inputFile == NULL) {
        inputFile = stdin;
    }

    if(outputFile == NULL) {
        outputFile = stdout;
    }

    /*if(processInput(inputFile, outputFile) == ERROR) {
    	return ERROR;
    }*/

    return SALIDA_EXITOSA;
}
