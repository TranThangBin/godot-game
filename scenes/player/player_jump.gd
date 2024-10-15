extends Player_State
class_name Player_Jump

@onready var jump_buffer_cast = $JumpBufferCast
var jump_buffered := false


func enter():
	player.jump()


func physics_update(delta):
	var direction = Input.get_axis("ui_left", "ui_right")

	if Input.is_action_just_pressed("ui_accept") and jump_buffer_cast.is_colliding() and player.velocity.y >= 0:
		jump_buffered = true

	if player.is_on_floor():
		if jump_buffered:
			transition.emit(self, "Player_Jump")
			jump_buffered = false
		else:
			if absf(player.velocity.x) > 0:
				transition.emit(self, "Player_Move")
			else:
				transition.emit(self, "Player_Idle")
	elif direction != 0:
		player.accelerate(direction, delta)
