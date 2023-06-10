# 4. Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:
# 20 ? temp ? 40 e
# 60 ? temp ? 80.
# Escreva um programa que coloque uma flag (registrador $t1) para 1 se a
# temperatura está entre os valores permitidos e para 0 caso contrário.

ori $t0, $zero, 20

ori $t1, $zero, 0 #flag = 0

slti $t1, $t0, 41 #t1 = 0 se t0 < 41
beq $t1, $zero, fora # t1 = 0? se sim, fora
slti $t1, $t0, 20 #t1 = 0 se t0 < 20
beq $t1, $zero, dentro # t1 = 0? se sim, dentro

fora:
slti $t1, $t0, 81 #t1 = 0 se t0 < 81
beq $t1, $zero, invalido #t1 = 0? se sim, invalido
slti $t1, $t0, 60 #t1 = 0 se t0 < 60
beq $t1, $zero, dentro #t1 = 0? se sim, dentro
j invalido

dentro: 
ori $t1, $zero, 1 #flag = 1
j fim #fim do programa
	
invalido:
or $t1, $zero, $zero #flag = 0, fora do intervalo

fim:	


 