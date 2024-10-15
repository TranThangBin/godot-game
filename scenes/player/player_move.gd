extends Player_State
class_name Player_Move

@onready var coyote_timer = $CoyoteTimer
@onready var was_on_floor := player.is_on_floor()


func physics_update(delta):
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction == 0:
		if absf(player.velocity.x) > 0:
			player.decelerate(delta)
		else:
			transition.emit(self, "Player_Idle")
	else:
		player.accelerate(direction, delta)

	if was_on_floor and !player.is_on_floor():
		coyote_timer.start()

	was_on_floor = player.is_on_floor()

	if Input.is_action_just_pressed("ui_accept") and (player.is_on_floor() or !coyote_timer.is_stopped()):
		transition.emit(self, "Player_Jump")
		coyote_timer.stop()
