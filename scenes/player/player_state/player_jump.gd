class_name PlayerJump

extends PlayerState

@export var jump_sfx: AudioStreamPlayer2D


func enter():
	jump_sfx.stop()
	player_controller.jump()
	jump_sfx.play()
	animated_sprite.set_animation("Jump")
	animated_sprite.set_frame(0)
	transition.emit(self, "PlayerAirborne")
