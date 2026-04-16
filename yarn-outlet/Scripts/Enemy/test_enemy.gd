extends Area2D
class_name EnemyObject

@export var enemySpeed = 5
@export var enemyHealth = 1
@onready var lifeTime = $lifeTimer
@onready var homeTime = $HomeTimer
@onready var gameObj = $"../GameObject"

@onready var explode_fx = preload("res://Scenes/Objects/Enemy/explosion_sc.tscn")

var homeReal = false

func _ready():
	lifeTime.start()
	homeTime.start()
	
func _process(delta):
	position.x -= enemySpeed
	if homeReal == true:
		
		position.y = move_toward(position.y, gameObj.player_y, (enemySpeed * 8) * delta)
	
	if enemyHealth <= 0:
		
		var explode = explode_fx.instantiate()
		explode.position = position
		get_parent().add_child(explode)
		queue_free()
		

func _on_timer_timeout():
	queue_free()

func _on_area_entered(area):
	if area is bullet:
		enemyHealth = enemyHealth - 1
	if area is PlayerObject:
		enemyHealth = 0
	if area is LevelHazard:
		enemyHealth = 0


func _on_home_timer_timeout():
	homeReal = true
