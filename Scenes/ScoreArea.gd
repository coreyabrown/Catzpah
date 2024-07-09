extends Area3D

var scoringObjects = []
var playerScored = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Get all Scoring Objects
	var scoringObjNodes = get_node("../ScoringObjects").get_children()
	scoringObjects.append_array(scoringObjNodes)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # Probably should use this to denote combos - maybe combo is no longer valid after X seconds

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
		print("Points = " + str(addPoints))
	elif body == get_node("../XROrigin3D/PlayerBody") and not playerScored:
		playerScored = true
		var addPoints = 70 # should be on the high end of points
		print("Points = " + str(addPoints))

	
