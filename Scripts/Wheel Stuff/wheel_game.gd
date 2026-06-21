extends Node2D

@export_range(-2,2,0.01) var arm_speed: float
@export_range(-2,2,0.01) var big_spin_speed: float
@onready var Wheel = $BigSpin/Wheel
@onready var Arm = $BigSpin/Arm
@onready var BigSpin = $BigSpin
var current_segment: int = 0

func get_current_segement() -> int:
	return int(fposmod(Arm.rotation_degrees, 360.0) / (360.0 / Wheel.segments.size()))

func get_current_segement_color() -> Color:
	return Wheel.segments[get_current_segement()]

func _process(delta: float) -> void:
	Arm.rotate((arm_speed - big_spin_speed) * delta)
	BigSpin.rotate(big_spin_speed * delta)
	
	current_segment = get_current_segement()
	
	#if Input.is_action_just_pressed("ui_accept"):
		#if Wheel.segments[current_segment] != Color.WHITE:
			#var tempColor = Wheel.segments[current_segment]
			#var tempSegments = [current_segment]
			#var segmentCount = Wheel.segments.size()
			#
			#var i = (current_segment - 1 + segmentCount) % segmentCount
			#while i != current_segment and Wheel.segments[i] == tempColor:
				#tempSegments.append(i)
				#i = (i - 1 + segmentCount) % segmentCount
			#
			#i = (current_segment + 1) % segmentCount
			#while i != current_segment and Wheel.segments[i] == tempColor:
				#tempSegments.append(i)
				#i = (i + 1) % segmentCount
			#
			#for k in tempSegments:
				#Wheel.segments[k] = Color.WHITE
			#Wheel.queue_redraw()
			#await get_tree().create_timer(0.2).timeout
			#for k in tempSegments:
				#Wheel.segments[k] = tempColor
			#Wheel.queue_redraw()
