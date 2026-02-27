extends Node2D

@export var typeSpeed : float = 60
@export var typeTime : float

@onready var _dialog : RichTextLabel = $text_display


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _display_text(text : String):
	_dialog.text = text
