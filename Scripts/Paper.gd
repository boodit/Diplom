extends Node3D

@export var labels : Array[Label]
@export var less : Array[lesson] = []
var less_time:int = 0
var label_time :int = 0

func _input(event):
	if event.is_action_released("new_less"):
		for label in labels:
			var les = less[less_time].export()
			if les[label_time] != null :
				label.text = les[label_time]
			else :
				label.text = ""
			label_time += 1
		label_time = 0
		if less_time != (less.size() - 1):
			less_time+=1
		else :
			less_time = 0
