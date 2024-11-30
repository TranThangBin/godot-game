class_name StateMachine

extends Node

@export var _initial_state: State
var _current_state: State
var _states := {}


func _ready():
	for child in get_children():
		if child is State:
			var state = child as State
			_states[state.name.to_lower()] = child
			state.transition.connect(_on_child_transition)
	if _initial_state != null:
		_initial_state.enter()
		_current_state = _initial_state


func _process(delta):
	if _current_state != null:
		_current_state.update(delta)


func _physics_process(delta):
	if _current_state != null:
		_current_state.physics_update(delta)


func _on_child_transition(state: State, new_state_name: String):
	if state != _current_state:
		return

	var new_state: State = _states.get(new_state_name.to_lower())
	if new_state == null:
		return

	if _current_state != null:
		_current_state.exit()

	_current_state = new_state
	new_state.enter()
