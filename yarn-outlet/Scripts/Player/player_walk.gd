extends CharacterBody2D

var dash = 1

const SPEED = 150.0
const JUMP_VELOCITY = -150.0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += (get_gravity() / 3) * delta

	if Input.is_action_pressed("ui_run"):
		dash = 1.5
	else:
		dash = 1

	# Handle jump.
	if Input.is_action_just_pressed("ui_shoot") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * (SPEED * dash)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
