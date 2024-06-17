extends StaticBody3D

@export var amperage :float = 15
@export var voltage :float = 220
var connectedBattary: bool = true


func _ready():
	pass 

func _process(delta):
	if GlobalScript.connectedStuff > 1:
		voltage = voltage / (GlobalScript.connectedStuff / 2)
	else : voltage = 220

func return_amperage():
	return amperage

func return_voltage():
	return voltage

func is_connected_battary():
	return connectedBattary

func _on_area_3d_area_entered(area):
	GlobalScript.bataryConnect = true


func _on_area_3d_area_exited(area):
	pass # Replace with function body.



