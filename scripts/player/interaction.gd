extends Node3D

@onready var ray: RayCast3D = $RayCast3D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if ray.is_colliding():
			if ray.get_collider().has_method("interact"):
				ray.get_collider().interact()
