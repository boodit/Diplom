extends Node3D
@export var cam1 : Camera3D
@export var cam2 : Camera3D

func _input(event):
	if event.is_action_released("camSwitch"):
		if cam1.current:
			cam2.make_current()
			cam2.get_parent().set_start_pos()
		else :
			cam1.make_current()
			cam1.get_parent().set_start_pos()
