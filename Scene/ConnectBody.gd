extends RigidBody3D

@export_range(0,10) var sopr : int = 1
var amperage :float = 0
var voltage	 :float = 0
var connected : bool
var connectResister: bool : 
	set(value):
		GlobalScript.stuffUp(value)
		connectResister = value
var connectedBattary: bool = false :
	set(value):
		connectedBattary = value
		print(name)
		print(connectedBattary)


func _process(delta):
	if sopr > 1 and voltage != 0: 
		amperage = voltage/sopr
	print(amperage)

func _on_area_3d_area_entered(area):
	if !connected:
		connectedBattary = area.get_parent().is_connected_battary()
		if connectedBattary:
			connectResister = true
			connected = true
			amperage = area.get_parent().return_amperage()
			voltage = area.get_parent().return_voltage()

func return_amperage():
	return amperage

func return_voltage():
	return voltage

func is_connected_battary():
	return connectedBattary

func _on_area_3d_area_exited(area):
	if connected and connectedBattary:
		connectResister = false
		connected = false
		amperage = 0
		voltage = 0
