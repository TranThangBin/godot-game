extends Control

@onready var settings_menu = $MainContainer/MiddleContainer/AlignmentContainer/SettingsMenu

func _on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://scene/level_1.tscn")

func _on_settings_button_pressed():
	settings_menu.visible = !settings_menu.visible

func _on_settings_menu_save():
	settings_menu.hide()

func _on_quit_button_pressed():
	get_tree().quit(0)
