extends Interactable

func _ready():
	State.grate = self

func interact():
	DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "grate")
