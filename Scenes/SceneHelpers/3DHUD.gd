extends Node3D

var multiplier = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score(0)

func update_score(score):
	var score_bug = "Score: "+str(score)
	$ScoreLabel.text = str(score_bug)


func _on_score_area_update_combo_text(new_value):
	if new_value.size() == 1:
		$ComboLabel.text = str(new_value[0])
	elif new_value.size() > 1:
		var combo_text = $ComboLabel.text
		var added_value = new_value[new_value.size() - 1]
		combo_text += " * " + str(added_value)
		format_combo_text(combo_text)
		$ComboLabel.text = str(combo_text)


func _on_score_area_update_combo_score(new_value):
	$ComboScore.text = str(new_value)


func _on_score_area_combo_end(score):
	$ComboLabel.text = ""
	$ComboScore.text = ""
	$ComboLabel.font_size = 16
	$ComboLabel.outline_size = 8
	multiplier = 1
	update_score(score)

func format_combo_text(combo_text):
	if combo_text.length() > 15 * multiplier and $ComboLabel.font_size > 4:
		$ComboLabel.font_size -= 2
		$ComboLabel.outline_size -= 1
		multiplier += 1
