extends Node2D

@export var player_stats: PlayerStats
@export var enemy_type: EnemyType
var enemy: Enemy

func _ready() -> void:
	enemy = Enemy.new(enemy_type)
	print("HP:")
	print(enemy.health)
	print("ATT:")
	print(enemy.attack)
	print("SPD:")
	print(enemy.speed)
