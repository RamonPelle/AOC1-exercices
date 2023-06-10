# 3. Escreva um programa que encontre a mediana de três valores lidos da memória. A
# mediana deve ser salva na posição 0x1001000C da memória.
# Exemplo:

.data
 a: .word 3
 b: .word 2
 c: .word 1
 d: .space 4
#Mediana = 3

.text
	lui $t0,0x1001
	lw $t1,0($t0)		# a
	lw $t2,4($t0)		# b
	lw $t3,8($t0)		# c
	
	
	slt $t4,$t1,$t2
	bne $t4,$zero,t1_lt_t2 
	
	or $t1,$t1,$zero	# t5 = maior
	or $t2,$t2,$zero	# t6 = menor
	j begin
t1_lt_t2:
	or $t1,$t2,$zero
	or $t2,$t1,$zero
begin:
	or $t7,$t1,$zero	# mediana = maior
	slt $t4,$t1,$t3		# maior < t3 ?
	bne $t4,$zero,end	# maior = mediana
	# maior > t3
	or $t7,$t3,$zero	# mediana = t3
	slt $t4,$t3,$t2		# t3 < menor ?
	beq $t4,$zero,end	# t3 = mediana
	
	or $t7,$t2,$zero	# mediana = menor
end:
	sw $t7,12($t0)
	
	
	
	
	
 
 
 


 
