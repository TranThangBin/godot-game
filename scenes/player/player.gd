extends CharacterBody2D
class_name Player

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var player_stats = $Player_Stats


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()


func accelerate(direction: float, delta: float):
	velocity.x = lerpf(velocity.x, direction * player_stats.get_speed(), player_stats.get_acceleration() * delta)


func decelerate(delta: float):
	velocity.x = lerpf(velocity.x, 0.0, player_stats.get_deceleration() * delta)


func jump():
	velocity.y = player_stats.get_jump_velocity()
