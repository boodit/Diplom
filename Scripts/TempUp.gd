extends Node

@export var temp : int = 80

func _ready():
	name = "pickNode"

func interact():
	%Voda.updateTemp(temp)
