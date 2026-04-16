extends Area2D
@export var enemySpawn = preload("res://Scenes/Objects/Enemy/test_enemy.tscn")
@export var levelCur = preload("res://Scenes/World/LEVEL_1.tscn")
@export var loop_ : int = 0
@export var y_pos = 0
@onready var timer_ = $Timer
var canSpawn = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_area_entered(PlayerObject):
	if canSpawn == true:
		for i in range(loop_):
			var cur_enemy = enemySpawn.instantiate()
			cur_enemy.position = Vector2(340, y_pos)
			get_parent().add_child(cur_enemy)
	canSpawn = false
	timer_.start()
	
	#var cur_enemy = enemyDebug.instantiate()
	#var random_y = randi_range(30,200)
	#cur_enemy.position = Vector2(340, random_y)
	#add_child(cur_enemy)
	#timer_.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	canSpawn = true
