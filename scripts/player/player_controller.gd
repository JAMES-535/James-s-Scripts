extends CharacterBody3D
class_name Player

var speed: float = 5.0
var acceleration: float = 30.0
var deceleration: float = 30.0
var jump_force: float = 2.0

var RISING_GRAVITY: float = -9.8
var FALLING_GRAVITY: float = -15
var gravity: float

func _ready() -> void:
	gravity = RISING_GRAVITY

func player_process(delta: float) -> void:
	pass

func player_physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
	
	if velocity.y < 0:
		gravity = FALLING_GRAVITY
	else:
		gravity = RISING_GRAVITY

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	var input: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	var direction: Vector3 = (transform.basis * Vector3(input.x, 0, input.y)).normalized()
	var target_velocity: Vector3 = direction * speed
	if input:
		velocity = velocity.move_toward(Vector3(target_velocity.x, velocity.y, target_velocity.z), delta * acceleration)
	else:
		velocity = velocity.move_toward(Vector3(0.0, velocity.y, 0.0), delta * deceleration);

	move_and_slide()
