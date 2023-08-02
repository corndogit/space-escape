extends Control

@onready var solutions_element : VBoxContainer= get_node("Control/solutions")
@onready var result : Label = get_node("Control/solutions/Result")
@onready var title : Label = get_node("Title")
@onready var solved_sfx = get_node("SolvedSFX")
const CORRECT_ANSWER : String = "7365"
const DIALOGUE_TYPE = CustomDialogue.DialogueType.INTERACTABLE
var input_fields : Array = []
var puzzle_solved = false

func _ready():
	for node in solutions_element.get_children():
		if node.get_class() == "LineEdit":
			input_fields.append(node)

func _on_answer_text_changed(_new_text):
	# loop through the input fields and construct the result
	var temp_result : String = ''
	for field in input_fields:
		if field.text.is_valid_int():
			temp_result += field.text
		else:
			temp_result += '0'
	result.text = temp_result
	_check_result()

func _check_result():
	if result.text == CORRECT_ANSWER and not puzzle_solved:
		puzzle_solved = true  # fixes a bug where dialogue opens twice
		solved_sfx.play()
		result.add_theme_color_override("font_color", Color(0, 1, 0))
		title.text = "Access granted"
		for field in input_fields:
			field.editable = false
		await get_tree().create_timer(1.0).timeout
		CustomDialogue.start(DIALOGUE_TYPE, "puzzle_1_solved")
		await DialogueManager.dialogue_ended
		State.computer_table.puzzle_1_solved = true
		queue_free()
