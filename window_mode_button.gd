extends Control


@onready var option_button = $HBoxContainer/OptionButton as OptionButton


const WINDOW_MODE_ARRAY : Array[String] = [
	"Полный экран",
	"В окне",
	"Полный экран без рамок",
	"В окне без рамок"
]

func _ready():
	add_window_mode_items()
	option_button.item_selected.connect(on_window_mode_selected)
	option_button.select(1)

func add_window_mode_items() -> void:
	for window_mode in WINDOW_MODE_ARRAY:
		option_button.add_item(window_mode)
	
func on_window_mode_selected(index : int)->void:
	match index:
		0: #fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Window mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #fullscreen borderless
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #Window mode borderless
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
