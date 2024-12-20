class_name PlayerState

extends State

@export var player_controller: PlayerController
@export var animated_sprite: AnimatedSprite2D


func _ready():
	player_controller.damaged.connect(_on_damaged)


func _on_damaged(collision_velocity: Vector2):
	transition.emit(self, "PlayerDamaged")
