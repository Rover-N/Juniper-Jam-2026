extends Node2D

@export var player_stats: PlayerStats
@export var player_label: Label
var active_player_wheels: int = 0


@export var encounter_table: EncounterTable
@export var enemy_type: EnemyType
@export var enemy_sprite_container: NodePath
@export var enemy_label: Label
@export var enemies_hp: ProgressBar

var enemies: Array[Enemy]
var enemies_sprites: Array[NodePath]
var RNG = RandomNumberGenerator.new()
var starting_enemy_health: int = 0
var starting_player_health: int = 0

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

func add_player_wheel(wheel_data: WheelData):
	var wheel: Wheel = Wheel.new()
	wheel.arm_spin = wheel_data.arm_spin
	wheel.wheel_spin = wheel_data.wheel_spin
	wheel.radius = wheel_data.radius
	wheel.segments = wheel_data.segments
	wheel.width = wheel_data.width
	active_player_wheels += 1
	wheel.position = Vector2(140.0,500.0)
	self.add_child(wheel)

func _ready() -> void:
	for i in range(0, 3): # Add enemies to the battle
		add_enemy()
	
	for enemy in enemies:
		print(enemy.name)
		print(enemy.health)
		starting_enemy_health += enemy.health
	
	enemy_label.text = "Enemies " + str(starting_enemy_health) + "/" + str(starting_enemy_health)
	enemies_hp.max_value = starting_enemy_health
	enemies_hp.value = starting_enemy_health
	
	starting_player_health = player_stats.health
	player_label.text = "You " + str(player_stats.health) + "/" + str(starting_player_health)
	add_player_wheel(load("res://Resources/WheelData/wheel01.tres"))

#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#if wheel_game.get_current_segement_color() == Color(1.0, 0.0, 0.0, 1.0):
			#damage_enemies()

func damage_enemies():
	enemies[0].health -= player_stats.attack
	var current_total_enemy_health: int = 0
	for enemy in enemies:
		current_total_enemy_health += enemy.health
	enemy_label.text = "Enemies " + str(current_total_enemy_health) + "/" + str(starting_enemy_health)
	enemies_hp.value = current_total_enemy_health
