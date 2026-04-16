extends Node2D
@onready var enemyDebug = preload("res://Scenes/Objects/Enemy/test_enemy.tscn")
@onready var timer_ = $"../enemyTimer"
@onready var levelObject = $"../LevelObj"
@onready var PlayerObj = $"../PlayerMain"

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
	

	
