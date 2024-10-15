extends Node
class_name Player_Stats

@export var _speed := 300.0
@export var _jump_velocity := -400.0
@export var _acceleration := 9.8
@export var _deceleration := 5.0


func get_speed() -> float:
	return _speed


func get_jump_velocity() -> float:
	return _jump_velocity


func get_acceleration() -> float:
	return _acceleration


func get_deceleration() -> float:
	return _deceleration