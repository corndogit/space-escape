extends Interactable

var powered : bool = false

func _ready():
	State.computer_table = self

func interact():
	DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "computer_table")
