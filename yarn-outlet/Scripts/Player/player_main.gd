extends StaticBody2D

@export var playerSpeed = 200 

var screen_size

enum playerState {
	#SHIP MODE
	IDLE,
	MOVE,
	SHOOT,
	INTERACT,
	DEATH,
	#WALK MODE
	WMIDLE,
	WMMOVE,
	WMJUMP,
	WMINTERACT
}

enum playerMode {
	SHIP,
	WALK
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	var input_hor = Input.get_axis("ui_left", "ui_right")
	var input_ver = Input.get_axis("ui_up", "ui_down")
	
	velocity.x += input_hor
	velocity.y += input_ver
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * playerSpeed
		playerState.MOVE
	else:
		playerState.IDLE
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
