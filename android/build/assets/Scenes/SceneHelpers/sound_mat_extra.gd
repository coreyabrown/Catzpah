extends RigidBody3D

@export_group("Sound Material")
@export var sound_material: Global.SoundMat = Global.SoundMat.PLASTIC

@onready var soundList = Global.masterSoundList[sound_material]

var soundNodes = []

func _ready():
	self.contact_monitor = true
	self.max_contacts_reported = 1
	var sfxLevel = Global.get_sfx_level()
	# Add sounds based on sound material
	for sound in soundList:
		var audioStream = AudioStreamPlayer3D.new()
		var audio = load(sound)
		audioStream.stream = audio
		audioStream.volume_db = (50 * (sfxLevel / 100)) - 20
		audioStream.add_to_group("sound")
		add_child(audioStream)
		soundNodes.append(audioStream)
	
	self.body_entered.connect(self._body_entered)

func _body_entered(body):
	var objVel = sqrt(self.linear_velocity.x*self.linear_velocity.x + self.linear_velocity.y*self.linear_velocity.y + self.linear_velocity.z*self.linear_velocity.z)
	if body == $"../../Level/Floor/StaticBody3D" and objVel > 0.2:
		play_sound()

func play_sound():
	var soundChoice = randi_range(0, soundList.size()-1)
	soundNodes[soundChoice].play()
