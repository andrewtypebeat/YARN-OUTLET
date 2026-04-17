extends Area2D
class_name bullet

@onready var freeTimer = $Timer
@onready var explode_fx = preload("res://Scenes/Objects/Enemy/explosion_bullet.tscn")

@export var bulDamage = 1

func _ready():
	freeTimer.start()

func _process(delta):
	position.x += 10
	
func _on_timer_timeout():
	queue_free()
func _on_area_entered(area):
	var explode = explode_fx.instantiate()
	explode.position = position
	get_parent().add_child(explode)
	queue_free()
