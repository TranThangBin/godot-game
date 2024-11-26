class_name Player

extends CharacterBody2D

signal level_finish

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var _player_stats = $PlayerStats


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var collider := collision.get_collider()
		if collider.is_in_group("pushable"):
			assert(collider is RigidBody2D)
			var rb := collider as RigidBody2D
			rb.apply_central_impulse(-collision.get_normal() * _player_stats.get_pushforce())
		elif collider.is_in_group("finish_level"):
			level_finish.emit()

	move_and_slide()
