# 2. Fa�a um programa que calcule o seguinte polin�mio usando o m�todo de Horner:
# y = 9a�- 5a� + 7a + 15
# Utilize endere�os de mem�ria para armazenar o valor de a e o resultado y. Cada
# valor deve ocupar 4 bytes na mem�ria (.word), assim como para o resultado (.space 4). 


.data
a: .word 3
y: .space 4


.text

lui $t0, 0x1001
lw $t1, 0x0($t0)# a = 3

or $t2, $zero, $t1
mult $t2, $t2
mflo $t2 #a�
mult $t1, $t2
mflo $t2 #a�
sll $t3, $t2, 3 #8a�
add $t3, $t3, $t2 #9a�

or $t2, $zero, $t1
mult $t2, $t2
mflo $t2 #a�
sll $t4, $t2, 2 #4a�
add $t4, $t4, $t2 #5a� (tem que ser -)

or $t2, $zero, $t1
sll $t5, $t2, 3 #8a
sub $t5, $t5, $t2 #7a

addi $t7, $zero, 15
add $t7, $t7, $t3
sub $t7, $t7, $t4
add $t7, $t7, $t5


sw $t7, 0x4($t0)