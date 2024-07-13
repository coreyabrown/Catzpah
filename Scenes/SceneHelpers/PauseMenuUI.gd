extends Control

signal closeMenu()

func play_focus_sound():
	$ButtonFocus.play()

func play_select_sound():
	$ButtonSelect.play()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/StartScene.tscn")

func _on_end_level_pressed():
	get_tree().change_scene_to_file("res://Scenes/LevelOver.tscn")

func _on_resume_pressed():
	closeMenu.emit()

func _on_resume_focus_entered():
	play_select_sound()

func _on_end_level_focus_entered():
	play_select_sound()

func _on_main_menu_focus_entered():
	play_select_sound()

func _on_resume_mouse_entered():
	play_focus_sound()

func _on_end_level_mouse_entered():
	play_focus_sound()

func _on_main_menu_mouse_entered():
	play_focus_sound()
