extends Node3D

@onready var firecracker = preload("res://assets/Firecracker.tscn")
@onready var camera = get_node("../Head/Camera3D")

@export var launch_force: float = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_left"):
		var f = firecracker.instantiate()
		get_tree().root.add_child(f)
		f.global_position = global_position + -camera.get_global_transform().basis.z
		f.get_node("RigidBody3D").apply_impulse(-camera.get_global_transform().basis.z*launch_force)
