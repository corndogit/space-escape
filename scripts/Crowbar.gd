extends Interactable

var taken : bool = false
const DIALOGUE_TYPE = CustomDialogue.DialogueType.INTERACTABLE
@onready var sprite : Sprite2D = get_node("Sprite2D")

func _ready():
	State.crowbar = self

func interact():
	CustomDialogue.start(DIALOGUE_TYPE, "crowbar")

func pickup():
	taken = true
	get_node(".").remove_from_group("Interactable")
