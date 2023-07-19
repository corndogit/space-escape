extends Control

@onready var input_field : TextEdit = get_node("InputField")
@onready var texture : Control = get_parent().get_node("AspectRatioContainer/MazeTexture")
@onready var error : Label = get_parent().get_node("AspectRatioContainer/Error")
const CORRECT_SOLUTION = "47263"


func _on_button_pressed():
	if input_field.text == CORRECT_SOLUTION:
		State.yellow_door.puzzle_3_solved = true
		DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "yellow_door")


func _on_puzzle_3_tree_entered():
	if State.grate.usb_taken:
		texture.visible = true
		error.visible = false
