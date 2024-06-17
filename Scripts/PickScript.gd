extends Node

@export var selfRigidBody : RigidBody3D
@export var UnPickWheelPos = 0.0
var wheelPos = UnPickWheelPos
var pick:bool =false
var coll

func _ready():
	if name != "pickNode":
		name = "pickNode"
	var parent
	parent = get_parent()
	if parent is RigidBody3D:
		selfRigidBody = parent
	selfRigidBody.body_entered.connect(_on_body_entered)
	selfRigidBody.body_exited.connect(_on_body_exited)

func _process(delta):
	if pick:
		look_coursor()
		await get_tree().create_timer(1).timeout
	if Input.is_action_just_released("LCM") and pick:
		interact()
	if Input.is_action_just_released("close") and Input.is_action_pressed("ctrl") :
		wheelPos += 0.1
	elif Input.is_action_just_released("far") and Input.is_action_pressed("ctrl") and coll == null:
		wheelPos -= 0.1

func interact():
	pick=!pick
	if hasSignal(selfRigidBody,"pickedSignal"):
		selfRigidBody.pickedSignal.emit(pick)
	wheelPos = UnPickWheelPos

func look_coursor():
	var viewport = get_viewport()
	var mouse_position = viewport.get_mouse_position()
	var camera = viewport.get_camera_3d()
	var origin = camera.project_ray_origin(mouse_position)
	var direction = camera.project_ray_normal(mouse_position)
	var ray_length = camera.far
	var end = origin + direction * ray_length
	var space_state = selfRigidBody.get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(origin, end,1)
	var result = space_state.intersect_ray(query)
	var mouse_position_3D = result.position
	if result.is_empty():mouse_position_3D = end
	selfRigidBody.position = mouse_position_3D + Vector3(0,0.8 + wheelPos,0)
	#print(wheelPos)

func hasSignal(node : Node, signalName : String) -> bool:
	var signalList = node.get_signal_list()
	for signalDictionary in signalList:
		if signalDictionary.name == signalName:
			return true
	return false

func _on_body_entered(body):
	coll = body



func _on_body_exited(body):
	coll = null

func is_pick() -> bool :
	return pick
