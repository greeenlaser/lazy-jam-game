extends Node3D

@onready var firecracker = preload("res://assets/Firecracker.tscn")
@onready var camera = get_node("../Head/Camera3D")

@export var launch_force: float = 5

var firecrackers: int = 0

func add_firecracker():
	firecrackers += 3-firecrackers
	Signals.GetFirecrackerCount.emit(firecrackers)	

func _ready():
	Signals.GetFirecrackerCount.emit(firecrackers)
	Signals.AddFirecracker.connect(add_firecracker)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_right") and firecrackers>0:
		var f = firecracker.instantiate()
		get_tree().root.add_child(f)
		f.global_position = camera.global_position - (Vector3(-1,-0.5,0)* -camera.get_global_transform().basis.z) + -camera.get_global_transform().basis.z
		f.get_node("RigidBody3D").apply_impulse(-camera.get_global_transform().basis.z*launch_force)
		firecrackers -= 1
		Signals.GetFirecrackerCount.emit(firecrackers)
