extends Node2D
@export var typeSpeed : float = 60
@export var typeTime : float

@onready var _dialog : RichTextLabel = $text_display
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_display_text("me lleva la verga")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _display_text(text : String):
	_dialog.text = text
	_dialog.visible_characters = 0
	typeTime = 0
	while _dialog.visible_characters < _dialog.get_total_character_count():
		typeTime += get_process_delta_time()
		_dialog.visible_characters = typeSpeed * typeTime as int
		await get_tree().process_frame
