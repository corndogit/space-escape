extends Interactable

var usb_taken : bool = false
@onready var open_sfx = $OpenGrateSFX
const DIALOGUE_TYPE = CustomDialogue.DialogueType.INTERACTABLE

func _ready():
	State.grate = self

func interact():
	CustomDialogue.start(DIALOGUE_TYPE, "grate")
	
func take_usb():
	usb_taken = true
	self.remove_from_group("Interactable")
