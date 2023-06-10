# 1. Faça um programa que calcule a seguinte equação:
# y = 32ab - 3a + 7b - 13
# Utilize endereços de memória para armazenar o valore de a, b e o resultado y. Cada
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space 4). 

.data
a: .word 3 #0x10010000
b: .word 5 #0x10010004
y: .space 4 #0x10010008

.text

lui $t0, 0x1001
lw $t1, 0x0($t0) #a = 3
lw $t2, 0x4($t0) #b = 4

mult $t1, $t2
mflo $t3 # $t3 = ab
sll $t3, $t3, 5 # $t3 = 32ab

addi $t4, $zero, -3
mult $t4, $t1 #-3a
mflo $t4

or $t5, $zero, $t2 #$t5 = b
sll $t5, $t5, 3 #$t5 = 8b
sub $t5, $t5, $t2 #7b

add $t6, $zero, $t4 # -3a
add $t6, $t6, $t5 # - 3a + 7b
addi $t6, $t6, -13 # - 3a + 7b -13
add $t6, $t6, $t3 # 32ab - 3a + 7b - 13

sw $t6, 0x8($t0)


