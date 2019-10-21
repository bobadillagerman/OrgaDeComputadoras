#include <mips/regdef.h>    
   
    .text            

    .abicalls
    .align 2        # alineacion 2^2

    .globl    matrix_multiply
    .ent      matrix_multiply

matrix_multiply:
    #debugging info: descripcion del stack frame
    .frame    $fp, 32, ra    

    # bloque para codigo PIC
    .set    noreorder    
    .cpload t9            
    .set    reorder        

    # creo stack frame
    subu    sp, sp, 32    # 4 (SRA) + 4 (ABA)

    # directiva para codigo PIC
    .cprestore 16       # inserta aqui "sw gp, 16(sp)",
                	    # mas "lw gp, 16(sp)" luego de #cada jal

    # salvado de callee-saved regs en SRA    
    sw    $fp, 20(sp)
    sw    ra, 24(sp)

    # de aqui al fin de la funcion uso $fp en lugar de sp.
    move    $fp, sp
    
    # salvo argumentos
    sw  a0, 32($fp)      # &m1
    sw  a1, 36($fp) 	# &m2

    
   	#comienzo funcion
   	li v0, 0 	#m3 = NULL

   	#cargo la dimension
   	lw a0, 32($fp) 
	lw a1, 36($fp)

	## se inicializan las variables
	lw	t3, 0(a0)		# dimension = m1->rows;
	lw	t6, 0(a1)		# dimension = m2->rows;
# dimension = m1->rows (podria ser tambien 1(a0)/0(a1)/1(a1) porque es cuadrada)

	move 	a0, t3
	move 	a1, t6
	
   	#llamo a create_matrix
   	la 	t9, create_matrix	# m3 = create_matrix(dimension, dimension);
	jal ra, t9
#queda guardado en v0 el puntero a m3

	#guardo argumentos de nuevo (los perdi con el create_matrix)
	lw a0, 32($fp) #a0 = &m1
	lw a1, 36($fp) #a1 = &m2

	lw t5, 0(a0) #t5 = m1->rows(dimension)

	li t0, 0 	#i = 0

for1: 
	bge t0, t5, end_for1	#condicion salida: i < dimension
	li t1, 0  #j = 0

for2:
	bge t1, t5, end_for2	#condicion salida: j < dimension
	li t2, 0	#k = 0
	li.d $f0, 0 	#sum = 0.0

for3:
	bge t2, t5, end_for3	#condicion salida: k < dimension

	mul t3, t0, t5 			#t3 = i*dimension
	addu t3, t3, t2 		#t3 = (i*dimension) + k

	mul t4, t2, t5			#t4 = k*dimension
	addu t4, t4, t1			#t4 = (k*dimension) + j

	sll t3, t3, 3
	lw t6, 8(a0)	#t6 = m1->array

	add t6, t6, t3	#t6 = &m1->array[(i*dimension) + k]
	l.d $f2, 0(t6)	#f2 = m1->array[(i*dimension) + k]

	sll t4, t4, 3
	lw t7, 8(a1)	#t7 = m2->array

	add t7, t7, t4	#t7 = m2->array[(k*dimension) + j]
	l.d $f4, 0(t7)	

	mul.d $f2, $f2, $f4 #f2 = f2 * f4
	add.d $f0, $f2, $f0 #sum = sum + f2

	addi t2, t2, 1	#k++
		
	j for3 			

end_for3:
	mul t4, t0, t5 	#i*dimension
	addu t4, t4, t1 #i*dimension + j
		
	lw t6, 8(v0)	#t6 = m3->array
		
	sll t4, t4, 3  
	add t6, t6, t4  #m3->array[i*dim+j]
	s.d $f0, 0(t6)	#m3->array[i*dim+j] = sum

	addi t1, t1, 1 	#j++
	j for2

end_for2:
	addi t0, t0, 1  #i++
	j for1

end_for1:
    # return;
    # restauro callee-saved regs
    lw    gp, 16(sp)
    lw    $fp, 20(sp)
    lw    ra, 24(sp)
    # destruyo stack frame
    addu    sp, sp, 32
    # vuelvo a funcion llamante
    jr    ra

  .end    matrix_multiply
  .size   matrix_multiply,.-matrix_multiply

    .globl  create_matrix
    .ent    create_matrix

create_matrix:
    #debugging info: descripcion del stack frame
    .frame    $fp, 32, ra    

    # bloque para codigo PIC
    .set    noreorder    
    .cpload t9            
    .set    reorder        

    # creo stack frame
    subu    sp, sp, 32    # 4 (SRA) + 4 (ABA)

    # directiva para codigo PIC
    .cprestore 16       # inserta aqui "sw gp, 16(sp)",
                	    # mas "lw gp, 16(sp)" luego de #cada jal

    # salvado de callee-saved regs en SRA    
    sw    $fp, 20(sp)
    sw    ra, 24(sp)

    # de aqui al fin de la funcion uso $fp en lugar de sp.
    move    $fp, sp
    
    # salvo argumentos
    sw  a0, 32($fp)      # rows
    sw  a1, 36($fp) 	# cols

    # reservo 12 bytes de memoria (Lo que ocupa el matrix_t)
    li a0, 12
    la t9, mymalloc
    jal ra, t9
    sw v0, 28($fp)      # Salvo puntero a matrix_t

    lw a0, 32($fp) 
    lw a1, 36($fp)

    sw a0, 0(v0)        # matriz->rows = rows
    sw a1, 4(v0)        # matriz->cols = cols

    mul t0, a0, a1      # t0 = rows * cols
    sll t0, t0, 3       # t0 = t0 * 8, 8 es sizeof(double)
    move a0, t0
    la t9, mymalloc
    jal ra, t9          # v0 = malloc(t0), puntero a array
    
    move t0, v0         # t0 = puntero a array
    lw v0, 28($fp)      # v0 = puntero a matriz
    sw t0, 8(v0)        # matriz->array t0;

    # restauro callee-saved regs
    lw    gp, 16(sp)
    lw    $fp, 20(sp)
    lw    ra, 24(sp)
    # destruyo stack frame
    addu    sp, sp, 32
    # vuelvo a funcion llamante
    jr    ra

  .end    create_matrix
