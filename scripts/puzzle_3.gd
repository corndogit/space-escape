extends Control

@onready var input_field = get_node("InputField")
const CORRECT_SOLUTION = "47263"
signal puzzle_solved

func _on_button_pressed():
	if input_field.text == CORRECT_SOLUTION:
		State.yellow_door.puzzle_3_solved = true
		DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "yellow_door")
