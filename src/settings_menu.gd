extends BoxContainer

signal save
@onready var volume_h_slider = $GridContainer/VolumeHSlider
@onready var fps_option_button = $GridContainer/FPSOptionButton

func _on_restore_to_default_button_pressed():
	volume_h_slider.value = 50
	fps_option_button.select(0)



func _on_save_and_return_button_pressed():
	save.emit()
