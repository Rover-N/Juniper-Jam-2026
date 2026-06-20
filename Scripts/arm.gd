extends Node2D

@export var Wheel: Node2D
@export var width: float = 5

func _ready() -> void:
	self.position = Wheel.position
	var offset = Wheel.radius + Wheel.width / 2
	$Polygon2D.polygon = PackedVector2Array([Vector2.ZERO, Vector2(offset, -width), Vector2(offset, width)])
