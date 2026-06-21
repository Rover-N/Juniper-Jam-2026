class_name Enemy
extends RefCounted

var health: int
var attack: int
var speed: int

func _init(enemy_type: EnemyType) -> void:
	health = randi_range(enemy_type.health_range.x, enemy_type.health_range.y)
	attack = randi_range(enemy_type.attack_range.x, enemy_type.attack_range.y)
	speed = randi_range(enemy_type.speed_range.x, enemy_type.speed_range.y)
