extends Node2D

@export var arm_width: float = 5
@export var wheel_width: float
@export var wheel_radius: float

func _ready() -> void:
	var offset = wheel_radius + wheel_width / 2
	var polygon: Polygon2D = Polygon2D.new()
	polygon.polygon = PackedVector2Array([Vector2.ZERO, Vector2(offset, -arm_width), Vector2(offset, arm_width)])
	self.add_child(polygon)
