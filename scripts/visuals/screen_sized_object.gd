extends Node2D

func _process(delta: float) -> void:
	scale = get_viewport_rect().size
	position = get_viewport_rect().size/2
