extends CharacterBody3D

@onready var _animated_sprite = $AnimatedSprite3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump, may remove later.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Move Left", "Move Right", "Move Up", "Move Down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _process(_delta):
	if Input.is_action_pressed("Move Right") and not Input.is_action_pressed("Move Left"):
		_animated_sprite.play("Right")
	else: 
		if Input.is_action_pressed("Move Left") and not Input.is_action_pressed("Move Right"):
			_animated_sprite.play("Left")
		else:
			if Input.is_action_pressed("Move Down") and not Input.is_action_pressed("Move Up"):
				_animated_sprite.play("Down")
			else:
				if Input.is_action_pressed("Move Up") and not Input.is_action_pressed("Move Down"):
					_animated_sprite.play("Up")
				else:
					_animated_sprite.stop()
