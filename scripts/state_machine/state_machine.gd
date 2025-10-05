extends Node
class_name StateMachine

@export var current_state: State

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_state._state_ready("")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_state._state_process(delta)

func _physics_process(delta: float) -> void:
	current_state._state_physics_process(delta)

func _input(event: InputEvent) -> void:
	current_state._state_input(event)

func change_state(state: String, ...args: Array) -> void:
	state = state.to_lower()
	for c in get_children():
		if c.name.to_lower() == state:
			current_state._state_exit()
			current_state = c
			current_state._state_ready(state, args)
			break;
