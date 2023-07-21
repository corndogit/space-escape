extends Interactable

var battery_charged : bool = false
@onready var charge_sfx = $ChargeSFX

func _ready():
	State.broken_pipe = self

func interact():
	DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "broken_pipe")
