extends RichTextLabel

var has_key: bool = false

func add_key():
	text = "Key"
	has_key = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = ""
	Signals.AddKey.connect(add_key)
