extends Interactable

var battery_charged : bool = false

func _ready():
	State.broken_pipe = self

func interact():
	DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "broken_pipe")
