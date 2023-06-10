# 6. Escreva um programa que calcule o número de bits significativos de um número
# inteiro positivo. Inicie o programa com a instrução ori $t1, $0, x, substituindo x pelo
# valor desejado. Armazene o resultado final no registrador $t2.
# Identificar o n?mero de bits significativos de um 
# n?mero inteiro positivo. 
# Armazene o resultado final no registrador $t2.

ori $t1, $zero, 1 ## t1 tem o nro de entrada

lui $t2, 0x8000  ## t2 = 0x80000000 
  ### usada para detectar o primeiro bit n?o zero no n?mero.
  ### 80000000 (hexa) = 1000 0000 .... 0000 0000 (bin)

addi $t4, $zero, -1  ### contador de zeros
  ### t4 come?a em -1 para que o primeiro zero de sinal 
  ### seja considerado entre os significativos

volta:
  and $t3, $t1, $t2  
     ### and entre o n?mero atual e a m?scara
     ### s? vai dar um quando o primeiro bit um do 
     ### n?mero de entrada chegar at? ao bit mais 
     ### significativo em t1.
  bne $t3, $zero, fim 
     ### enquanto for t3 = 0 segue a contagem
  sll $t1, $t1, 1
     ### desloca o n?mero de entrada um bit para a 
     ### esquerda, para testar o pr?ximo bit.
  addi $t4, $t4, 1
     ### incrementa o contador de zeros
  j volta
  
fim:
  addi $t5, $zero, 32
    ### t5 = 32
  sub $t5, $t5, $t4
    ### subtrai o n?mero de zeros n?o significativos 
    ### do total de bits (32), indicando o n?mero 
    ### de bits significativos