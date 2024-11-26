class_name PlayerStats

extends Node

@export var _speed := 300.0
@export var _jump_velocity := -400.0
@export var _min_jump_velocity := -200.0  # the reason it is the way it is is due to godot y velocity
@export var _acceleration := 9.8
@export var _deceleration := 5.0
@export var _push_force := 80.0


func get_speed() -> float:
	return _speed


func get_jump_velocity() -> float:
	return _jump_velocity


func get_min_jump_velocity() -> float:
	return _min_jump_velocity


func get_acceleration() -> float:
	return _acceleration


func get_deceleration() -> float:
	return _deceleration


func get_pushforce() -> float:
	return _push_force
