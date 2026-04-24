extends Node2D
@onready var timer_ = $"../enemyTimer"
@onready var levelObject = $"../LevelObj"
@onready var PlayerObj = $"../PlayerMain"
@onready var HPtext = $TextureRect/HPlabel

@onready var pauseanim = $AnimationPlayer

@onready var scoreText = $SCORElabel
@onready var scoreText2 = $SCORElabelWIN

@export var respawn_delay: float = 2.5

var player_y
var player_x

var playerHP
var scoreT = 0

var playerDead = false

var loop_ = 3

var levelWin = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().paused == false:
		levelObject.position.x -= 1.5
	else:
		pass
	scoreText.text = "SCORE: " + str(scoreT)
	scoreText2.text = "TOTAL SCORE: " + str(scoreT)
	
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == false:
			pauseanim.play("paused")
			get_tree().paused = true
		else: if get_tree().paused == true:
			pauseanim.play("unpaused")
			get_tree().paused = false
	
	if get_tree().paused == true && levelWin == false:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().paused = false
			get_tree().change_scene_to_file("res://Scenes/World/THE_OUTLET/Outlet_Main.tscn")
		
	if levelWin == true:
		pass # LEVEL FINISH HERE
		
	if PlayerObj:
		playerDead = false
		player_y = PlayerObj.position.y
		player_x = PlayerObj.position.x
		playerHP = PlayerObj.playerHP
		HPtext.text = str(playerHP)
		
	else:
		playerDead = true
		await get_tree().create_timer(respawn_delay).timeout
		if get_tree().paused == false:
			get_tree().reload_current_scene()
		else:
			pass
			
	if levelWin == true:
		get_tree().paused = true
		pauseanim.play("win")
		await get_tree().create_timer(2).timeout
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Scenes/World/THE_OUTLET/Outlet_Main.tscn")
