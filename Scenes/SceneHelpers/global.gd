extends Node

var current_scene = null
var levelEndScore = 0
var levelReference = ["Main Menu", "Living Room", "Office", "Kitchen", "Bathroom"]
var levelPath = ["res://Scenes/StartScene.tscn", "res://Scenes/LivingRoom.tscn", "res://Scenes/Office.tscn", "res://Scenes/Kitchen.tscn", "res://Scenes/Bathroom.tscn"]
var currentLevel = levelReference[0]
var musicLevel = 100
var sfxLevel = 100

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

var masterSoundList = [["res://Assets/Audio/CollisionSounds/Cardboard1.wav", "res://Assets/Audio/CollisionSounds/Cardboard2.wav"],
["res://Assets/Audio/CollisionSounds/Ceramic1.wav", "res://Assets/Audio/CollisionSounds/Ceramic2.wav"],
["res://Assets/Audio/CollisionSounds/Food1.wav", "res://Assets/Audio/CollisionSounds/Food2.wav"],
["res://Assets/Audio/CollisionSounds/Lamp1.wav"],
["res://Assets/Audio/CollisionSounds/Metal1.wav", "res://Assets/Audio/CollisionSounds/Metal2.wav", "res://Assets/Audio/CollisionSounds/Metal3.wav"],
["res://Assets/Audio/CollisionSounds/Notebook1.wav"],
["res://Assets/Audio/CollisionSounds/Pills1.wav", "res://Assets/Audio/CollisionSounds/Pills2.wav"],
["res://Assets/Audio/CollisionSounds/Plastic1.wav", "res://Assets/Audio/CollisionSounds/plastic2.wav", "res://Assets/Audio/CollisionSounds/Plastic3.wav", "res://Assets/Audio/CollisionSounds/Plastic4.wav"],
["res://Assets/Audio/CollisionSounds/Plant1.wav", "res://Assets/Audio/CollisionSounds/Plant2.wav"],
["res://Assets/Audio/CollisionSounds/ToiletPaper1.wav", "res://Assets/Audio/CollisionSounds/ToiletPaper2.wav"],
["res://Assets/Audio/CollisionSounds/Wood1.wav", "res://Assets/Audio/CollisionSounds/Wood2.wav", "res://Assets/Audio/CollisionSounds/Wood3.wav"]]

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
