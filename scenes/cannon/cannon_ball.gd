class_name CannonBall

extends Area2D

@onready var _prev_pos := global_position
var _velocity := Vector2.ZERO


func _physics_process(delta):
	var cur_pos = global_position
	var delta_pos = cur_pos - _prev_pos
	_velocity = Vector2.ZERO
	if delta != 0:
		_velocity = delta_pos / delta
	_prev_pos = cur_pos


func _on_body_entered(body: Node2D):
	if body.is_in_group("passable"):
		return

	if body is Player:
		var player = body as Player
		player.player_controller.damaged.emit(Vector2(500, 500))

	queue_free()
