extends Control

@onready var settings_menu = $MainContainer/BottomContainer/SettingsMenu

func _on_settings_button_pressed():
	settings_menu.visible = !settings_menu.visible


func _on_quit_button_pressed():
	get_tree().quit(0)
