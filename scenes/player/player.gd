class_name Player

extends CharacterBody2D

@onready var _player_stats = $PlayerStats
@onready var player_controller: PlayerController = $PlayerController

@warning_ignore("unused_parameter")


func _physics_process(delta):
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("pushable"):
		body.collision_layer = 1 | 2
		body.collision_mask = 1 | 2


func _on_area_2d_body_exited(body):
	if body.is_in_group("pushable"):
		body.collision_layer = 2
		body.collision_mask = 2
