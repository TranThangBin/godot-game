extends Node2D

@export var _next_level_scene: String
@export var _player: Player
@export var _hud: Hud


func _ready():
	_player.level_finish.connect(_on_level_finish)


func _on_level_finish():
	get_tree().paused = true
	_hud.pause_menu.show_next_level_menu(_next_level_scene)
