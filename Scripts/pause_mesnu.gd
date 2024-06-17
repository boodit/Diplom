extends Control

var pause : bool = false

func _input(event):
	if event.is_action_pressed("pause"):
		self.visible = !is_visible_in_tree()


func _on_start_pressed():
	self.visible = !is_visible_in_tree()


func _on_options_pressed():
	get_tree().change_scene_to_packed(GlobalScript.Main_menu)


func _on_quit_pressed():
	get_tree().quit()
