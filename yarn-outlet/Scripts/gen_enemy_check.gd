extends Area2D

@export var enemy_scene: PackedScene
@export var enemy_count: int = 3
@export var one_shot: bool = true
@export var level_node: NodePath 
@export var spawn_delay: float = 0.5
@export var spawn_x: float = 340
@export var spawn_y: float = 0
@export var use_player_y: bool

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
		if use_player_y == true:
			enemy.position = Vector2(
				spawn_x, 
				player_y + randf_range(-30, 30)
				)
		else:
			enemy.position = Vector2(
				spawn_x, 
				spawn_y
				)
		
		level.add_child(enemy)
		await get_tree().create_timer(spawn_delay).timeout
