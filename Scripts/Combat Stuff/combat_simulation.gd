class_name CombatSimulation
extends RefCounted

var player_stats: PlayerStats
var enemy_array: Array[Enemy]

func _init(p_player_stats: PlayerStats, p_enemy_array: Array[Enemy]) -> void:
	player_stats = p_player_stats
	enemy_array = p_enemy_array

func damage_enemy(damage: int, target_index: int) -> int:
	enemy_array[target_index].health -= damage
	return enemy_array[target_index].health

func damage_player(damage: int) -> int:
	player_stats.health -= damage
	return player_stats.health
