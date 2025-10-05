extends Camera3D
class_name CameraComponent

@export_group("References")
@export var player: CharacterBody3D

@export_group("Camera variables")
@export_range(0.1, 2.0) var sensitivity: float = 1.0

func camera_input(event: InputEvent):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		player.rotate_y(deg_to_rad(-event.relative.x * sensitivity))
		rotate_x(deg_to_rad(-event.relative.y * sensitivity))
		rotation_degrees.x = clampf(rotation_degrees.x, -80, 80)
