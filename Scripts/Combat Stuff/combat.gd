extends Node2D

@export var player_stats: PlayerStats
@export var enemy_type: EnemyType
@export var encounter_table: EncounterTable
@export var enemy_sprite_container: NodePath
@export var enemy_label: Label
@export var enemies_hp: ProgressBar

var enemies: Array[Enemy]
var enemies_sprites: Array[NodePath]
var RNG = RandomNumberGenerator.new()
var total_enemy_health: int = 0

func add_enemy():
	# Thank you kilo_cant_concentrate on the Juniper's Dev Garden discord server :)
	var index = RNG.rand_weighted(encounter_table.table.values())
	var selected_enemy = encounter_table.table.keys()[index]
	enemies.append(Enemy.new(
		selected_enemy
	))
	add_enemy_sprite(enemies[enemies.size() - 1])

func add_enemy_sprite(enemy: Enemy):
	var enemy_sprite: TextureRect = TextureRect.new()
	enemy_sprite.texture = enemy.type.animation_atlas
	enemy_sprite.expand_mode = TextureRect.EXPAND_FIT_WIDTH
	enemy_sprite.flip_h = true
	get_node(enemy_sprite_container).add_child(enemy_sprite)

func _ready() -> void:
	for i in range(0, 3): # Add enemies to the battle
		add_enemy()
	
	for enemy in enemies:
		print(enemy.name)
		print(enemy.health)
		total_enemy_health += enemy.health
	
	enemy_label.text = "Enemies " + str(total_enemy_health) + "/" + str(total_enemy_health)
	enemies_hp.max_value = total_enemy_health
	enemies_hp.value = total_enemy_health
