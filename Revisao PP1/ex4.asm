# 4. Escreva um programa que calcule o fatorial de n.
# O valor de n deve ser lido da mem�ria na posi��o 0x10010000 e o valor de n! deve
# ser escrito na posi��o seguinte na mem�ria (0x10010004).

.data 
 a: .word 4
 y: .space 4
 
.text
	lui $t0, 0x1001		#carrega 0x10010000 em $t0
	lw $t1, 0($t0)		#carrega n em $t1

	addi $t6, $zero, 1	# coloca 1 em $t6
	sw $t6, 4($t0)		# coloca 1 em n!

	beq $t1, $zero, fim	# se n=0 fim
	beq $t1, $t6, fim	# se n=1 fim

	add $t2, $t1, $zero 	#n em $t2
	addi $t3, $t1, -1 	#n-1 em $t3
	
loop:	mult $t2, $t3		#multiplica $t2 e $t3
	mflo $t2			#armazena o resultado em $t2
	addi $t3, $t3, -1 	#n-1 em $t3
	slti $t4, $t3, 1		#set $t4 se $t3 < 1
	beq $t4, $zero, loop	#se $t4 = 0, mais uma volta	
	
	sw $t2, 4($t0)		#armazena resultado em 0x10010004
	j fim

fim:
 
 