class_name Hud

extends CanvasLayer

@onready var pause_menu: PauseMenu = $PauseMenu
var level_finished := false


func _input(event):
	if event.is_action_pressed("ui_cancel") and !level_finished:
		if get_tree().paused:
			pause_menu.unpause()
		else:
			pause_menu.pause()


func _exit_tree():
	get_tree().paused = false


func _on_pause_button_pressed():
	pause_menu.pause()
