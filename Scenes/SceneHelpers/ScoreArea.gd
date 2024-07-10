extends Area3D

var scoringObjects = []
var playerScored = false
var score = 0
var comboScore = 0
var displayComboScore = 0
var combo = []
signal combo_end(score)
signal update_combo_text(new_value)
signal update_combo_score(new_value)

@onready var comboEngaged : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Get all Scoring Objects
	var scoringObjNodes = get_node("../ScoringObjects").get_children()
	scoringObjects.append_array(scoringObjNodes)
	combo_end.emit(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $Timer.is_stopped() and comboEngaged:
		endCombo()
	if $Timer.is_stopped() and $LevelEndTimer.is_stopped() and playerScored:
		Global.set_score(score)
		get_tree().change_scene_to_file("res://Scenes/LevelOver.tscn")


func _on_body_entered(body):
	if body in scoringObjects:
		var arrayIndex = scoringObjects.find(body)
		scoringObjects.pop_at(arrayIndex)
		
		var objMass = body.mass
		var objVel = body.linear_velocity
		var eucVel = sqrt(objVel.x*objVel.x + objVel.y*objVel.y + objVel.z*objVel.z) # euclidean length -> Sqrt(x^2 + y^2 + z^2)
		var objAngVel = body.angular_velocity
		var eucAngVel = sqrt(objAngVel.x*objAngVel.x + objAngVel.y*objAngVel.y + objAngVel.z*objAngVel.z)
		var addPoints = (30 - eucVel) + (10 + objMass) + (30 - eucAngVel) # Score is somewhere between 30 and 70 usually
		
		addCombo(addPoints, body.name)
		
	elif body == get_node("../XROrigin3D/PlayerBody") and not playerScored:
		playerScored = true
		var addPoints = 70 # should be on the high end of points
		# Maybe should end level after falling?
		addCombo(addPoints, "RUFUS")
		
		$LevelEndTimer.start()
		

func endCombo():
	comboEngaged = false
	# print("ENDED COMBO")
	score += displayComboScore
	# print("SCORE: "+str(score))
	
	combo_end.emit(score)
	
	comboScore = 0
	combo = []

func addCombo(trickScore, itemName):
	comboEngaged = true
	$Timer.start($Timer.wait_time)
	
	itemName = itemName.rstrip("0123456789")
	combo.append(itemName.to_upper())
	
	comboScore += trickScore
	var comboLength = combo.size()
	displayComboScore = clamp(round(comboScore * pow(1.2, comboLength)),10,1000)
	# print("COMBO: "+str(combo) +"\nDISPLAY COMBO SCORE: " +str(displayComboScore))
	update_combo_text.emit(combo)
	update_combo_score.emit(displayComboScore)
