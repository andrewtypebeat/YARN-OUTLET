extends EnemyObject

@onready var lifeTime = $lifeTimer
@onready var homeTime = $HomeTimer

var homeReal = false

func _ready():
	lifeTime.start()
	homeTime.start()
	
func _process(delta):
	position.x -= enemySpeed
	if homeReal == true:
		
		position.y = move_toward(position.y, gameObj.player_y, (enemySpeed * 15) * delta)
	
	if enemyHealth <= 0:
		
		
		
		var explode = explode_fx.instantiate()
		explode.position = position
		get_parent().add_child(explode)
		queue_free()

func _on_area_entered(area):
	if area is bullet:
		enemyHealth = enemyHealth - 1
		gameObj.scoreT += 50
	if area is PlayerObject:
		enemyHealth = 0	
	
func _on_home_timer_timeout():
	homeReal = true


func _on_life_timer_timeout():
	queue_free()
