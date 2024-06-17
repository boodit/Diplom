extends Control
@onready var audio_stream_player = $AudioStreamPlayer



func _on_start_pressed():
	get_tree().change_scene_to_packed(GlobalScript.start_level)


func _on_options_pressed():
	get_tree().change_scene_to_packed(GlobalScript.options_level)


func _on_quit_pressed():
	get_tree().quit()

func _on_start_mouse_entered():
	audio_stream_player.play()


func _on_options_mouse_entered():
	audio_stream_player.play()


func _on_quit_mouse_entered():
	audio_stream_player.play()
