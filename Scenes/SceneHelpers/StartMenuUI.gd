extends Control

func _ready():
	connectButtons()

func play_focus_sound():
	$ButtonFocus.play()

func play_select_sound():
	$ButtonSelect.play()

func _on_exit_pressed():
	# Haptic feedback on button press?
	get_tree().quit()

func _on_new_game_pressed():
	# Haptic feedback on button press?
	get_tree().change_scene_to_file("res://Scenes/LivingRoom.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scenes/LevelSelectScene.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")

func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/HowToPlay.tscn")

func connectButtons():
	for button in $MenuButtons.get_children():
		button.focus_entered.connect(self._focus_entered)
		button.mouse_entered.connect(self._mouse_entered)
	for button in $Settings_Help.get_children():
		button.focus_entered.connect(self._focus_entered)
		button.mouse_entered.connect(self._mouse_entered)

func _focus_entered():
	play_select_sound()

func _mouse_entered():
	play_focus_sound()
