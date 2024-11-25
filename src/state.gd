class_name State

extends Node

@warning_ignore("unused_signal")
signal transition(state: State, new_state_name: String)


func enter() -> void:
	pass


func exit() -> void:
	pass


@warning_ignore("unused_parameter")
func update(delta: float) -> void:
	pass


@warning_ignore("unused_parameter")
func physics_update(delta: float) -> void:
	pass
