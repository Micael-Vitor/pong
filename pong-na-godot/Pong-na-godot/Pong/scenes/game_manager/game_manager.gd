extends Node2D


#bola
@onready var bola : Area2D = $"../Bola"

#Efeitos sonoros
@onready var impactoGol : AudioStreamPlayer = $somImpactoGol

#potuação
var pontuacaoJogador1 : int = 0
var pontuacaoJogador2 : int =  0

#UI
@onready var textoPontuacao1 : Label = $"../UI/PainelDePontuacao/TextoPotuacaoJogador1"
@onready var textoPontuacao2 : Label = $"../UI/PainelDePontuacao/TextoPotuacaoJogador2"


func _process(delta):
	receberInputs()


func receberInputs() ->void:
	#reinicia a partida
	if Input.is_action_just_pressed("reiniciar"):
		get_tree().reload_current_scene()
		
	# Sai do jogo
	if Input.is_action_just_pressed("sair"):
		get_tree().quit()


func _on_gol_1_area_entered(area):
	#chamado quando jogador 2 marca um gol
	
	impactoGol.play()
	pontuacaoJogador2 += 1
	textoPontuacao2.text = str(pontuacaoJogador2)
	bola.rodarTimer()


func _on_gol_2_area_entered(area):
	#chamado quando jogador 1 marca um gol
	
	impactoGol.play()
	pontuacaoJogador1 += 1
	textoPontuacao1.text = str(pontuacaoJogador1)
	bola.rodarTimer()
