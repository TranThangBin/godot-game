extends StaticBody2D

@export var _cannon_ball_speed := 50.0
@export var _second_per_shot := 2.5

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var cannon_balls = $CannonBalls
@onready var shoot_cd = $ShootCD

const CANNON_BALL = preload("res://scenes/cannon/cannon_ball.tscn")


func _ready():
	shoot_cd.wait_time = _second_per_shot


func _physics_process(delta):
	for cannon_ball in cannon_balls.get_children():
		cannon_ball.position.x -= _cannon_ball_speed * delta


func _on_shoot_cd_timeout():
	animated_sprite_2d.play()


func _on_animated_sprite_2d_animation_finished():
	cannon_balls.add_child(CANNON_BALL.instantiate())
