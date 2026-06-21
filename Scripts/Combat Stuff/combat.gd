extends Node2D

@export var player_stats: PlayerStats
@export var enemy_type: EnemyType
@export var encounter_table: EncounterTable
var enemies: Array[Enemy]
var RNG = RandomNumberGenerator.new()

func add_enemy():
	# Thank you kilo_cant_concentrate on the Juniper's Dev Garden discord server :)
	var index = RNG.rand_weighted(encounter_table.table.values())
	enemies.append(Enemy.new(
		encounter_table.table.keys()[index]
	))

func _ready() -> void:
	for i in range(1, 4):
		add_enemy()
	for enemy in enemies:
		print(enemy.name)
