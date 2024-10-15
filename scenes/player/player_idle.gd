extends Player_State
class_name Player_Idle


func physics_update(delta):
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		transition.emit(self, "Player_Move")

	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
		transition.emit(self, "Player_Jump")
