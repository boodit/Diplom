extends Area3D
class_name Voda

var starting_temperature :float = 80.0  # начальная температура воды
var ambient_temperature :float = 20.0  # температура окружающей среды (комнатная температура)
var decay_coefficient :float = 0.001  # коэффициент охлаждения
var temperature :float:
	set(value):
		temperature = value
		temperature_transfer.emit(value)
		#print(value)
var time :float
signal temperature_transfer(temp)
 

func _on_timer_timeout():
	time += 0.1
	temperature = ambient_temperature + (starting_temperature - ambient_temperature) * exp(-decay_coefficient * time)

func updateTemp(temp):
	temperature = temp
	time = 0.0
