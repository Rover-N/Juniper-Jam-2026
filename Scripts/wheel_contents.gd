class_name WheelContents
extends Resource

@export var radius: float

@export var segments: Array[Color]

@export var width: float

func _init(def_radius = 100.0, def_segments: Array[Color] = [], def_width = 20.0):
	radius = def_radius
	segments = def_segments
	width = def_width
