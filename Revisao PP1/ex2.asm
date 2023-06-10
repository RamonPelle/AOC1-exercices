# 2. Escreva um programa que calcule o produtório abaixo. 
# produtorio n i=0 -> (n+i/2)
#O valor de n deve ser lido da posição 0x10010000 da memória no início do programa. 
# O valor de A deve ser escrito na memória no fim do programa, na posição 0x10010004.
# OBS: considere a divisão inteira, i.e.:
# 1 / 2 = 0,
# 2 / 2 = 1,
# 3 / 2 = 1,
# 4 / 2 = 2, etc.

.data
 n: .word 2
 a: .space 4

.text
 # t1 = n, t2 = i
 lui $t0,0x1001
 lw $t1,0($t0)	# n
 or $t7, $zero, $t1
 addi $t7, $t7, 1 #n+1, criterio de parada
 ori $t2,$zero,0 # i
 ori $t4, $zero, 1 #produto
loop:
 sra $t3,$t2,1		# i/2
 
 add $t6,$t1,$t3		# n + i/2
 mult $t4,$t6		# mult *= n + i/2
 mflo $t4
 addi $t2,$t2,1


 bne $t7,$t2,loop
 sw $t4, 4($t0)
