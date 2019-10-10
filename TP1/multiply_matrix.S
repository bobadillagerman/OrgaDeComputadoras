#include <mips/regdef.h>    
   
    .text            

    .abicalls
    .align 2        # alineacion 2^2

    .globl    matrix_multiply
    .ent      matrix_multiply

matrix_multiply:
    #debugging info: descripcion del stack frame
    .frame    $fp, 42, ra    

    # bloque para codigo PIC
    .set    noreorder    
    .cpload t9            
    .set    reorder        

    # creo stack frame
    subu    sp, sp, 42    # 4 (SRA) + 4 (LTA) + 4 (ABA)

    # directiva para codigo PIC
    .cprestore 32       # inserta aqui "sw gp, 24(sp)",
                		# mas "lw gp, 24(sp)" luego de #cada jal

    # salvado de callee-saved regs en SRA    
    sw    $fp, 36(sp)
    sw    ra, 40(sp)

    # de aqui al fin de la funcion uso $fp en lugar de sp.
    move    $fp, sp
    
    # salvo argumentos
    sw  a0, 48($fp)      # &m1
    sw  a1, 52($fp) 	# &m2

    
   	#comienzo funcion
   	li v0, 0 	#m3 = NULL

   	#cargo la dimension
   	lw a0, 48($fp) 
   	lw a0, 0(a0)	# dimension = m1->rows (podria ser tambien 1(a0)/0(a1)/1(a1) porque es cuadrada)


	## se inicializan las variables
	#lw	t3, 0(a0)		# m1rows = m1->rows;
	#lw	t6, 4(a1)		# m2cols = m2->cols;

	###### Hago la llamada a create matrix
	#move 	a0, t3
	#move 	a1, t6


   	#llamo a create_matrix
   	la 	t9, create_matrix	# m3 = create_matrix(dimension, dimension);
	jal ra, t9

	#guardo argumentos
	lw a0, 48($fp) #a0 = &m1
	lw a1, 52($fp) #a1 = &m2

	lw t5, 0($fp) #a0 = dimension

	li t0, 0 	#i = 0

	for1: 
		blt t0, t5, end_for1	#condicion salida: i < dimension
		li t1, 0  #j = 0

	for2:
		blt t1, t5, end_for2	#condicion salida: j < dimension
		li t2, 0	#k = 0
		l.d $f0, 0 	#sum = 0.0

	for3:
		blt t2, t5, end_for3	#condicion salida: k < dimension

		mul t4, t0, t5 			#t4 = i*dimension
		addu t6, t4, t2 		#t6 = (i*dimension) + k

		mul t7, t2, t5			#t7 = k*dimension
		addu t8, t7, t1			#t8 = (k*dimension) + j

		lw t4, 8(a0)	#t4 = m1->array
		lw t7, 8(a1)	#t7 = m2->array
		
		mul t6, t6, 8	#dir de array[pos] = 8xpos
		add t6, t6, t4	#t6 = &m1->array[(i*dimension) + k]
		l.d $f2, 0(t6)	#f2 = m1->array[(i*dimension) + k]

		mul t8, t8, 8	#repito para m2
		add t8, t8, t7	#t8 = m2->array[(k*dimension) + j]
		l.d $f4, 0(t8)	

		mul.d $f2, $f2, $f4 	#
		add.d $f0, $f2, $f0 #sum = sum + m1->array[(i*dimension) + k] + m2->array[(k*dimension) + j]
		addi t2, t2, 1	#k++
		
		j for3 			

	end_for3:
		mul t4, t0, t1 	#i*dimension
		addu t4, t4, t2 #i*dimension + j
		
		lw t6, 8(v0)	#t6 = m3->array
		
		mul t4, t4, 8
		add t6, t6, t4  #m3->array[i*dim+j]
		s.d $f0, 0(t6)	#m3->array[i*dim+j] = sum

	end_for2:
		addi t1, t1, 1 	#j++
		j for1

	end_for1:
	    # return;
	    # restauro callee-saved regs
	    lw    gp, 32(sp)
	    lw    $fp, 36(sp)
	    lw    ra, 40(sp)
	    # destruyo stack frame
	    addu    sp, sp, 42
	    # vuelvo a funcion llamante
	    jr    ra

	    .end    matrix_multiply
	    .size   matrix_multiply,.-matrix_multiply
