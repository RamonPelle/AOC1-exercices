.data
#array
	arr: .space 20 #reserva 5 words para o array
	arrSize: .word 5 #num of words
#textos
	vitoria: .asciiz "Parabéns! Você venceu :)\n\n"
	derrota: .asciiz "Ops, infelizmente você perdeu :(\n\n"
	fim: .asciiz "Obrigado por jogar nosso jogo. Até a próxima :D\n"
	sobretxt: .asciiz "O sistema irá apresentar números randômicos no console. Você terá 5s para responder na ordem em que eles aparecerem, em uma janela pop-up.\nJogo desenvolvido por: Ana Carolina, Rafael e Ramon.\n\n"
	partida: .asciiz "Nova partida iniciada. Leia os números, e entre um por vez na nova tela que será aberta. Boa sorte :D"

	inicio: .asciiz "Bem vindo ao jogo, escolha alguma das opções: \n"
	menu1: .asciiz "1 - Iniciar novo jogo\n"
	menu2: .asciiz "2 - Sobre\n"
	menu3: .asciiz "3 - Sair\n"
	menu4: .asciiz "4 - Limpar a tela\n"
	#adicionar uma opcao para ver pontuacao, se formos calcular isso.
	teste: .asciiz "Insira os números na ordem correta apertando Enter entre eles. Caso digite algum número errado, você perde!"
	nl: .ascii "\n"

.text

main: 	
	jal clr
	la $a0, inicio #mensagem inicial
	li $v0, 4
	syscall
	
	lw $s0, arrSize #rodadas
	li $s1, 1000 #tempo em ms
	li $s2, 0 #rodada atual
	loopMenu:
		jal imprimeMenu
		jal lerDado

		beq $s7, 4, clr
		beq $s7, 3, encerrar
		beq $s7, 2, sobre
		beq $s7, 1, iniciar
		
		j loopMenu #sempre vai cair nesse j	

imprimeMenu:
	la, $a0, menu1 
	li $v0, 4
	syscall
	la $a0, menu2
	li $v0, 4
	syscall
	la $a0, menu3
	li $v0, 4
	syscall
	la $a0, menu4
	li $v0, 4
	syscall
	jr $ra

lerDado: #int
	li $v0, 5
	syscall
	move $s7, $v0
	jr $ra
	
iniciar:
	addiu $sp,$sp,-4 #pilha, pois essa funcao chama outra
	sw $ra,($sp) 

	la $a0, partida 
	li $v0, 4
	syscall
	
	la $a0, nl
	li $v0, 4
	syscall
	
	jal gerarVetor
	li $t2, 0 #contadorGame
	li $t3, 0 #contadorQuestions
	loopGame:
		addi $t2, $t2, 1 #i++
		move $t3, $t2
		la $t4, arr #pos inicial array
		la $t1, arr #para usar no input Box
		add $t6, $t2, $zero #for numero de input boxes
		
		loopQuestions:
			subi $t3, $t3, 1 #decrementa 1 questao
			lw $t5, 0($t4) #valor no array
			addi $t4, $t4, 4 #posicao++
			li $v0, 1 #printa int
			add $a0, $zero, $t5 #valor do array para ser printado
			syscall

			li $v0, 4 
			la, $a0, nl
			syscall 
			bne $t3, $zero, loopQuestions
			
			move $a0, $s1 #sleep
			li $v0, 32
			syscall
			jal clr
			
			
			
		loopInput:	
			#abrirá uma caixa de input para cada numero do array que aparecer
			la $a0, teste #mudar a frase teste
			li $v0, 51 #input box
			syscall
			move $t7, $a0
			lw $t5, 0($t1) #pega valor do array
			bne $t5, $t7, perdeu #compara se valores são iguais
			addi $t1, $t1, 4 #prox endereço
			subi $t6, $t6, 1 #decrementa for
			bne $t6, $zero, loopInput		
			
		move $a0, $s1 #sleep
		li $v0, 32
		syscall
		jal clr
		bne $t2, $s0, loopGame 
		
	li $s7, 0 #evitar loop
	lw $ra, ($sp) #pilha
	addiu $sp, $sp, 4
	j ganhou
	
perdeu:	jal clr
	la $a0, derrota
	li $v0, 4
	syscall
	j loopMenu
	
ganhou:	jal clr
	la $a0, vitoria
	li $v0, 4
	syscall
	j loopMenu

sobre: 
	la $a0, sobretxt 
	li $v0, 4
	syscall
	
	li $s7, 0 #evitar loop
	jr $ra
clr:
	la $a0, nl
	li $v0, 4
	syscall
	addi $t0, $t0, 1
	
	bne $t0, 20, clr
	li $t0, 0
	li $s7, 0 #evitar loop
	jr $ra
	
gerarVetor:	
	li $a0, 1 #min - max random
	li $a1, 100 
	lw $t2, arrSize 
	la $t1, arr
	li $v0, 42
	loopArr:
		syscall #random = $a0
		sw $a0, 0($t1)#posicao i do vetor
		subi $t2, $t2, 1 #decrementa o contador
		addi $t1, $t1, 4 #posicao++
		bne $t2, $zero, loopArr	
	jr $ra 
	
encerrar: 
	la $a0, fim 
	li $v0, 4
	syscall
	nop
	nop
