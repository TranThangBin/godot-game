class_name CannonBall

extends Area2D


func _on_body_entered(body):
	if body is Player:
		pass

	queue_free()
