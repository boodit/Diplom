extends Control





func _on_resume_pressed():
	pass # Replace with function body.


func _on_settings_pressed():
	get_tree().change_scene_to_packed(GlobalScript.settings_level)


func _on_quit_pressed():
	get_tree().change_scene_to_packed(GlobalScript.Main_menu)
