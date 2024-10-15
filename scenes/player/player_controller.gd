extends Node
class_name Player_Controller

@export var _player: Player
@export var _player_stats: Player_Stats


func accelerate(direction: float, delta: float) -> void:
	_player.velocity.x = lerpf(_player.velocity.x, direction * _player_stats.get_speed(), _player_stats.get_acceleration() * delta)


func decelerate(delta: float) -> void:
	_player.velocity.x = lerpf(_player.velocity.x, 0.0, _player_stats.get_deceleration() * delta)


func jump() -> void:
	_player.velocity.y = _player_stats.get_jump_velocity()


func get_x_velocity() -> float:
	return _player.velocity.x


func get_y_velocity() -> float:
	return _player.velocity.y


func is_on_floor() -> bool:
	return _player.is_on_floor()
