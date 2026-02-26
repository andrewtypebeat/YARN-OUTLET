extends Node2D
@onready var enemyDebug = preload("res://Scenes/Objects/Enemy/test_enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_enemy_timer_timeout():
	var en_debug = enemyDebug.instantiate()
	var random_y = randi_range(30,200)
	en_debug.position = Vector2(340, random_y)
	add_child(en_debug)
