#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include "multiply.h"
#include "mymalloc.h"

#define ERROR -1
#define SALIDA_EXITOSA 0


// Destructor de matrix_t
void destroy_matrix(matrix_t* m){
    myfree(m->array);
	myfree(m);
}

// Imprime matrix_t sobre el file pointer fp en el formato solicitado
// por el enunciado
int print_matrix(FILE* fp, matrix_t* m){
    if (fprintf(fp, "%zd ", m->cols) < 0) {
        fprintf(stderr, "Error print_matrix: Valor erroneo en una columna \n");
        return ERROR;
    }
    int i = 0;
    while (i < (int)(m->cols*m->rows)){
        if (fprintf(fp, "%g ", m->array[i]) < 0) {
            fprintf(stderr, "Error print_matrix: Valor erroneo en una fila \n");
        return ERROR;
        }
        i++;
    }
    fprintf(fp, "\n");

    return SALIDA_EXITOSA;
}


int main(int argc, char *argv[]) {
    int option = 0;
    const char *short_opt = "hV";
    struct option long_opt[] = {
            {"version", no_argument,       NULL, 'V'},
            {"help",    no_argument,       NULL, 'h'},
            {NULL, 0,                      NULL, 0}
    };
    FILE *inputFileOriginal = NULL;
    FILE *outputFile = NULL;
    FILE *inputFile = tmpfile();
    size_t dimension;
    
    while ((option = getopt_long(argc, argv, short_opt, long_opt, NULL)) != -1) {
        switch (option) {
            case 'V':
                printf("TP #0 de la materia Organizacion de Computadoras \n");
                printf("Alumnos: \n");
                printf("	Bobadilla Catalan, German\n	Leloutre, Daniela \n	Soro, Lucas \n");
                return SALIDA_EXITOSA;
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
                return SALIDA_EXITOSA;
            default:
		fprintf(stderr, "Error: Argumento invalido \n");
                abort();
        }
    }

    if (argc == 2) {
    	fprintf(stderr, "Error: Argumento invalido \n");
        return ERROR;
    }

    inputFileOriginal = stdin;
    outputFile = stdout;

    //Corregido bug de entrada estandar por tuberia
    int data;
    while ((data=fgetc(inputFileOriginal)) != EOF ) {
	fputc(data,inputFile );
    }
    rewind(inputFile);


    matrix_t* matriz1;
    matrix_t* matriz2;

    //En cada ciclo leo una linea
    int k, caracter;

    while ((k=fscanf(inputFile,"%zd",&dimension)) != EOF) {
		if (k==0){
			fprintf(stderr, "Error fscanf: Dimension erronea en una matriz \n");
			return ERROR;
		}

		matriz1 = create_matrix(dimension,dimension);
		matriz2 = create_matrix(dimension,dimension);
		float dato;

		double* arreglo1 = (double*) mymalloc(dimension*dimension*sizeof(double));
		double* arreglo2 = (double*) mymalloc(dimension*dimension*sizeof(double));

		
		//En cada ciclo leo un numero (y espacios en blanco que voy a ignorar)
		int cantidadDeElementosEnUnaLinea=0, i=0;
		while (cantidadDeElementosEnUnaLinea<((dimension*dimension)*2)){
			caracter = fgetc(inputFile);
			while (caracter==' ')
				caracter = fgetc(inputFile);
			if (caracter=='\n'){
				fprintf(stderr, "Error fgetc: Cantidad erronea de elementos en una linea \n");
				return ERROR;
			} else {
				cantidadDeElementosEnUnaLinea++;
				fseek(inputFile,-1,SEEK_CUR);
				//Cargo en el arreglo que corresponda
				if (fscanf(inputFile,"%g",&dato)==1)
					if (cantidadDeElementosEnUnaLinea<=(dimension*dimension))
						arreglo1[i] = dato;
					else
						arreglo2[i] = dato;
				else {
					fprintf(stderr, "Error fscanf: Valor erroneo en una matriz \n");
					return ERROR;
				}
				i++;
				if (cantidadDeElementosEnUnaLinea==(dimension*dimension))
					i = 0;
			}
		}
		caracter = fgetc(inputFile);
		while (caracter==' '){
			caracter = fgetc(inputFile);
		}
		if (caracter != '\n'){
			fprintf(stderr, "Error fgetc: Cantidad erronea de elementos en una linea \n");
			return ERROR;
		}

		
		//Cargo las matrices y multiplico
		matriz1->array = arreglo1;
		matriz2->array = arreglo2;
		
		matrix_t* resultado;
		resultado = matrix_multiply(matriz1, matriz2);

	
		if(print_matrix(outputFile, resultado) == ERROR) {
			fprintf(stderr, "Error print_matrix: No se pudo escribir la matriz resultado \n");
			return ERROR;
		}
		destroy_matrix(resultado);
    
        destroy_matrix(matriz1);
        destroy_matrix(matriz2);
    }
    
    if(fclose(inputFile)==EOF){
        fprintf(stderr, "Error fclose: %s\n", strerror( errno ));
        return ERROR;
    }

    if(fclose(outputFile)==EOF){
        fprintf(stderr, "Error fclose: %s\n", strerror( errno ));
        return ERROR;

    }

    return SALIDA_EXITOSA;
}
