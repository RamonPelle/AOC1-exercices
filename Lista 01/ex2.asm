#Escreva 0xAAAAAAAA em $t1. Faça um shift de um bit para a direita
#desse valor e coloque o resultado em $t2, deixando $t1 inalterado. Em
#$t3, $t4 e $t5 coloque os resultados das operações or, and e xor entre
#$t1 e $t2, respectivamente. Em comentários no final do código, explique
#os resultados obtidos, mostrando os valores binários.

or  $t1,$t1,$t6 #salva a
sll $t1,$t1,4
or  $t1,$t1,$t6 #Salva a
sll $t1,$t1,4
or  $t1,$t1,$t6 #salva a
sll $t1,$t1,4
or  $t1,$t1,$t6 #salva a
sll $t1,$t1,4
or  $t1,$t1,$t6 #salva a
sll $t1,$t1,4
or  $t1,$t1,$t6 #salva a
sll $t1,$t1,4
or  $t1,$t1,$t6 #salva a
sll $t1,$t1,4
or  $t1,$t1,$t6 #salva a

srl $t1,$t1,1 #shift 1 bit para direita
or $t2, $t2, $t1
or $t3, $t2, $t1
and $t4, $t2, $t1
xor $t5, $t2, $t1
