class_name StateDebugLabel

extends Label

@export var state_machine: StateMachine


func _process(delta):
	set_text(str(state_machine.current_state))
