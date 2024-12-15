class_name CannonBall

extends Area2D


func _on_body_entered(body: Node2D):
	if body.is_in_group("passable"):
		return

	if body is Player:
		var player = body as Player

	queue_free()
