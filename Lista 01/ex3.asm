#Comece um programa pela instru��o: ori $t1, $zero, 0x01. Usando
#apenas as instru��es l�gicas do tipo R (dois registradores como
#operandos) or, and e xor e instru��es de shift (isto �, sem usar outras
#instru��es ori al�m da inicial e nem instru��es nor),
#escreva 0xFFFFFFFF em $t1. Procure usar o menor n�mero de
#instru��es poss�vel.

ori $t1, $zero, 0x01

sll $t2,$t1,1 #(0000 0000 0000 0000 0000 0000 0000 0010) -t2
or  $t1,$t2,$t1 #(0000 0000 0000 0000 0000 0000 0000 0011) -t1

sll $t2,$t1,2 #(0000 0000 0000 0000 0000 0000 0000 1100) -t2
or  $t1,$t2,$t1 #(0000 0000 0000 0000 0000 0000 0000 1111) -t1

sll $t2,$t1,4 #(0000 0000 0000 0000 0000 0000 1111 0000) -t2
or  $t1,$t2,$t1 #(0000 0000 0000 0000 0000 0000 1111 1111) -t1

sll $t2,$t1,8 #(0000 0000 0000 0000 1111 1111 0000 0000) -t2
or  $t1,$t2,$t1 #(0000 0000 0000 0000 1111 1111 1111 1111) -t1

sll $t2,$t1,16 #(1111 1111 1111 1111 0000 0000 0000 0000) -t2
or  $t1,$t2,$t1 #(0000 0000 0000 0000 1111 1111 1111 1111) -t1

#SLL COPIA T1 EM T2 COM OS SHIFTS
