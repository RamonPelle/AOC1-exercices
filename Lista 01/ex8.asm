# Fa�a um programa que calcule a seguinte equa��o:
# y = 3x� - 5x + 13

# Armazene x no registrador $t5 com a instru��o addi $t5, $zero, x, substituindo x pelo
# valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no  registrador $t5.

# Armazene o resultado y no registrador $t6.
# Fa�a teste com diferentes valores positivos e negativos de x.

# Fa�a um teste substituindo a primeira instru��o addi por uma instru��o ori # equivalente e responda, nos coment�rios, qual o resultado quando s�o usados n�meros
# positivos e n�meros negativos.

addi $t5, $zero, -6

#+5x
or $t1, $zero, $t5
sll $t1, $t1, 2
add $t1, $t1, $t5

#3x�

add $t2, $t2, $t5
mult $t2, $t2
mflo $t3 # = x�

sll $t4, $t3, 1 #$t4 = 2x�
add $t3, $t4, $t3 # $t4 + x�


#CONTA FINAL
addi  $t6, $t3, 13 # 13 + 3x�
sub $t6, $t6, $t1 # -5x :D
