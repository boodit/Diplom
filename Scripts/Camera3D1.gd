extends Camera3D


var mouse = Vector2()


func _input(event):
	if event is InputEventMouse:
		mouse = event.position
	if event is InputEventMouseButton and event.is_pressed():
		if event.is_action_pressed("LCM"):
			get_selection()

func get_selection():
	var worldspace = get_world_3d().direct_space_state
	var start = project_ray_origin(mouse)
	var end = project_position(mouse,1000)
	var qe = PhysicsRayQueryParameters3D.create(start,end)
	var result = worldspace.intersect_ray(qe)
	#if result and result.collider.has_method("interact"):
		#result.collider.interact()
	if result and result.collider.has_node("pickNode"):
		result.collider.get_node("pickNode").interact()

