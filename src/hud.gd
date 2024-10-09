extends CanvasLayer

@onready var pause_menu = $PauseMenu

func pause():
	pause_menu.visible = true
	get_tree().paused = true

func unpause():
	pause_menu.visible = false
	get_tree().paused = false

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

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit(0)


func _on_tree_exiting():
	get_tree().paused = false
