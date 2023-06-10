# 1. Escreva um programa que leia dois halfwords (a e b) da memória e calcule a sua
# divisão se os dois valores forem diferentes e a sua multiplicação se os dois valores
# forem iguais. Escreva o resultado (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data.`11

.data
 a: .half 30 #0x10010000
 b: .half 5 #0x10010002
 y: .space 4 #0x10010004
	
.text
 lui $t0, 0x1001 # t0 é o registrador base
 lh $t1, 0($t0) # t1 = a (16bits)
 lh $t2, 2($t0) # t2 = b (16bits)
 
 beq $t1, $t2, multiplica
 #não é igual, então $t3 = a/b
 div $t1, $t2
 mflo $t3
 j fim
 
 multiplica:
  #é igual, então $t3 = a*b
  mult $t1, $t2
  mflo $t3

fim:
  sw $t3 4($t0) #armazena y
