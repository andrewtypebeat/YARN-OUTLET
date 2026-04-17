extends EnemyObject

@onready var lifeTime = $lifeTimer
@onready var hitAnim = $AnimationPlayer
@onready var moveAgainTimer = $moveTimerTwo

var stop_ = false

func _ready():
	pass
	
func _process(delta):
	if stop_ == false:
		position.x -= enemySpeed
	else:
		position.x = position.x
	
	if enemyHealth <= 0:
		
		var explode = explode_fx.instantiate()
		explode.position = position
		get_parent().add_child(explode)
		queue_free()

func _on_area_entered(area):
	if area is bullet:
		hitAnim.play("hit")
		enemyHealth = enemyHealth - 1
	if area is PlayerObject:
		enemyHealth = 0
		
func _on_move_timer_timeout():
	stop_ = true
	$moveTimerTwo.start()


func _on_move_timer_two_timeout():
	stop_ = false
	enemySpeed = 6
