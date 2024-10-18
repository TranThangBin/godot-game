extends BoxContainer

signal save

const DEFAULT_VOLUME_VALUE := 50
const DEFAULT_FPS_INDEX := 0
const DEFAULT_FULLSCREEN_OPT := false

@onready var volume_h_slider = $GridContainer/VolumeHSlider
@onready var fps_option_button = $GridContainer/FPSOptionButton
@onready var fullscreen_button = $GridContainer/FullscreenButton


func _on_restore_to_default_button_pressed():
	volume_h_slider.value = DEFAULT_VOLUME_VALUE
	fps_option_button.select(DEFAULT_FPS_INDEX)
	fullscreen_button.button_pressed = DEFAULT_FULLSCREEN_OPT


func save_settings():
	save.emit()


func _on_save_and_return_button_pressed():
	save_settings()
