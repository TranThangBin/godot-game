class_name PlayerClimb

extends PlayerState


func enter():
	state_entered.emit()
	animated_sprite.play("Climb")


func physics_update(delta):
	var direction = Input.get_axis("player_climb_up", "player_climb_down")

	if direction != 0:
		animated_sprite.speed_scale = 1
		player_controller.climb(direction, delta)
	else:
		animated_sprite.speed_scale = 0
		player_controller.set_y_velocity(0)

	if Input.is_action_just_pressed("player_jump"):
		transition.emit(self, "PlayerJump")

	if !player_controller.is_climbable():
		if !player_controller.is_on_floor():
			transition.emit(self, "PlayerAirborne")
		elif player_controller.get_x_velocity() != 0:
			transition.emit(self, "PlayerMove")
		else:
			transition.emit(self, "PlayerIdle")
