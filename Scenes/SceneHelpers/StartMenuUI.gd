extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")


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
