extends CharacterBody2D

const ACCELERATION := 9.8
const DECELERATION := 5.0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var was_on_floor = is_on_floor()
@onready var coyote_timer = $CoyoteTimer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if was_on_floor and !is_on_floor() and velocity.y > 0:
		coyote_timer.start()
	
	was_on_floor = is_on_floor()
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or !coyote_timer.is_stopped()):
		velocity.y = JUMP_VELOCITY
		coyote_timer.stop()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = lerpf(velocity.x, direction * SPEED, ACCELERATION * delta)
	else:
		velocity.x = lerpf(velocity.x, 0.0, DECELERATION * delta)

	move_and_slide()
