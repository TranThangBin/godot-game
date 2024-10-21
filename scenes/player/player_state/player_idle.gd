class_name PlayerIdle

extends PlayerState


func physics_update(delta):
	var direction := Input.get_axis("player_left", "player_right")
	if direction != 0:
		transition.emit(self, "PlayerMove")
		return

	if !player_controller.is_on_floor():
		transition.emit(self, "PlayerAirborne")
		return

	if Input.is_action_just_pressed("player_jump") and player_controller.is_on_floor():
		transition.emit(self, "PlayerJump")
