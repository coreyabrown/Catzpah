extends Node

var current_scene = null
var levelEndScore = 0
var levelReference = ["Main Menu", "Living Room", "Office"]
var levelPath = ["res://Scenes/StartScene.tscn", "res://Scenes/LivingRoom.tscn", "res://Scenes/Office.tscn"]
var currentLevel = levelReference[0]

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
	
