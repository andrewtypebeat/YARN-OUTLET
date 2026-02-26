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
@export var playerHP = 100

@onready var bulType = preload("res://Scenes/Objects/player_bullet.tscn")
@onready var bulTimer = $Timer
@onready var bulSound = $bulSound

var screen_size
var pState = playerState.IDLE
var canShoot = true

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO 
	var input_hor = Input.get_axis("ui_left", "ui_right")
	var input_ver = Input.get_axis("ui_up", "ui_down")
	var inp_shoot = Input.is_action_pressed("ui_shoot")
	
	var dash = 1

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
		bulSound.play()
		canShoot = false
		bulTimer.start()

func _on_timer_timeout():
	canShoot = true
