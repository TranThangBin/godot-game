extends Area2D

@export var _next_level_scene: PackedScene
@export var _hud: Hud


func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D):
	if body is Player:
		get_tree().paused = true
		_hud.level_finished = true
		_hud.pause_menu.show_next_level_menu(_next_level_scene)
