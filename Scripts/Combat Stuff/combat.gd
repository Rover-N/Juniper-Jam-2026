extends Node2D

@export var player_stats: PlayerStats
@export var enemy_type: EnemyType
@export var encounter_table: EncounterTable
var enemies: Array[Enemy]

func add_enemy():
	var n = 0
	var table_winner: EnemyType
	var threshold = randi_range(0, encounter_table.total_weight)
	for encounter in encounter_table.table:
		while threshold > n:
			n += encounter_table.table[encounter]
		table_winner = encounter
	enemies.append(Enemy.new(table_winner))

func _ready() -> void:
	add_enemy()
	print(enemies[0].attack)
