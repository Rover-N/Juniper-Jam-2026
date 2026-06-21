class_name EnemyType
extends Resource

@export var health_range: Vector2i
@export var attack_range: Vector2i
@export var speed_range: Vector2i

func _init(default_health_range: Vector2i = Vector2i(1,3), default_attack_range: Vector2i = Vector2i(1,2), default_speed_range: Vector2i = Vector2i(1,1)) -> void:
		health_range = default_health_range
		attack_range = default_attack_range
		speed_range = default_speed_range
