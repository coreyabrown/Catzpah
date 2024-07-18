extends Control

signal closeMenu()

func _ready():
	connectButtons()

func play_focus_sound():
	$ButtonFocus.play()
	# $"../../../../LeftPaw".trigger_haptic_pulse("haptic", 0.0, 0.5, 0.1, 0.0)
	# $"../../../../RightPaw".trigger_haptic_pulse("haptic", 0.0, 0.5, 0.1, 0.0)

func play_select_sound():
	$ButtonSelect.play()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/StartScene.tscn")

func _on_end_level_pressed():
	get_tree().change_scene_to_file("res://Scenes/LevelOver.tscn")

func _on_resume_pressed():
	closeMenu.emit()

func connectButtons():
	for button in $MenuButtons.get_children():
		button.focus_entered.connect(self._focus_entered)
		button.mouse_entered.connect(self._mouse_entered)

func _focus_entered():
	play_select_sound()

func _mouse_entered():
	play_focus_sound()
