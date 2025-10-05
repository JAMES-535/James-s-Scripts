extends State

@export_group("References")
@export var player: CharacterBody3D
@export var camera_component: CameraComponent
@export var ray_component: RayCastComponent

@export_group("Player variables")
@export var speed: float = 8.0
@export var acceleration: float = 30.0
@export var deceleration: float = 30.0
@export var jump_force: float = 5.0

func _state_ready(prev_state: String, ...args: Array) -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	player.speed = speed  
	player.acceleration = acceleration
	player.deceleration = deceleration
	player.jump_force = jump_force
	
func _state_process(delta: float) -> void:
	player.player_process(delta)
	if ray_component: ray_component.ray_process()

func _state_physics_process(delta: float) -> void:
	player.player_physics_process(delta)

func _state_input(event: InputEvent):
	if camera_component: camera_component.camera_input(event)
