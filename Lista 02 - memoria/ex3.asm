# 3. Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = - ax^4 + bx³ - cx² + dx - e
# y = +3x^4 + 7x³ - 5x² -2x -8

.data
 a: .word -3 #0x0
 b: .word 7 #0x4 
 c: .word 5 #0x8
 d: .word -2 #0xC
  e: .word 8 #0x10 
 x: .word 4 #0x14
 y: .space 4#0x18
 
.text

lui $t0, 0x1001
lw $t1, 0x14($t0) # x

mult $t1, $t1
mflo $t2 #x²
mult $t2, $t1
mflo $t2 #x³
mult $t2, $t1
mflo $t2 #x^4

lw $t7, 0x0($t0) # a
mult $t2, $t7
mflo $t3 #ax ^4

lw $t7, 0x4($t0) # b
div $t2, $t2, 4 #x³
mult $t7, $t2
mflo $t4

lw $t7, 0x8($t0) # c
div $t2, $t2, 4 #x²
mult $t7, $t2
mflo $t5

lw $t7, 0xC($t0) # d
div $t2, $t2, 4 #x
mult $t7, $t2
mflo $t6

lw $t7, 0x10($t0) # e

ori $t1, $zero, 0
sub $t1, $t1, $t3 # -ax^4
add $t1, $t1, $t4 # -ax^4 + bx³
sub $t1, $t1, $t5 # -ax^4 + bx³ - cx²
add $t1, $t1, $t6 # -ax^4 + bx³ - cx² + dx
sub $t1, $t1, $t7 # -ax^4 + bx³ - cx² + dx - e

sw $t1, 0x18($t0)


