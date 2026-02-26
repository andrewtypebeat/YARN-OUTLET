extends Area2D
class_name EnemyTest

@export var enemySpeed = 1
@export var enemyHealth = 1
@onready var lifeTime = $lifeTimer
func _ready():
	lifeTime.start()
	
func _process(delta):
	position.x -= enemySpeed
	if enemyHealth <= 0:
		queue_free()

func _on_timer_timeout():
	queue_free()

func _on_area_entered(area):
	if area is bullet:
		enemyHealth = enemyHealth - 1
	if area is PlayerObject:
		queue_free()
