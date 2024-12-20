class_name PlayerController

extends Node

signal damaged(collision_velocity: Vector2)

@export var _player: Player
@export var _player_stats: PlayerStats
@export var _climb_state: PlayerClimb

var _climbable := false
var _on_climb_entered = null
var _collision_velocity = Vector2.ZERO


func _ready():
	damaged.connect(func(collision_velocity): _collision_velocity = collision_velocity)


func apply_knockback():
	_player.velocity = _collision_velocity


func is_climbable():
	return _climbable


func set_climbable(callback: Callable):
	_on_climb_entered = callback
	_climb_state.state_entered.connect(_on_climb_entered)
	_climbable = true


func unset_climbable():
	_climb_state.state_entered.disconnect(_on_climb_entered)
	_on_climb_entered = null
	_climbable = false


func accelerate(direction: float, delta: float) -> void:
	_player.velocity.x = lerpf(_player.velocity.x, direction * _player_stats.get_speed(), _player_stats.get_acceleration() * delta)


func decelerate(delta: float) -> void:
	if absf(_player.velocity.x) > _player_stats.get_speed() / 4:
		_player.velocity.x = lerpf(_player.velocity.x, 0.0, _player_stats.get_deceleration() * delta)
	else:
		_player.velocity.x = 0


func climb(direction: float, delta: float) -> void:
	_player.velocity.y = lerpf(_player.velocity.y, direction * _player_stats.get_speed(), _player_stats.get_acceleration() * delta)


func jump() -> void:
	_player.velocity.y = _player_stats.get_jump_velocity()


func get_x_velocity() -> float:
	return _player.velocity.x


func set_x_velocity(v: float) -> void:
	_player.velocity.x = v


func get_y_velocity() -> float:
	return _player.velocity.y


func set_y_velocity(v: float) -> void:
	_player.velocity.y = v


func is_on_floor() -> bool:
	return _player.is_on_floor()


func reduce_jump_height() -> void:
	_player.velocity.y = _player_stats.get_min_jump_velocity()


func get_min_jump_velocity() -> float:
	return _player_stats.get_min_jump_velocity()
