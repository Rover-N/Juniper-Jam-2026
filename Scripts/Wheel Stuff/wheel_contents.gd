class_name WheelContents
extends Resource

@export var radius: float

@export var segments: Array[Color]

@export var width: float

func _init(default_radius = 100.0, default_segments: Array[Color] = [], default_width = 20.0):
	radius = default_radius
	segments = default_segments
	width = default_width
