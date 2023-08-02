extends Node

const Balloon = preload("res://scenes/dialogue/balloon.tscn")
var interactables = load("res://resources/interactables.dialogue")
var winning_cutscene = load("res://resources/win_cutscene.dialogue")
enum DialogueType {INTERACTABLE, WINNING_CUTSCENE}

func start(dialogue_type : DialogueType, start_title : String):
	var balloon = Balloon.instantiate()
	var resource
	if dialogue_type == DialogueType.INTERACTABLE:
		resource = interactables
	elif dialogue_type == DialogueType.WINNING_CUTSCENE:
		resource = winning_cutscene
	get_tree().current_scene.add_child(balloon)
	balloon.start(resource, start_title)
