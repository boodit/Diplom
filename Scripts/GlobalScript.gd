extends Node

@onready var start_level = preload("res://Scene/B.tscn") as PackedScene
@onready var options_level = preload("res://UI/options.tscn") as PackedScene 
@onready var Main_menu = preload("res://UI/main_menu.tscn") as PackedScene
var bataryConnect:bool
var connectedStuff : int = 0

func stuffUp(signh : bool):
	if bataryConnect:
		connectedStuff +=1
		bataryConnect = false
	else :
		if signh:
			connectedStuff +=1
		if !signh:
			connectedStuff -=1
		if connectedStuff == 0:
			bataryConnect = true
	print(connectedStuff)
