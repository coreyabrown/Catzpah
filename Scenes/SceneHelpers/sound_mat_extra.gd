extends RigidBody3D

@export_group("Sound Material")
@export var sound_material: Global.SoundMat = Global.SoundMat.PLASTIC

@onready var soundList = Global.masterSoundList[sound_material]
@onready var sfxLevel = Global.get_sfx_level()

var soundNodes = []

func _ready():
	self.contact_monitor = true
	self.max_contacts_reported = 1
	# Add sounds based on sound material
	for sound in soundList:
		var audioStream = AudioStreamPlayer3D.new()
		var audio = load(sound)
		audioStream.stream = audio
		audioStream.volume_db = (50 * (sfxLevel / 100)) - 25
		audioStream.add_to_group("sound")
		add_child(audioStream)
		soundNodes.append(audioStream)
	
	self.body_entered.connect(self._body_entered)

func _body_entered(body):
	var objVel = sqrt(self.linear_velocity.x*self.linear_velocity.x + self.linear_velocity.y*self.linear_velocity.y + self.linear_velocity.z*self.linear_velocity.z)
	if body.name == "CollisionHandLeft":
		$"../../XROrigin3D/LeftPaw".trigger_haptic_pulse("haptic", 0.0, 0.3, 0.1, 0.0)
	if body.name == "CollisionHandRight":
		$"../../XROrigin3D/RightPaw".trigger_haptic_pulse("haptic", 0.0, 0.3, 0.1, 0.0)
	if objVel > 0.5:
		play_sound(objVel)

func play_sound(vel):
	var soundChoice = randi_range(0, soundList.size()-1)
	soundNodes[soundChoice].volume_db = (50 * (sfxLevel / 100)) - 55 + clamp(vel * 10, 0, 30)
	soundNodes[soundChoice].play()
