extends Interactable

var battery_charged : bool = false
const DIALOGUE_TYPE = CustomDialogue.DialogueType.INTERACTABLE
@onready var charge_sfx = $ChargeSFX

func _ready():
	State.broken_pipe = self

func interact():
	CustomDialogue.start(DIALOGUE_TYPE, "broken_pipe")
