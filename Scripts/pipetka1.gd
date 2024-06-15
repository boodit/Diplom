extends RigidBody3D
var pick:bool =false
signal pickedSignal(pickSignal)
@onready var marker_3d = $Marker3D
const KAPLYA = preload("res://kaplya.tscn")

func _ready():
	pickedSignal.connect(picked)

func _process(delta):
	if pick and Input.is_action_just_pressed("RCM"):
		inst_kaplya()

func inst_kaplya():
	var inst = KAPLYA.instantiate()
	inst.global_position = marker_3d.global_position
	add_sibling(inst)

func picked(pickSignal):
	pick=pickSignal
	print(pick)
