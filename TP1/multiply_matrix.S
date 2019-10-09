#include <mips/regdef.h>	
	.text			# segmento de texto del programa

	.abicalls
	.align 2		# alineacion 2^2

	.globl	matrix_multiply
	.ent	matrix_multiply

matrix_multiply:
	#debugging info: descripcion del stack frame
	.frame	$fp, 42, ra	

	# bloque para codigo PIC
	.set	noreorder	# apaga reordenamiento de instrucciones
	.cpload t9			# directiva usada para codigo PIC
	.set	reorder		# enciende reordenamiento de instrucciones

	# creo stack frame
	subu	sp, sp, 42	# 4 (SRA) + 4 (LTA) + 4 (ABA)

	# directiva para codigo PIC
	.cprestore 32		# inserta aqui "sw gp, 24(sp)",
				# mas "lw gp, 24(sp)" luego de #cada jal.
	# salvado de callee-saved regs en SRA	
	sw	$fp, 36(sp)
	sw	ra, 40(sp)

	# de aqui al fin de la funcion uso $fp en lugar de sp.
	move	$fp, sp
	
	# salvo 1er arg (siempre)
	sw	a0, 48($fp)	# &m1
	sw  a1, 52($fp) # &m2





	# return;
	# restauro callee-saved regs
	lw	gp, 32(sp)
	lw	$fp, 36(sp)
	lw	ra, 40(sp)
	# destruyo stack frame
	addu	sp, sp, 42
	# vuelvo a funcion llamante
	jr	ra

	.end	matrix_multiply

