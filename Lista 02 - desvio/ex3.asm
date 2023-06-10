#  Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e
# calcule o x-ésimo termo da série de Fibonacci:
# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
# Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória

.data
x: .word 10
y: .space 4
	
.text
 lui $t0, 0x1001
 lw $t1, 0($t0) #carrega o termo que devemos achar na sequencia em $t1
 
 addi $t2, $zero, 1 # $t2 = 1
 addi $t3, $zero, 1 # $t3 = 1
 addi $t4, $zero, 1 # $t4 = 1
 addi $t5, $zero, 2
 
 beq $t1, $t2, fim #i = 1, fibonacci = 1
 beq $t1, $t5, fim #i = 2, fibonacci = 1
 	
 loop:
 add $t4, $t3, $t2 #soma os valores dos indices
 add $t2, $t3, $zero # atualiza os valores
 add $t3, $t4, $zero # atualiza os valores
 addi $t5, $t5, 1 # atualiza o contador de indice
 bne $t1, $t5, loop #ate que o contador seja igual ao termo que queremos encontrar
 
 fim:
 sw $t4, 4($t0)