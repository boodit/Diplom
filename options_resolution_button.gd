extends Control

@onready var option_button = $HBoxContainer/OptionButton as OptionButton

const RESOLUTION_DICTIONARY : Dictionary = {
	"1152 x 648" : Vector2i(1152, 648),
	"1280 x 720" : Vector2i(1280, 720),
	"1920 x 1080" : Vector2i(1920, 1080),
	"3440 x 1440" : Vector2i(3440, 1440)
}

func _ready():
	add_resolution_itmes()
	option_button.item_selected.connect(on_resolution_selected)
	

	
func add_resolution_itmes() -> void:
	for resolution_size_text in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution_size_text)
		
func center_window():
	var screen_center = DisplayServer.screen_get_position() + DisplayServer.screen_get_size() /2
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(screen_center - window_size /2)
	
func on_resolution_selected(index : int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
	center_window()
	

