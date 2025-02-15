extends Node

var firecracker_count: int = 0

func get_firecracker_count(count):
	firecracker_count = count

func _ready():
	Signals.GetFirecrackerCount.connect(get_firecracker_count)

func interact():
	if firecracker_count < 3:
		Signals.AddFirecracker.emit()
		print("firecracker picked up")
		queue_free()
