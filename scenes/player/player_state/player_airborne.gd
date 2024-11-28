class_name PlayerAirborne

extends PlayerState

@export var jump_buffer_cast: RayCast2D

var jump_buffered := false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func physics_update(delta):
	if !player_controller.is_on_floor():
		player_controller.set_y_velocity(player_controller.get_y_velocity() + gravity * delta)

	var horizontal_direction = Input.get_axis("player_left", "player_right")
	var vertical_direction = Input.get_axis("player_climb_up", "player_climb_down")

	if horizontal_direction != 0:
		player_controller.accelerate(horizontal_direction, delta)
		animated_sprite.flip_h = horizontal_direction < 0
	else:
		player_controller.decelerate(delta)

	if player_controller.get_y_velocity() > 0:
		animated_sprite.set_animation("Jump")
		animated_sprite.set_frame(1)

	if (
		Input.is_action_just_pressed("player_jump")
		and jump_buffer_cast.is_colliding()
		and player_controller.get_y_velocity() >= 0
	):
		jump_buffered = true

	if vertical_direction != 0 and player_controller.is_climbable():
		player_controller.set_x_velocity(0)
		transition.emit(self, "PlayerClimb")
		return

	if player_controller.is_on_floor():
		if jump_buffered:
			jump_buffered = false
			transition.emit(self, "PlayerJump")
		else:
			if absf(player_controller.get_x_velocity()) > 0:
				transition.emit(self, "PlayerMove")
			else:
				transition.emit(self, "PlayerIdle")
