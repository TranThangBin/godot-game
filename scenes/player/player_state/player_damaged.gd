class_name PlayerDamaged

extends PlayerState

@export var timeout_timer: Timer
var jump_buffered := false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func enter():
	timeout_timer.timeout.connect(_on_timer_timeout)
	player_controller.apply_knockback()
	timeout_timer.start()
	animated_sprite.set_animation("Jump")
	animated_sprite.set_frame(0)


func physics_update(delta):
	if !player_controller.is_on_floor():
		player_controller.set_y_velocity(player_controller.get_y_velocity() + gravity * delta)


func exit():
	timeout_timer.timeout.disconnect(_on_timer_timeout)


func _on_timer_timeout():
	var vertical_direction = Input.get_axis("player_climb_up", "player_climb_down")

	if player_controller.get_y_velocity() > 0:
		animated_sprite.set_animation("Jump")
		animated_sprite.set_frame(1)

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
	else:
		transition.emit(self, "PlayerAirborne")
