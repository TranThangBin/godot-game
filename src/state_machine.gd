class_name StateMachine

extends Node

@export var _debug_label: Label
@export var _initial_state: State
var _current_state: State
var _states := {}


func _ready():
	for child: State in get_children():
		if child is State:
			var state: State = child
			_states[state.name.to_lower()] = child
			state.transition.connect(_on_child_transition)
	if _initial_state != null:
		_initial_state.enter()
		_current_state = _initial_state
		if _debug_label != null:
			_debug_label.set_text(_current_state.name)


func _process(delta):
	if _current_state != null:
		_current_state.update(delta)


func _physics_process(delta):
	if _current_state != null:
		_current_state.physics_update(delta)


func _on_child_transition(state: State, new_state_name: String):
	if _debug_label != null:
		_debug_label.set_text(new_state_name)

	if state != _current_state:
		return

	var new_state: State = _states.get(new_state_name.to_lower())
	if new_state == null:
		return

	if _current_state != null:
		_current_state.exit()

	_current_state = new_state
	new_state.enter()
