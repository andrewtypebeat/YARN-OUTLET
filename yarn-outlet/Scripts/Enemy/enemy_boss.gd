extends EnemyObject

@onready var hitAnim = $AnimationPlayer

@onready var stopTimer1 = $stop/stopTimer
@onready var stopTimer2 = $stop/stopTimer2

@onready var stompTimer1 = $stomp/stompTimer1

@onready var PlayerObj = $"../PlayerMain"

var stop_ = false
var delay_ = 0.6

var back_ = false

func _ready():
	pass
	
func _process(delta):
	if stop_ == false:
		if back_ == true:
			position.x += enemySpeed
			await get_tree().create_timer(0.9).timeout
			back_ = false
			stop_ = true
			stopTimer1.start()
			
		else:
			position.x -= enemySpeed
	else:
		position.y = move_toward(position.y, gameObj.player_y, (enemySpeed * 20) * delta)
	
	if enemyHealth <= 0:
		gameObj.levelWin = true
		var explode = explode_fx.instantiate()
		explode.position = position
		get_parent().add_child(explode)
		queue_free()


func _on_area_entered(area):
	if area is bullet:
		gameObj.scoreT += 50
		hitAnim.play("hit")
		enemyHealth = enemyHealth - 1
	if area is PlayerObject:
		PlayerObj.playerHP = 0


func _on_stop_timer_timeout():
	stop_ = true
	await get_tree().create_timer(delay_).timeout
	stompTimer1.start()
	


func stomp_timeout():
	stop_ = false
	stopTimer2.start()


func _on_stop_timer_2_timeout():
	await get_tree().create_timer(delay_).timeout
	back_ = true
	
