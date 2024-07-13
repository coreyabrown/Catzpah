@tool
class_name XRToolsMovementDirect
extends XRToolsMovementProvider


## XR Tools Movement Provider for Direct Movement
##
## This script provides direct movement for the player. This script works
## with the [XRToolsPlayerBody] attached to the players [XROrigin3D].
##
## The player may have multiple [XRToolsMovementDirect] nodes attached to
## different controllers to provide different types of direct movement.


## Movement provider order
@export var order : int = 10

## Movement speed
@export var max_speed : float = 3.0

## If true, the player can strafe
@export var strafe : bool = false

## Input action for movement direction
@export var input_action : String = "primary"

## Input action for pause
@export var pause_action : String = "menu_button"
@onready var pauseMenuNode = $"../../XRCamera3D/Menu"

# Controller node
@onready var _controller := XRHelpers.get_xr_controller(self)

func _ready():
	_controller.connect("button_pressed", _on_button_pressed)

# Add support for is_xr_class on XRTools classes
func is_xr_class(name : String) -> bool:
	return name == "XRToolsMovementDirect" or super(name)


# Perform jump movement
func physics_movement(_delta: float, player_body: XRToolsPlayerBody, _disabled: bool):
	# Skip if the controller isn't active
	if !_controller.get_is_active():
		return

	## get input action with deadzone correction applied
	var dz_input_action = XRToolsUserSettings.get_adjusted_vector2(_controller, input_action)

	player_body.ground_control_velocity.y += dz_input_action.y * max_speed
	if strafe:
		player_body.ground_control_velocity.x += dz_input_action.x * max_speed

	# Clamp ground control
	var length := player_body.ground_control_velocity.length()
	if length > max_speed:
		player_body.ground_control_velocity *= max_speed / length


# This method verifies the movement provider has a valid configuration.
func _get_configuration_warnings() -> PackedStringArray:
	var warnings := super()

	# Check the controller node
	if !XRHelpers.get_xr_controller(self):
		warnings.append("This node must be within a branch of an XRController3D node")

	# Return warnings
	return warnings


## Find the left [XRToolsMovementDirect] node.
##
## This function searches from the specified node for the left controller
## [XRToolsMovementDirect] assuming the node is a sibling of the [XROrigin3D].
static func find_left(node : Node) -> XRToolsMovementDirect:
	return XRTools.find_xr_child(
		XRHelpers.get_left_controller(node),
		"*",
		"XRToolsMovementDirect") as XRToolsMovementDirect


## Find the right [XRToolsMovementDirect] node.
##
## This function searches from the specified node for the right controller
## [XRToolsMovementDirect] assuming the node is a sibling of the [XROrigin3D].
static func find_right(node : Node) -> XRToolsMovementDirect:
	return XRTools.find_xr_child(
		XRHelpers.get_right_controller(node),
		"*",
		"XRToolsMovementDirect") as XRToolsMovementDirect

func _on_button_pressed(p_button) -> void:
	if p_button == pause_action:
		togglePauseMenu()

func togglePauseMenu():
	if pauseMenuNode.visible:
		pauseMenuNode.visible = false
		# Left Paw
		$"../XRToolsFunctionPointer".visible = false
		$"../XRToolsFunctionPickup".visible = true
		$"../CollisionHandLeft".visible = true
		
		# Right Paw
		$"../../RightPaw/XRToolsFunctionPointer".visible = false
		$"../../RightPaw/XRToolsFunctionPickup".visible = true
		$"../../RightPaw/CollisionHandRight".visible = true
	else:
		pauseMenuNode.visible = true
		# Left Paw
		$"../XRToolsFunctionPointer".visible = true
		$"../XRToolsFunctionPickup".visible = false
		$"../CollisionHandLeft".visible = false
		
		# Right Paw
		$"../../RightPaw/XRToolsFunctionPointer".visible = true
		$"../../RightPaw/XRToolsFunctionPickup".visible = false
		$"../../RightPaw/CollisionHandRight".visible = false


func _on_pause_menu_close_menu():
	togglePauseMenu()
