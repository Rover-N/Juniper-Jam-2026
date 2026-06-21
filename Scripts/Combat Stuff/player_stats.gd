class_name PlayerStats
extends Resource

@export var health: int

@export var attack: int

@export var speed: int

func _init(default_health: int = 5, default_attack: int = 1, default_speed = 1):
	health = default_health
	attack = default_attack
	speed = default_speed
