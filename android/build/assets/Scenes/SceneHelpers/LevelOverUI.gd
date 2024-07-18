extends Control

@onready var nextButton = $MenuButtons/NextLevel

# Called when the node enters the scene tree for the first time.
func _ready():
	$ScoreLabel.text = "Score: "+str(Global.get_score())
	$LevelLabel.text = str(Global.get_level())
	if Global.levelReference.find(Global.get_level()) == Global.levelReference.size() - 1:
		nextButton.visible = false
	else:
		nextButton.visible = true
	
	connectButtons()

func play_focus_sound():
	$ButtonFocus.play()

func play_select_sound():
	$ButtonSelect.play()

func connectButtons():
	for button in $MenuButtons.get_children():
		button.focus_entered.connect(self._focus_entered)
		button.mouse_entered.connect(self._mouse_entered)

func _focus_entered():
	play_select_sound()

func _mouse_entered():
	play_focus_sound()

func _on_exit_pressed():
	get_tree().change_scene_to_file(Global.get_curr_level_path())

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/StartScene.tscn")


func _on_next_level_pressed():
	get_tree().change_scene_to_file(Global.get_next_level_path())

