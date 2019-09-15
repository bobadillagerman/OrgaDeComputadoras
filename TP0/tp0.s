	.file	1 "tp0.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	create_matrix
	.ent	create_matrix
create_matrix:
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
	li	$a0,12			# 0xc
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v1,24($fp)
	lw	$v0,48($fp)
	sw	$v0,0($v1)
	lw	$v1,24($fp)
	lw	$v0,52($fp)
	sw	$v0,4($v1)
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	create_matrix
	.size	create_matrix, .-create_matrix
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
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,free
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
	.ascii	"%g \000"
	.align	2
$LC2:
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
	bgez	$v0,$L20
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,28($fp)
	b	$L19
$L20:
	sw	$zero,24($fp)
$L21:
	lw	$v0,52($fp)
	lw	$v1,52($fp)
	lw	$a0,4($v0)
	lw	$v0,0($v1)
	mult	$a0,$v0
	mflo	$v1
	lw	$v0,24($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L23
	b	$L22
$L23:
	lw	$a0,52($fp)
	lw	$v0,24($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$a0,48($fp)
	la	$a1,$LC1
	lw	$a2,0($v0)
	lw	$a3,4($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	bgez	$v0,$L24
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,28($fp)
	b	$L19
$L24:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L21
$L22:
	lw	$a0,48($fp)
	la	$a1,$LC2
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,28($fp)
$L19:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	print_matrix
	.size	print_matrix, .-print_matrix
	.align	2
	.globl	matrix_multiply
	.ent	matrix_multiply
matrix_multiply:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	lw	$v0,76($fp)
	lw	$v0,4($v0)
	sw	$v0,28($fp)
	lw	$v1,28($fp)
	lw	$v0,28($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$a0,28($fp)
	lw	$a1,28($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,24($fp)
	sw	$zero,36($fp)
$L26:
	lw	$v0,36($fp)
	lw	$v1,28($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L29
	b	$L27
$L29:
	sw	$zero,40($fp)
$L30:
	lw	$v0,40($fp)
	lw	$v1,28($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L33
	b	$L28
$L33:
	sw	$zero,44($fp)
	sw	$zero,48($fp)
$L34:
	lw	$v0,48($fp)
	lw	$v1,28($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L37
	b	$L35
$L37:
	l.s	$f0,44($fp)
	cvt.d.s	$f4,$f0
	lw	$a0,72($fp)
	lw	$v1,36($fp)
	lw	$v0,28($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,48($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$a1,$v1,$v0
	lw	$a0,76($fp)
	lw	$v1,48($fp)
	lw	$v0,28($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,40($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f2,0($a1)
	l.d	$f0,0($v0)
	mul.d	$f0,$f2,$f0
	add.d	$f0,$f4,$f0
	cvt.s.d	$f0,$f0
	s.s	$f0,44($fp)
	lw	$v0,48($fp)
	addu	$v0,$v0,1
	sw	$v0,48($fp)
	b	$L34
$L35:
	lw	$v1,36($fp)
	lw	$v0,28($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,40($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	l.s	$f0,44($fp)
	cvt.d.s	$f0,$f0
	s.d	$f0,0($v0)
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L30
$L28:
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,36($fp)
	b	$L26
$L27:
	lw	$v1,24($fp)
	lw	$v0,32($fp)
	sw	$v0,8($v1)
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	matrix_multiply
	.size	matrix_multiply, .-matrix_multiply
	.rdata
	.align	2
$LC4:
	.ascii	"version\000"
	.align	2
$LC5:
	.ascii	"help\000"
	.data
	.align	2
$LC6:
	.word	$LC4
	.word	0
	.word	0
	.word	86
	.word	$LC5
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
$LC3:
	.ascii	"hV\000"
	.align	2
$LC7:
	.ascii	"TP #0 de la materia Organizacion de Computadoras \n\000"
	.align	2
$LC8:
	.ascii	"Alumnos: \n\000"
	.align	2
$LC9:
	.ascii	"\tBobadilla Catalan, German\n"
	.ascii	"\tLeloutre, Daniela \n"
	.ascii	"\tSoro, Lucas \n\000"
	.align	2
$LC10:
	.ascii	"Usage: \n\000"
	.align	2
$LC11:
	.ascii	"\t%s -h \n\000"
	.align	2
$LC12:
	.ascii	"\t%s -V \n\000"
	.align	2
$LC13:
	.ascii	"\t%s < in_file > out_file \n\000"
	.align	2
$LC14:
	.ascii	"Options: \n\000"
	.align	2
$LC15:
	.ascii	"\t-V, --version  Print version and quit. \n\000"
	.align	2
$LC16:
	.ascii	"\t-h, --help     Print this information. \n\000"
	.align	2
$LC17:
	.ascii	"Examples: \n\000"
	.align	2
$LC18:
	.ascii	"\ttp0 < in.txt > out.txt \n\000"
	.align	2
$LC19:
	.ascii	"\tcat in.txt | tp0 > out.txt \n\000"
	.align	2
$LC20:
	.ascii	"%zd\000"
	.align	2
$LC21:
	.ascii	"Error fscanf: Dimension erronea en una matriz \n\000"
	.align	2
$LC22:
	.ascii	"%g\000"
	.align	2
$LC23:
	.ascii	"Error fscanf: Valor erroneo en una matriz \n\000"
	.align	2
$LC24:
	.ascii	"Error print_matrix: No se pudo escribir la matriz result"
	.ascii	"ado \n\000"
	.align	2
$LC25:
	.ascii	"Error fclose: %s\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,160,$ra		# vars= 112, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,160
	.cprestore 24
	sw	$ra,152($sp)
	sw	$fp,148($sp)
	sw	$gp,144($sp)
	move	$fp,$sp
	sw	$a0,160($fp)
	sw	$a1,164($fp)
	sw	$zero,32($fp)
	la	$v0,$LC3
	sw	$v0,36($fp)
	addu	$v0,$fp,40
	la	$v1,$LC6
	move	$a0,$v0
	move	$a1,$v1
	li	$a2,48			# 0x30
	la	$t9,memcpy
	jal	$ra,$t9
	sw	$zero,88($fp)
	sw	$zero,92($fp)
	addu	$v0,$fp,40
	sw	$zero,16($sp)
	lw	$a0,160($fp)
	lw	$a1,164($fp)
	lw	$a2,36($fp)
	move	$a3,$v0
	la	$t9,getopt_long
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L41
	b	$L40
$L41:
	lw	$v0,32($fp)
	sw	$v0,140($fp)
	li	$v0,86			# 0x56
	lw	$v1,140($fp)
	beq	$v1,$v0,$L43
	li	$v0,104			# 0x68
	lw	$v1,140($fp)
	beq	$v1,$v0,$L44
	b	$L45
$L43:
	la	$a0,$LC7
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC8
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC9
	la	$t9,printf
	jal	$ra,$t9
	sw	$zero,136($fp)
	b	$L38
$L44:
	la	$a0,$LC10
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,164($fp)
	la	$a0,$LC11
	lw	$a1,0($v0)
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,164($fp)
	la	$a0,$LC12
	lw	$a1,0($v0)
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,164($fp)
	la	$a0,$LC13
	lw	$a1,0($v0)
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC14
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC15
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
	sw	$zero,136($fp)
	b	$L38
$L45:
	la	$t9,abort
	jal	$ra,$t9
$L40:
	la	$v0,__sF
	sw	$v0,88($fp)
	la	$v0,__sF+88
	sw	$v0,92($fp)
$L47:
	addu	$v0,$fp,96
	lw	$a0,88($fp)
	la	$a1,$LC20
	move	$a2,$v0
	la	$t9,fscanf
	jal	$ra,$t9
	sw	$v0,108($fp)
	lw	$v1,108($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L49
	b	$L48
$L49:
	lw	$v0,108($fp)
	bne	$v0,$zero,$L50
	la	$a0,__sF+176
	la	$a1,$LC21
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,136($fp)
	b	$L38
$L50:
	lw	$a0,96($fp)
	lw	$a1,96($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,100($fp)
	lw	$a0,96($fp)
	lw	$a1,96($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,104($fp)
	lw	$v1,96($fp)
	lw	$v0,96($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,116($fp)
	lw	$v1,96($fp)
	lw	$v0,96($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,120($fp)
	sw	$zero,124($fp)
$L51:
	lw	$v1,96($fp)
	lw	$v0,96($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,124($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L54
	b	$L52
$L54:
	addu	$v0,$fp,112
	lw	$a0,88($fp)
	la	$a1,$LC22
	move	$a2,$v0
	la	$t9,fscanf
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L55
	lw	$v0,124($fp)
	sll	$v1,$v0,3
	lw	$v0,116($fp)
	addu	$v0,$v1,$v0
	l.s	$f0,112($fp)
	cvt.d.s	$f0,$f0
	s.d	$f0,0($v0)
	b	$L53
$L55:
	la	$a0,__sF+176
	la	$a1,$LC23
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,136($fp)
	b	$L38
$L53:
	lw	$v0,124($fp)
	addu	$v0,$v0,1
	sw	$v0,124($fp)
	b	$L51
$L52:
	sw	$zero,128($fp)
$L57:
	lw	$v1,96($fp)
	lw	$v0,96($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,128($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L60
	b	$L58
$L60:
	addu	$v0,$fp,112
	lw	$a0,88($fp)
	la	$a1,$LC22
	move	$a2,$v0
	la	$t9,fscanf
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L61
	lw	$v0,128($fp)
	sll	$v1,$v0,3
	lw	$v0,120($fp)
	addu	$v0,$v1,$v0
	l.s	$f0,112($fp)
	cvt.d.s	$f0,$f0
	s.d	$f0,0($v0)
	b	$L59
$L61:
	la	$a0,__sF+176
	la	$a1,$LC23
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,136($fp)
	b	$L38
$L59:
	lw	$v0,128($fp)
	addu	$v0,$v0,1
	sw	$v0,128($fp)
	b	$L57
$L58:
	lw	$v1,100($fp)
	lw	$v0,116($fp)
	sw	$v0,8($v1)
	lw	$v1,104($fp)
	lw	$v0,120($fp)
	sw	$v0,8($v1)
	lw	$a0,100($fp)
	lw	$a1,104($fp)
	la	$t9,matrix_multiply
	jal	$ra,$t9
	sw	$v0,132($fp)
	lw	$a0,92($fp)
	lw	$a1,132($fp)
	la	$t9,print_matrix
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L63
	la	$a0,__sF+176
	la	$a1,$LC24
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v1,-1			# 0xffffffffffffffff
	sw	$v1,136($fp)
	b	$L38
$L63:
	lw	$a0,132($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,100($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,104($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	b	$L47
$L48:
	lw	$a0,88($fp)
	la	$t9,fclose
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L64
	la	$t9,__errno
	jal	$ra,$t9
	lw	$a0,0($v0)
	la	$t9,strerror
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC25
	move	$a2,$v0
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,136($fp)
	b	$L38
$L64:
	lw	$a0,92($fp)
	la	$t9,fclose
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L65
	la	$t9,__errno
	jal	$ra,$t9
	lw	$a0,0($v0)
	la	$t9,strerror
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC25
	move	$a2,$v0
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v1,-1			# 0xffffffffffffffff
	sw	$v1,136($fp)
	b	$L38
$L65:
	sw	$zero,136($fp)
$L38:
	lw	$v0,136($fp)
	move	$sp,$fp
	lw	$ra,152($sp)
	lw	$fp,148($sp)
	addu	$sp,$sp,160
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
