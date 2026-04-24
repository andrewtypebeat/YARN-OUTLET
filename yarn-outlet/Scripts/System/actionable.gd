extends Area2D

@export var dialogue_resource : DialogueResource
@export var dialogue_start : String = "start"

@onready var playerObj = "res://Scenes/Objects/Player/player_walk.tscn"

func action() -> void:
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
	


func _on_area_2d_area_entered(area):
	pass # Replace with function body.
