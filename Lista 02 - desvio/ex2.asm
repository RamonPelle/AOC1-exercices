# 2. Escreva um programa que calcule:
# 1 + 2 + 3 + … + 333
# Escreva o resultado (y) em uma palavra (4 bytes) de memória. O resultado deve ser
# armazenado, obrigatoriamente, na posição 0x10010000 da memória .data. 

.data
 y: .space 4
 
.text
 lui $t0, 0x1001
 ori $t1, $zero, 0  
 ori $t2, $zero, 0
 
 loop: 
 addi $t2, $t2, 1
 add $t1, $t1, $t2

 bne $t2, 50, loop
 
 end:
 sw $t1, 0($t0)
 
 
