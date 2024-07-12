extends Control


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


func _on_new_game_focus_entered():
	play_select_sound()


func _on_credits_focus_entered():
	play_select_sound()


func _on_exit_focus_entered():
	play_select_sound()


func _on_new_game_mouse_entered():
	play_focus_sound()


func _on_credits_mouse_entered():
	play_focus_sound()


func _on_exit_mouse_entered():
	play_focus_sound()


func _on_settings_focus_entered():
	play_select_sound()


func _on_how_to_play_focus_entered():
	play_select_sound()


func _on_settings_mouse_entered():
	play_focus_sound()


func _on_how_to_play_mouse_entered():
	play_focus_sound()

