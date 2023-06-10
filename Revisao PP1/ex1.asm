# 1. Reescreva o seguinte código C em MIPS Assembly:
# int i;
# int vetor[8];
# for(i=0; i<8; i++) {
# 	if(i%2==0)
# 		vetor[i] = i * 2;
# 	else
# 		vetor[i] = vetor[i] + vetor[i-1];
# }
# Cada posição do vetor deve ter 4 bytes e deve ser armazenada, em sequência, a
# partir da posição 0x1001000 da memória.

.data
 a: .word 4 #0x10010000 - 0
 b: .word 4 #0x10010004 - 4
 c: .word 4 #0x10010008 - 8
 d: .word 4 #0x1001000C - 12
 e: .word 4 #0x10010010 - 16
 f: .word 4 #0x10010014 - 20
 g: .word 4 #0x10010018 - 24
 h: .word 4 #0x1001001C - 28
 
.text
 #t0 = mem, t1 = i, t9 = 2
 lui $t0,0x1001
 ori $t9,$zero,2

loop:
 div $t1,$t9	# i%2
 mfhi $t2
 bne $t2,$zero, else
 mult $t1,$t9	# i*2
 mflo $t2
 
 j teste
 
else:	
 lw $t2, 0($t0)		# vetor[i]
 addi $t3,$t0,-4		# vetor[i-1]
 lw $t3,0($t3)
 add $t2,$t2,$t3		# vetor[i] + vetor[i-1]
 
teste:
 sw $t2, 0($t0)	
 addi $t0,$t0,4		#novo endereço
 
 addi $t1,$t1,1		#incrementa
 slti $t3, $t1,8		#testa 
 bne $t3,$zero,loop
      
