extends Control


func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/StartScene.tscn")

func play_focus_sound():
	$ButtonFocus.play()

func play_select_sound():
	$"../../../XROrigin3D/LeftPaw".trigger_haptic_pulse("haptic", 0.0, 0.5, 0.1, 0.0)
	$"../../../XROrigin3D/RightPaw".trigger_haptic_pulse("haptic", 0.0, 0.5, 0.1, 0.0)
	$ButtonSelect.play()
	
func _on_back_to_menu_focus_entered():
	play_select_sound()


func _on_back_to_menu_mouse_entered():
	play_focus_sound()
