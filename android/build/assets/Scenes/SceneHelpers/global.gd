extends Node

var current_scene = null
var levelEndScore = 0
var levelReference = ["Main Menu", "Living Room", "Office", "Kitchen", "Bathroom"]
var levelPath = ["res://Scenes/StartScene.tscn", "res://Scenes/LivingRoom.tscn", "res://Scenes/Office.tscn", "res://Scenes/Kitchen.tscn", "res://Scenes/Bathroom.tscn"]
var currentLevel = levelReference[0]
var musicLevel = 100
var sfxLevel = 100

var colSoundPath = "res://Assets/Audio/CollisionSounds/"
var masterSoundList = [[colSoundPath + "Cardboard1.wav", colSoundPath + "Cardboard2.wav"],
[colSoundPath + "Ceramic1.wav", colSoundPath + "Ceramic2.wav"],
[colSoundPath + "Food1.wav", colSoundPath + "Food2.wav"],
[colSoundPath + "Lamp1.wav"],
[colSoundPath + "Metal1.wav", colSoundPath + "Metal2.wav", colSoundPath + "Metal3.wav"],
[colSoundPath + "Notebook1.wav"],
[colSoundPath + "Pills1.wav", colSoundPath + "Pills2.wav"],
[colSoundPath + "Plastic1.wav", colSoundPath + "plastic2.wav", colSoundPath + "Plastic3.wav", colSoundPath + "Plastic4.wav"],
[colSoundPath + "Plant1.wav", colSoundPath + "Plant2.wav"],
[colSoundPath + "ToiletPaper1.wav", colSoundPath + "ToiletPaper2.wav"],
[colSoundPath + "Wood1.wav", colSoundPath + "Wood2.wav", colSoundPath + "Wood3.wav"]]
enum SoundMat {
	CARDBOARD = 0,
	CERAMIC = 1,
	FOOD = 2,
	LAMP = 3,
	METAL = 4,
	NOTEBOOK = 5,
	PILLBOTTLE = 6,
	PLASTIC = 7,
	POTTEDPLANT = 8,
	TOILETPAPER = 9,
	WOOD = 10
}

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	
func set_score(score):
	levelEndScore = score

func get_score():
	return levelEndScore

func set_level(levelIndex):
	currentLevel = levelReference[levelIndex]

func get_level():
	return currentLevel

func get_next_level_path():
	var current_index = levelReference.find(currentLevel)
	return levelPath[current_index+1]

func get_curr_level_path():
	var current_index = levelReference.find(currentLevel)
	return levelPath[current_index]

func get_music_level():
	return musicLevel

func set_music_level(value):
	musicLevel = clamp(value,0,100)

func get_sfx_level():
	return sfxLevel

func set_sfx_level(value):
	sfxLevel = clamp(value,0,100)

func get_level_list():
	return levelReference

func get_level_paths():
	return levelPath
