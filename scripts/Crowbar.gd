extends Interactable

var taken : bool = false
@onready var sprite : Sprite2D = get_node("Sprite2D")

func _ready():
	State.crowbar = self

func interact():
	DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "crowbar")

func pickup():
	taken = true
	get_node(".").remove_from_group("Interactable")
