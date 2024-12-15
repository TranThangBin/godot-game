extends StaticBody2D

@export var _cannon_ball_speed := 50.0
@export var _second_per_shot := 2.5
@export var _initial_delay := 0.0

@onready var _animated_sprite_2d = $AnimatedSprite2D
@onready var _cannon_balls = $CannonBalls
@onready var _shoot_cd = $ShootCD

const CANNON_BALL = preload("res://scenes/cannon/cannon_ball.tscn")


func _ready():
	_shoot_cd.wait_time = _second_per_shot


func _process(delta):
	_initial_delay -= delta

	if _initial_delay <= 0:
		_animated_sprite_2d.play()
		_shoot_cd.start()
		set_process(false)


func _physics_process(delta):
	for cannon_ball in _cannon_balls.get_children():
		cannon_ball.position.x -= _cannon_ball_speed * delta


func _on_shoot_cd_timeout():
	_animated_sprite_2d.play()


func _on_animated_sprite_2d_animation_finished():
	_cannon_balls.add_child(CANNON_BALL.instantiate())
