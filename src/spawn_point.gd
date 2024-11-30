extends Node2D

@export var _player: Player


func _ready():
	_player.position = position
