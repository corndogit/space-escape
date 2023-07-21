extends Interactable

var usb_taken : bool = false
@onready var open_sfx = $OpenGrateSFX

func _ready():
	State.grate = self

func interact():
	DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "grate")
	
func take_usb():
	usb_taken = true
	self.remove_from_group("Interactable")
