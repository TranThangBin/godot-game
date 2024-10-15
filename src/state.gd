extends Node

class_name State

signal transition(state: State, new_state_name: String)


func enter() -> void:
	pass


func exit() -> void:
	pass


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	pass
