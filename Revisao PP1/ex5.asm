# 5. Escreva um programa que receba dois números em complemento de dois
# (armazenados em $s0 e $s1). Procure em um vetor (com início endereçado em $s3 e
# tamanho armazenado em $s4) quantos números existem com valores dentro do
# intervalo fechado definido por $s0 e $s1. Assuma que $s0 <= $s1.
# Utilize os registradores $s3 e $s4 apenas para armazenar o início e o tamanho do
# vetor.

.data
a: .word 5
b: .word 1
c: .word 6
d: .word 7
e: .word 10

.text
lui $s3,0x1001#inicio
addi $s4,$zero,5#tamanho
addi $s0,$zero,5#menor
addi $s1,$zero,10#maior
addi $s5,$zero,0 #contador
addi $t2,$zero,0 #acumulador
add  $s7,$zero,$s3#endereço atual
addi  $t4,$s1,1#maior+1
loop:
beq $s5,$s4,fim
lw $t7,0($s7) #pega o valor do vetor[i]

slt $s6,$t7,$t4# 0 -> fora do limite(tem que ser menor)
beq $s6,$zero,fora
slt $s6,$t7,$s0# 0 ->dentro do limite(tem que ser maior)
bne $s6,$zero,fora
addi $t2,$t2,1#encontra valor dentro do limite

fora:
addi $s7,$s7,4 #passa de endereço
addi $s5,$s5,1 #soma 1 no contador
j loop


fim:
sw $t2,0($s7) 