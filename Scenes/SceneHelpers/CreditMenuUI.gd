extends Control


func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/StartScene.tscn")

func play_focus_sound():
	$ButtonFocus.play()

func play_select_sound():
	$ButtonSelect.play()
	
func _on_back_to_menu_focus_entered():
	play_select_sound()


func _on_back_to_menu_mouse_entered():
	play_focus_sound()
