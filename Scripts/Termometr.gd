extends RigidBody3D


var temp : float

func _on_area_3d_area_entered(area):
	if area as Voda:
		area.temperature_transfer.connect(setTemperatur)


func _on_area_3d_area_exited(area):
	if area as Voda:
		area.temperature_transfer.disconnect(setTemperatur)

func setTemperatur(newTemp):
	temp = newTemp
	%LabelTemperarture.text = "%.03f" % temp
