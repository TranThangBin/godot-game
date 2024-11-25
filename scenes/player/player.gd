class_name Player

extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

const _PUSH_FORCE := 80


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var collider := collision.get_collider()
		if collider.is_in_group("pushable"):
			assert(collider is RigidBody2D)
			var rb := collider as RigidBody2D
			rb.apply_central_impulse(-collision.get_normal() * _PUSH_FORCE)

	move_and_slide()
