extends StaticBody2D


@export var jogador1 : bool
var velocidadeDoJogador : int = 500


func _ready():
	pass


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
	position.y = clamp(position.y, 64, 654)

