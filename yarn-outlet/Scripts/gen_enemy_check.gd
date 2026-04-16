extends Area2D

@export var enemy_scene: PackedScene
@export var enemy_count: int = 3
@export var one_shot: bool = true
@export var level_node: NodePath 
@export var spawn_delay: float = 0.5
var player_y

var has_triggered := false

func _ready():
	has_triggered = false
	connect("area_entered", _on_area_entered)

func _on_area_entered(area: PlayerObject):
	if has_triggered and one_shot:
		return

	if area is PlayerObject:
		player_y = area.global_position.y
		spawn_enemies()
		has_triggered = true


func spawn_enemies():
	var level = get_node(level_node)
	
	for i in range(enemy_count):
		print("enemy has spawned")
		var enemy = enemy_scene.instantiate()
		enemy.position = Vector2(
			320, 
			player_y + randf_range(-30, 30)
			)
		level.add_child(enemy)
		await get_tree().create_timer(spawn_delay).timeout
