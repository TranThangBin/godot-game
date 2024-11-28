class_name Player

extends CharacterBody2D

@onready var _player_stats = $PlayerStats
@onready var player_controller: PlayerController = $PlayerController

@warning_ignore("unused_parameter")


func _physics_process(delta):
	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var collider := collision.get_collider()
		if collider.is_in_group("pushable"):
			var rb := collider as RigidBody2D
			rb.apply_central_impulse(
				-collision.get_normal().normalized() * _player_stats.get_pushforce()
			)

	move_and_slide()
