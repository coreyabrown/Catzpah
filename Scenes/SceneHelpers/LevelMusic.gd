extends Node3D

var musicList = []
var musicLevel = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	update_music_level(Global.get_music_level())
	musicList.append_array($".".get_children())
	var songChoice = randi_range(0, musicList.size()-1)
	print(str(songChoice))
	musicList[songChoice].volume_db = (20 * (musicLevel / 100)) - 30
	musicList[songChoice].play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_music_level(value):
	musicLevel = Global.get_music_level()
