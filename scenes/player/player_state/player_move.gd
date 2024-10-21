class_name PlayerMove

extends PlayerState

@export var coyote_timer: Timer
@onready var was_on_floor := player_controller.is_on_floor()


func physics_update(delta):
	if was_on_floor and !player_controller.is_on_floor():
		coyote_timer.start()

	was_on_floor = player_controller.is_on_floor()

	var direction := Input.get_axis("player_left", "player_right")
	if direction != 0:
		player_controller.accelerate(direction, delta)
	else:
		if int(player_controller.get_x_velocity()) != 0:
			player_controller.decelerate(delta)
		else:
			transition.emit(self, "PlayerIdle")
			return

	if !player_controller.is_on_floor() and coyote_timer.is_stopped():
		transition.emit(self, "PlayerAirborne")
		return

	if (
		Input.is_action_just_pressed("player_jump")
		and (player_controller.is_on_floor() or !coyote_timer.is_stopped())
	):
		coyote_timer.stop()
		transition.emit(self, "PlayerJump")
