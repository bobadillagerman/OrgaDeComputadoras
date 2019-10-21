	.file	1 "tp1.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	destroy_matrix
	.ent	destroy_matrix
destroy_matrix:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v0,40($fp)
	lw	$a0,8($v0)
	la	$t9,myfree
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,myfree
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
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
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$v0,52($fp)
	lw	$a0,48($fp)
	la	$a1,$LC0
	lw	$a2,4($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	bgez	$v0,$L19
	la	$a0,__sF+176
	la	$a1,$LC1
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,28($fp)
	b	$L18
$L19:
	sw	$zero,24($fp)
$L20:
	lw	$v0,52($fp)
	lw	$v1,52($fp)
	lw	$a0,4($v0)
	lw	$v0,0($v1)
	mult	$a0,$v0
	mflo	$v1
	lw	$v0,24($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L22
	b	$L21
$L22:
	lw	$a0,52($fp)
	lw	$v0,24($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$a0,48($fp)
	la	$a1,$LC2
	lw	$a2,0($v0)
	lw	$a3,4($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	bgez	$v0,$L23
	la	$a0,__sF+176
	la	$a1,$LC3
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,28($fp)
	b	$L18
$L23:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L20
$L21:
	lw	$a0,48($fp)
	la	$a1,$LC4
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,28($fp)
$L18:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
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
	.frame	$fp,176,$ra		# vars= 128, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,176
	.cprestore 24
	sw	$ra,168($sp)
	sw	$fp,164($sp)
	sw	$gp,160($sp)
	move	$fp,$sp
	sw	$a0,176($fp)
	sw	$a1,180($fp)
	sw	$zero,32($fp)
	la	$v0,$LC5
	sw	$v0,36($fp)
	addu	$v0,$fp,40
	la	$v1,$LC8
	move	$a0,$v0
	move	$a1,$v1
	li	$a2,48			# 0x30
	la	$t9,memcpy
	jal	$ra,$t9
	sw	$zero,88($fp)
	sw	$zero,92($fp)
	la	$t9,tmpfile
	jal	$ra,$t9
	sw	$v0,96($fp)
	addu	$v0,$fp,40
	sw	$zero,16($sp)
	lw	$a0,176($fp)
	lw	$a1,180($fp)
	lw	$a2,36($fp)
	move	$a3,$v0
	la	$t9,getopt_long
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L27
	b	$L26
$L27:
	lw	$v0,32($fp)
	sw	$v0,152($fp)
	li	$v0,86			# 0x56
	lw	$v1,152($fp)
	beq	$v1,$v0,$L29
	li	$v0,104			# 0x68
	lw	$v1,152($fp)
	beq	$v1,$v0,$L30
	b	$L31
$L29:
	la	$a0,$LC9
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC10
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC11
	la	$t9,printf
	jal	$ra,$t9
	sw	$zero,148($fp)
	b	$L24
$L30:
	la	$a0,$LC12
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,180($fp)
	la	$a0,$LC13
	lw	$a1,0($v0)
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,180($fp)
	la	$a0,$LC14
	lw	$a1,0($v0)
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,180($fp)
	la	$a0,$LC15
	lw	$a1,0($v0)
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC17
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC18
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC19
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC20
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC21
	la	$t9,printf
	jal	$ra,$t9
	sw	$zero,148($fp)
	b	$L24
$L31:
	la	$a0,__sF+176
	la	$a1,$LC22
	la	$t9,fprintf
	jal	$ra,$t9
	la	$t9,abort
	jal	$ra,$t9
$L26:
	lw	$v1,176($fp)
	li	$v0,2			# 0x2
	bne	$v1,$v0,$L33
	la	$a0,__sF+176
	la	$a1,$LC22
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,148($fp)
	b	$L24
$L33:
	la	$v0,__sF
	sw	$v0,88($fp)
	la	$v0,__sF+88
	sw	$v0,92($fp)
$L34:
	lw	$a0,88($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,104($fp)
	lw	$v1,104($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L36
	b	$L35
$L36:
	lw	$a0,104($fp)
	lw	$a1,96($fp)
	la	$t9,fputc
	jal	$ra,$t9
	b	$L34
$L35:
	lw	$a0,96($fp)
	la	$t9,rewind
	jal	$ra,$t9
$L37:
	addu	$v0,$fp,100
	lw	$a0,96($fp)
	la	$a1,$LC23
	move	$a2,$v0
	la	$t9,fscanf
	jal	$ra,$t9
	sw	$v0,116($fp)
	lw	$v1,116($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L39
	b	$L38
$L39:
	lw	$v0,116($fp)
	bne	$v0,$zero,$L40
	la	$a0,__sF+176
	la	$a1,$LC24
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v1,-1			# 0xffffffffffffffff
	sw	$v1,148($fp)
	b	$L24
$L40:
	lw	$a0,100($fp)
	lw	$a1,100($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,108($fp)
	lw	$a0,100($fp)
	lw	$a1,100($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,112($fp)
	lw	$v1,100($fp)
	lw	$v0,100($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,mymalloc
	jal	$ra,$t9
	sw	$v0,128($fp)
	lw	$v1,100($fp)
	lw	$v0,100($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,mymalloc
	jal	$ra,$t9
	sw	$v0,132($fp)
	sw	$zero,136($fp)
	sw	$zero,140($fp)
$L41:
	lw	$v1,100($fp)
	lw	$v0,100($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v1,$v0,1
	lw	$v0,136($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L43
	b	$L42
$L43:
	lw	$a0,96($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,120($fp)
$L44:
	lw	$v1,120($fp)
	li	$v0,32			# 0x20
	beq	$v1,$v0,$L46
	b	$L45
$L46:
	lw	$a0,96($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,120($fp)
	b	$L44
$L45:
	lw	$v1,120($fp)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L47
	la	$a0,__sF+176
	la	$a1,$LC25
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,148($fp)
	b	$L24
$L47:
	lw	$v0,136($fp)
	addu	$v0,$v0,1
	sw	$v0,136($fp)
	lw	$a0,96($fp)
	li	$a1,-1			# 0xffffffffffffffff
	li	$a2,1			# 0x1
	la	$t9,fseek
	jal	$ra,$t9
	addu	$v0,$fp,124
	lw	$a0,96($fp)
	la	$a1,$LC26
	move	$a2,$v0
	la	$t9,fscanf
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L49
	lw	$v1,100($fp)
	lw	$v0,100($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,136($fp)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L50
	lw	$v0,140($fp)
	sll	$v1,$v0,3
	lw	$v0,128($fp)
	addu	$v0,$v1,$v0
	l.s	$f0,124($fp)
	cvt.d.s	$f0,$f0
	s.d	$f0,0($v0)
	b	$L52
$L50:
	lw	$v0,140($fp)
	sll	$v1,$v0,3
	lw	$v0,132($fp)
	addu	$v0,$v1,$v0
	l.s	$f0,124($fp)
	cvt.d.s	$f0,$f0
	s.d	$f0,0($v0)
	b	$L52
$L49:
	la	$a0,__sF+176
	la	$a1,$LC27
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,148($fp)
	b	$L24
$L52:
	lw	$v0,140($fp)
	addu	$v0,$v0,1
	sw	$v0,140($fp)
	lw	$v1,100($fp)
	lw	$v0,100($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,136($fp)
	bne	$v0,$v1,$L41
	sw	$zero,140($fp)
	b	$L41
$L42:
	lw	$a0,96($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,120($fp)
$L54:
	lw	$v1,120($fp)
	li	$v0,32			# 0x20
	beq	$v1,$v0,$L56
	b	$L55
$L56:
	lw	$a0,96($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,120($fp)
	b	$L54
$L55:
	lw	$v1,120($fp)
	li	$v0,10			# 0xa
	beq	$v1,$v0,$L57
	la	$a0,__sF+176
	la	$a1,$LC25
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,148($fp)
	b	$L24
$L57:
	lw	$v1,108($fp)
	lw	$v0,128($fp)
	sw	$v0,8($v1)
	lw	$v1,112($fp)
	lw	$v0,132($fp)
	sw	$v0,8($v1)
	lw	$a0,108($fp)
	lw	$a1,112($fp)
	la	$t9,matrix_multiply
	jal	$ra,$t9
	sw	$v0,144($fp)
	lw	$a0,92($fp)
	lw	$a1,144($fp)
	la	$t9,print_matrix
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L58
	la	$a0,__sF+176
	la	$a1,$LC28
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v1,-1			# 0xffffffffffffffff
	sw	$v1,148($fp)
	b	$L24
$L58:
	lw	$a0,144($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,108($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,112($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	b	$L37
$L38:
	lw	$a0,96($fp)
	la	$t9,fclose
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L59
	la	$t9,__errno
	jal	$ra,$t9
	lw	$a0,0($v0)
	la	$t9,strerror
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC29
	move	$a2,$v0
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,148($fp)
	b	$L24
$L59:
	lw	$a0,92($fp)
	la	$t9,fclose
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L60
	la	$t9,__errno
	jal	$ra,$t9
	lw	$a0,0($v0)
	la	$t9,strerror
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC29
	move	$a2,$v0
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v1,-1			# 0xffffffffffffffff
	sw	$v1,148($fp)
	b	$L24
$L60:
	sw	$zero,148($fp)
$L24:
	lw	$v0,148($fp)
	move	$sp,$fp
	lw	$ra,168($sp)
	lw	$fp,164($sp)
	addu	$sp,$sp,176
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
