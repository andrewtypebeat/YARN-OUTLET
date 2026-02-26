extends Area2D
class_name bullet

@onready var freeTimer = $Timer
@export var bulDamage = 1

func _ready():
	freeTimer.start()

func _process(delta):
	position.x += 10
	
func _on_timer_timeout():
	queue_free()
func _on_area_entered(area):
	queue_free()
