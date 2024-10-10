extends Panel

@onready var pause_menu_container = $PauseMenuContainer
@onready var settings_menu = $SettingsMenu

func pause():
	show()
	get_tree().paused = true

func unpause():
	hide()
	get_tree().paused = false
	return_from_settings()

func return_from_settings():
	settings_menu.hide()
	pause_menu_container.show()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused:
			unpause()
		else:
			pause()

func _on_pause_button_pressed():
	pause()

func _on_resume_button_pressed():
	unpause()

func _on_settings_button_pressed():
	pause_menu_container.hide()
	settings_menu.show()

func _on_settings_menu_save():
	return_from_settings()

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")

func _on_quit_button_pressed():
	get_tree().quit(0)

func _on_tree_exiting():
	get_tree().paused = false
