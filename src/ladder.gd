extends StaticBody2D

@export var _floor: CollisionShape2D
@export var _climb_area: Area2D


func _ready():
	_climb_area.body_entered.connect(_on_climb_area_body_entered)
	_climb_area.body_exited.connect(_on_climb_area_body_exited)


func _on_climb_area_body_entered(body):
	if body is not Player:
		return

	var player = body as Player
	player.player_controller.set_climbable(
		func(): _floor.disabled = true ; player.position.x = position.x
	)


func _on_climb_area_body_exited(body):
	if body is not Player:
		return

	var player = body as Player
	player.player_controller.unset_climbable()
	call_deferred("_enable_floor_collision")


func _enable_floor_collision():
	_floor.disabled = false
