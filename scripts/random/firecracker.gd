extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", on_collision)

func on_collision(body):
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
