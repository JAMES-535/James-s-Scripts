extends Node
class_name TransitionManager

static var instance: TransitionManager

@onready var anim_player: AnimationPlayer = $AnimationPlayer

@export var world_2d: Node2D
@export var world_3d: Node3D
@export var current_scene: PackedScene
var current_scene_in_world: Node = null


func _ready() -> void:
	if instance == null:
		instance = self
	else:
		queue_free()
		
	if world_2d == null:
		print("No World2D selected")
	if world_3d == null:
		print("No World3D selected")
		
	if current_scene == null:
		print("No initial scene specified, project will be blank")
	else:
		_change_scene()
		

func change_scene(scene: PackedScene) -> void:
	current_scene = scene
	if anim_player: 
		anim_player.play("close")
	else:
		print("No transition animation player detected") 
		_change_scene()


func _change_scene() -> void:
	if current_scene_in_world: current_scene_in_world.queue_free()
	current_scene_in_world = current_scene.instantiate()
	
	if current_scene_in_world is Node2D:
		world_2d.add_child(current_scene_in_world)
	elif current_scene_in_world is Node3D:
		world_3d.add_child(current_scene_in_world)
		
	if anim_player: anim_player.play("open")
