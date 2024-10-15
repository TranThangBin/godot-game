extends Node

@export var initial_state: State
var current_state: State
var states := {}


func _ready():
	for child: State in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(_on_child_transition)
	if initial_state != null:
		initial_state.enter()
		current_state = initial_state


func _process(delta):
	if current_state != null:
		current_state.update(delta)


func _physics_process(delta):
	if current_state != null:
		current_state.physics_update(delta)


func _on_child_transition(state: State, new_state_name: String):
	if state != current_state:
		return

	var new_state: State = states.get(new_state_name.to_lower())
	if new_state == null:
		return

	if current_state != null:
		current_state.exit()

	new_state.enter()
	current_state = new_state
