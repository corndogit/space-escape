extends Control

@onready var solutions_element : VBoxContainer= get_node("Control/solutions")
@onready var result : Label = get_node("Control/solutions/Result")
const CORRECT_ANSWER : String = "7275"
var input_fields : Array = []

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
	if result.text == CORRECT_ANSWER:
		result.add_theme_color_override("font_color", Color(0, 1, 0))
		print("Puzzle solved!")
		for field in input_fields:
			field.editable = false
		# communicate that this puzzle is solved
	
