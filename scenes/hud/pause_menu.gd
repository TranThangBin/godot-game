class_name PauseMenu

extends Panel

@onready var pause_menu_container = $PauseMenuContainer
@onready var settings_menu = $SettingsMenu


func _show_pause_menu():
	for button in pause_menu_container.get_children():
		button.show()
	pause_menu_container.get_child(0).hide()
	show()


func show_next_level_menu(next_level_scene: String):
	for button in pause_menu_container.get_children():
		button.show()

	if next_level_scene.is_empty():
		pause_menu_container.get_child(0).hide()
	else:
		pause_menu_container.get_child(0).pressed.connect(
			func(): get_tree().change_scene_to_file(next_level_scene)
		)

	pause_menu_container.get_child(1).hide()
	pause_menu_container.get_child(3).hide()
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
	settings_menu.hide()
	pause_menu_container.show()


func _on_settings_button_pressed():
	pause_menu_container.hide()
	settings_menu.show()


func _on_settings_menu_save():
	return_from_settings()


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit(0)
