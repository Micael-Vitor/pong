extends Area2D


#Movimento
var velocidadeDaBola : int = 500
var posicaoInicial : Vector2 = Vector2(640, 360)
var direcaoInicial : Vector2 = Vector2(0, 0)
var novaDirecao : Vector2 = Vector2(0, 0)

#Limites
var x_minimo : float = 0
var x_maximo : float = 1280
var y_minimo : float = 0
var y_maximo : float = 720

#Efeitos sonoros
@onready var somImpactoBarreira : AudioStreamPlayer = $SomImpactoBarreira
@onready var impactoJogador : AudioStreamPlayer = $SomImpactorJogador

#Timer
@onready var timer : Timer = $Timer


func _ready():
	rodarTimer()


func _process(delta):
	movimentarBola(delta)
	colidirComAsParedes()


func rodarTimer()-> void:
	timer.start()


func resetarBola()-> void:
	#Centraliza a bola e a manda para uma direção aleatoria
	position = posicaoInicial
	escolherDirecaoInicial()


func escolherDirecaoInicial()-> void:
	#Escolhe as direções horizontal e vertical
	var x_aleatorio = [-1, 1].pick_random()
	var y_aleatorio = [-1, 1].pick_random()
	
	#Aplica as novas direções
	direcaoInicial = Vector2(x_aleatorio, y_aleatorio)
	novaDirecao = direcaoInicial


func movimentarBola(delta: float)-> void:
	#Movimenta a bola
	position += novaDirecao * velocidadeDaBola * delta
	
	
func colidirComAsParedes()-> void:
	#Manda a bola na direção contraria ao tentar sair da tela
	if position.y >= y_maximo or position.y <= y_minimo:
		
		if position.x >= x_minimo and position.x <= x_maximo:
			novaDirecao.y *= -1 
			somImpactoBarreira.play()


func _on_body_entered(body):
	#Manda a bola na direção contraria ao colidir com o jogador
	if body.is_in_group("jogador1") or  body.is_in_group("jogador2"):
		novaDirecao.x *= -1
		impactoJogador.play()
		


func _on_timer_timeout():
	resetarBola()
