extends Control

@onready var musicIndicator = $MenuButtons/Music/MusicVolumeIndicator
@onready var musicSlider = $MenuButtons/Music/MusicVolume
var musicLevel = 100

func _ready():
	musicIndicator.text = str(Global.get_music_level())
	musicLevel = Global.get_music_level()
	musicSlider.value = musicLevel

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/StartScene.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")

func _on_music_volume_value_changed(value):
	musicIndicator.text = str(value)
	musicLevel = value

func _on_music_volume_drag_ended(value_changed):
	if value_changed:
		Global.set_music_level(musicLevel)

func play_focus_sound():
	$ButtonFocus.play()

func play_select_sound():
	$ButtonSelect.play()

func _on_main_menu_focus_entered():
	play_select_sound()

func _on_main_menu_mouse_entered():
	play_focus_sound()

func _on_credits_focus_entered():
	play_select_sound()

func _on_credits_mouse_entered():
	play_focus_sound()
