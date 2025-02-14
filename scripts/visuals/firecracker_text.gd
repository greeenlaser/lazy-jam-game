extends RichTextLabel

func set_text_from_count(firecracker_count):
	text = "%s/3 Firecrackers" % str(firecracker_count)

func _ready() -> void:
	Signals.GetFirecrackerCount.connect(set_text_from_count)
