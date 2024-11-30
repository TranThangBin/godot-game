@tool
extends Node2D

@export var _speed := 1.0
@export var _initial_angle := 1.0:
	set(value):
		_initial_angle = value
		_angle = _initial_angle * PI
		_update_platform_position()

@export var _counter_clockwise := false:
	set(value):
		_counter_clockwise = value
		_update_platform_position()

@export var _radius := 100.0:
	set(value):
		_radius = value
		_update_platform_position()
		if Engine.is_editor_hint():
			_draw_path()
		else:
			_clear_path()

@onready var _moving_area = $MovingArea
@onready var _platform = $Platform

var _angle = 0.0


func _ready():
	_angle = _initial_angle * PI
	_update_platform_position()
	if Engine.is_editor_hint():
		_draw_path()
	else:
		_clear_path()


func _physics_process(delta):
	if Engine.is_editor_hint():
		return
	_angle += delta * _speed
	_update_platform_position()


func _draw_path():
	_moving_area.visible = true
	_moving_area.scale = 2 * _radius * Vector2.ONE


func _clear_path():
	_moving_area.visible = false


func _update_platform_position():
	if _platform == null:
		return

	var x_pos = cos(_angle)
	var y_pos = sin(_angle)

	if _counter_clockwise:
		var temp = x_pos
		x_pos = y_pos
		y_pos = temp

	_platform.position = Vector2(_radius * x_pos, _radius * y_pos)
