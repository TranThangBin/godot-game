extends BoxContainer

signal save

const DEFAULT_VOLUME_VALUE := 50
const DEFAULT_FPS_INDEX := 0
const DEFAULT_FULLSCREEN_OPT := false

@onready var volume_h_slider := $GridContainer/VolumeHSlider
@onready var fps_option_button := $GridContainer/FPSOptionButton
@onready var fullscreen_button := $GridContainer/FullscreenButton


func _ready():
	_load_preferences()


func _load_preferences():
	var pref = UserPreferences.get_preferences()
	volume_h_slider.value = pref.get("volume", volume_h_slider.value)
	fps_option_button.selected = pref.get("fps_id", fps_option_button.get_selected_id())
	fullscreen_button.button_pressed = pref.get("fullscreen", fullscreen_button.button_pressed)


func _on_restore_to_default_button_pressed():
	volume_h_slider.value = DEFAULT_VOLUME_VALUE
	fps_option_button.select(DEFAULT_FPS_INDEX)
	fullscreen_button.button_pressed = DEFAULT_FULLSCREEN_OPT


func save_settings():
	(
		UserPreferences
		. save_preferences(
			{
				"volume": volume_h_slider.value,
				"fps_id": fps_option_button.get_selected_id(),
				"fullscreen": fullscreen_button.button_pressed,
			}
		)
	)
	save.emit()


func _on_save_and_return_button_pressed():
	save_settings()


func _on_fullscreen_button_toggled(toggled_on):
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if toggled_on else DisplayServer.WINDOW_MODE_WINDOWED)


func _on_fps_option_button_item_selected(index):
	Engine.max_fps = int(fps_option_button.get_item_text(index))


func _on_volume_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),linear_to_db(value))
