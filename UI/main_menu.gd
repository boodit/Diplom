extends Control



func _on_start_pressed():
	get_tree().change_scene_to_packed(GlobalScript.start_level)


func _on_options_pressed():
	get_tree().change_scene_to_packed(GlobalScript.options_level)


func _on_quit_pressed():
	get_tree().quit()










