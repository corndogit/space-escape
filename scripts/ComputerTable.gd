extends Interactable

var powered : bool = true
var puzzle_scene = preload("res://scenes/puzzle_2_clue.tscn").instantiate()
signal open_scene(puzzle_scene)

func _ready():
	State.computer_table = self

func interact():
	if not powered:
		DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "computer_table")
	else:
		super.interact()
