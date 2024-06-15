extends Node3D

func _on_area_3d_body_entered(body):
	if body and body.has_method("die"):
		body.die()

