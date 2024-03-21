extends StaticBody2D


#Parametros
@export var jogador1 : bool

#Movimento
var velocidadeDoJogador : int = 500

#Limites
var y_minimo : float = 64
var y_maximo : float = 654


func _process(delta):
	movimentarJogador(delta)
	limitarMovimentoDoJogador()
	
	
func movimentarJogador(delta : float)-> void:
	# Movimento do jogador 1
	if jogador1:
		if Input.is_action_pressed("mv_cima1"):
			position.y -= velocidadeDoJogador * delta 
		elif Input.is_action_pressed("mv_baixo1"):
			position.y += velocidadeDoJogador * delta
	
	
	#Impede que o jogador saia da tela
func limitarMovimentoDoJogador()-> void:
	position.y = clamp(position.y, y_minimo, y_maximo)

