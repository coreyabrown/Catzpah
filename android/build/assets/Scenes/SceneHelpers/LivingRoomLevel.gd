extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var sfx = Global.get_sfx_level()
	Global.set_sfx_level(sfx)
	var music = Global.get_music_level()
	Global.set_music_level(music)
	
	Global.set_level(1)

