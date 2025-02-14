extends Node2D

@onready var mesh: MeshInstance2D = $MeshInstance2D

@export var amount: float = 50

func _process(_delta: float) -> void:
	mesh.material.set_shader_parameter("amount", amount)
