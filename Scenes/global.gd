extends Node

var current_scene = null
var levelEndScore = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	
func pass_score(score):
	levelEndScore = score

func get_score():
	return levelEndScore
