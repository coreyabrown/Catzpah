extends Control

func _ready():
	var levels = Global.get_level_list()
	var levelPaths = Global.get_level_paths()
	
	for i in levels:
		var index = levels.find(i)
		buildbutton(levels[index], levelPaths[index])

func buildbutton(levelName, path):
	var button = Button.new()
	button.text = levelName
	button.pressed.connect(self._button_pressed.bind(path))
	button.focus_entered.connect(self._focus_entered)
	button.mouse_entered.connect(self._mouse_entered)
	$MenuButtons.add_child(button)

func _button_pressed(path):
	get_tree().change_scene_to_file(path)

func play_focus_sound():
	$ButtonFocus.play()

func play_select_sound():
	$"../../../XROrigin3D/LeftPaw".trigger_haptic_pulse("haptic", 0.0, 0.5, 0.1, 0.0)
	$"../../../XROrigin3D/RightPaw".trigger_haptic_pulse("haptic", 0.0, 0.5, 0.1, 0.0)
	$ButtonSelect.play()
	
func _focus_entered():
	play_select_sound()

func _mouse_entered():
	play_focus_sound()
