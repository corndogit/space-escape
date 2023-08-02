extends Control

@onready var input_field : TextEdit = get_node("InputField")
@onready var texture : Control = get_parent().get_node("AspectRatioContainer/MazeTexture")
@onready var error : Label = get_parent().get_node("AspectRatioContainer/Error")
@onready var solved_sfx = get_node("SolvedSFX")
const CORRECT_SOLUTION = "47263"
const DIALOGUE_TYPE = CustomDialogue.DialogueType.INTERACTABLE

func _on_button_pressed():
	if input_field.text == CORRECT_SOLUTION:
		solved_sfx.play()
		State.yellow_door.puzzle_3_solved = true
		CustomDialogue.start(DIALOGUE_TYPE, "yellow_door")

func _draw():
	if State.grate.usb_taken:
		texture.visible = true
		error.visible = false
