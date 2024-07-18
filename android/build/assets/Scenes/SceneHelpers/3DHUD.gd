extends Node3D

var multiplier = 1
var sfxLevel = 100
	
@onready var comboLabel = $ComboLabel
@onready var scoreLabel = $ScoreLabel
@onready var comboScore = $ComboScore
@onready var singleTrickMeow = $SingleTrickMeow
@onready var comboEndMeow = $ComboEndMeow

# Called when the node enters the scene tree for the first time.
func _ready():
	sfxLevel = Global.get_sfx_level()
	update_score(0)

func update_score(score):
	var score_bug = "Score: "+str(score)
	scoreLabel.text = str(score_bug)


func _on_score_area_update_combo_text(new_value):
	if new_value.size() == 1:
		comboLabel.text = str(new_value[0])
		play_sound(singleTrickMeow)
	elif new_value.size() > 1:
		var combo_text = comboLabel.text
		var added_value = new_value[new_value.size() - 1]
		combo_text += " * " + str(added_value)
		format_combo_text(combo_text)
		comboLabel.text = str(combo_text)
		play_sound(singleTrickMeow)


func _on_score_area_update_combo_score(new_value):
	comboScore.text = str(new_value)


func _on_score_area_combo_end(score):
	comboLabel.text = ""
	comboScore.text = ""
	comboLabel.font_size = 16
	comboLabel.outline_size = 8
	multiplier = 1
	update_score(score)
	if score > 0:
		play_sound(comboEndMeow)

func format_combo_text(combo_text):
	if combo_text.length() > 15 * multiplier and comboLabel.font_size > 4:
		comboLabel.font_size -= 2
		comboLabel.outline_size -= 1
		multiplier += 1

func play_sound(sound):
	sound.volume_db = (50 * (sfxLevel / 100)) - 125
	sound.play()
