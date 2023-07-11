extends Interactable

var powered : bool = false
var puzzle_scene = preload("res://scenes/puzzle_2_clue.tscn").instantiate()
@onready var level = get_parent()
@onready var player = level.get_node("Player")
@onready var camera = player.get_node("Camera2D")

func _ready():
	State.computer_table = self
	puzzle_scene.visible = false

func interact():
	if not powered:
		DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "computer_table")
	else:
		level.add_child(puzzle_scene)
		camera.enabled = false
		puzzle_scene.visible = true
		

func close_puzzle():
	# do not forget how to do this
	puzzle_scene.visible = false
	level.remove_child(puzzle_scene)
	camera.enabled = true
	player.in_dialogue = false
