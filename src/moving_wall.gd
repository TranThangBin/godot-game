extends Node2D

@export var _button: PressureSwitch
@export var _animation_player: AnimationPlayer

const _low_speed := 1.0
const _high_speed := 10.0


func _ready():
	_button.button_activated.connect(_on_button_activated)
	_button.button_deactivated.connect(_on_button_deactivated)


func _on_button_activated():
	if !_animation_player.is_playing():
		_animation_player.play("activate")

	_animation_player.speed_scale = _low_speed


func _on_button_deactivated():
	if !_animation_player.is_playing():
		_animation_player.play("activate", -1, 1.0, true)

	_animation_player.speed_scale = -_high_speed
