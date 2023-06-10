#Escreva a sequência 0x12345678 em $t1. A seguir, escreva um código
#que inverta a sequência, escrevendo 0x87654321 em $t2. Obviamente o
#código deve inverter os bits de $t1 e não simplesmente
#escrever 0x87654321 diretamente em $t2

ori $t1, $zero, 0x1234
sll $t1, $t1, 16
ori $t1, $t1, 0x5678

or $t2, $t2, $t1 # copia 12345678 em t2
sll $t2, $t2, 28 # 0x80000000

or $t3, $zero, $t1 
srl $t3, $t3, 4
sll $t3, $t3, 28
srl $t3, $t3, 4 # 0x07000000
or $t2, $t2, $t3 # manda para t2

or $t3, $zero, $t1
srl $t3, $t3, 8
sll $t3, $t3, 28
srl $t3, $t3, 8
or $t2, $t2, $t3

or $t3, $zero, $t1
srl $t3, $t3, 12
sll $t3, $t3, 28
srl $t3, $t3, 12
or $t2, $t2, $t3

or $t3, $zero, $t1
srl $t3, $t3, 16
sll $t3, $t3, 28
srl $t3, $t3, 16
or $t2, $t2, $t3

or $t3, $zero, $t1
srl $t3, $t3, 20
sll $t3, $t3, 28
srl $t3, $t3, 20
or $t2, $t2, $t3

or $t3, $zero, $t1
srl $t3, $t3, 24
sll $t3, $t3, 28
srl $t3, $t3, 24
or $t2, $t2, $t3

or $t3, $zero, $t1
srl $t3, $t3, 28
or $t2, $t2, $t3

or $t3, $zero, $zero