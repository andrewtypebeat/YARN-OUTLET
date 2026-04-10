extends Node2D
@onready var enemyDebug = preload("res://Scenes/Objects/Enemy/test_enemy.tscn")

var loop_ = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_enemy_timer_timeout():
	var cur_enemy = enemyDebug.instantiate()
	var random_y = randi_range(30,200)
	cur_enemy.position = Vector2(340, random_y)
	add_child(cur_enemy)

#AAHHH YA SE COMO EN PROCESS HAY UN MATCH PARA UNA VARIABLE DE SPAWN Y A LO
#LARGO DEL NIVEL HAY NODOS AREA2D QUE ACTIVAN ESAS SEÑALES Y LAS DESACTIVAN INMEDIATAMENTE DESPUES
