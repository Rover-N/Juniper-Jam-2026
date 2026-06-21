@tool
extends Node2D

@export var data: WheelContents

@export var radius: float = 20.0:
	set(value):
		radius = value
		queue_redraw()

@export var segments: Array[Color]:
	set(value):
		segments = value
		queue_redraw()

@export var width: float = 5:
	set(value):
		width = value
		queue_redraw()

func _ready() -> void:
	radius = data.radius
	segments = data.segments
	width = data.width
	queue_redraw()
	#self.position = Vector2(radius + width / 2 + 32, radius + width / 2 + 32)


func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, Color.LIGHT_GRAY)
	
	for i in range(segments.size()):
		draw_arc(
			Vector2.ZERO,
			radius,
		 	deg_to_rad(360.0 / segments.size() * i),
			deg_to_rad(360.0 / segments.size() * (i + 1)),
			20,
			segments[i],
			width) 
