extends Area2D


var velocidadeDaBola : int = 500
var posicaoInicial : Vector2 = Vector2(640, 360)
var direcaoInicial : Vector2 = Vector2(0, 0)
var novaDirecao : Vector2 = Vector2(0, 0)

var y_minimo : float = 0
var y_maximo : float = 720


func _ready():
	resetarBola()


func _process(delta):
	movimentarBola(delta)
	colidirComAsParedes()
	

func resetarBola()-> void:
	#centraliza a bola e a manda para uma direção aleatoria
	position = posicaoInicial
	escolherDirecaoInicial()


func escolherDirecaoInicial()-> void:
	#escolhe as direções horizontal e vertical
	var x_aleatorio = [-1, 1].pick_random()
	var y_aleatorio = [-1, 1].pick_random()
	
	#aplica as novas direções
	direcaoInicial = Vector2(x_aleatorio, y_aleatorio)
	novaDirecao = direcaoInicial


func movimentarBola(delta: float)-> void:
	position += novaDirecao * velocidadeDaBola * delta
	
	
func colidirComAsParedes()-> void:
	if position.y >= y_maximo:
		novaDirecao.y *= -1
	elif position.y <= y_minimo:
		novaDirecao.y *= 1
