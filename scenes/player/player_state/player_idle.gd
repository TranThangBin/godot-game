class_name PlayerIdle

extends PlayerState


func enter():
	animated_sprite.play("Idle")


@warning_ignore("unused_parameter")


func physics_update(delta):
	var horizontal_direction := Input.get_axis("player_left", "player_right")
	var vertical_direction := Input.get_axis("player_climb_up", "player_climb_down")

	if horizontal_direction != 0:
		transition.emit(self, "PlayerMove")
		return

	if vertical_direction != 0 and player_controller.is_climbable():
		transition.emit(self, "PlayerClimb")
		return

	if !player_controller.is_on_floor():
		transition.emit(self, "PlayerAirborne")
		return

	if Input.is_action_just_pressed("player_jump"):
		transition.emit(self, "PlayerJump")
