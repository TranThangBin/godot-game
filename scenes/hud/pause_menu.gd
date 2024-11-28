class_name PauseMenu

extends Panel

@onready var _pause_menu_container = $PauseMenuContainer
@onready var _settings_menu = $SettingsMenu
var _on_next_level_button_pressed = null


func _show_pause_menu():
	for button in _pause_menu_container.get_children():
		button.show()
	_pause_menu_container.get_child(0).hide()
	show()


func show_next_level_menu(next_level_scene: PackedScene):
	for button in _pause_menu_container.get_children():
		button.show()

	if next_level_scene == null:
		_pause_menu_container.get_child(0).hide()
	else:
		if _on_next_level_button_pressed != null:
			_pause_menu_container.get_child(0).pressed.disconnect(_on_next_level_button_pressed)
		_on_next_level_button_pressed = func(): get_tree().change_scene_to_packed(next_level_scene)
		_pause_menu_container.get_child(0).pressed.connect(_on_next_level_button_pressed)

	_pause_menu_container.get_child(1).hide()
	_pause_menu_container.get_child(3).hide()
	show()


func pause():
	_show_pause_menu()
	get_tree().paused = true


func unpause():
	hide()
	get_tree().paused = false
	return_from_settings()


func _on_resume_button_pressed():
	unpause()


func return_from_settings():
	_settings_menu.hide()
	_pause_menu_container.show()


func _on_settings_button_pressed():
	_pause_menu_container.hide()
	_settings_menu.show()


func _on_settings_menu_save():
	return_from_settings()


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit(0)
