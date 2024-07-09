extends CanvasLayer

var score = 0
var trickScore = 0
var comboScore = 0
var combo = []
var comboActive = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if "I SHOULD END THE COMBO" == "YEPPERS":
		endCombo()
	elif "I SHOULD EXTEND THE COMBO" == "UH HUH":
		addCombo()

func endCombo():
	comboActive = false
	score += comboScore
	$VBoxContainer/ComboLabel.clear()
	comboScore = 0

func addCombo():
	comboScore += trickScore
	var comboLength = combo.size()
	if comboLength == 1:
		$VBoxContainer/ComboLabel.append_text(combo[comboLength-1])
	else:
		$VBoxContainer/ComboLabel.append_text(" * "+combo[comboLength-1])
