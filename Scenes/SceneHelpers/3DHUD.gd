extends Node3D

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
		for i in range(new_value.size()):
			if i > 0:
				combo_text += " * " + str(new_value[i])
		$ComboLabel.text = str(combo_text)


func _on_score_area_update_combo_score(new_value):
	$ComboScore.text = str(new_value)


func _on_score_area_combo_end(score):
	$ComboLabel.text = ""
	$ComboScore.text = ""
	update_score(score)
