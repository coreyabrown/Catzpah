extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Score: "+str(Global.get_score())

func _on_exit_pressed():
	# Haptic feedback on button press?
	get_tree().quit()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/StartScene.tscn")
