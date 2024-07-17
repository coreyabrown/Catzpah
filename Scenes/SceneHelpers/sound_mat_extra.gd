extends RigidBody3D

@export_group("Sound Material")
@export var sound_material: Global.SoundMat = Global.SoundMat.PLASTIC

@onready var soundList = Global.masterSoundList[sound_material]

func _ready():
	var sfxLevel = Global.get_sfx_level()
	# Add sounds based on sound material
	for sound in soundList:
		var audioStream = AudioStreamPlayer3D.new()
		var audio = load(sound)
		audioStream.stream = audio
		audioStream.volume_db = (50 * (sfxLevel / 100)) - 125
		add_child(audioStream)

#TODO: Programmatically connect collision with floor to this script. Then Play the sound. Then Copy this over to Pickable.gd

func play_sound():
	var soundNodes = []
	soundNodes.append_array(get_children())
	var soundChoice = randi_range(0, soundList.size()-1)
	soundNodes[soundChoice].play()
