extends RayCast3D
class_name RayCastComponent

@export_group("References")
@export var player: CharacterBody3D

signal hover_changed(is_hovering: bool)

var interacting: Interactable

func ray_process() -> void:
	var obj = get_collider()
	if obj is Interactable:
		hover_changed.emit(true)
	else:
		hover_changed.emit(false)
		
	if Input.is_action_just_pressed("interact"):
		if obj is Interactable: obj.action(player)
		
	if Input.is_action_just_released("interact"):
		if obj is Interactable: obj.release(player)
