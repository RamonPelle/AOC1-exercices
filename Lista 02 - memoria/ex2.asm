# 2. Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = 9a³- 5a² + 7a + 15
# Utilize endereços de memória para armazenar o valor de a e o resultado y. Cada
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space 4). 


.data
a: .word 3
y: .space 4


.text

lui $t0, 0x1001
lw $t1, 0x0($t0)# a = 3

or $t2, $zero, $t1
mult $t2, $t2
mflo $t2 #a²
mult $t1, $t2
mflo $t2 #a³
sll $t3, $t2, 3 #8a³
add $t3, $t3, $t2 #9a³

or $t2, $zero, $t1
mult $t2, $t2
mflo $t2 #a²
sll $t4, $t2, 2 #4a³
add $t4, $t4, $t2 #5a² (tem que ser -)

or $t2, $zero, $t1
sll $t5, $t2, 3 #8a
sub $t5, $t5, $t2 #7a

addi $t7, $zero, 15
add $t7, $t7, $t3
sub $t7, $t7, $t4
add $t7, $t7, $t5


sw $t7, 0x4($t0)