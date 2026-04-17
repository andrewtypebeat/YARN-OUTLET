extends Node2D  # or whatever your root node is

@onready var anim = $AnimationPlayer
@onready var explode_sfx = $explode

func _ready():
	anim.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name: String):
	queue_free()
	
