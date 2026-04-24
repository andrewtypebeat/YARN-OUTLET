extends Area2D
class_name PlayerObject

enum playerState {
	#SHIP MODE
	IDLE,
	MOVE,
	DASH,
	SHOOT,
	INTERACT,
	DEATH,
	#WALK MODE
	WMIDLE,
	WMMOVE,
	WMJUMP,
	WMINTERACT
}

@export var speed = 150
@export var playerHP = 10

@onready var bulType = preload("res://Scenes/Objects/player_bullet.tscn")
@onready var bulTimer = $Timer
@onready var bulSound = $bulSound
@onready var gameObj = $"../GameObject"

@onready var explode_fx = preload("res://Scenes/Objects/Enemy/explosion_sc.tscn")

var screen_size
var pState = playerState.IDLE
var canShoot = true
var dash = 1

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO 
	var input_hor = Input.get_axis("ui_left", "ui_right")
	var input_ver = Input.get_axis("ui_up", "ui_down")
	var inp_shoot = Input.is_action_pressed("ui_shoot")
	
	$hplabel.text = str(playerHP)

	velocity.x += input_hor
	velocity.y += input_ver
	
	if Input.is_action_pressed("ui_run"):
		dash = 1.5
	else:
		dash = 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * (speed * dash);
		pState = playerState.MOVE
	else:
		pState = playerState.IDLE

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if inp_shoot && canShoot == true:
		var curBullet = bulType.instantiate()
		curBullet.position.y = position.y
		curBullet.position.x = position.x + 10
		get_parent().add_child(curBullet)
		play_sound()
		canShoot = false
		bulTimer.start()
		
	if playerHP <= 0 || gameObj.playerDead == true:
		var explode = explode_fx.instantiate()
		explode.position = position
		get_parent().add_child(explode)
		queue_free()
	

func _on_timer_timeout():
	canShoot = true
	
func play_sound():
	bulSound.pitch_scale = randf_range(0.8, 1.2) # slight variation
	bulSound.play()
	
func _on_area_entered(area):
	if area is EnemyObject:
		playerHP =  playerHP - 1
	if area is LevelHazard:
		playerHP = 0
