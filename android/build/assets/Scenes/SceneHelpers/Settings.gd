extends Control

@onready var musicIndicator = $MenuButtons/Music/MusicVolumeIndicator
@onready var musicSlider = $MenuButtons/Music/MusicVolume
@onready var sfxIndicator = $MenuButtons/SFX/SFXIndicator
@onready var sfxSlider = $MenuButtons/SFX/SFXVolume
var musicLevel = 100
var sfxLevel = 100

func _ready():
	musicIndicator.text = str(Global.get_music_level())
	musicLevel = Global.get_music_level()
	musicSlider.value = musicLevel
	
	sfxIndicator.text = str(Global.get_sfx_level())
	sfxLevel = Global.get_sfx_level()
	sfxSlider.value = sfxLevel

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

func _on_sfx_volume_value_changed(value):
	sfxIndicator.text = str(value)
	sfxLevel = value

func _on_sfx_volume_drag_ended(value_changed):
	if value_changed:
		Global.set_sfx_level(sfxLevel)

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

