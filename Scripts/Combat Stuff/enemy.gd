class_name Enemy
extends RefCounted

var name: String
var health: int
var attack: int
var speed: int

func _init(enemy_type: EnemyType) -> void:
	name = enemy_type.enemy_name
	health = randi_range(enemy_type.health_range.x, enemy_type.health_range.y)
	attack = randi_range(enemy_type.attack_range.x, enemy_type.attack_range.y)
	speed = randi_range(enemy_type.speed_range.x, enemy_type.speed_range.y)
