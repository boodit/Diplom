extends Node3D

@export var inverse :bool = false
var pref
var startPos

func _ready():
	startPos = position
	if inverse:
		pref = -1
	else:
		pref = 1
	
func _process(delta):
	if InputEventKey:
		var positionNew =Input.get_vector("Left","Right","Up","Down")
		var wheelPos = 0
		if Input.is_action_just_released("close") and !Input.is_action_pressed("ctrl"):
			wheelPos = 1
		elif Input.is_action_just_released("far") and !Input.is_action_pressed("ctrl"):
			wheelPos = -1
		position += -Vector3(positionNew.x/4,wheelPos,positionNew.y/4)*pref
		

func _input(event):
	pass

func set_start_pos():
	position = startPos
