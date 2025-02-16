extends Node

@onready var audio = $AudioStreamPlayer3D


var pos: float = 0
func interact():
	audio.playing = !audio.playing
	
	if audio.playing:
		audio.seek(pos)
	else:
		pos = audio.get_playback_position()
