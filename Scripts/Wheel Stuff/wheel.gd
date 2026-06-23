class_name Wheel
extends Node2D

@export var wheel_spin: float

@export var arm_spin: float

@export var radius: float

@export var segments: Array[Color]

@export var width: float

const arm_scene = preload("res://Scenes/arm.tscn")

var arm: Node2D

var arm_script: Variant	= "res://Scripts/Wheel Stuff/arm.gd"

func _ready() -> void:
	arm = arm_scene.instantiate()
	arm.wheel_width = width
	arm.wheel_radius = radius
	self.add_child(arm)

func _draw() -> void:
	for i in range(segments.size()):
		draw_arc(
			Vector2.ZERO,
			radius,
		 	deg_to_rad(360.0 / segments.size() * i),
			deg_to_rad(360.0 / segments.size() * (i + 1)),
			20,
			segments[i],
			width)

func _process(delta: float) -> void:
	rotate(delta * wheel_spin)
	self.get_child(0).rotate(delta * (arm_spin - wheel_spin))
