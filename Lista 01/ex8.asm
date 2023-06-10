# Faça um programa que calcule a seguinte equação:
# y = 3x² - 5x + 13

# Armazene x no registrador $t5 com a instrução addi $t5, $zero, x, substituindo x pelo
# valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no  registrador $t5.

# Armazene o resultado y no registrador $t6.
# Faça teste com diferentes valores positivos e negativos de x.

# Faça um teste substituindo a primeira instrução addi por uma instrução ori # equivalente e responda, nos comentários, qual o resultado quando são usados números
# positivos e números negativos.

addi $t5, $zero, -6

#+5x
or $t1, $zero, $t5
sll $t1, $t1, 2
add $t1, $t1, $t5

#3x²

add $t2, $t2, $t5
mult $t2, $t2
mflo $t3 # = x²

sll $t4, $t3, 1 #$t4 = 2x²
add $t3, $t4, $t3 # $t4 + x²


#CONTA FINAL
addi  $t6, $t3, 13 # 13 + 3x²
sub $t6, $t6, $t1 # -5x :D
