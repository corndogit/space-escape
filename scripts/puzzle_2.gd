extends GridContainer

var inputs_dict : Dictionary
@onready var button : Button = get_node("../Submit")
@onready var solved_sfx = get_node("SolvedSFX")

# Called when the node enters the scene tree for the first time.
func _ready():
	inputs_dict = {
		"tier": [
			get_node("input_0-0"),
			get_node("input_0-1"),
			get_node("input_0-2"),
			get_node("input_0-3")],
		"rocket": [
			get_node("input_0-3"),
			get_node("input_1-3"),
			get_node("input_2-3"),
			get_node("input_3-3"),
			get_node("input_4-3"),
			get_node("input_5-3")],
		"console": [
			get_node("input_2-3"),
			get_node("input_2-4"),
			get_node("input_2-5"),
			get_node("input_2-6"),
			get_node("input_2-7"),
			get_node("input_2-8"),
			get_node("input_2-9")],
		"ion": [
			get_node("input_1-7"),
			get_node("input_2-7"),
			get_node("input_3-7")],
		"other": [
			get_node("input_4-0"),
			get_node("input_4-1"),
			get_node("input_4-2"),
			get_node("input_4-3"),
			get_node("input_4-4")]
	}

# Checks the contents of every LineEdit to see if it matches the key
func _check_contents(key : String, arr : Array) -> bool:
	for i in len(arr):
		if key[i] != arr[i].text.to_lower():
			return false
	return true

# Checks the entire crossword for correct answer, returns true if solved
func _check_crossword() -> bool:
	for k in inputs_dict.keys():
		if not _check_contents(k, inputs_dict[k]):
			return false
	return true

func _on_button_pressed():
	if _check_crossword():
		solved_sfx.play()
		State.computer_wall.puzzle_2_solved = true
		for arr in inputs_dict.values():
			for node in arr:
				node.editable = false
		DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "computer_wall")
