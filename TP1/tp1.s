	.file	1 "tp1.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	create_matrix
	.ent	create_matrix
create_matrix:
	.frame	$fp,48,$31		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,44($sp)
	sw	$fp,40($sp)
	sw	$28,36($sp)
	sw	$16,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	li	$4,12			# 0xc
	la	$25,malloc
	jal	$31,$25
	sw	$2,24($fp)
	lw	$3,24($fp)
	lw	$2,48($fp)
	sw	$2,0($3)
	lw	$3,24($fp)
	lw	$2,52($fp)
	sw	$2,4($3)
	lw	$16,24($fp)
	lw	$3,48($fp)
	lw	$2,52($fp)
	mult	$3,$2
	mflo	$2
	sll	$2,$2,3
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,8($16)
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	lw	$16,32($sp)
	addu	$sp,$sp,48
	j	$31
	.end	create_matrix
	.size	create_matrix, .-create_matrix
	.align	2
	.globl	destroy_matrix
	.ent	destroy_matrix
destroy_matrix:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	lw	$2,40($fp)
	lw	$4,8($2)
	la	$25,free
	jal	$31,$25
	lw	$4,40($fp)
	la	$25,free
	jal	$31,$25
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	destroy_matrix
	.size	destroy_matrix, .-destroy_matrix
	.rdata
	.align	2
$LC0:
	.ascii	"%zd \000"
	.align	2
$LC1:
	.ascii	"Error print_matrix: Valor erroneo en una columna \n\000"
	.align	2
$LC2:
	.ascii	"%g \000"
	.align	2
$LC3:
	.ascii	"Error print_matrix: Valor erroneo en una fila \n\000"
	.align	2
$LC4:
	.ascii	"\n\000"
	.text
	.align	2
	.globl	print_matrix
	.ent	print_matrix
print_matrix:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,40($sp)
	sw	$fp,36($sp)
	sw	$28,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	lw	$2,52($fp)
	lw	$4,48($fp)
	la	$5,$LC0
	lw	$6,4($2)
	la	$25,fprintf
	jal	$31,$25
	bgez	$2,$L20
	la	$4,__sF+176
	la	$5,$LC1
	la	$25,fprintf
	jal	$31,$25
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,28($fp)
	b	$L19
$L20:
	sw	$0,24($fp)
$L21:
	lw	$2,52($fp)
	lw	$3,52($fp)
	lw	$4,4($2)
	lw	$2,0($3)
	mult	$4,$2
	mflo	$3
	lw	$2,24($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L23
	b	$L22
$L23:
	lw	$4,52($fp)
	lw	$2,24($fp)
	sll	$3,$2,3
	lw	$2,8($4)
	addu	$2,$3,$2
	lw	$4,48($fp)
	la	$5,$LC2
	lw	$6,0($2)
	lw	$7,4($2)
	la	$25,fprintf
	jal	$31,$25
	bgez	$2,$L24
	la	$4,__sF+176
	la	$5,$LC3
	la	$25,fprintf
	jal	$31,$25
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,28($fp)
	b	$L19
$L24:
	lw	$2,24($fp)
	addu	$2,$2,1
	sw	$2,24($fp)
	b	$L21
$L22:
	lw	$4,48($fp)
	la	$5,$LC4
	la	$25,fprintf
	jal	$31,$25
	sw	$0,28($fp)
$L19:
	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	print_matrix
	.size	print_matrix, .-print_matrix
	.rdata
	.align	2
$LC6:
	.ascii	"version\000"
	.align	2
$LC7:
	.ascii	"help\000"
	.data
	.align	2
$LC8:
	.word	$LC6
	.word	0
	.word	0
	.word	86
	.word	$LC7
	.word	0
	.word	0
	.word	104
	.word	0
	.word	0
	.word	0
	.word	0
	.globl	memcpy
	.rdata
	.align	2
$LC5:
	.ascii	"hV\000"
	.align	2
$LC9:
	.ascii	"TP #0 de la materia Organizacion de Computadoras \n\000"
	.align	2
$LC10:
	.ascii	"Alumnos: \n\000"
	.align	2
$LC11:
	.ascii	"\tBobadilla Catalan, German\n"
	.ascii	"\tLeloutre, Daniela \n"
	.ascii	"\tSoro, Lucas \n\000"
	.align	2
$LC12:
	.ascii	"Usage: \n\000"
	.align	2
$LC13:
	.ascii	"\t%s -h \n\000"
	.align	2
$LC14:
	.ascii	"\t%s -V \n\000"
	.align	2
$LC15:
	.ascii	"\t%s < in_file > out_file \n\000"
	.align	2
$LC16:
	.ascii	"Options: \n\000"
	.align	2
$LC17:
	.ascii	"\t-V, --version  Print version and quit. \n\000"
	.align	2
$LC18:
	.ascii	"\t-h, --help     Print this information. \n\000"
	.align	2
$LC19:
	.ascii	"Examples: \n\000"
	.align	2
$LC20:
	.ascii	"\ttp0 < in.txt > out.txt \n\000"
	.align	2
$LC21:
	.ascii	"\tcat in.txt | tp0 > out.txt \n\000"
	.align	2
$LC22:
	.ascii	"Error: Argumento invalido \n\000"
	.align	2
$LC23:
	.ascii	"%zd\000"
	.align	2
$LC24:
	.ascii	"Error fscanf: Dimension erronea en una matriz \n\000"
	.align	2
$LC25:
	.ascii	"Error fgetc: Cantidad erronea de elementos en una linea "
	.ascii	"\n\000"
	.align	2
$LC26:
	.ascii	"%g\000"
	.align	2
$LC27:
	.ascii	"Error fscanf: Valor erroneo en una matriz \n\000"
	.align	2
$LC28:
	.ascii	"Error print_matrix: No se pudo escribir la matriz result"
	.ascii	"ado \n\000"
	.align	2
$LC29:
	.ascii	"Error fclose: %s\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,176,$31		# vars= 128, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,176
	.cprestore 24
	sw	$31,168($sp)
	sw	$fp,164($sp)
	sw	$28,160($sp)
	move	$fp,$sp
	sw	$4,176($fp)
	sw	$5,180($fp)
	sw	$0,32($fp)
	la	$2,$LC5
	sw	$2,36($fp)
	addu	$2,$fp,40
	la	$3,$LC8
	move	$4,$2
	move	$5,$3
	li	$6,48			# 0x30
	la	$25,memcpy
	jal	$31,$25
	sw	$0,88($fp)
	sw	$0,92($fp)
	la	$25,tmpfile
	jal	$31,$25
	sw	$2,96($fp)
	addu	$2,$fp,40
	sw	$0,16($sp)
	lw	$4,176($fp)
	lw	$5,180($fp)
	lw	$6,36($fp)
	move	$7,$2
	la	$25,getopt_long
	jal	$31,$25
	sw	$2,32($fp)
	lw	$3,32($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L28
	b	$L27
$L28:
	lw	$2,32($fp)
	sw	$2,152($fp)
	li	$2,86			# 0x56
	lw	$3,152($fp)
	beq	$3,$2,$L30
	li	$2,104			# 0x68
	lw	$3,152($fp)
	beq	$3,$2,$L31
	b	$L32
$L30:
	la	$4,$LC9
	la	$25,printf
	jal	$31,$25
	la	$4,$LC10
	la	$25,printf
	jal	$31,$25
	la	$4,$LC11
	la	$25,printf
	jal	$31,$25
	sw	$0,148($fp)
	b	$L25
$L31:
	la	$4,$LC12
	la	$25,printf
	jal	$31,$25
	lw	$2,180($fp)
	la	$4,$LC13
	lw	$5,0($2)
	la	$25,printf
	jal	$31,$25
	lw	$2,180($fp)
	la	$4,$LC14
	lw	$5,0($2)
	la	$25,printf
	jal	$31,$25
	lw	$2,180($fp)
	la	$4,$LC15
	lw	$5,0($2)
	la	$25,printf
	jal	$31,$25
	la	$4,$LC16
	la	$25,printf
	jal	$31,$25
	la	$4,$LC17
	la	$25,printf
	jal	$31,$25
	la	$4,$LC18
	la	$25,printf
	jal	$31,$25
	la	$4,$LC19
	la	$25,printf
	jal	$31,$25
	la	$4,$LC20
	la	$25,printf
	jal	$31,$25
	la	$4,$LC21
	la	$25,printf
	jal	$31,$25
	sw	$0,148($fp)
	b	$L25
$L32:
	la	$4,__sF+176
	la	$5,$LC22
	la	$25,fprintf
	jal	$31,$25
	la	$25,abort
	jal	$31,$25
$L27:
	lw	$3,176($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L34
	la	$4,__sF+176
	la	$5,$LC22
	la	$25,fprintf
	jal	$31,$25
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,148($fp)
	b	$L25
$L34:
	la	$2,__sF
	sw	$2,88($fp)
	la	$2,__sF+88
	sw	$2,92($fp)
$L35:
	lw	$4,88($fp)
	la	$25,fgetc
	jal	$31,$25
	sw	$2,104($fp)
	lw	$3,104($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L37
	b	$L36
$L37:
	lw	$4,104($fp)
	lw	$5,96($fp)
	la	$25,fputc
	jal	$31,$25
	b	$L35
$L36:
	lw	$4,96($fp)
	la	$25,rewind
	jal	$31,$25
$L38:
	addu	$2,$fp,100
	lw	$4,96($fp)
	la	$5,$LC23
	move	$6,$2
	la	$25,fscanf
	jal	$31,$25
	sw	$2,116($fp)
	lw	$3,116($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L40
	b	$L39
$L40:
	lw	$2,116($fp)
	bne	$2,$0,$L41
	la	$4,__sF+176
	la	$5,$LC24
	la	$25,fprintf
	jal	$31,$25
	li	$3,-1			# 0xffffffffffffffff
	sw	$3,148($fp)
	b	$L25
$L41:
	lw	$4,100($fp)
	lw	$5,100($fp)
	la	$25,create_matrix
	jal	$31,$25
	sw	$2,108($fp)
	lw	$4,100($fp)
	lw	$5,100($fp)
	la	$25,create_matrix
	jal	$31,$25
	sw	$2,112($fp)
	lw	$3,100($fp)
	lw	$2,100($fp)
	mult	$3,$2
	mflo	$2
	sll	$2,$2,3
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,128($fp)
	lw	$3,100($fp)
	lw	$2,100($fp)
	mult	$3,$2
	mflo	$2
	sll	$2,$2,3
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,132($fp)
	sw	$0,136($fp)
	sw	$0,140($fp)
$L42:
	lw	$3,100($fp)
	lw	$2,100($fp)
	mult	$3,$2
	mflo	$2
	sll	$3,$2,1
	lw	$2,136($fp)
	sltu	$2,$2,$3
	bne	$2,$0,$L44
	b	$L43
$L44:
	lw	$4,96($fp)
	la	$25,fgetc
	jal	$31,$25
	sw	$2,120($fp)
$L45:
	lw	$3,120($fp)
	li	$2,32			# 0x20
	beq	$3,$2,$L47
	b	$L46
$L47:
	lw	$4,96($fp)
	la	$25,fgetc
	jal	$31,$25
	sw	$2,120($fp)
	b	$L45
$L46:
	lw	$3,120($fp)
	li	$2,10			# 0xa
	bne	$3,$2,$L48
	la	$4,__sF+176
	la	$5,$LC25
	la	$25,fprintf
	jal	$31,$25
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,148($fp)
	b	$L25
$L48:
	lw	$2,136($fp)
	addu	$2,$2,1
	sw	$2,136($fp)
	lw	$4,96($fp)
	li	$5,-1			# 0xffffffffffffffff
	li	$6,1			# 0x1
	la	$25,fseek
	jal	$31,$25
	addu	$2,$fp,124
	lw	$4,96($fp)
	la	$5,$LC26
	move	$6,$2
	la	$25,fscanf
	jal	$31,$25
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L50
	lw	$3,100($fp)
	lw	$2,100($fp)
	mult	$3,$2
	mflo	$3
	lw	$2,136($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L51
	lw	$2,140($fp)
	sll	$3,$2,3
	lw	$2,128($fp)
	addu	$2,$3,$2
	l.s	$f0,124($fp)
	cvt.d.s	$f0,$f0
	s.d	$f0,0($2)
	b	$L53
$L51:
	lw	$2,140($fp)
	sll	$3,$2,3
	lw	$2,132($fp)
	addu	$2,$3,$2
	l.s	$f0,124($fp)
	cvt.d.s	$f0,$f0
	s.d	$f0,0($2)
	b	$L53
$L50:
	la	$4,__sF+176
	la	$5,$LC27
	la	$25,fprintf
	jal	$31,$25
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,148($fp)
	b	$L25
$L53:
	lw	$2,140($fp)
	addu	$2,$2,1
	sw	$2,140($fp)
	lw	$3,100($fp)
	lw	$2,100($fp)
	mult	$3,$2
	mflo	$3
	lw	$2,136($fp)
	bne	$2,$3,$L42
	sw	$0,140($fp)
	b	$L42
$L43:
	lw	$4,96($fp)
	la	$25,fgetc
	jal	$31,$25
	sw	$2,120($fp)
$L55:
	lw	$3,120($fp)
	li	$2,32			# 0x20
	beq	$3,$2,$L57
	b	$L56
$L57:
	lw	$4,96($fp)
	la	$25,fgetc
	jal	$31,$25
	sw	$2,120($fp)
	b	$L55
$L56:
	lw	$3,120($fp)
	li	$2,10			# 0xa
	beq	$3,$2,$L58
	la	$4,__sF+176
	la	$5,$LC25
	la	$25,fprintf
	jal	$31,$25
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,148($fp)
	b	$L25
$L58:
	lw	$3,108($fp)
	lw	$2,128($fp)
	sw	$2,8($3)
	lw	$3,112($fp)
	lw	$2,132($fp)
	sw	$2,8($3)
	lw	$4,108($fp)
	lw	$5,112($fp)
	la	$25,matrix_multiply
	jal	$31,$25
	sw	$2,144($fp)
	lw	$4,92($fp)
	lw	$5,144($fp)
	la	$25,print_matrix
	jal	$31,$25
	move	$3,$2
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L59
	la	$4,__sF+176
	la	$5,$LC28
	la	$25,fprintf
	jal	$31,$25
	li	$3,-1			# 0xffffffffffffffff
	sw	$3,148($fp)
	b	$L25
$L59:
	lw	$4,144($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	lw	$4,108($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	lw	$4,112($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	b	$L38
$L39:
	lw	$4,96($fp)
	la	$25,fclose
	jal	$31,$25
	move	$3,$2
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L60
	la	$25,__errno
	jal	$31,$25
	lw	$4,0($2)
	la	$25,strerror
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC29
	move	$6,$2
	la	$25,fprintf
	jal	$31,$25
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,148($fp)
	b	$L25
$L60:
	lw	$4,92($fp)
	la	$25,fclose
	jal	$31,$25
	move	$3,$2
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L61
	la	$25,__errno
	jal	$31,$25
	lw	$4,0($2)
	la	$25,strerror
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC29
	move	$6,$2
	la	$25,fprintf
	jal	$31,$25
	li	$3,-1			# 0xffffffffffffffff
	sw	$3,148($fp)
	b	$L25
$L61:
	sw	$0,148($fp)
$L25:
	lw	$2,148($fp)
	move	$sp,$fp
	lw	$31,168($sp)
	lw	$fp,164($sp)
	addu	$sp,$sp,176
	j	$31
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
