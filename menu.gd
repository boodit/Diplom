class_name MainMenu
extends Control





func _on_play_pressed():
	get_tree().change_scene_to_packed(GlobalScript.start_level)



func _on_exit_pressed():
	get_tree().quit()




