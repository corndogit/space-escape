extends PanelContainer

func _ready():
	var window_size = get_window().get_size_with_decorations()
	custom_minimum_size.x = window_size.x
	custom_minimum_size.y = window_size.y

func _on_puzzle_1_puzzle_solved():
	DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "computer_table")
	await get_tree().create_timer(3).timeout
	State.active_puzzle.close_puzzle()

func _on_close_button_pressed():
	State.active_puzzle.close_puzzle()
