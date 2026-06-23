class_name WheelData
extends Resource

@export var wheel_spin: float

@export var arm_spin: float

@export var radius: float

@export var segments: Array[Color]

@export var width: float

func _init(default_wheel_spin: float = 0.0, default_arm_spin: float = 0.0, default_radius: float = 0.0, default_segments: Array[Color] = [], default_width = 0.0):
	wheel_spin = default_wheel_spin
	arm_spin = default_arm_spin
	radius = default_radius
	segments = default_segments
	width = default_width
