extends RichTextLabel
@onready var playerObject = $"../../PlayerMain"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
 	
	match playerObject.playerState:
		1:
			text = "1"
		2:
			text = "2"
	
