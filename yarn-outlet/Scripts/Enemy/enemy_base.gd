extends Area2D
class_name EnemyObject

@export var enemySpeed = 5
@export var enemyHealth = 1

@onready var gameObj = $"../GameObject"

@onready var explode_fx = preload("res://Scenes/Objects/Enemy/explosion_sc.tscn")


func _process(delta):
	pass
