extends Node

@onready var shape_cast: ShapeCast3D = $ShapeCast3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", on_collision)

func on_collision(body):
	if shape_cast.is_colliding():
		var creature = shape_cast.get_collider(0)
		creature.freeze()
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
