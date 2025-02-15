extends Node

func interact():
	Signals.AddKey.emit()
	queue_free()
