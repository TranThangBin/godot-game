@tool
extends AnimatableBody2D

@export var _initial_angle := 0.0
@export var _speed := 1.0
@export var _counter_clockwise := false
@export var _radius := 100.0:
	set(value):
		_radius = value
		_draw_hint()

@onready var _moving_area = $MovingArea
@onready var _initial_pos := position

var _angle = 0.0


func _ready():
	_angle = _initial_angle * PI
	_draw_hint()


func _physics_process(delta):
	if Engine.is_editor_hint():
		return

	_angle += delta * _speed

	var x_pos = cos(_angle)
	var y_pos = sin(_angle)

	if _counter_clockwise:
		var temp = x_pos
		x_pos = y_pos
		y_pos = temp

	position = Vector2(_radius * x_pos + _initial_pos.x, _radius * y_pos + _initial_pos.y)


func _draw_hint():
	if Engine.is_editor_hint():
		_moving_area.visible = true
		_moving_area.scale = 2 * _radius * Vector2.ONE
	else:
		_moving_area.visible = false
