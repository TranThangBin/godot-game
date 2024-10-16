extends Player_State
class_name Player_Jump

@export var jump_buffer_cast: RayCast2D
@export var jump_sfx: AudioStreamPlayer2D
var jump_buffered := false


func enter():
	jump_sfx.stop()
	player_controller.jump()
	jump_sfx.play()


func physics_update(delta):
	var direction = Input.get_axis("player_left", "player_right")

	if Input.is_action_just_pressed("player_jump") and jump_buffer_cast.is_colliding() and player_controller.get_y_velocity() >= 0:
		jump_buffered = true

	if !Input.is_action_pressed("player_jump") and player_controller.is_jumping():
		player_controller.reduce_jump_height()

	if player_controller.is_on_floor():
		if jump_buffered:
			transition.emit(self, "Player_Jump")
			jump_buffered = false
		else:
			if absf(player_controller.get_x_velocity()) > 0:
				transition.emit(self, "Player_Move")
			else:
				transition.emit(self, "Player_Idle")
	elif direction != 0:
		player_controller.accelerate(direction, delta)
	else:
		player_controller.decelerate(delta)
