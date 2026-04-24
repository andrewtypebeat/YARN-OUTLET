extends Node2D  

@onready var anim = $AnimationPlayer
@onready var explode_sfx = $explode

func _ready():
	anim.animation_finished.connect(_on_animation_finished)
	play_sound()

func _on_animation_finished(anim_name: String):
	queue_free()
	
func play_sound():
	explode_sfx.pitch_scale = randf_range(0.9, 1.1) 
	explode_sfx.play()
