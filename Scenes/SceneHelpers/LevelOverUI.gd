extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$ScoreLabel.text = "Score: "+str(Global.get_score())
	$LevelLabel.text = str(Global.get_level())
	if Global.levelReference.find(Global.get_level()) == Global.levelReference.size() - 1:
		$MenuButtons/NextLevel.visible = false
	else:
		$MenuButtons/NextLevel.visible = true

func _on_exit_pressed():
	# Haptic feedback on button press?
	get_tree().quit()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/StartScene.tscn")


func _on_next_level_pressed():
	get_tree().change_scene_to_file(Global.get_next_level_path())
