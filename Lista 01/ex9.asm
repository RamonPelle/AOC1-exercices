#Faça um programa que calcule a seguinte equação:
# y = (9x + 7) / (2x + 8)
# Armazene x em $t1, com a instrução addi $t1, $zero, x, substituindo x pelo valor
# desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
# registrador $t1.

# Armazene o quociente da divisão em $t2 e o resto em $t3.
# Responda o que acontece quando x = -4.

addi $t1, $zero, 1

# 9x + 7
or $t2, $zero, $t1
sll $t2, $t2, 3
add $t2, $t2, $t1
addi $t2, $t2, 7

# 2x + 8
or $t3, $zero, $t1
sll $t3, $t3, 1
add $t3, $t3, $t1
addi $t3, $t3, 8

div $t2, $t3
mflo $t2
mfhi $t3


