extends Node2D
@onready var timer_ = $"../enemyTimer"
@onready var levelObject = $"../LevelObj"
@onready var PlayerObj = $"../PlayerMain"


@export var respawn_delay: float = 2.5

var player_y
var playerDead = false

var loop_ = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	levelObject.position.x -= 2
	
	if PlayerObj:
		playerDead = false
		player_y = PlayerObj.position.y
		
	else:
		playerDead = true
		await get_tree().create_timer(respawn_delay).timeout
		get_tree().reload_current_scene()
	

	
