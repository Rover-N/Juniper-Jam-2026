class_name EncounterTable
extends Resource

@export var table: Dictionary[EnemyType, int]
var total_weight: int = table.values().reduce(func(accum: int, num: int): return accum + num, 0)
# Thanks stephane03 on the Juniper's Dev Garden discord server :)

func _init(default_table: Dictionary[EnemyType, int] = {}, default_total_weight: int = 0) -> void:
	table = default_table
	total_weight = default_total_weight
