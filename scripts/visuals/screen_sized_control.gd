extends Control

func _process(_delta: float) -> void:
	scale = get_viewport_rect().size
	position = get_viewport_rect().size/2
